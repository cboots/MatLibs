%A0:  Transission Matrix (KxK) A(j,i)=P(St=j|St-1 = i)
%B0:  Emission Matrix (NxK) B(k,j) = P(O=k|S=j)
%Pi0: State Priors (Kx1) Pi(i) = P(S_1=i)
function model = train_hmm_model(observations, A0, B0, Pi0)
stoptol = 0.1;

K = size(A0, 1);
N = size(B0, 1);
NObs = numel(observations);

%Use Estimation Maximization to train model for each sequence
for seqi=1:NObs
    obs = observations{seqi};
    T = numel(obs);
    csi = zeros(T, K, K);
    
    %Reinitialize
    A = A0;
    B = B0;
    Pi = Pi0;
    
    prevll = -Inf;
    diff = Inf;
    while(diff > stoptol)
        %E Step
        %Use FB Algorithm to compute alpha beta
        [alpha beta s] = forwardbackwardscaled(obs, A, B, Pi);
        gamma = alpha.*beta;%TxK
        
        %gamma_t(i) = P_th(s_t=i|O);
        %TODO Vectorize
        for t = 1:T-1 %Last time no transition, undefined
            for i=1:K
                csi(t,i,:) = alpha(t,i)*A(i,:).*(B(obs(t+1),:).*beta(t+1,:)/s(t+1));
            end
        end
        
        %M step
        %Maximize A
        for i=1:K
            A(i,:) = sum(csi(:,i,:),1)./sum(gamma(1:end-1,i));
        end
        
        %Maximize B
        for k=1:N
            B(k,:) = sum(gamma(k==obs,:),1)./sum(gamma,1);
        end
        
        %Maximize Pi
        Pi = (gamma(1,:)/sum(gamma(1,:)))';
        ll = sum(log(s));
        diff = ll - prevll;
        
        if(isnan(diff))
            diff = stoptol + 1;
            disp('s underflow');
        end
        
        prevll = ll;
    end
    
    
    As{seqi} = A;
    Bs{seqi} = B;
    Pis{seqi} = Pi;
end

%Sum models and renormalize
Af = zeros(size(A));
Bf = zeros(size(B));
Pif = zeros(size(Pi));
for seqi=1:NObs
   Af = Af + As{seqi};
   Bf = Bf + Bs{seqi};
   Pif = Pif + Pis{seqi};
end
model.A = Af/NObs;
model.B = Bf/NObs;
model.Pi = Pif/NObs;
end
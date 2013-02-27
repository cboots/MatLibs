function Qavg = QuatAvg(Q)

% Form the symmetric accumulator matrix
A=zeros(4,4);
M=size(Q,2);

for i=1:M
    q=Q(:,i);
    A=q*q'+A; % rank 1 update
end

% scale
A=(1.0/M)*A;

% Get the eigenvector corresponding to largest eigen value
[Qavg, Eval]=eigs(A,1);

%Normalize to unit quat
Qavg = Qavg/norm(Qavg);
Qavg = -Qavg;
end

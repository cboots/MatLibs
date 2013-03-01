function states = guessHiddenStates(observations, model)
    [alpha beta s] = forwardbackwardscaled(observations, model.A, model.B, model.Pi);
    
    gamma = alpha.*beta;
    
    [~, states] = max(gamma, [], 2);
end
function K = kfun_sigmoid(U,V,P1,P2)
% Sigmoid �˺���
K = tanh(P1*(U*V')+P2);
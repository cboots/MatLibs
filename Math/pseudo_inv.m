function [ A_pseu ] = pseudo_inv( A )
%PSEUDO_INV Summary of this function goes here
%   Detailed explanation goes here

[m,n]=size(A);
[U,S,V]=svd(A);
r=rank(S);
SR=S(1:r,1:r);
SRc=[SR^-1 zeros(r,m-r);zeros(n-r,r) zeros(n-r,m-r)];
A_pseu=V*SRc*U.';

end


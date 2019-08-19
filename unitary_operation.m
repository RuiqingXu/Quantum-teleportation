%% 量子操作存在噪声
a=pi./4;
b=pi./3;
P=0.5;
I=eye(2);
H=1/sqrt(2)*hadamard(2);
C12=[1 0 0 0;0 1 0 0;0 0 0 1;0 0 1 0];
ori=[sin(a).^2 cos(a).*sin(a).*exp(-1i.*b);cos(a).*sin(a).*exp(1i.*b) sin(a).^2 ];
cha=[1./2 0 0 1./2;0 0 0 0;0 0 0 0;1./2 0 0 1./2];
re=kron(ori,cha);
% Eb0=[sqrt(1-P) 0;0 sqrt(1-P)];
  Eb0=[0 sqrt(P);sqrt(P) 0];
%  Eb0=[sqrt(P) 0;0 -sqrt(P)];
% Eb0=[0 sqrt(P);0 0];
% Eb0=[1 0;0 sqrt(1-P)];
% Eb0=[sqrt(1-3.*P./4) 0;0 sqrt(1-3.*P./4)];
% Eb0=[0 sqrt(P./4);sqrt(P./4) 0];
% Eb0=[sqrt(P./4) 0;0 -sqrt(P./4)];
% Eb0=[0 -1i.*sqrt(P./4);1i.*sqrt(P./4) 0];
%% 受控非门、H门都存在...噪声
I12=kron(I,I);
K1=kron(I12,Eb0);
K2=kron(I12,H);
K3=K1;
K4=[1 0 0 0 0 0 0 0;0 1 0 0 0 0 0 0;0 0 1 0 0 0 0 0;0 0 0 1 0 0 0 0;...
    0 0 0 0 0 1 0 0;0 0 0 0 1 0 0 0;0 0 0 0 0 0 0 1;0 0 0 0 0 0 1 0];
K5=K1;
K6=K2;
K7=K1;
K8=kron(I,C12);
K9=kron(kron(Eb0,I),I);
K10=kron(kron(H,I),I);
K11=K9;
K12=kron(kron(I,Eb0),I);
K13=kron(C12,I);
U=K1*K2*K3*K4*K5*K6*K7*K8*K9*K10*K12*K11*K13;
r1=U*re*U';


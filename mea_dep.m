function Fd1=mea_dep()
Fd1=zeros(101,1);
for Pa=0:0.01:1
% Pa=0.3;
a=pi./3;b=pi./2;P=0.3;
ori=[1./2+P./2+(1-P).*cos(a)./2 1./2.*sqrt(1-P).*sin(a).*exp(-1i.*b);...
    1./2.*sqrt(1-P).*sin(a).*exp(1i.*b) 1./2.*(1-P).*(1-sin(a))];
ori1=[cos(a./2).^2 cos(a).*sin(a).*exp(-1i.*b);cos(a).*sin(a).*exp(1i.*b) sin(a).^2];
cha=[1./2 0 0 1./2;0 0 0 0;0 0 0 0;1./2 0 0 1./2];
com=kron(ori,cha);
H=[1./sqrt(2) 1./sqrt(2);1./sqrt(2) -1./sqrt(2)];
C13=[1 0 0 0 0 0 0 0;0 1 0 0 0 0 0 0;0 0 1 0 0 0 0 0;0 0 0 1 0 0 0 0;...
    0 0 0 0 0 1 0 0;0 0 0 0 1 0 0 0;0 0 0 0 0 0 0 1;0 0 0 0 0 0 1 0];
I=eye(2);
Z3=kron(kron(I,I),H)*C13*kron(kron(I,I),H);
CNOT_X=[1 0 0 0;0 1 0 0;0 0 0 1;0 0 1 0];
X3=kron(I,CNOT_X);
H1=kron(kron(H,I),I);
C12=kron(CNOT_X,I);
% 第一个量子比特在受控非门处受振幅阻尼干扰
Ea0=[sqrt(1-3.*Pa./4) 0;0 sqrt(1-3.*Pa./4)];
Ea1=[0 sqrt(Pa./4);sqrt(Pa./4) 0];
Ea2=[0 -1i.*sqrt(Pa./4);1i.*sqrt(Pa./4) 0];
Ea3=[sqrt(Pa./4) 0;0 -sqrt(Pa./4)];
E01=kron(kron(Ea0,I),I);
E11=kron(kron(Ea1,I),I);
E21=kron(kron(Ea2,I),I);
E31=kron(kron(Ea3,I),I);
E02=kron(kron(I,Ea0),I);
E12=kron(kron(I,Ea1),I);
E22=kron(kron(I,Ea2),I);
E32=kron(kron(I,Ea3),I);
% E03=kron(kron(I,I),Ea0);
% E13=kron(kron(I,I),Ea1);
% E23=kron(kron(I,I),Ea2);
% E33=kron(kron(I,I),Ea3);
Utel0=Z3*X3*E01*H1*E02*E01*C12;
Utel1=Z3*X3*E11*H1*E12*E11*C12;
Utel2=Z3*X3*E21*H1*E22*E21*C12;
Utel3=Z3*X3*E31*H1*E32*E31*C12;
fin0=Utel0*com*Utel0';
r0=[fin0(1,1)+fin0(3,3)+fin0(5,5)+fin0(7,7) fin0(1,2)+fin0(3,4)+fin0(5,6)+fin0(7,8);...
    fin0(2,1)+fin0(4,3)+fin0(6,5)+fin0(8,7) fin0(2,2)+fin0(4,4)+fin0(6,6)+fin0(8,8)] ;
fin1=Utel1*com*Utel1';
r1=[fin1(1,1)+fin1(3,3)+fin1(5,5)+fin1(7,7) fin1(1,2)+fin1(3,4)+fin1(5,6)+fin1(7,8);...
    fin1(2,1)+fin1(4,3)+fin1(6,5)+fin1(8,7) fin1(2,2)+fin1(4,4)+fin1(6,6)+fin1(8,8)] ;
fin2=Utel2*com*Utel2';
r2=[fin2(1,1)+fin2(3,3)+fin2(5,5)+fin2(7,7) fin2(1,2)+fin2(3,4)+fin2(5,6)+fin2(7,8);...
    fin2(2,1)+fin2(4,3)+fin2(6,5)+fin2(8,7) fin2(2,2)+fin2(4,4)+fin2(6,6)+fin2(8,8)] ;
fin3=Utel3*com*Utel3';
r3=[fin3(1,1)+fin3(3,3)+fin3(5,5)+fin3(7,7) fin3(1,2)+fin3(3,4)+fin3(5,6)+fin3(7,8);...
    fin3(2,1)+fin3(4,3)+fin3(6,5)+fin3(8,7) fin3(2,2)+fin3(4,4)+fin3(6,6)+fin3(8,8)] ;
Ram1=r0+r1+r2+r3;
Fd1(int16(Pa./0.01+1),1)=trace(ori1*Ram1);

end
Pa1=0:0.01:1;
Fdep=abs(Fd1(int16(Pa1./0.01+1),1));
Fdep=Fdep';
plot(Pa1,Fdep,'r--');
ylim([0 1]);
% yticks(0:0.1:1)

%% 量子信道存在噪声
a=pi./4;
b=pi./3;
F1=zeros(100,1);
F2=zeros(100,1);
F3=zeros(100,1);
F4=zeros(100,1);
F5=zeros(100,1);
for P=0.01:0.01:1
ori=[sin(a).^2 cos(a).*sin(a).*exp(-1i.*b);cos(a).*sin(a).*exp(1i.*b) sin(a).^2 ];
bit=[cos(a).^2.*(P.^2+(1-P).^2)+2.*sin(a).^2.*P.*(1-P) 2.*cos(a).*sin(a).*exp(1i.*b).*P.*(1-P)+cos(a).*sin(a).*exp(-1i.*b).*(P.^2+(1-P).^2);...
    2.*cos(a).*sin(a).*exp(-1i.*b).*P.*(1-P)+cos(a).*sin(a).*exp(1i.*b).*(P.^2+(1-P).^2) sin(a).^2.*(P.^2+(1-P).^2)+2.*cos(a).^2.*P.*(1-P)] ;
pha=[cos(a).^2 cos(a).*sin(a).*(3.*P-1).*(P-1).*exp(-1i.*b);cos(a).*sin(a).*(3.*P-1).*(P-1).*exp(1i.*b) sin(a).^2];
amp=[cos(a).^2.*(1+P.^2)+sin(a).^2.*P.*(1-P) cos(a).*sin(a).*(1-P).*exp(-1i.*b);cos(a).*sin(a).*(1-P).*exp(1i.*b) sin(a).^2.*(1-P).^2+cos(a).^2.*P.*(1-P)];
dep=[(1-P./2).^2.*cos(a).^2+P.^2./8.*sin(a).^2 cos(a).*sin(a).*exp(1i.*b).*(P-7./8.*P.^2)+cos(a).*sin(a).*exp(-1i.*b).*((P-1).^2+1./4.*P.^2);...
    cos(a).*sin(a).*exp(-1i.*b).*(P-7./8.*P.^2)+cos(a).*sin(a).*exp(1i.*b).*((P-1).^2+1./4.*P.^2) (1-P./2).^2.*sin(a).^2+P.^2./8.*cos(a).^2];
ob=bit*ori;
op=pha*ori;
oa=amp*ori;
od=dep*ori;
F1(int16(P./0.01),1)=trace(ob);
F2(int16(P./0.01),1)=trace(op);
F3(int16(P./0.01),1)=trace(oa);
F4(int16(P./0.01),1)=trace(od);
F5(int16(P./0.01),1)=2./3;
end
% plot(P,F1(int16(P./0.01),1))
T=0.01:0.01:1;
plot(T,F1,'r:o',T,F2,'g:*',T,F3,'k:+',T,F4,'b--',T,F5,'c:d');
% plot(P,F1(int16(P./0.01),1),'r',P,F2(int16(P./0.01),1),'g',P,F3(int16(P./0.01),1),'k',P,F4(int16(P./0.01),1),'b');
legend('bitflip','phaseflip','amplitude','depolarize','classical limit')
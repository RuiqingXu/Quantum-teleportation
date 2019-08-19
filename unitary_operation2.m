%% 量子酉操作存在噪声
a=pi./4;
b=pi./3;
F1=zeros(100,1);
F2=zeros(100,1);
F3=zeros(100,1);
F4=zeros(100,1);
F5=zeros(100,1);
for P1=0.01:0.01:1
ori=[sin(a).^2 cos(a).*sin(a).*exp(-1i.*b);cos(a).*sin(a).*exp(1i.*b) sin(a).^2 ];
bit=[cos(a).^2.*(1-P1).^7+sin(a).^2.*P1.^7 cos(a).*sin(a).*exp(-1i.*b).*(1-P1).^7-cos(a).*sin(a).*exp(1i.*b).*P1.^7;cos(a).*sin(a).*exp(1i.*b).*(1-P1).^7-...
    cos(a).*sin(a).*exp(-1i.*b).*P1.^7 sin(a).^2.*(1-P1).^7+cos(a).^2.*P1.^7];
pha=[cos(a).^2.*(1-P1).^7+cos(a).^2.*P1.^7 cos(a).*sin(a).*exp(-1i.*b).*(1-P1).^7-cos(a).*sin(a).*exp(1i.*b).*P1.^7;cos(a).*sin(a).*exp(1i.*b).*(1-P1).^7-...
    cos(a).*sin(a).*exp(-1i.*b).*P1.^7 sin(a).^2.*(1-P1).^7+sin(a).^2.*P1.^7];
amp=[(cos(a).^2.*(2-P1).^3+P1.*(1-P1).*(2-P1).^2.*cos(a).*sin(a).*exp(1i.*b)+cos(a).*sin(a).*exp(-1i.*b).*(2-P1).^2.*P1.*(1-P1)+...
    P1.^2.*(1-P1).^2.*(2-P1).*sin(a).^2+4.*(1-P1).^2.*(2-P1).*cos(a).^2)./16 (cos(a).^2.*(2-P1).^2.*P1.*sqrt(1-P1)+P1.^2.*(1-P1).*(2-P1).*sqrt(1-P1).*cos(a).*sin(a).*exp(1i.*b)+(2-P1).^3.*(1-P1).*sqrt(1-P1).*cos(a).*sin(a).*exp(-1i.*b)+...
    sin(a).^2.*P1.*(1-P1).^2.*(2-P1).^2.*sqrt(1-P1)+4.*cos(a).*sin(a).*exp(-1i.*b).*(1-P1).^3.*(2-P1).*sqrt(1-P1))./16;(cos(a).^2.*(2-P1).^2.*P1.*sqrt(1-P1)+(2-P1).^3.*(1-P1).*sqrt(1-P1).*cos(a).*sin(a).*exp(1i.*b)+cos(a).*sin(a).*exp(-1i.*b).*P1.^2.*(1-P1).*(2-P1).*sqrt(1-P1)+...
    (2-P1).^2.*(1-P1).^2.*P1.*sqrt(1-P1).*sin(a).^2+4.*(1-P1).^3.*(2-P1).*sqrt(1-P1).*cos(a).*sin(a).*exp(1i.*b))./16 (cos(a).^2.*P1.^2.*(1-P1).*(2-P1)+(2-P1).^2.*(1-P1).^2.*P1.*cos(a).*sin(a).*exp(1i.*b)+cos(a).*sin(a).*exp(-1i.*b).*P1.*(2-P1).^2.*(1-P1).^2+...
     sin(a).^2.*(2-P1).^3.*(1-P1).^3+4.*sin(a).^2.*(1-P1).^5.*(2-P1))./16];
dep=[cos(a).^2.*(1-3.*P1./4).^7+2.*sin(a).^2.*(P1./4).^7+cos(a).^2.*(P1./4).^7 cos(a).*sin(a).*exp(-1i.*b).*(1-3.*P1./4).^7-...
    cos(a).*sin(a).*exp(-1i.*b).*(P1./4).^7;cos(a).*sin(a).*exp(1i.*b).*(1-3.*P1./4).^7-cos(a).*sin(a).*exp(1i.*b).*(P1./4).^7 sin(a).^2.*(1-3.*P1./4).^7+...
    2.*cos(a).^2.*(P1./4).^7+sin(a).^2.*(P1./4).^7];
ob=bit*ori;
op=pha*ori;
oa=amp*ori;
od=dep*ori;
F1(int16(P1./0.01),1)=trace(ob);
F2(int16(P1./0.01),1)=trace(op);
F3(int16(P1./0.01),1)=trace(oa);
F4(int16(P1./0.01),1)=trace(od);
F5(int16(P1./0.01),1)=2./3;
end

P=0.01:0.01:1;
%  plot(P,abs(F1),'-o',P,abs(F2),'-*')
 plot(P,abs(F1),'r:o',P,abs(F2),'g:*',P,abs(F3),'k:+',P,abs(F4),'b--',P,F5,'c:d');
%  plot(P,F1(int16(P./0.01),1),'r:o',P,F2(int16(P./0.01),1),'g:*',P,F3(int16(P./0.01),1),'k:+',P,F4(int16(P./0.01),1),'b--');
legend('bitflip','phaseflip','amplitude','depolarize','classical limit')

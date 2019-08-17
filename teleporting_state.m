%% 待传送量子态存在噪声
a=pi./4;
b=pi./3;
F1=zeros(100,1);
F2=zeros(100,1);
F3=zeros(100,1);
F4=zeros(100,1);
F5=zeros(100,1);
for P1=0.01:0.01:1
ori=[sin(a).^2 cos(a).*sin(a).*exp(-1i.*b);cos(a).*sin(a).*exp(1i.*b) sin(a).^2 ];
bit=[cos(a).^2-P1.*cos(2.*a) ((1-P1).*sin(2.*a).*exp(-1i.*b)+P1.*sin(2.*a).*exp(1i.*b))./2;((1-P1).*sin(2.*a).*exp(1i.*b)+P1.*sin(2.*a).*exp(-1i.*b))./2 sin(a).^2+P1.*cos(2.*a)];
pha=[cos(a).^2 1-P1.*sin(2.*a).*exp(-1i.*b);1-P1.*sin(2.*a).*exp(1i.*b) sin(a).^2];
amp=[cos(a).^2+P1.*sin(a).^2 cos(a).*sin(a).*exp(-1i.*b).*sqrt(1-P1);cos(a).*sin(a).*exp(1i.*b).*sqrt(1-P1) (1-P1).*sin(a).^2];
dep=[(1-P1./2).*cos(a).^2 (1-P1).*cos(a).*sin(a).*exp(-1i.*b)+P1./2.*cos(a).*sin(a).*exp(1i.*b);(1-P1).*cos(a).*sin(a).*exp(1i.*b)+P1./2.*cos(a).*sin(a).*exp(-1i.*b) (1-P1./2).*sin(a).^2];
ob=ori*bit;
op=ori*pha;
oa=ori*amp;
od=ori*dep;
F1(int16(P1./0.01),1)=trace(ob);
F2(int16(P1./0.01),1)=trace(op);
F3(int16(P1./0.01),1)=trace(oa);
F4(int16(P1./0.01),1)=trace(od);
F5(int16(P1./0.01),1)=2./3;
end
% plot(P,F1(int16(P./0.01),1))
P=0.01:0.01:1;
plot(P,F1,'r:o',P,F2,'g:*',P,F3,'k:+',P,F4,'b--',P,F5,'c:d');
% plot(P,F1(int16(P./0.01),1),'r',P,F2(int16(P./0.01),1),'g',P,F3(int16(P./0.01),1),'k',P,F4(int16(P./0.01),1),'b');
legend('bitflip','phaseflip','amplitude','depolarize','classical limit')
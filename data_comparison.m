%% 待传送量子态存在噪声
% a0=0.2;
a=pi./4;
% b0=0.5;
b=pi./2;
% ori=[sin(a).^2 cos(a).*sin(a).*exp(-1i.*b);cos(a).*sin(a).*exp(1i.*b) sin(a).^2 ];
P=0:0.1:1;
F00=cos(a).^4+sin(a).^4-P.*cos(2.*a).^2+(1-P)./2.*sin(2.*a).^2+P./4.*sin(2*a).^2.*exp(-2.*1i.*b)+...
      +P./4.*sin(2*a).^2.*exp(2.*1i.*b);
F01=cos(a).^4+sin(a).^4+1./2.*sin(2.*a).*exp(-1i.*b)+1./2.*sin(2.*a).*exp(1i.*b)-P.*sin(2.*a).^2;
F02=cos(a).^4+sin(a).^4-P.*sin(a).^4+P./4.*sin(2.*a).^2+sqrt(1-P)./2.*sin(2.*a).^2;
F03=cos(a).^4.*(1-P./2)+(1-P)./2.*sin(2.*a).^2+P./8.*sin(2.*a).^2.*exp(-2*1i.*b)+...
    +P./8.*sin(2.*a).^2.*exp(2*1i.*b)+sin(a).^4.*(1-P./2);
% plot(P,F00,'r',P,F01,'g',P,F02,'k',P,F03,'b')
% legend('bitflip','phaseflip','amplitude','depolarize');
%% 量子信道存在噪声
F10=P.^2.*cos(a).^4+(1-P).^2.*cos(a).^4+P.*(1-P).*sin(2.*a).^2+1./2.*(P.^2+(1-P).^2).*(sin(2.*a).^2)+...
    +1./2.*P.*(1-P).*sin(2.*a).^2.*exp(-2*1i*b)+1./2.*P.*(1-P).*sin(2.*a).^2.*exp(2*1i*b)+...
    +P.^2.*sin(a).^4+(1-P).^2.*sin(a).^4;
F11=cos(a).^4+1./2.*sin(2.*a).^2.*(3.*P-1).*(P-1)+sin(a).^4;
F12=cos(a).^4.*(1+P.^2)+1./2.*sin(2.*a).^2.*(1+P).*(1-P)+sin(a).^4.*(1-P).^2;
F13=(1./2.*P-1).^2.*cos(2.*a)+1./16.*P.^2.*sin(2.*a).^2+1./2.*sin(2.*a).^2.*((P-1).^2+P.^2./4)+...
    +1./4.*sin(2.*a).^2.*exp(-2.*1i.*b).*(P-7./8.*P.^2)+1./4.*sin(2.*a).^2.*exp(2.*1i.*b).*(P-7./8.*P.^2);
plot(P,F10,'r',P,F11,'g',P,F12,'k',P,F13,'b')
legend('bitflip','phaseflip','amplitude','depolarize');
% bit=[cos(a).^2-P.*cos(2.*a) ((1-P).*sin(2.*a).*exp(-1i.*b)+P.*sin(2.*a).*exp(1i.*b))./2;((1-P).*sin(2.*a).*exp(1i.*b)+P.*sin(2.*a).*exp(-1i.*b))./2 sin(a).^2+P.*cos(2.*a)];
% pha=[cos(a).^2 1-P.*sin(2.*a).*exp(-1i.*b);1-P.*sin(2.*a).*exp(1i.*b) sin(a).^2];
% amp=[cos(a).^2+P.*sin(a).^2 cos(a).*sin(a).*exp(-1i.*b).*sqrt(1-P);cos(a).*sin(a).*exp(1i.*b).*sqrt(1-P) (1-P).*sin(a).^2];
% dep=[(1-P./2).*cos(a).^2 (1-P).*cos(a).*sin(a).*exp(-1i.*b)+P./2.*cos(a).*sin(a).*exp(1i.*b);(1-P).*cos(a).*sin(a).*exp(1i.*b)+P./2.*cos(a).*sin(a).*exp(-1i.*b) (1-P./2).*sin(a).^2];
% ob=ori*bit;
% op=ori*pha;
% oa=ori*amp;
% od=ori*dep;
% F1=trace(ob);
% F2=trace(op);
% F3=trace(oa);
% F4=trace(od);
% (,P,F2,'g',P,F3,'k',P,F4,'b');
% hold on
% plot(P,F2,'g');
% plot(P,F3,'k');
% plot(P,F4,'b');
% hold off
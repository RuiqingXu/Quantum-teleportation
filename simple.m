
%{���ƶ�άͼ��
x=0:pi/100:2*pi;
y1=sin(x);
plot(x,y1);
xlabel('x');
ylabel('y');
title('function');
hold on;
y2=cos(x);
plot(x,y2,'b:+');%r--:��ɫ���ߣ�g:*;��ɫ����
legend('sin','cos')
hold off;
%}
%{������άͼ��
[x,y]=meshgrid(-2:.2:2);
z=x.*exp(-x.^2-y.^2);
surf(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');
title('z=f(x,y)');
%}

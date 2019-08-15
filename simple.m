
%{绘制二维图像
x=0:pi/100:2*pi;
y1=sin(x);
plot(x,y1);
xlabel('x');
ylabel('y');
title('function');
hold on;
y2=cos(x);
plot(x,y2,'b:+');%r--:红色虚线；g:*;绿色点线
legend('sin','cos')
hold off;
%}
%{绘制三维图像
[x,y]=meshgrid(-2:.2:2);
z=x.*exp(-x.^2-y.^2);
surf(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');
title('z=f(x,y)');
%}

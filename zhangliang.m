%%计算量子信道经过比特翻转后的表现形式
P=rand();
B=[1/2 0 0 1/2;0 0 0 0;0 0 0 0;1/2 0 0 1/2];
E0=[sqrt(1-P) 0;0 sqrt(1-P)];
E1=[0 sqrt(P);sqrt(P) 0];
A0=kron(E0,E0);
A1=kron(E0,E1);
A2=kron(E1,E0);
A3=kron(E1,E1);
B0=mtimes(A0,B);
B01=mtimes(B0,A0');
B1=mtimes(A1,B);
B11=mtimes(B1,A1');
B2=mtimes(A2,B);
B21=mtimes(B2,A2');
B3=mtimes(A3,B);
B31=mtimes(B3,A3');
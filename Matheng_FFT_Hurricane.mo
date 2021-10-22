model FFT_Hurricane

parameter Integer N = 160;
Real fn[N];
//Real f2k1[N], f2k[N], F[2*N];
Real y1[N], y2[N], y3[N];
//Real gn[N], hn[N];
//Real W = Modelica.Math.exp(((-1)^0.5)*(2*3.14159265358/N));

algorithm
for i in 1:N loop
  y1[i]:=1*(Modelica.Math.sin(i));
  y2[i]:=0.3333*(Modelica.Math.sin(3*i));
  y3[i]:=0.2*(Modelica.Math.sin(5*i));
  fn:=y1+y2+y3;
end for;
/*
for n in 1:N loop
  gn[n]:=fn[n]+fn[n];
  hn[n]:=fn[n]-(fn[n]*W^n);
  f2k1[n+1]:=f2k1[n]+(hn[n]*W^(2*n*(n+1)));
  f2k[n+1]:=f2k[n]+(gn[n]*W^(2*n*(n+1)));
  F[2*n-1]:=abs(f2k[n+1]);
  F[2*n]:=abs(f2k1[n+1]);
end for;
*/
end FFT_Hurricane;

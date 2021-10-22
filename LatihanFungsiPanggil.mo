function LatihanFungsiPanggil

input Real rh;
input Real v;
input Real h;
input Real pinit;
output Real P;

algorithm
P:=pinit+rh*9.81*h+0.5*rh*v^2;


end LatihanFungsiPanggil;

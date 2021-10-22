model LatihanParameterRealDsb_1

parameter Real Rho=3000;
parameter Real V=10;
parameter Real H=3;
parameter Real Pinit=1000;

Real Ptotal;

equation
Ptotal=LatihanFungsiPanggil(Rho,V,H,Pinit);


end LatihanParameterRealDsb_1;

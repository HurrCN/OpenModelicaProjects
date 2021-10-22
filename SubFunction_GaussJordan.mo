function SubFunction_GaussJordan_Hurricane

//let's say, we have matrices equation [A]{u} = {b}
input Real A[8,8];
input Real b[8];
output Real x[8];

//define float error
protected
Real error = 10e-10;

algorithm
x:=Modelica.Math.Matrices.solve(A,b);

//Eliminating float error for less than error value
for i in 1:8 loop
  if abs(x[i]) <= error then x[i]:= 0;
  end if;
end for;

end SubFunction_GaussJordan_Hurricane;

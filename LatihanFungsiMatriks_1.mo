function LatihanFungsiMatriks
input Real A[3,3];
input Real B[3];
output Real X[3];

algorithm
X:=Modelica.Math.Matrices.solve(A,B);

end LatihanFungsiMatriks;

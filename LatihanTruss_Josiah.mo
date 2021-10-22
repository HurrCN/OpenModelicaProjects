model LatihanTruss

//define initial variable
parameter Integer Points=5; //Number of Points
parameter Integer Trusses=6; //Number of Trusses
parameter Real Area=8; //Area
parameter Real Elas=1.9e6; //Elasticity

//define connection
parameter Integer C[Trusses,2]=[1,2;
                                2,3;
                                2,4;
                                2,5;
                                3,4;
                                4,5];
                              
//define coordinates (please put orderly)
parameter Real P[Points,2]=[0,0;
                            36,0;
                            0,36;
                            36,36;
                            72,36]; 

//define external force (please put orderly)
parameter Real F[Points*2]={0,0,
                            0,0,
                            0,0,
                            0,-500,
                            0,-500};

//define boundary
parameter Integer b[:]={1,3};

//solution
Real displacement[N], reaction[N];

protected
Integer boundary[2*size(b,1)]=cat(1,(2*b).-1,2*b);
parameter Integer N=2*Points;
Real q1[N], q2[N], G[N,N], g[N,N], G_star[N,N], id[N,N]=identity(N), err=10e-10, cos, sin, L, X[2,2];

algorithm
//Creating Global Matrix
G:=id;

for i in 1:Trusses loop
  for j in 1:2 loop
    q1[j]:=P[C[i,1],j];
    q2[j]:=P[C[i,2],j];
  end for;

    //Solving Matrix
    L:=Modelica.Math.Vectors.length(q2-q1);
    cos:=(q2[1]-q1[1])/L;
    sin:=(q2[2]-q1[2])/L;
    X:=(Area*Elas/L)*[  cos^2, cos*sin;
                      sin*cos,   sin^2]; 
   
    //Transforming to global matrix
    g:=zeros(N,N);
    for m in 1:2 loop
      for n in 1:2 loop
        g[2*(C[i,1]-1)+m,2*(C[i,1]-1)+n]:=X[m,n];
        g[2*(C[i,2]-1)+m,2*(C[i,2]-1)+n]:=X[m,n];
        g[2*(C[i,2]-1)+m,2*(C[i,1]-1)+n]:=-X[m,n];
        g[2*(C[i,1]-1)+m,2*(C[i,2]-1)+n]:=-X[m,n];
      end for;
    end for;
      
  G_star:=G+g;
  G:=G_star;
end for;

//Implementing boundary
for i in boundary loop
 for j in 1:N loop
   G[i,j]:=id[i,j];
 end for;
end for;

//Solving displacement
displacement:=Modelica.Math.Matrices.solve(G,F);

//Solving reaction
reaction:=(G_star*displacement)-F;

//Eliminating float error
for i in 1:N loop
  reaction[i]:=if abs(reaction[i])<=err then 0 else reaction[i];
  displacement[i]:=if abs(displacement[i])<=err then 0 else displacement[i];
end for;

end LatihanTruss;

model TugasProjectTruss_InternalForce_Hurricane

parameter Real nJoint=4;
parameter Real nTruss=4;
parameter Integer N=nJoint*2;
parameter Real U[N]={ 0,             0,
                      -0.00016069,   -0.000659479,
                      0,             0,
                      0,             -0.000730902};
parameter Integer Nodes[nTruss,2]=[ 1, 2;
                                    2, 3;
                                    2, 4;
                                    3, 4];
parameter Real X[N]={0,138.1897,90,0};
parameter Real T[N,N];
Real u[N];

algorithm
//T:=[(Modelica.Math.cos(X)),

end TugasProjectTruss_InternalForce_Hurricane;

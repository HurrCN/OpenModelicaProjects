class LatihanMatriks
parameter Real c1=1; //spring 1
parameter Real c2=2; //spring 2
parameter Real c3=3; //spring 3
parameter Real c4=4; //spring 4
parameter Real c5=5; //spring 5
parameter Real k1[3,3]=c1*[1,0,0;
                           0,0,0;
                           0,0,0];
parameter Real k2[3,3]=c2*[1,-1,0;
                           -1,1,0;
                           0,0,0];
parameter Real k3[3,3]=c3*[1,-1,0;
                           -1,1,0;
                           0,0,0];
parameter Real k4[3,3]=c4*[1,0,-1;
                           0,0,1;
                           -1,0,1];
parameter Real k5[3,3]=c5*[0,0,0;
                           0,1,-1;
                           0,-1,1];
  
parameter Real B[3]={100,200,300};
Real K[3,3]; 
Real s[3];
 
algorithm
K:=k1+k2+k3+k4+k5;
s:=LatihanFungsiMatriks(K,B);
end LatihanMatriks;

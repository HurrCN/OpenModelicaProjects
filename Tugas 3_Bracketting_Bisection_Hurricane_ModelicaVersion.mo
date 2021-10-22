//Developed by Muhammad Hurricane
//Finalized in June 3, 2021


model Bracketting_Bisection_Hurricane
/*
parameter Real a=0;       //lower limit guess
parameter Real b=1;       //upper limit guess
parameter Integer N=500;  //iteration limit
parameter Real tolerance=0.0000000000000001;

//function definition for boundaries given
Real fa = a^3-7*a^2+18*a-11.4;
Real fb = b^3-7*b^2+18*b-11.4;
Real fA[N], fB[N];
Real A[N], B[N]; //boundaries will be keep updated over iteration
Real Xns[N], fXns[N]; //every iteration's result
Real Error[N];
Real Solution;

algorithm

// to check whether the guess may bracket the root correctly
if fa*fb < 0 then
  A[1]:=a; //taking the intial guess as the first value
  B[1]:=b; //as well
  Xns[1]:=(B[1]-A[1])/2; //let's define it as the midpoint
  fA[1]:=A[1]^3-7*A[1]^2+18*A[1]- 11.4;
  fB[1]:=B[1]^3-7*B[1]^2+18*B[1]- 11.4;
  fXns[1]:=Xns[1]^3-7*Xns[1]^2+18*Xns[1]- 11.4;
  
  for i in 2:N loop
    if (fXns[i-1]*fA[i-1])<0 then
      A[i]:=A[i-1];
      B[i]:=Xns[i-1];
    else
      A[i]:=Xns[i-1];
      B[i]:=B[i-1];
    end if;
    
    fA[i]:=A[i]^3-7*A[i]^2+18*A[i]- 11.4;
    fB[i]:=B[i]^3-7*B[i]^2+18*B[i]- 11.4;
    Xns[i]:=(A[i]+B[i])/2;
    fXns[i]:=Xns[i]^3-7*Xns[i]^2+18*Xns[i]-11.4;
    Error[i]:=abs((Xns[i]-Xns[i-1])/Xns[i]);
    
    if Error[i]<tolerance then
      Solution:=Xns[i];
      break;      
    end if;
    
  end for;
end if;
*/

parameter Real a=0; //guess bawah 
parameter Real b=1; //guess atas 
parameter Integer N=100; //max iteration 
parameter Real er=0.0000001; //error maximum 

Real fa = (a^3)-(7*a^2)+(18*a)-11.4;
Real fb = (b^3)-(7*b^2)+(18*b)-11.4;
Real A[N]; 
Real B[N]; 
Real fy[N]; 
Real y[N]; 
Real ER[N]; 
Real sol;
//written by Josiah Enrico S

//solution  
algorithm  

if fa*fb<0 then  
 A[1]:=a; 
 B[1]:=b;
 y[1]:=(A[1]+B[1])/2;
 fy[1]:=(y[1]^3)-(7*y[1]^2)+(18*y[1])-11.4;
 ER[1]:=1;

 for i in 2:N loop
  if fy[i-1]<0 then
   A[i]:=y[i-1];
   B[i]:=B[i-1];
  else
   A[i]:=A[i-1];
   B[i]:=y[i-1];
  end if;  

  y[i]:=(A[i]+ B[i])/2;
  fy[i]:=(y[i]^3)-(7*y[i]^2)+(18*y[i])-11.4;
  ER[i]:=abs(1-y[i-1]/y[i]);

  if ER[i]<er then
   sol:=y[i];
   break;
  end if;
  
 end for;
end if;

end Bracketting_Bisection_Hurricane;

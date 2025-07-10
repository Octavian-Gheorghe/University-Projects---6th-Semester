function I = ad_trapezoid(f,a,b,error,m)
  I1 = trapezoid_rule(f,a,b,m);
  I2 = trapezoid_rule(f,a,b,2*m);
  if(abs(I1 - I2) < error)
    I = I2;
  else
    I = ad_trapezoid(f,a,(a+b)/2,error,m) + ad_trapezoid(f,(a+b)/2,b,error,m);
end


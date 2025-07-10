f = @(x) 2./sqrt(pi) * e .^ (-x.^2)
a = 0
b = 2
m = 4
error = 0.1
b = 0.1
while b <= 1
  I = ad_trapezoid(f,a,b,error,m);
  IPredefFormula = integral(f,a,b);
  b = b + 0.1;
endwhile

f = @(x) (1 ./ (2 + sin(x)))
error = 0.1
n_max = 10
a = 0
b = pi/2
I = romberg(f,a,b,error,n_max)



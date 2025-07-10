f = @(x) 1./x
a = 1
b = 2
n = 100
I = simpsons_rule(f,a,b,n)
I = rectangle_rule(f,a,b,n)
I = trapezoid_rule(f,a,b,n)

#x0 = a
#xn = b
#xi = a + h*i

x0 = linspace(-2, 4, 7)
f0 = (x0 + 1) ./ (3 .* x0 .^2 + 2 .* x0 + 1)
d0 = (((3 .* x0 .^2 + 2 .* x0 + 1) - (6 .* x0 + 2) .* (x0 + 1)) ./ (3 .* x0 .^2 + 2 .* x0 + 1) .^ 2)
#x = linspace(-2, 4)
#fi = lagrangeNewton(x0, f0, x)
H = doHermite(x0, f0, d0, x)
#db = spline(x0, f0, x)
#f = (x + 1) ./ (3 .* x .^2 + 2 .* x + 1)
#hold on;
#plot(f)
#hold on;
#plot(H);
#hold on;
#db = spline(x0, f0, x);
#plot(db)


#x0 = [-1, -1/2, 0, 1/2, 1, 3/2]
#f0 = sin(pi * x0)
#d0 = sin(pi) + pi .* x .* cos(pi * x)
#x = linspace(-1, 3/2)
#f - sin(pi * x)
#H = doHermite(x0, f0, d0, x)
#dbs = spline(x0, f0, x)
#dbsc = spline(x0, [d0(1), f0, d0(length(d0))], x)
#ph = pchip(x0, f0, x)
#plot(x0, f0, 'o')
#hold on;
#plot(x, ph)
#hold on;
#plot(x, dbs)
#hold on;
#plot(x, dbsc)



x = [0.5, 1.5, 2, 3, 3.5, 4.5, 5, 6, 7, 8]
f = [5, 5.8, 5.8, 6.8, 6.9, 7.6, 7.8, 8.2, 9.2, 9.9]
p = polyfit(x, f, 1)
pval = polyval(p, x)
pfour = polyval(p, 4)
difffour = norm(f - pval)
plot(x, f, 'o')
hold on;
plot(x, pval)






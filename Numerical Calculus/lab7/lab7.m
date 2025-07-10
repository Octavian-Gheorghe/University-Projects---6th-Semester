
#x = [0, 1/3, 1/2. 1]
#f = cos(pi * x)
x0 = [1,2,3]
f0 = [1,4,9]
x = [5,6]
N = lagrangeNewton(x0, f0, x)

A = lagrangeAitken(x0, f0, x)


# 1
x0 = [0, 1/3, 1/2, 1]
f0 = cos(pi * x0)
x = linspace(0, 1, 50)
f = cos(pi * x)
N = lagrangeNewton(x0, f0, x)
plot(f, '-')
hold on
plot(N, 'o')

N = lagrangeNewton(x0, f0, [1/5])


#2
x0 = linspace(-4, 4, 9)
f0 = 2 .^ x0
x = [1/2]
A = lagrangeAitken(x0, f0, x)


#3.
x0 = [1000, 1010, 1020, 1030, 1040, 1050]
f0 = zeros(size(x0))
for i = 1 : length(x0)
  f0(i) = log10(x0(i))
end
x = [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009]
N = lagrangeNewton(x0, f0, x)


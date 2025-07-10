# use norm (T, inf) to get || T ||

#1. 1. Use both iterative methods to approximate the solution of the linear system (Problem 1, Lab Nr. 4)
# 5x1 − x2 = 4
# −xj−1 + 5xj − xj+1 = 3, j = 2, n − 1,
# − xn−1 + 5xn = 4
# for n = 1000. Compare the number of iterations needed for an error of 10−5
n = 7;
A = zeros(n, n);
A(1,1) = 5;
A(1,2) = -1;
A(n,n) = 5;
A(n,n-1) = -1;

b = zeros(n,1);
b(1,1) = 4;
b(n,1) = 4;

for j = 2:n-1
  A(j,j-1) = -1;
  A(j,j) = 5;
  A(j, j+1) = -1;
  b(j,1) = 3;
end
disp("A");
disp(A);
disp("\n");
disp("b");
disp(b');

x_0 = zeros(1, n)
err = 10 ^ (-5)
maxnit = 1000

[x, nit] = solve_jacobi(A, b, x_0, err, maxnit)
[x, nit] = solve_gauss_seidel(A, b, x_0, err, maxnit)



#2. (Wilson’s Example) Consider the system Ax = b, where

# a) solve the system.

A = [ 10, 7, 8, 7 ; 7 5 6 5 ; 8 6 10 9 ; 7 5 9 10 ]
b = [32 23 33 31 ]'
xa = A \ b

# b) Perturb b to ˜b = ... . Solve the system Ax = ˜b. What are the input and output relative
errors?
A = [ 10, 7, 8, 7 ; 7 5 6 5 ; 8 6 10 9 ; 7 5 9 10 ]
bchanged = [32.1 22.9 33.1 30.9 ]'
xb = A \ bchanged
errb = norm(xa-xb, inf)/norm(xa, inf)
errbchanged = norm(b-bchanged, inf)/norm(b, inf)


# c) The same question for the perturbed system matrix A
Achanged = [ 10, 7, 8.1, 7.2 ; 7.8 5.04 6 5 ; 8 5.98 9.89 9 ; 6.99 4.99 9 9.98 ]
b = [32 23 33 31 ]'
xc = Achanged \ b
errc = norm(xa-xc, inf)/norm(xa, inf)
errcchanged = norm(A - Achanged, inf)/norm(A, inf)

# d) Explain the phenomenon.
cond(A)
#since this is large, small perturbations in b will lead to huge perturbations in x

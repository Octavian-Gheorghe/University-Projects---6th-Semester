# 1. Implement back substitution for solving an upper triangular linear system and forward substitution for solving a lower triangular linear system.

#examples from course 2
U = [ 2 4, 2 ; 0 -1 1 ; 0 0 -1 ]
b = [ 8 0 -1]
x = back_substitution(U, b);
x = x'


U = [ 1 0 0 ; 1/2 1 0 ; 1/2 1 1 ]
b = [ 8 4 3 ]
x = forward_substitution(U, b);
x = x'


#2. Implement Gaussian elimination with partial pivoting.

#example from course 2

A = [ 1 -1 1 ; -2 2 1 ; -3 -1 5 ]
b = [ -1 2 -5 ]
b = b'
x = gaussian_elimination_pivoting(A, b);
x = x'


# Implement a routine that solves the system Ax=b using
# - LUP factorization

# I am testing specifically the decomposition, cause if the deocmposition is correct, then the calculation of Ly = Pb and  Ux = y. is easily done
A = [ 2 1 -2 ; 1 1 -1 ; 3 -1 1 ]
[L, U, P] = LUP_decomposition(A);
disp(L);
disp("\n")
disp(U);
disp("\n")
disp(P);


# - Cholesky factorization

# I am testing specifically the decomposition
A = [ 4 12 -16 ; 12 37 -43 ; -16 -43 98 ]
R = cholesky_decomposition(A)
A = R * R'


# - QR factorization

A = [ 1 1 0 ; 1 0 1 ; 0 1 1 ]
[ Q, R ] = qr_decomposition(A);
disp(Q)
disp("\n")
disp(R)



# 1. Use both methods(Gaussian elimination and factorizations,when possible)to solve the linear system
#you know what, just read the damn notes


disp("Exercise 1: \n");
A = [ 2 1 -1 -2 ; 4 4 1 3 ; -6 -1 10 10 ; -2 1 8 4 ]
b = [2 4 -5 1]
b = b'
x = gaussian_elimination_pivoting(A, b);
x = x'
x = solve_LUP(A, b);
x = x'
#cholesky here, not plausable since it is not symmetric
#x = solve_cholesky(A, b);
#x = x'
x = solve_QR(A, b);
x = x'


# 2. Use both methods(Gaussian elimination and factorizations,when possible)to solve the linear system
#you know what, just read the damn notes
disp("Exercise 2: \n");
n = 10;
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
disp(A);
disp("\n");
disp(b);
x = gaussian_elimination_pivoting(A, b);
x = x'
x = solve_LUP(A, b);
x = x'
x = solve_cholesky(A, b);
x = x'
x = solve_QR(A, b);
x = x'



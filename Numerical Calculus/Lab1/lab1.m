#Declaration of a 3 x 3 matric
A = [1 2 3 ; 4 5 6 ; 7 8 9]

#Determinant of a Matrix
det(A)

#Inverse of a Matrix
inv(A)

#Traditional Matrix multiplication is done using "*"
AMultiplied = A * A

#Multiplication of elements of a matrix that are on the same position in their respective matrices is done using .*
AMultipliedModularly = A .* A

#AIdentity is identity of A; An identity matrix is a matrix where all elements on the 'main diagonal' are 1 and 0 otherwise
AIdentity = A * inv(A)

#For using an exponential, you can use ^
APowTwo = A ^ 2

#.^ has the same purpouse as .*, it  multiplies a matrix by multiplying each element on the same position in their respective matrix.
#While .* multiplies different matrices, .^ is used to multiply a matrix with itself
APowTwoModularly = A .^ 2

#This is how you declare a vector that has elements from 1 to 100, one by one
#Vector = [ x : y ]
# x = the start value
# y = the end value
v = [1:100]

#This is how you declare a vector that has elements from 1 to 100, two by two
#Vector = [ x : k : y ]
# x = the start value
# k = the value by each you increment from x until y
# y = the end value
vOdd = [1:2:100]

#You cannot use * on vector and must use .*

# If you want to "invert" a vector, by putting all the elements on a column instead of a line, we use " ' "
vOnCol = v'



#Laboratory 1

#1. Let p(x) = x^5 - 5x^4 - 16x^3 + 16x^2 - 17x + 21
# a) Plot the graph on the interval [ -4 , 7.2 ]

#We declare x as a set of values that starts at -4, ends at 7.2 and is incremented by 0.1
x = -4 : 0.1 : 7.2

#px is simply a vector that calculates the value of the function for each value determined by x above
px = x .^ 5 - 5 * x .^ 4 - 16 * x .^ 3 + 16 * x .^ 2 - 17 * x + 21

#this fnction plots all the values on a window
figure(1) % this figure function allows us to open multiple figure files by running the same script
plot(x,px)


# b) Compute p( -2.5 )
#Here we use another approach, we create a vector that is meant to tell us the coefficient of each value of x^i, with i from [len(vector), 0]. This is, thus, a polynomial
#We will then multiply -2.5 with p
p = [1, -5, -16, 16, -17, 21]
pForMinusTwoPointFive = polyval(p, -2.5)


# c) Find the roots of p
# Since p is a polynomial, Octave provides the function "roots" that returns the values for which p(x) = x^5 - 5x^4 - 16x^3 + 16x^2 - 17x + 21 is 0
# The values are returned in a format resembling an imaginary number wether the result is a real number or not
p = [1, -5, -16, 16, -17, 21] % redundant, but we write it here to make everything as clear as possible
RootsOfP = roots(p)

#Since one of the answers is "7.0000 + 0i", we try to multiply p with 7, the expected result is 0
pForSeven = polyval(p, 7)



# 2. Plot the function f, g, h : [ 0 , 2π ] -> |R, f(x) = sin x, g(x) = sin 2x, h(x) = sin 3x, on the same figure, in three tiled positions, one on top of the other
x = [0 : 0.1 * pi : 2 * pi]
#In order to plot the 3 functions on the same figure, in three tiled positions, we use the function subplot(x,y,z)
#This function can create multiple plots within a single figure by dividing the figure into a grid of subplots
# x - the number of rows
# y - the number of columns
# z - the index, which is from 1 to x*y
#It opens a windows with x * y plots available for plotting. You indicate which plot is next to be shown, and then plot it as usual
figure(2)
fx = sin(x)
subplot(3,1,1)
plot(x,fx)
title('sin(x)')

gx = sin(2*x)
subplot(3,1,2)
plot(x,gx)
title('sin(2x)')

hx = sin(3*x)
subplot(3,1,3)
plot(x,hx)
title('sin(3x)')

#For the sake of making sure we cover everything that could be asked of us, we will also do one on top of the other
#We simply use the "plot" function, but this time, we specify a few more things such as a line color (with it's style), a line width
figure(3)
plot(x, fx, 'b--', 'LineWidth', 2) % Blue dashed line
hold on
plot(x, gx, 'g-.', 'LineWidth', 3) % Green dash-dot line
hold on
plot(x, hx, 'm:', 'LineWidth', 4) % Magenta dotted line
legend('sin(x)', 'sin(2x)', 'sin(3x)')


# 3. For R, r from |R+, consider the epicycloid (also called hypercycloid), given by the parametric equations
# t from [ 0 , 10π ]
# x(t) = (R + r)cos t - r cos ((R/r + 1) t)
# y(t) = (R + r)sin t - r sin ((R/r + 1) t)
#Plot its graph, for R = 3.8, r = 1
t =[0 : 0.01 * pi : 10 * pi]
R = 3.8
r = 1
x = ( R + r ) * cos(t) - r * cos((R / r + 1) * t)
y = ( R + r ) * sin(t) - r * sin((R / r + 1) * t)
figure(4)
plot(x,y)

# 4. Plot the function of two variables, f : [ -2 , 2 ] X [ 0.5 , 4.5 ] -> |R, f(x, y) = sin (e ^ x) cos (ln y) (using both mesh and plot3)
x = [-2 : 0.1 : 2]
y = [ 0.5 : 0.1 : 4.5]

#We use meshgrid to plot:
#meshgrid is creates coordinate grids for 3D plotting and matrix operations.
#It generates two 2D matrices from two 1D vectors, which are useful for evaluating functions over a grid
[x,y] = meshgrid(x, y)
fxy = sin ( exp ( x ) ) .* cos ( log ( y ) )

figure(5)
mesh(x,y,fxy)

figure(6)
plot3(x,y,fxy)



# for this lab you need to use the taylor function. If it is undefined, then:
# 1. run "pkg install -forge symbolic" in command window
# 2. run "pkg load symbolic" in command window

# 1. Use formula (2) to do the following:
#   a) Graph on the same set of axes the function e^x and its Taylor polynomials of degrees 1, 2, 3 and 4, for x from [ -3 , 3 ]
pkg load symbolic
syms x
f = exp(x)
T1 = taylor(f, x, 0, 'Order', 2) # degree 1
T2 = taylor(f, x, 0,'Order', 3) # degree 2
T3 = taylor(f, x, 0, 'Order', 4) # degree 3
T4 = taylor(f, x, 0, 'Order', 5) # degree 4
f_handle = matlabFunction(f)
T1_handle = matlabFunction(T1)
T2_handle = matlabFunction(T2)
T3_handle = matlabFunction(T3)
T4_handle = matlabFunction(T4)
x_vals = -3:0.1:3
figure(1)
hold on
plot(x_vals, f_handle(x_vals), 'k', 'LineWidth', 2, 'DisplayName', 'e^x')
plot(x_vals, T1_handle(x_vals), 'r--', 'DisplayName', 'Degree 1')
plot(x_vals, T2_handle(x_vals), 'g--', 'DisplayName', 'Degree 2')
plot(x_vals, T3_handle(x_vals), 'b--', 'DisplayName', 'Degree 3')
plot(x_vals, T4_handle(x_vals), 'm--', 'DisplayName', 'Degree 4')
hold off

#    b) Approximate e with 6 correct decimals
T = taylor(f, x, 'Order', 101);
T_handle = matlabFunction(T);
e_approx = T_handle(1); # approximate for x = 1
printf("Approximated e: %.6f\n", e_approx);

#Alternatively, use vpa(e, 8) - that would mean that it would write the value of e


# 2. Use formula (4) to do the following:
#   a) Graph on the same set of axes the function sin x and its Taylor polynomials of degrees 1, 2, 3 and 4, for x from [ -pi , pi ]
syms x
f = sin(x)
T1 = taylor(f, x, 'Order', 4) # degree 3
T2 = taylor(f, x, 'Order', 6) # degree 5
f_handle = matlabFunction(f)
T1_handle = matlabFunction(T1)
T2_handle = matlabFunction(T2)
x_vals = -pi:0.1*pi:pi
figure(2)
hold on
plot(x_vals, f_handle(x_vals), 'k', 'LineWidth', 2, 'DisplayName', 'e^x')
plot(x_vals, T1_handle(x_vals), 'r--', 'DisplayName', 'Degree 3')
plot(x_vals, T2_handle(x_vals), 'g--', 'DisplayName', 'Degree 5')
hold off

#   b) Approximate sin(pi/5) with 5 correct decimals
T = taylor(f, x, 'Order', 101);
T_handle = matlabFunction(T);
sinOfPiBy2_approx = T_handle(pi/5);
printf("Approximated e: %.5f\n", e_approx);


#   c) What happens for x = 10 pi / 3? Explain the phenomenon and find a sollution
T = taylor(f, x, 'Order', 101);
T_handle = matlabFunction(T);
e_approx = T_handle(10*pi/3);
printf("Approximated e: %.10f\n", e_approx);


# 3.
#   a) Using formula (5), graph on the same set of axes the function ln(1 + x) and its Taylor polynomials of degrees 2 and 5, for x ∈ [−0.9,1];
syms x
f = log(1+x) # formula (5)
T1 = taylor(f, x, 'Order', 3) # degree 2
T2 = taylor(f, x, 'Order', 6) # degree 5
f_handle = matlabFunction(f)
T1_handle = matlabFunction(T1)
T2_handle = matlabFunction(T2)
x_vals = - 0.9 : 0.01 : 1
figure(3)
hold on
plot(x_vals, f_handle(x_vals), 'k', 'LineWidth', 2, 'DisplayName', 'e^x')
plot(x_vals, T1_handle(x_vals), 'r--', 'DisplayName', 'Degree 3')
plot(x_vals, T2_handle(x_vals), 'g--', 'DisplayName', 'Degree 5')
hold off

#   b) How many terms would be necessary in (5) to approximate ln2 with 5 correct decimals?
syms x
f = log(1+x)
# ?
for i = 2 : 15
  T = taylor(f, x, 'Order', i)
  T_handle = matlabFunction(T);
  approx = T_handle(1);
  printf("Approximated e: %.5f\n", approx);
end

vpa(log(2),7)

#   c) Use formula (5) to find a Taylor series expansion for the function ln(1 − x).
syms x
f = log(1 + x);
T = taylor(f, x, 'Order', 6);
T_neg_x = subs(T, x, -x);
disp(T_neg_x)
# so the question is why it gives: -0.8660254038

#   d) Use formula (5) and the one found in part c) to derive a Taylor series expansion for the function ln ( 1 + x / 1 − x )
syms x
f = log(1 + x);
T1 = taylor(f, x, 'Order', 6);
T2 = subs(T1, x, -x);
T_final = T1 - T2;
disp('Taylor series expansion for ln((1 + x) / (1 - x)) up to 5th degree:')
disp(T_final)


#   e) Use the formula found in part d) to approximate ln2 with 5 correct decimals. How many terms are necessary?

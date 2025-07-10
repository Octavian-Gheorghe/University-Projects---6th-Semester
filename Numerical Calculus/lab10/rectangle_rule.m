function I = rectangle_rule(f, a, b, n)
  h = (b -a) / n;
  # I is just that sum
  i = 0;
  I = 0;
  while i < n
    I = I + h * f(a + (i + 1/2) * h);
    i = i + 1;
  endwhile
end


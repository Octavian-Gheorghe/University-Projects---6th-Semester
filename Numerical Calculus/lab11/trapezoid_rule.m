function I = trapezoid_rule(f, a, b, n)
  h = (b-a)/n;
  f0 = f(a)
  fn = f(b)
  feverythingelse = 0;
  i = 1;
  while i < n
    xi = a + h * i;
    feverythingelse = feverythingelse + f(xi);
    i = i + 1;
  endwhile
  I = h / 2 * (f0 + fn + 2 * feverythingelse);
end

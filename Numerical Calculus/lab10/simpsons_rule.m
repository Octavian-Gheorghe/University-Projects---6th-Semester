function I = simpsons_rule(f, a, b, m)
  h = (b-a)/(2*m); # n = 2*m
  i = 1;
  ffirstsum = 0;
  while i <= m
    x = a + h * (2 * i - 1);
    ffirstsum = ffirstsum + f(x);
    i = i + 1;
  endwhile
  fsecondsum = 0;
  i = 1;
  while i < m
    x = a + h * (2 * i);
    fsecondsum = fsecondsum + f(x);
    i = i + 1;
  endwhile
  I = (h/3)*(f(a) + 4 * ffirstsum + 2 * fsecondsum + f(b));
end


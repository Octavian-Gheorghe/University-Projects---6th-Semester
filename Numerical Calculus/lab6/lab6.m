# 1

nodes = linspace(-2,4,10);
f_nodes = (nodes + 1) ./ (3 .* nodes .* nodes + 2 .* nodes + 1);
figure(1);
x = linspace(-2,4,500);
x_nodes = (x + 1) ./ (3 .* x .* x + 2 .* x + 1);
fi = doLagrangeBar(nodes, f_nodes, x);
hold on;
plot(x, x_nodes, 'o');
plot(x, fi);

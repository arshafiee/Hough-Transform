function [xunit, yunit] = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
for i = 1:length(x)
    xunit = r * cos(th) + x(i);
    yunit = r * sin(th) + y(i);
    plot(xunit, yunit);
end
hold off
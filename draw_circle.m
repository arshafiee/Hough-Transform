function [xunit, yunit] = draw_circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
for i = 1:length(x)
    xunit = r(i) * cos(th) + x(i);
    yunit = r(i) * sin(th) + y(i);
    plot(xunit, yunit);
end
hold off
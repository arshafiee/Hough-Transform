function H = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    
    H = zeros(size(BW));
    th = 0:pi/50:2*pi;
    
    [y x] = find(BW == 1);
    
    for pt = 1:length(x)
        xunit = radius * cos(th) + x(pt);
        yunit = radius * sin(th) + y(pt);
        for i = 1:length(xunit)
            if (round(yunit(i)) >= 1)&&(round(yunit(i)) <= size(BW, 1))...
                    &&(round(xunit(i)) >= 1)&&...
                    (round(xunit(i)) <= size(BW, 2))
                H(round(yunit(i)), round(xunit(i))) = ...
                    H(round(yunit(i)), round(xunit(i))) + 1;
            end
        end
    end
end

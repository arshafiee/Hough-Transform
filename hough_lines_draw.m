function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees
    
    figure();
    imshow(img);
    
    for pk = 1:length(peaks)
        R = rho(peaks(pk, 1));
        T = theta(peaks(pk, 2));
        if sin(T / 180 * pi) == 0
            x = [R R];
            y = [1 size(img, 1)];
            hold on
            pl = line(x, y);
            pl.Color = 'green';
            pl.LineWidth = 1;
        else
            x = [1 size(img, 2)];
            y = (R - x .* cos(T / 180 * pi))./ sin(T / 180 * pi);
            hold on
            pl = line(x, y);
            pl.Color = 'green';
            pl.LineWidth = 1;
        end
        
    end

end

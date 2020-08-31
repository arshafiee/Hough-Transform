function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    [y x] = find(BW == 1);
    %x = x - 1;
    %y = y - 1;
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});
   
    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;
    D = sqrt((size(BW,1)-1)^2 + (size(BW,2)-1)^2);
    NRHO = (2 * ceil(D/rhoStep)) + 1;
    DIAGONAL = rhoStep * ceil(D/rhoStep);
    rho = -1 * DIAGONAL : rhoStep :DIAGONAL;
    %% TODO: Your code here
    H = zeros(length(rho),length(theta));
    distance = zeros(1,length(rho));
    for i = 1:length(x)
        for th = 1:length(theta)
            d = x(i) * cos(theta(th)/180 * pi) + y(i) * ...
                sin(theta(th)/180 * pi);
            distance = abs(rho - d);
            [value, index] = min(distance);
            H(index,th) = H(index,th) + 1;
        end
    end
end

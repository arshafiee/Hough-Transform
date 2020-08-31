function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.5 * max(H(:)));
    addParameter(p, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;
  %  numpeaks
   % threshold
    %nHoodSize

    % TODO: Your code here
    Rawpeaks = zeros(numpeaks, 3);
    for i = 1:numpeaks
        Sorted_H = sort(H(:),'descend');
        [rho, theta] = find(H == Sorted_H(1));
        Rawpeaks(i,1) = rho(1);
        Rawpeaks(i,2) = theta(1);
        Rawpeaks(i,3) = Sorted_H(1);
        if (rho - floor(nHoodSize(1)/2) >= 1)
            margin1 = rho - floor(nHoodSize(1)/2);
        else
            margin1 = 1;
        end
        if (rho + floor(nHoodSize(1)/2) <= size(H,1))
            margin2 = rho + floor(nHoodSize(1)/2);
        else
            margin2 = size(H,1);
        end
        if (theta - floor(nHoodSize(2)/2) >= 1)
            margin3 = theta - floor(nHoodSize(2)/2);
        else
            margin3 = 1;
        end
        if (theta + floor(nHoodSize(2)/2) <= size(H,2))
            margin4 = theta + floor(nHoodSize(2)/2);
        else
            margin4 = size(H,2);
        end
        H(margin1:margin2,margin3:margin4) = 0;
    end
    peaks = zeros(1,3);
    j = 1;
    for i = 1:numpeaks
        if (Rawpeaks(i,3) >= threshold)
            peaks(j,1) = Rawpeaks(i,1);
            peaks(j,2) = Rawpeaks(i,2);
            peaks(j,3) = Rawpeaks(i,3);
            j = j + 1;
        end
    end
    
end

function lastpeaks = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    
    th = 0:pi/50:2*pi;
    
    [y x] = find(BW == 1);
    radius = radius_range(1):0.1:radius_range(2);
    H = zeros(size(BW, 1), size(BW, 2), length(radius));
    
    for r = 1:length(radius)
        for pt = 1:length(x)
            xunit = radius(r) * cos(th) + x(pt);
            yunit = radius(r) * sin(th) + y(pt);
            for i = 1:length(xunit)
                if (round(yunit(i)) >= 1)&&(round(yunit(i)) <= size(BW, 1))...
                        &&(round(xunit(i)) >= 1)&&...
                        (round(xunit(i)) <= size(BW, 2))
                    H(round(yunit(i)), round(xunit(i)), r) = ...
                        H(round(yunit(i)), round(xunit(i)), r) + 1;
                end
            end
        end
    end
    
    max_of_all = max(H(:));
    Rawpeaks = zeros(1, 4);
    counter = 1;
    
    for r = 1:length(radius)
        peaks = hough_peaks(H(:,:, r), 10, 'Threshold', 0.7 * max_of_all);
        if peaks(1, 3) ~= 0
            for i = 1:size(peaks, 1)
                Rawpeaks(counter, 1:3) = peaks(i,:);
                Rawpeaks(counter, 4) = radius(r);
                counter = counter + 1;
            end
        end
    end
    
    [~,idx] = sort(Rawpeaks(:,3), 'descend');
    sorted = Rawpeaks(idx,:);
    
    lastpeaks = zeros(1, 4);
    counter = 1;
    exit_flag = 0;
    
    for i = 1:size(sorted, 1)
        for j = 1:size(lastpeaks, 1)
            if (abs(sorted(i, 1) - lastpeaks(j, 1)) <= 11) && ...
                    (abs(sorted(i, 2) - lastpeaks(j, 2)) <= 11)
                exit_flag = 1;
                break;
            end
        end
        if exit_flag == 1
            exit_flag = 0;
            continue;
        end
        lastpeaks(counter, :) = sorted(i, :);
        counter = counter + 1;
    end
                
end

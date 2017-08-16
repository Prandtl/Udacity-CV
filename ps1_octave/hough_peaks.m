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
    p = inputParser();
    p.addOptional('numpeaks', 1, @isnumeric);
    p.addParamValue('Threshold', 0.5 * max(H(:)));
    p.addParamValue('NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    p.parse(varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    done = false;
    peaks = [];
    hnew = H;

    delta = floor(nHoodSize / 2 - 1);
    hsize = size(hnew);

    while ~done
      [maxValue, maxIndex] = max(hnew(:));
      [maxRow, maxCol] = ind2sub(size(hnew), maxIndex);

      peaks = [peaks; [maxRow, maxCol]];

      top = ifelse(maxRow - delta >= 1, maxRow - delta, 1);
      bottom = ifelse(maxRow + delta <= hsize(1), maxRow + delta, hsize(1));
      left = ifelse(maxCol - delta >= 1, maxCol - delta, 1);
      right = ifelse(maxCol + delta <= hsize(2), maxCol + delta, hsize(2));

      for row = top:bottom
        for col = left:right
          hnew(row, col) = 0;
        endfor
      endfor

      if(maxValue < threshold)
        done = true;
      end
      if(size(peaks)==numpeaks)
        done = true;
      end
    end
endfunction

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
    % p = inputParser();
    % p = p.addParamValue('RhoResolution', 1);
    % p = p.addParamValue('Theta', linspace(-90, 89, 180));
    % p = p.parse(varargin{:});

    % rhoStep = p.Results.RhoResolution;
    % theta = p.Results.Theta;
    rhoStep = 1;
    theta = linspace(-90, 89, 180);
    thetaAmount = size(theta, 2);

    imgSize = size(BW);
    maxRho = norm(imgSize);
    rhoAmount = (maxRho * 2 - mod(maxRho * 2, rhoStep))/rhoStep + 1;
    rho = zeros(1, rhoAmount);
    for ii = 1:rhoAmount
      rho(ii) = -maxRho + (ii - 1) * rhoStep;
    endfor

    H = zeros(rhoAmount, thetaAmount);

    for row = 1:imgSize(1)
      for col = 1:imgSize(2)
        if(BW(row, col)~=1)
          continue
        end
        for thetaIndex = 1:thetaAmount
          currentTheta = theta(thetaIndex);
          currentRho = col * cos(currentTheta) - row * sin(currentTheta);
          rhoIndex = (currentRho + maxRho - mod(currentRho + maxRho, rhoStep))/rhoStep + 1;
          H(rhoIndex,thetaIndex)+=1;
        endfor
      endfor
    endfor

endfunction

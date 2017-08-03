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
    rhoStep = 0.33;
    theta = linspace(-90, 89, 180);

    img_size = size(BW);
    max_rho = norm(img_size);
    rho = -max_rho:rhoStep:max_rho;
    disp(max_rho);
    disp(rho);

    H=0;
    theta=0;
    rho=0;
endfunction
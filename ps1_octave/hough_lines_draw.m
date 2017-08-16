function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    workingCopy = img;
    peaksSize = size(peaks);
    imgSize = size(img);
    xs = 1:imgSize(2);
    ys = 1:imgSize(1);
    for ii = 1:peaksSize(1)
      rhoii = rho(peaks(ii, 1));
      thetaii = theta(peaks(ii, 2));

      sin_theta = sin(thetaii);
      cos_theta = cos(thetaii);

      if(abs(sin_theta) > 0.001)
        for xx = xs
            yx = floor(-(cos(thetaii)/sin(thetaii)) * xx + (rhoii/sin(thetaii)));

            if(yx < 1 || yx > imgSize(1))
              continue;
            end
            workingCopy(xx, yx, 1) = 0;
            workingCopy(xx, yx, 2) = 255;
            workingCopy(xx, yx, 3) = 0;
        endfor
      end


      if(abs(cos_theta) > 0.001)
        for yy = ys
            xy = floor(-(sin(thetaii)/cos(thetaii)) * yy + (rhoii/cos(thetaii)));

            if(xy < 1 || xy > imgSize(2))
              continue;
            end
            workingCopy(xy, yy, 1) = 0;
            workingCopy(xy, yy, 2) = 255;
            workingCopy(xy, yy, 3) = 0;
        endfor
      end

    endfor

    imwrite(workingCopy, outfile);
endfunction

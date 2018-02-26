function density = clickImage(density, lane)
    
%capture image
    %webcamlist
    cam = webcam('iBall Face2Face CHD12.0 Webcam');
    %cam = webcam('Integrated Webcam');
    %cam.AvailableResolutions
    %cam.Resolution = '640x480';
    img = snapshot(cam);
    imshow(img);
    clear('cam');
    
%convert tot grayscale    
    gray_image = rgb2gray(img);
    
%count fraction of white pixels
    [rows, cols] = size(gray_image);
    count = 0;
    for x = 1:rows
        for y = 1:cols
            if gray_image(x,y) > 50
                count = count + 1;
            end
        end
    end
    var = count/(rows*cols);
    var = var*100;

    density(lane) = var;  
end
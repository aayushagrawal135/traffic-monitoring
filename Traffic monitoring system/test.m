clc;
clear all;

webcamlist
cam = webcam('Integrated Webcam');
%cam.AvailableResolutions;
%cam.Resolution = '640x480';
img = snapshot(cam);
imshow(img);

clear cam;

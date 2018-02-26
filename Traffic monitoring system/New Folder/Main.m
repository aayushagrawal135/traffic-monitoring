clc;
clear all;

%Initialize stuff : -------------------------------------
g = 10;
r = 30;
timer = [g,r ;g,r ;g,r ;g,r];

%Make 2 arduino objects, 1 for communicating with LCD and 1 for
%communicating RFID
ard_servo = arduino(port, board, 'Libraries', 'Servo');

%params : COM port, name of arduino, ex uno
%ard_rfid = arduino('', '');
%ard_lcdServo = arduino('', '');

lane = 1;

%-------------------------------------------------------------

while true
    
    positionCamera(lane, ard_servo);
    %activateSignals(lane, redTime, greenTime);
    density = clickImage(density, lane);
    greenTime = updateGreenTime(density, greenTime); 
    redTime = assignRedTime(greenTime);
    
    %delay for greenTime(lane) seconds
    
    
    pause(greenTime(lane));
    lane = lane + 1;
    lane = mod(lane, 4)+1;
end
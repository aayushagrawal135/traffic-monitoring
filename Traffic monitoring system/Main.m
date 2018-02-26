clc;
clear all;

%Initialize stuff : -------------------------------------
greenTime = ones(1,4)*7;
density = ones(1,4)*20;
%density = zeros(1,4);
redTime = assignRedTime(greenTime);

%Make 2 arduino objects, 1 for communicating with LCD and 1 for
%communicating RFID
port = 'COM8';
board = 'Uno';
ard_servo = arduino(port, board, 'Libraries', 'Servo');

%params : COM port, name of arduino, ex uno
%ard_rfid = arduino('', '');
%ard_lcdServo = arduino('', '');

lane = 1;

%-------------------------------------------------------------
count = 0;
while true
    
    greenTime
    density
    lane
    
    %param value for positioin camera
    temp = mod((lane+2),4);
    if temp == 0
        temp = 4;
    end
 
    %position camera
    positionCamera(temp, ard_servo); 
    pause(2);
    density = clickImage(density, temp);
    %disp(density);
    
    disp(lane);
    count = count+1;
    [greenTime, redTime] = activateSignals(lane, greenTime, redTime, ard_servo, count);
    
    
    if sum(redTime)==0 && sum(greenTime)==0
        %greenTime = ones(1,4)*3;
        %redTime = assignRedTime(greenTime);
        greenTime = updateGreenTime(density); 
        redTime = assignRedTime(greenTime);
        %disp("density updated");
    end
    
    lane = lane+1;
    lane = mod(lane, 4);
    if lane == 0
        lane = 4;
    end
    %{
    
    
    greenTime = updateGreenTime(density, greenTime); 
    redTime = assignRedTime(greenTime);
    
    %delay for greenTime(lane) seconds
    
    
    pause(greenTime(lane));
    lane = lane + 1;
    lane = mod(lane, 4)+1;
    %}
end
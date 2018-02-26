clear all;
clc;

    port = 'COM7';
    
    buffer = 3;
    arduino = serial(port,'BaudRate',9600);
    set(arduino, 'Timeout', 30);
    fopen(arduino);
    
    pause(0.1);
    
    while true
        y = fscanf(arduino,'%d');
        pause(1);
        
        if y == 1
            disp("detected something");
            break;
        end
    end
    fclose(arduino);
    clear arduino;
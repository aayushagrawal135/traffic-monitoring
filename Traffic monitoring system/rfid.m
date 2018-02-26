function rfid(gtime, ard)    
    port = 'COM7';
    
    buffer = 3;
    arduino = serial(port,'BaudRate',9600);
    set(arduino, 'Timeout', 3);
    fopen(arduino);
    
    pause(0.1);
    
    while true
        y = fscanf(arduino,'%d');
        pause(1);
        
        if y == 1
            %disp("detected something");
            
            writeDigitalPin(ard, pin1, 0);
            writeDigitalPin(ard, pin2, 0);
            writeDigitalPin(ard, pin3, 0);
            writeDigitalPin(ard, pin4, 1);
  
            while gtime > 0
                pause(0.5);
                gtime = gtime - 1;
            end
            
            writeDigitalPin(ard, pin4, 0);
            
            break;
        end
    end
    fclose(arduino);
    clear arduino;
end
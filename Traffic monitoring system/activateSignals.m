function [greenTime, redTime] = activateSignals(lane, greenTime, redTime, ard, count)
    
    pin1 = 'D6';
    pin2 = 'D13';
    pin3 = 'D8';
    pin4 = 'D7';
    %copy_gt = greenTime;
    %    rfid(greenTime(4), ard);
    
    %if count == 10
     %   c_rfid(greenTime(4), ard, pin1, pin2, pin3,pin4);
    %end
    
    %rfid_always(copy_gt, count, ard, pin1, pin2, pin3, pin4);
    temp = greenTime(lane);
    
    if lane == 1
        writeDigitalPin(ard, pin1, 1);
        writeDigitalPin(ard, pin2, 0);
        writeDigitalPin(ard, pin3, 0);
        writeDigitalPin(ard, pin4, 0);
  
        while greenTime(lane) > 0
            pause(0.5);
            greenTime(lane) = greenTime(lane) - 1;
            fprintf("lane %d : GREEN %d, lane 2 :RED %d, lane %3 :RED %d, lane %4 :RED %d\n", lane, greenTime(lane), redTime(2), redTime(3), redTime(4));
             %rfid_always(copy_gt, count, ard, pin1, pin2, pin3, pin4);
            %fprintf('lane : %d, gtime : %d\n',lane, greenTime(lane));
        end
        redTime(2) = redTime(2) - temp;
        redTime(3) = redTime(3) - temp;
        redTime(4) = redTime(4) - temp;
        greenTime(lane) = 0;
    end
    
    if lane == 2
        writeDigitalPin(ard, pin1, 0);
        writeDigitalPin(ard, pin2, 1);
        writeDigitalPin(ard, pin3, 0);
        writeDigitalPin(ard, pin4, 0);
        
        while greenTime(lane) > 0
            pause(0.5);
            greenTime(lane) = greenTime(lane) - 1;
            fprintf("lane %d : GREEN %d, lane 1 :RED %d, lane %3 :RED %d, lane %4 :RED %d\n", lane, greenTime(lane), redTime(1), redTime(3), redTime(4));
             %rfid_always(copy_gt, count, ard, pin1, pin2, pin3, pin4);
            %fprintf('lane : %d, gtime : %d\n',lane, greenTime(lane));
        end
        redTime(1) = redTime(1) - temp;
        redTime(3) = redTime(3) - temp;
        redTime(4) = redTime(4) - temp;
        greenTime(lane) = 0;
    end
    
    if lane == 3
        writeDigitalPin(ard, pin1, 0);
        writeDigitalPin(ard, pin2, 0);
        writeDigitalPin(ard, pin3, 1);
        writeDigitalPin(ard, pin4, 0);
        
        while greenTime(lane) > 0
            pause(0.5);
            greenTime(lane) = greenTime(lane) - 1;
            fprintf("lane %d : GREEN %d, lane 1 :RED %d, lane %2 :RED %d, lane %4 :RED %d\n", lane, greenTime(lane), redTime(1), redTime(2), redTime(4));
            % rfid_always(copy_gt, count, ard, pin1, pin2, pin3, pin4);
            %fprintf('lane : %d, gtime : %d\n',lane, greenTime(lane));
        end
        redTime(1) = redTime(1) - temp;
        redTime(2) = redTime(2) - temp;
        redTime(4) = redTime(4) - temp;
        greenTime(lane) = 0;
    end
    
    if lane == 4
        writeDigitalPin(ard, pin1, 0);
        writeDigitalPin(ard, pin2, 0);
        writeDigitalPin(ard, pin3, 0);
        writeDigitalPin(ard, pin4, 1);
        
        while greenTime(lane) > 0
            pause(0.5);
            greenTime(lane) = greenTime(lane) - 1;
            fprintf("lane %d : GREEN %d, lane 1 :RED %d, lane %2 :RED %d, lane %3 :RED %d\n", lane, greenTime(lane), redTime(1), redTime(2), redTime(3));
            % rfid_always(copy_gt, count, ard, pin1, pin2, pin3, pin4);
            %fprintf('lane : %d, gtime : %d\n',lane, greenTime(lane));
        end
        redTime(1) = redTime(1) - temp;
        redTime(2) = redTime(2) - temp;
        redTime(3) = redTime(3) - temp;
        greenTime(lane) = 0;
    end
end
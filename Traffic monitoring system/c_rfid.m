function c_rfid(gtime, ard, pin1, pin2, pin3, pin4)
    
    writeDigitalPin(ard, pin1, 0);
    writeDigitalPin(ard, pin2, 0);
    writeDigitalPin(ard, pin3, 0);
    writeDigitalPin(ard, pin4, 1);
    
    while gtime > 0
        pause(0.5);
    	gtime = gtime - 1;
    end
    
    writeDigitalPin(ard, pin4, 0);
end
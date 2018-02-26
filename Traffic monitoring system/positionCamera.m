function positionCamera(lane, ard_servo)
    
    disp('Inside cam')
%inputs attributes
    %port = 'COM8';
    %board = 'Uno';

%Initialize arduino
    %ard_servo = arduino(port, board, 'Libraries', 'Servo');
    servo_motor = servo(ard_servo,'D9');
 
   if lane == 1 || lane == 4
       a = 0; 
       if lane == 1
            a = 0.5;
       else
           a = 1;
       end
       for angle = a:-0.1:(a-0.5)
             writePosition(servo_motor, angle);
             pause(0.2);
       end
       pause(1);
   end
   
   if lane == 2 || lane == 3
       a = 0; 
       if lane == 2
            a = 0;
       else
           a = 0.5;
       end
       for angle = a:0.1:(a+0.5)
             writePosition(servo_motor, angle);
             pause(0.2);
       end
       pause(1);
   end
   
    clear servo_motor;
    clear ard_servo;
end
%function servoMotor()

    port = 'COM8';
    board = 'Uno';
    ard_servo = arduino(port, board, 'Libraries', 'Servo');
    servo_motor = servo(ard_servo,'D9','MinPulseDuration', 1e-3, 'MaxPulseDuration', 2e-3);

   % servo_motor = servo(ard_servo, 'D8');
   disp("something") 
   
   writePosition(servo_motor, 0);
   pause(1);
   writePosition(servo_motor, 0.25);
   pause(1);
   writePosition(servo_motor, 0.5);
   pause(1);
   writePosition(servo_motor, 0.75);
   pause(1);
   disp("sooo")
   writePosition(servo_motor, 1);
   pause(1);
    %for angle = 0:0.5:1
     %   writePosition(servo_motor, angle);
      %  current_position = readPosition(servo_motor);
       % current_position = current_position * 180; 

        % print current position of servo motor
        %fprintf('Current position is %d\n', current_position);   

        % small delay is required so that servo can be positioned at the
        % angle told to it.
        %pause(2);
    %end
    
    
    
    clear servo_motor;
    clear ard_servo;
%end    
    
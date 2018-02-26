clc;
port = 'COM8';
board = 'Uno';
a = arduino(port, board, 'Libraries', 'Servo');
s = servo(a, 'D8');
clear s;
clear a;
clear all;
clc;

port = 'COM8';

delete(instrfind({'Port'},{port'}));
answer = 1;
arduino = serial(port', 'Baudrate', 9600);

fopen(arduino);

while(answer)
    fprintf(arduino, '%s', char(answer));
    answer = input("enter a value: ");
end

fclose(arduino);
delete(instrfind({'Port'},{port}));
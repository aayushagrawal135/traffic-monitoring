d1=100;
d2=100;
d3=100;
d4=100;

bg1 = imread('trafficBG.bmp');
bg2 = imread('trafficBG.bmp');
bg3 = imread('trafficBG.bmp');
bg4 = imread('trafficBG.bmp');

t1=10;
t2=10;
t3=10;
t4=10;

i=0;


a = arduino('COM5','Uno','Libraries','Servo');
s = servo(a,9,'MinPulseDuration', 1e-3, 'MaxPulseDuration', 2e-3);

while true
    if i==0
        writeDigitalPin(a,'RED3',0);
        writeDigitalPin(a,'RED4',1);
        writePosition(s,0.25);
        
        img1 = snapshot(cam);
        sub = img1 - bg1;
        subgray = rgb2gray(sub);
        [row col] = size(subgray);
        count = 0;
        for k=1:row
            for j=1:col
                if subgray(k,j)~=0
                    count = count+1;
                end
            end
        end
        d1 = count/(row*col);
        d1 = d1/(d1+d2+d3+d4);
        t1 = d1*100;
        
        pause(t3);
    end
    if i==1
        writeDigitalPin(a,'RED4',0);
        writeDigitalPin(a,'RED1',1);
        writeDigitalPin(a,'RED2',1);
        writeDigitalPin(a,'RED3',1);
        writePosition(s,1);
        
        img2 = snapshot(cam);
        sub = img2 - bg2;
        subgray = rgb2gray(sub);
        [row col] = size(subgray);
        count = 0;
        for k=1:row
            for j=1:col
                if subgray(k,j)~=0
                    count = count+1;
                end
            end
        end
        d2 = count/(row*col);
        d2 = d2/(d1+d2+d3+d4);
        t2 = d2*100;
        
        pause(t4);
    end
    if i==2
        writeDigitalPin(a,'RED1',0);
        writeDigitalPin(a,'RED2',1);
        writeDigitalPin(a,'RED3',1);
        writeDigitalPin(a,'RED4',1);
        writePosition(s,1);
        
        img3 = snapshot(cam);
        sub = img3 - bg3;
        subgray = rgb2gray(sub);
        [row col] = size(subgray);
        count = 0;
        for k=1:row
            for j=1:col
                if subgray(k,j)~=0
                    count = count+1;
                end
            end
        end
        d3 = count/(row*col);
        d3 = d3/(d1+d2+d3+d4);
        t3 = d3*100;
        
        pause(t1);
    end
    if i==3
        writeDigitalPin(a,'RED2',0);
        writeDigitalPin(a,'RED3',1);
        writeDigitalPin(a,'RED4',1);
        writeDigitalPin(a,'RED1',1);
        writePosition(s,1);
        
        img1 = snapshot(cam);
        sub = img4 - bg4;
        subgray = rgb2gray(sub);
        [row col] = size(subgray);
        count = 0;
        for k=1:row
            for j=1:col
                if subgray(k,j)~=0
                    count = count+1;
                end
            end
        end
        d4 = count/(row*col);
        d4 = d4/(d1+d2+d3+d4);
        t4 = d4*100;
        
        pause(t2);
    end
    i = i+1;
    i = i%4;
end
clear('cam');
function redTime = assignRedTime(greenTime)

    redTime = zeros(1,4);
    for x = 1:4
        a2 = mod(x,4)+1;
        a3 = mod(x+1,4)+1;
        a4 = mod(x+2,4)+1;

        var = greenTime(a2) + greenTime(a3) + greenTime(a4);
        redTime(x) = var;
    end
end
function gtime = updateGreenTime(density)
    
    gtime = zeros(1,4);
    [rows, cols] = size(density);
    for x = 1:cols
        var = density(x)/sum(density);
        var = var*40;
        gtime(x) = floor(var);
    end
end
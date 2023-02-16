function s = rdservice(&a)
    if(a < 21)
        s=3;
    elseif(a < 36)
        s=4;
    elseif(a < 66)
        s=5;
    elseif(a < 86)
        s=6;
    else
        s=7;
    end
    
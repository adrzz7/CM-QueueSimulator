function s = rdinterarr(&a)
    if(a < 41)
        s=1;
    elseif(a < 61)
        s=2;
    elseif(a < 81)
        s=3;
    elseif(a < 91)
        s=4;
    else
        s=5;
    end
    
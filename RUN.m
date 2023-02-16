function y=RUN(n,min,max)
    %generate random uniform number
    x=rand(1,n);
    z=min+(max-min)*x; %x=a+(b-a)R
    y=ceil(z);
    end
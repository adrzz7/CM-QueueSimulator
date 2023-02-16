function y=LCG(n,min,max)
    %set to prime numbers
    a=13;
    c=53;
    
    x=rand()*max;
    x=ceil(x);
    
    for i=1:n
        z=a*x+c;
        y(i)=(ceil(mod (z,max))); %LCG formula X=(ax+c)(mod m)
        
        %if result lower then min, +min
        if y(i)<min;
            y(i)=y(i)+min;
        end
        
        x=y(i);
    end
    
    
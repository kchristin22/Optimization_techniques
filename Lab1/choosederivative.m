function result = choosederivative(index,x) 
    if index == 1
        result = diff((x-2)^2 + x*log(x+3));
    elseif index == 2
        result = diff(5^x + (2-cos(x))^2);
    elseif index == 3
        result = diff(exp(x) * (x^3 - 1) + (x-1)*sin(x));
    end
end


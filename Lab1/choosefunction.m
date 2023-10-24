function result = choosefunction(index,x)
    if index == 1
        result = (x-2)^2 + x*log(x+3);
    elseif index == 2
        result = 5^x + (2-cos(x))^2;
    elseif index == 3
        result = exp(x) * (x^3 - 1) + (x-1)*sin(x);
    end
end
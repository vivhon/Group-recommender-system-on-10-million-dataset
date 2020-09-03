function [y] = nonrating(y,z,w)
[m,n]=size(y);
for i=1:m % loop for user
    for j=1:n % loop for item 
        if y(i,j)==z % condition to find out non rating values i.e z
            y(i,j)=w; % replacing non rating values with w
        end
    end
end


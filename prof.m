function [dat] = prof(bl)

[m,n]=size(bl);
dat=zeros(1,n);
for j=1:n
    count=0;
    mul=1;
    for i=1:m
        if bl(i,j)~=0
            count=count+1;
            mul=mul*bl(i,j);
        end
    end
    if count > 0
        dat(1,j)= nthroot(mul,count);
    else
        dat(1,j)=0;
    end
end

end


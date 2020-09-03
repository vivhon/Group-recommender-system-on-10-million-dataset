function [data] = imp()

rat = importfile("ratings.dat");
[m1,~]=size(rat);
m=rat(1,1);
n=rat(1,2);
for i=1:m1
    if rat(i,1)>m
        m=rat(i,1);
    end
    if rat(i,2)>n
        n=rat(i,2);
    end
end
%==========================================================================

data=zeros(m,n);
for i=1:m1
        data(rat(i,1),rat(i,2))=rat(i,3);        
end

end


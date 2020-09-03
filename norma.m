function [ndata]=norma(data,maxo,mino,max,min,w)
[m,n]=size(data);
ndata=zeros(m,n); % initializing normalized training data matrix
for i=1:m % i is for user
    for j=1:n % j is for item
        if data(i,j)== w % checking whether the user i has given rating to item j or not 
            ndata(i,j)= w;
        else
            ndata(i,j)=((max-min)/(maxo-mino))*(data(i,j)-maxo)+(max); % normalisation formula
        end
    end
end
end



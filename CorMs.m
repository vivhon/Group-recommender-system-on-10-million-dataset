function [corms]=CorMs(train,pass,ci,w)
[m,n] = size(train);
[m1,~] = size(pass);
corms=zeros(m,m1); % initialising corellation matrix 
for i=1:m % i is for 1st user i.e user x
    for j=1:m1 % j is for 2nd user i.e user y
        sum=0; 
        count=0; % resetting no of common item between user x and y
        for h=1:n % h is for item 
            if(train(i,h)~= w && pass(j,h)~= w) % condition to check whether user i and user j have rated item h
                sum=sum+((train(i,h)-pass(j,h))*(train(i,h)-pass(j,h))); % numerator of MSD formula 
                count=count+1; % no of common item
            end
        end
        if (count~=0 && count>=ci) % checking whether no common item should not be 0 and should be greater then ci and if both user x and y is same then restriction of common item will not be their
            corms(i,j)=1-((1/count)*sum); % MSD formula
            
        else
            corms(i,j)= w; % if common item is 0 or less then threshold ci or su of both i and j is zerro (ratings of all item will be zerro)
        end
    end
end
end


function [corcos]=CorCos(train,pass,ci,w)
[m1,n]=size(train);
[m2,~]=size(pass);
corcos=zeros(m1,m2);                                        % initialising correlation matrix
for i=1:m1                                                 % i is for 1st user i.e user x
    for j=1:m2                                             % j is for 2nd user i.e user y
        sum1=0;
        sum2=0;
        sum3=0;
        count=0;
        for h=1:n                                         % h is for item
            if(train(i,h)~= w && pass(j,h)~= w)      % checking whether both user i and user j have rated item h
                sum1=sum1 + ( train(i,h) * pass(j,h) );
                sum2=sum2 + ( train(i,h) * train(i,h) );
                sum3=sum3 + ( pass(j,h) * pass(j,h) );
                count=count+1;                            % no of common items
            end
        end
        if (count~=0 && count>=ci && sum2~=0 && sum3~=0) 
            corcos(i,j)=sum1/( sqrt(sum2) * sqrt(sum3) ); % calculating cosine correlation
        else
            corcos(i,j)= w;  % su of both i and j is zerro (ratings of all item will be zerro)
        end
    end
end
end


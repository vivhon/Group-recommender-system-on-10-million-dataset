function [corpe]=CorPear(train,pass,ci,w)
[m1,n] = size(train);
[m2,~] = size(pass);
corpe=zeros(m1,m2);                  % initialising correlation matrix
% =========================================================================
% Calculating mean for each user of its raiting
mean1 = mean(train,w);
mean2 = mean(pass,w);
% =========================================================================
% Calculating pearson correlation
for i=1:m1                                            % i is for 1st user i.e user x
    for j=1:m2                                        % j is 2nd user i.e user y
        sum1=0; 
        sum2=0;
        sum3=0;
        count=0;
        for h=1:n                                    % h is for item
            if(train(i,h)~= w && pass(j,h)~= w) % to check whether item h is rated by both user x and user y
                sum1=sum1 + ( (train(i,h)-mean1(i)) * (pass(j,h)-mean2(j)) );
                sum2=sum2 + ( (train(i,h)-mean1(i)) * (train(i,h)-mean1(i)) );
                sum3=sum3 + ( (pass(j,h)-mean2(j)) * (pass(j,h)-mean2(j)) );
                count=count+1;                       % no of common items rated by both user x and user y
            end
        end
        if (count~=0 && count>=ci && sum2~=0 && sum3~=0) 
            corpe(i,j)=sum1/(sqrt(sum2*sum3));      % calculating S-pearson correlation b/w user i and user j on item h
        else
            corpe(i,j)= w; % it can be possible when su of user i and j is zerro (then mean and rating of every item will be zerro)
        end
    end
end
end


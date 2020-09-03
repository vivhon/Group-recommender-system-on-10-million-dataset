function [mea] = mean(y,w)
[m,n] = size(y);
mea=zeros(m,1);                    % initializing mean matrix
for i=1:m                           % i is for user 
    count=0;                        % resetting count for each user 
    sum=0;                         % resetting sum for each user
    for j=1:n                       % j is for item
        if (y(i,j)~= w)         % checking whether the item is rated by user i or not
            count=count+1;          % no item rated by user i
            sum=sum+y(i,j);   % sum of ratings rated by user i
        end
    end
    if count~=0                     % checking whether user i has rated at least one item
        mea(i)=sum/count;         % finding mean for each user
    end
end
end


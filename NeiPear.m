function [neipe]=NeiPear(corpe,k,w)
[m,n] = size(corpe);
neipe=zeros(m,k);
[~,p]=sort(corpe,2,'descend');
neipe=nonrating(neipe,0,w);
for i=1:m
    count=1;
    for j=1:n
        if corpe(i,p(i,j))~=w %&& corpe(i,p(i,j))>0
            neipe(i,count)=p(i,j);
            if count<k
                count=count+1;
            else
                break;
            end
        end
        
    end
end
end


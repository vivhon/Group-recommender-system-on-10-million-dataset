function  [neicos,p]=NeiCos(corcos,k,w)
[m,n]=size(corcos);
neicos=zeros(m,k);
[~,p]=sort(corcos,2,'descend');
neicos=nonrating(neicos,0,w);
for i=1:m
    count=1;
    for j=1:n
        if corcos(i,p(i,j))~=w % && corcos(i,p(i,j))>0
            neicos(i,count)=p(i,j);
            if count<k
                count=count+1;
            else
                break;
            end
        end
        
    end
end
end


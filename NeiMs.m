function  [neims]=NeiMs(corms,k,w)
[m,n] = size(corms);
neims=zeros(m,k);
[~,p]=sort(corms,2,'descend');
neims=nonrating(neims,0,w);
for i=1:m
    count=1;
    for j=1:n
        if corms(i,p(i,j))~=w % && corms(i,p(i,j))>0
            neims(i,count)=p(i,j);
            if count<k
                count=count+1;
            else
                break;
            end
        end
        
    end
end
end


function [pred,coverage,ucoverage]=predict(pass,train,test,nei,cor,k,w)
[m,n] = size(test);
pred=zeros(m,n);
pred=nonrating(pred,0,w);
ucoverage=ones(m,1);
coverage=1;
% ===================================================
% Calculating mean for each user of its raiting
mean1 = mean(train,w);
mean2 = mean(pass,w);
% ==================================================
sum3=0;
sum4=0;
for i=1:m
    ucov1=0;
    ucov2=0;
    for j=1:n
        sum1=0;
        sum2=0;
        count=0;
        if test(i,j)~=w
            sum4 = sum4 + 1;
            ucov1=ucov1+1;
            for l=1:k
                if nei(i,l)~= w
                    if pass(nei(i,l),j)~=w && cor(i,nei(i,l)) ~= w
                        sum1 = sum1+( cor(i,nei(i,l)) * ( pass(nei(i,l),j) - mean2(nei(i,l)) ) );
                        sum2 = sum2 + cor(i,nei(i,l));
                        count=count+1;
                    end
                end
            end
            if  sum2~=0 && count>=1
                pred(i,j)= mean1(i)+ ( sum1 / sum2);
                sum3 = sum3 + 1;
                ucov2=ucov2+1;
            end
        end
    end
    if ucov1>0
        ucoverage(i)=100*(ucov2/ucov1);
    end
end
if sum4>0
    coverage=100*(sum3/sum4);
end
end
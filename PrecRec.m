function [prec,recall,fprate,uprec,urecall,ufprate] = PrecRec(recmnd,test,pred,nrr,w)
[m,n] = size(pred);
% [trecmnd] = recmnd(test,rec,nrr,w) we have to find recomendation on
% actual rating and also they can be prediced so here tset contain actual
% values and these values can be predicted so make new function to find
% actual recommendation
urecall=zeros(m,1);
uprec=zeros(m,1);
ufprate=zeros(m,1);
h=0;
x=0;
wfp=0;
for i=1:m
    tp=0;
    fp=0;
    rn=0;
    tn=0;
    for j=1:n
        if recmnd(i,j)~=w  && test(i,j)>=nrr % && trecmnd(i,j)~=w % if a item is recommended then its rating should be greater
            tp=tp + 1;          		     % then nrr so no use of recmnd(i,j)>=nrr
        end
        if recmnd(i,j)~=w && test(i,j)<nrr  % && trecmnd(i,j)==w % recmnd~=w is equal to tp+fp
            fp=fp + 1;
        end
        if pred(i,j)~=w && test(i,j)>=nrr % this is equal to fn + tp (fn = trecmnd(i,j)~=w && recmnd(i,j)==w) 
            rn=rn + 1;      % i.e total no of relevant items and also can be predicted
        end
        if recmnd(i,j)==w && test(i,j)<nrr && pred(i,j)~=w
            tn=tn + 1;      
        end
    end
    if tp+fp~=0
        hu= tp/(tp + fp);
    else
        hu=1;
    end
    if rn~=0
        xu=tp/(rn);
    else
        xu=1;
    end
    if (fp+tn)~=0
        fpr=fp/(fp+tn);
    else
        fpr=0;
    end
    
    uprec(i)=hu;
    urecall(i)=xu;
    ufprate(i)= fpr;
    
    h=h+hu;
    x=x+xu;
    wfp=wfp+fpr;
end
prec=h/m;
recall=x/m;
fprate=wfp/m;
end

function [data1] = gro(data,x,y)
data1=[];
[m1,n1]= size(data);
rem=m1;
us=zeros(m1,1);
count2=1;
while true
    if rem >= 2*y
        t=randi([x,y],1,1); 
        bl=zeros(t,n1);
        rem=rem-t;
        count=1;
        while(t>0)
            pr = randi([1,m1],1,1);
            if us(pr)==0
                us(pr)=-1;
                bl(count,:)=data(pr,:);
                count=count+1;
                t=t-1;
            end
        end
        data1(count2,:)=prof(bl);
        count2=count2+1;
        
        
    else 
        t2=zeros(2,1);
        t2(1,1)=int16(rem/2);
        t2(2,1)= rem - t2(1,1);
        for i=1:2
            bl=zeros(t2(i,1),n1);
            count=1;
            while(t2(i,1)>0)
                pr = randi([1,m1],1,1);
                if us(pr)==0
                    us(pr)=-1;
                    bl(count,:)=data(pr,:);
                    count=count+1;
                    t2(i,1)=t2(i,1)-1;
                end
            end
            data1(count2,:)=prof(bl);
            count2=count2+1;
        end
        break;
    end
        
end
    
end


function [] = Preprocessing(sliderValue,beta1,beta2)
%Preprocessing: Automatically mixing multi kinds of crease patterns for better shape construction

global h sita Ls1 delta

num=length(delta);
Ls=Ls1*sliderValue*h;

% for i=1:1:num
%     if(delta(i)<0)
%         delta(i)=360+delta(i);
%     end
% end   
j=0;
for i=1:2:2*num+1
        j=j+1;
        sita(i)=asin(h/Ls(j))/pi*180;
end
j=0;
for i=2:2:2*num+1
    j=j+1;
    sita(i)=(180-delta(j)+sita(i-1)+sita(i+1))/2; 
end

for i=1:1:num
    
    if(delta(i)>beta1)
        sita(2*i)=(360-delta(i)+sita(2*i-1)+180-sita(2*i+1))/2;
        for j=2*i+1:2:2*num+1
            sita(j)=180-sita(j);
        end
        for j=2*i+2:2:2*num+1
            sita(j)=180-(180+delta(j/2)-sita(j-1)-sita(j+1))/2;
        end
    end
    
    if(delta(i)<beta2)
        sita(2*i)=(sita(2*i-1)+180-sita(2*i+1)-delta(i))/2;
        for j=2*i+1:2:2*num+1
            sita(j)=180-sita(j);
        end
        for j=2*i+2:2:2*num+1
            sita(j)=180-(180+delta(j/2)-sita(j-1)-sita(j+1))/2;
        end
    end   
end
end


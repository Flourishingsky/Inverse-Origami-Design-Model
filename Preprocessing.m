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
%distribute the L to d(i)
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

% p1=0;p2=0;
% Pattern_1=[];Pattern_2=[];
for i=1:1:num   
    if(delta(i)>beta1)
%         p1=p1+1;
%         Pattern_1(p1)=i;
        sita(2*i)=(360-delta(i)+sita(2*i-1)+180-sita(2*i+1))/2;
        for j=2*i+1:2:2*num+1
            sita(j)=180-sita(j);
        end
        for j=2*i+2:2:2*num+1
            sita(j)=180-(180+delta(j/2)-sita(j-1)-sita(j+1))/2;
        end
    end
    
    if(delta(i)<beta2)
%         p2=p2+1;
%         Pattern_2(p2)=i;
        sita(2*i)=(sita(2*i-1)+180-sita(2*i+1)-delta(i))/2;
        for j=2*i+1:2:2*num+1
            sita(j)=180-sita(j);
        end
        for j=2*i+2:2:2*num+1
            sita(j)=180-(180+delta(j/2)-sita(j-1)-sita(j+1))/2;
        end
    end   
end
% Pattern_2
% Pattern_1
% sita
% if (isempty(Pattern_2)==0)
%     for j=1:1:length(Pattern_2)
%         sita=[sita(1:2*Pattern_2(j)+j),sita(2*Pattern_2(j)+j),sita(2*Pattern_2(j)+j+1:end)];
%     end
% end
% 
% 
% sita
end


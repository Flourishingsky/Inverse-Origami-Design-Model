
function [output1] = Folded_angle(i,p1)
%Folded_angle: Calculate the relationship among folded angles p according to
%the coplanar constraint

global sita

if i==1
    output1=p1;
else
    if p1==0
        output1=0;
    elseif p1==90
        output1=180;
    else
%         syms x
%         q=tand(p1)*sin(x)-cosd(sita(i))*(1-cos(x));
%         output=double(solve(q));
%         output1=real(output(1)/pi*180);
          output1=acosd(((cosd(sita(i)))^2-(tand(p1))^2)/((cosd(sita(i)))^2+(tand(p1))^2));
          if(sita(i)>90)
              output1=-output1;
          end
    end
end

end


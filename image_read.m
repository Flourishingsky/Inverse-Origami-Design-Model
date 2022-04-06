function []=image_read()
% divide the custom shape with multi line segments
% clear all; clc;
global Ls1 delta
Ls1=[];delta=[];

[file,path] = uigetfile({'*.jpg;*.tif;*.png;*.gif'});
A=fullfile(path,file);
hand=figure('NumberTitle', 'off', 'Name', 'load shape file');
warning('off');
imshow(A);hold on;
set(gcf,'color','w');grid on;
axis equal;

[ix,iy]=ginput(2);
x=ix;y=iy;
plot(x,y,'-r','linewidth',1); hold on;
A = [x(2),y(2)];
O = [x(1),y(1)];
OA = A - O;
Ls1(1)=sqrt(OA(1)^2+OA(2)^2);
%draw auxiliary circle 
rectangle('Position',[A-Ls1(1),2*Ls1(1),2*Ls1(1)],'Curvature',[1,1],'EdgeColor','b','linewidth',0.6);

i=2;
while (1)
    i=i+1;
    [ix,iy]=ginput(1);
    if (isempty(ix))
        break;
    else
        x(i)=ix;y(i)=iy;
        plot([x(i-1),x(i)],[y(i-1),y(i)],'-r','linewidth',1); hold on;

        B = [x(i),y(i)];
        A = [x(i-2),y(i-2)];
        O = [x(i-1),y(i-1)];
        OA = A - O;
        OB = B - O;
        OA_dot_OB = OA(1)*OB(1) + OA(2)*OB(2);
        OA_cross_OB = OA(1)*OB(2) - OA(2)*OB(1);
        Ls1(i-1)=sqrt(OB(1)^2+OB(2)^2);
        %draw auxiliary circle
        rectangle('Position',[B-Ls1(1),2*Ls1(1),2*Ls1(1)],'Curvature',[1,1],'EdgeColor','b','linewidth',1);

        delta(i-2) = atan2(OA_cross_OB, OA_dot_OB)*180/pi;
        if (delta(i-2)<0)
            delta(i-2)=360+delta(i-2);
        end
        text(x(i-1),y(i-1),num2str(delta(i-2)),'FontName','Gill Sans MT','Fontsize',6);
    end
end
Ls1=Ls1/min(Ls1);
pause(2);
close(hand);
% save 111.mat Ls1 delta
end
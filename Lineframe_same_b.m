function [] = Lineframe_same(facet,hs)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    facet1_x=facet(1,1:4)';
    facet1_y=facet(2,1:4)';facet1_z=facet(3,1:4)';
    plot3([facet1_x(1),facet1_x(4)],[facet1_y(1),facet1_y(4)],[facet1_z(1),facet1_z(4)],'b-.','Linewidth',1);hold on;
    plot3([facet1_x(4),facet1_x(3)],[facet1_y(4),facet1_y(3)],[facet1_z(4),facet1_z(3)],'b-.','Linewidth',1);hold on;
    plot3([facet1_x(3),facet1_x(2)],[facet1_y(3),facet1_y(2)],[facet1_z(3),facet1_z(2)],'r','Linewidth',1);hold on;
    plot3([facet1_x(2),facet1_x(1)],[facet1_y(2),facet1_y(1)],[facet1_z(2),facet1_z(1)],'b-.','Linewidth',1);hold on;
% 
    plot3(2*hs-[facet1_x(1),facet1_x(4)],[facet1_y(1),facet1_y(4)],[facet1_z(1),facet1_z(4)],'b-.','Linewidth',1);hold on;
    plot3(2*hs-[facet1_x(4),facet1_x(3)],[facet1_y(4),facet1_y(3)],[facet1_z(4),facet1_z(3)],'b-.','Linewidth',1);hold on;
    plot3(2*hs-[facet1_x(3),facet1_x(2)],[facet1_y(3),facet1_y(2)],[facet1_z(3),facet1_z(2)],'r','Linewidth',1);hold on;
    plot3(2*hs-[facet1_x(2),facet1_x(1)],[facet1_y(2),facet1_y(1)],[facet1_z(2),facet1_z(1)],'b-.','Linewidth',1);hold on;

end


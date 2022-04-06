function [] = Draw(layer,sliderValue2)

%Draw all the facets
global k p
axis equal;

p(1)=0;
facet1=Rotate_Matrix(1,p)*basic_facet(1); 
for j=1:1:layer
    for i=1:1:k
       hand(j,i)=patch(2*(j-1)*facet1(1,2)+facet1(1,:),facet1(2,:),facet1(3,:),[82/256,122/256,175/256]);hold on;
       hand2(j,i)=patch(2*(j-1)*facet1(1,2)-facet1(1,:),facet1(2,:),facet1(3,:),[82/256,122/256,175/256]);hold on;
    end
end
for p1=sliderValue2*90
    for i=1:1:k
       p(i)=Folded_angle(i,p1);  
       facet=Rotate_Matrix(i,p)*basic_facet(i);
       for j=1:1:layer
            facet2=[2*(j-1)*facet(1,2)+facet(1,:);facet(2,:);facet(3,:);facet(4,:)];
            set(hand(j,i),'Faces',[1,2,3,4],'Vertices',[facet2(1:3,1)';facet2(1:3,2)';facet2(1:3,3)';facet2(1:3,4)'],'FaceColor',[82/256,122/256,175/256]);
            facet2=[2*(j-1)*facet(1,2)-facet(1,:);facet(2,:);facet(3,:);facet(4,:)];
            set(hand2(j,i),'Faces',[1,2,3,4],'Vertices',[facet2(1:3,1)';facet2(1:3,2)';facet2(1:3,3)';facet2(1:3,4)'],'FaceColor',[82/256,122/256,175/256]);
       end
    end
end

axis equal; rotate3d on;
set(gcf,'color','w');
xlabel('x(mm)','FontAngle','italic');ylabel('y(mm)','FontAngle','italic');zlabel('z(mm)','FontAngle','italic');
title('Origami folding simulator');
set(gca,'FontName','Gill Sans MT','Fontsize',10);

end


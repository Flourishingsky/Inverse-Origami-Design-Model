function []=draft(layer,p)
% draw the crease pattern

global sita
axis equal;

facet1=Rotate_Matrix(1,p)*basic_facet(1);%basic_facet(1);
facet2=facet1(1:3,:);
k=length(sita)-1;
for j=1:1:layer
    facet2(1,:)=facet1(1,:)+(j-1)*2*facet1(1,2);
    Initial_Lineframe(facet2,(j-1)*2*facet1(1,2));
end

for i=3:2:k 
   facet=Rotate_Matrix(i,p)*basic_facet(i);
   facet2=facet;
   if((sita(i)-90)*(sita(i+1)-90)>0)    %���ڽǲ����90��˵���ۺۻ���ͬ
       if(sita(i)<90)
           for j=1:1:layer
                facet2(1,:)=facet(1,:)+(j-1)*2*facet(1,2);
                Lineframe(facet2,(j-1)*2*facet(1,2));
           end
       else                          %�ھ�������90�ȵ��ۺۺ�ᷢ���ۺ��෴�Ĺ��ɱ仯
           for j=1:1:layer
                facet2(1,:)=facet(1,:)+(j-1)*2*facet(1,2);
                Lineframe_inverse(facet2,(j-1)*2*facet(1,2));
           end
       end       
   else
       if(sita(i)<90)
           for j=1:1:layer
                facet2(1,:)=facet(1,:)+(j-1)*2*facet(1,2);
                Lineframe_same(facet2,(j-1)*2*facet(1,2));
           end   
       else
           for j=1:1:layer
                facet2(1,:)=facet(1,:)+(j-1)*2*facet(1,2);
                Lineframe_same_b(facet2,(j-1)*2*facet(1,2));
           end 
       end   
    end
end

for i=2:2:k                            %�����м�ż��λ�õ��ۺۣ�ֻ��Ҫ��������������
   facet=Rotate_Matrix(i,p)*basic_facet(i);
   facet2=facet;
   for j=1:1:layer
        facet2(1,:)=facet(1,:)+(j-1)*2*facet(1,2);
        Lineframe_odd(facet2,(j-1)*2*facet(1,2));
   end
end

for j=1:1:layer
   facet2(1,:)=facet(1,:)+(j-1)*2*facet(1,2);
   plot3([facet2(1,4),facet2(1,3)],[facet2(2,4),facet2(2,3)],[facet2(3,4),facet2(3,3)],'r','Linewidth',1);hold on;
   plot3(2*(j-1)*2*facet1(1,2)-[facet2(1,4),facet2(1,3)],[facet2(2,4),facet2(2,3)],[facet2(3,4),facet2(3,3)],'r','Linewidth',1);hold on;
end

axis equal; rotate3d on;
set(gcf,'color','w');
xlabel('x(mm)','FontAngle','italic');ylabel('y(mm)','FontAngle','italic');zlabel('z(mm)','FontAngle','italic');
title('Origami folding simulator');
set(gca,'FontName','Gill Sans MT','Fontsize',10);
end


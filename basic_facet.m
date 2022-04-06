function y = basic_facet(x)

%   此处显示详细说明
global b sita d a
y=[0,0,a(x)*sind(sita(x)), b(x)*sind(sita(x));0,d(x),a(x)*cosd(sita(x))+d(x), b(x)*cosd(sita(x));0,0,0,0;1,1,1,1];
end


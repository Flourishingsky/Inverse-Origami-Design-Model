function [ ] = Parameters( )
% Parameters: Get the values of a, b, d

global h b sita d a    % Five  basic global parameters to define the crease pattern

%% Constraint: P coincides with E
for i=1:2:length(sita)-1
    d(i)=h/sind(sita(i));
    if ((sita(i)<90)&&(sita(i+1)<90))
        a(i)=abs(h/sind(2*sita(i+1)));
        b(i)=a(i)-d(i)*sind(sita(i)-sita(i+1))./sind(sita(i+1));
    else
        a(i)=abs(h/sind(2*sita(i)));
        b(i)=a(i)-d(i)*sind(sita(i)-sita(i+1))./sind(sita(i+1));
    end
end
for i=2:2:length(sita)-1
    d(i)=h/sind(sita(i));
    if ((sita(i)<90)&&(sita(i+1)<90))
        b(i)=abs(h/sind(2*sita(i)));
        a(i)=b(i)+d(i)*sind(sita(i)-sita(i+1))./sind(sita(i+1));
    else
        b(i)=abs(h/sind(2*sita(i+1)));
        a(i)=b(i)+d(i)*sind(sita(i)-sita(i+1))./sind(sita(i+1));
    end
end

a(length(sita))=a(length(sita)-1);
b(length(sita))=b(length(sita)-1);

%% Invalid constraint in crease patterns II or III
for i=2:1:length(sita)-1
    if ((sita(i)>90)&&(sita(i+1)<90))
        a(i)=b(i-1)+b(i+1);
        b(i)=a(i)-d(i)*sind(sita(i)-sita(i+1))./sind(sita(i+1));
    elseif ((sita(i)<90)&&(sita(i+1)>90))
        b(i)=a(i-1)+a(i+1);
        a(i)=b(i)+d(i)*sind(sita(i)-sita(i+1))./sind(sita(i+1));
    else   
    end
    if(a(i)<0)
        b(i)=b(i)-a(i);
        a(i)=0;
    end
    if(b(i)<0)
        a(i)=a(i)-b(i);
        b(i)=0;
    end  
end


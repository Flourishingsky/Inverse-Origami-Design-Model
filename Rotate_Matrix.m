function y = Rotate_Matrix(k1,p)
% Rotate_Matrix: Local coordinate system relative to the global coordiante system.

global b sita    % use the two basic parameters

rotate_angle(1)=0;
if (k1>1)
    rotate_angle(2)=-p(2);
end
if (k1>2&&p(2)~=0)
    for i=3:1:k1
        rotate_angle(i)=-rotate_angle(i-1)*p(i-1)/abs(rotate_angle(i-1)*p(i-1))*p(i);
    end
else
    for i=3:1:k1
        rotate_angle(i)=0;
    end
end

M1=R_y(p(1))*R_z(sita(1));

if (k1>1)
    for i=2:1:k1
        M=R_z(-sita(i-1))*T_y(b(i-1))*R_z(sita(i))*R_y(rotate_angle(i));
        M1=M1*M;
    end
end

y=M1;

end


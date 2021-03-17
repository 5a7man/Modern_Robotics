function T = FK(M,S,q)
[~,c] = size(S);
for i = c:-1:1
    if isequal(S(1:3,i),[0;0;0])
        temp = [eye(3,3),S(4:6,i)*q(i); zeros(1,3),1];
    else
        temp = [eye(3,3)+sin(q(i))*skew(S(1:3,i))+(1-cos(q(i)))*(skew(S(1:3,i)))^2, ...
               (eye(3,3)*q(i)+(1-cos(q(i)))*skew(S(1:3,i))+(q(i)-sin(q(i)))*(skew(S(1:3,i)))^2)*S(4:6,i);...
                zeros(1,3),1];
    end
    M = temp*M;
end
T = M;
end
function J = Jac(S,q)
[~,c] = size(S);
J(:,1) = S(:,1);
I = eye(4,4);

for j = 2:c
    for i = 1:j-1
        if isequal(S(1:3,i),[0;0;0])
            temp = [eye(3,3),S(4:6,i)*q(i); zeros(1,3),1];
        else
            temp = [eye(3,3)+sin(q(i))*skew(S(1:3,i))+(1-cos(q(i)))*(skew(S(1:3,i)))^2, ...
                   (eye(3,3)*q(i)+(1-cos(q(i)))*skew(S(1:3,i))+(q(i)-sin(q(i)))*(skew(S(1:3,i)))^2)*S(4:6,i);...
                    zeros(1,3),1];
        end
        A = I*temp;
        I = temp;
    end
    J(:,j) = [A(1:3,1:3),zeros(3,3);skew(A(1:3,end))*A(1:3,1:3),A(1:3,1:3)]*S(:,j);
end
end
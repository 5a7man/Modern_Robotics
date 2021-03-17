function visualization(q)
cla
hold on
view(3) 
grid on
axis([-3 3 -3 3 -1 2]) 

q1 = q(1);
q2 = q(2);
d3 = q(3);

M3 = [1,0,0,0;
      0,1,0,1;
      0,0,1,1;
      0,0,0,1];
 
M2 = [1,0,0,0;
      0,1,0,0;
      0,0,1,1;
      0,0,0,1];
 
M1 = [1,0,0,0;
      0,1,0,0;
      0,0,1,0;
      0,0,0,1];
 
A = [eye(3,3),[0;1;0]*d3;
      zeros(1,3),1];
  
B = [eye(3,3)+sin(q2)*skew([1,0,0])+(1-cos(q2))*(skew([1,0,0]))^2, ...
      (eye(3,3)*q2+(1-cos(q2))*skew([1,0,0])+(q2-sin(q2))*(skew([1,0,0]))^2)*[0;0.25;0];...
      zeros(1,3),1];
 
C = [eye(3,3)+sin(q1)*skew([0,0,1])+(1-cos(q1))*(skew([0,0,1]))^2, ...
      (eye(3,3)*q1+(1-cos(q1))*skew([0,0,1])+(q1-sin(q1))*(skew([0,0,1]))^2)*[0;0;0];...
      zeros(1,3),1];

t1 = C*M1;
t2 = C*B*M2;
t3 = C*B*A*M3;
base = eye(4,4);

plot3([base(1,4) t1(1,4)],[base(2,4) t1(2,4)],[base(3,4) t1(3,4)],'-b','LineWidth', 1);
plot3(t1(1,4),t1(2,4),t1(3,4),'ro','MarkerSize',2,'LineWidth', 5);

plot3([t1(1,4) t1(1,4)],[t1(2,4) t1(2,4)],[t1(3,4) t1(3,4)+0.25],'-b','LineWidth', 1);
plot3(t1(1,4),t1(2,4),t1(3,4)+0.25,'ro','MarkerSize',2,'LineWidth', 5);

plot3([t1(1,4) t2(1,4)],[t1(2,4) t2(2,4)],[t1(3,4)+0.25 t2(3,4)],'-b','LineWidth', 1);
plot3([t2(1,4) t3(1,4)],[t2(2,4) t3(2,4)],[t2(3,4) t3(3,4)],'--b','LineWidth', 1);
plot3(t3(1,4),t3(2,4),t3(3,4),'bx','MarkerSize',2,'LineWidth', 5);


xlabel('x');
ylabel('y');
zlabel('z');

pause(0.01)
end

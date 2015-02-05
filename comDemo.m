N = 300;
th = acos(rand(1,N)*2 - 1);
phi = rand(1,N)*2*pi;
r = rand(1,N);
r0 = [r.*sin(th).*cos(phi);r.*sin(th).*sin(phi);r.*cos(th)];
rG = sum(r0,2)/N;

figure(1)
clf
set(1,'Position', [100,265,560,420])
p1 = plot3(r0(1,:),r0(2,:),r0(3,:),'.');
hold on
G1 = plot3(rG(1),rG(2),rG(3),'k.','MarkerSize',30);
hold off
axis equal
axis([-1,4,-1,4,-1,4])
grid on

figure(2)
clf
set(2,'Position', [661,265,560,420])
p2 = plot3(r0(1,:),r0(2,:),r0(3,:),'.');
hold on
G2 = plot3(rG(1),rG(2),rG(3),'k.','MarkerSize',30);
hold off
axis equal
axis([-2,2,-2,2,-2,2])
grid on

v1 = repmat([1;1;1],1,N);
r2 = r0;
%%
for j = 1:150
    r1 = r0+v1*(j/45);
    rG1 = sum(r1,2)/N;
    set(p1,'XData',r1(1,:),'YData',r1(2,:),'ZData',r1(3,:))
    set(G1,'XData',rG1(1),'YData',rG1(2),'ZData',rG1(3))
    
    v2 = randn(3,N);
    r2 = r2+v2/30;
    rG2 = sum(r2,2)/N;
    set(p2,'XData',r2(1,:),'YData',r2(2,:),'ZData',r2(3,:))
    set(G2,'XData',rG2(1),'YData',rG2(2),'ZData',rG2(3))
    
    pause(0.1)
end


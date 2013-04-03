function plot_hough_results(IM, H, T, R, NPeaks, Tc)

if(nargin < 6)
    Tc = 0.3*max(H(:));
end
if(nargin < 5)
    NPeaks = 10;
end

figure
subplot(1,2,1)
imshow(H,[],'XData',T,'YData',R,...
    'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(H,NPeaks,'threshold',Tc);
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
% Find lines and plot them
lines = houghlines(IM,T,R,P,'FillGap',5,'MinLength',7);
subplot(1,2,2), imshow(IM), hold on
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    % Determine the endpoints of the longest line segment
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len)
        max_len = len;
        xy_long = xy;
    end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');

end
function Rects = windowed_rect_hough(I, Dmin, Dmax, Xrange, Yrange)
%%I - the image to search for rectangles in
% Dmin - the inner ring diameter of the search window
% Dmax - the outer ring diameter of the search window
% Algorithm based on http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.59.4239&rep=rep1&type=pdf

%create window
windowring = ring_mask(Dmin, Dmax);

dtheta = 180/(4/3*Dmax);
drho=sqrt(2)/(4/3);

Tc = 0.5*Dmin;
Ttheta = 10;
Trho = 20;
Talpha = 10;
TL = 1;
NPeaks = 20;

Rects = cell(0);
for xc=Xrange
    for yc=Yrange
        
        %Apply window
        window = extract_window(I, windowring, xc, yc);
%         figure
%         imagesc(window);
        [H T R] = hough(window,'RhoResolution',drho,'Theta',-90:dtheta:90-dtheta);
        
%         plot_hough_results(window, H, T, R, NPeaks, Tc);
        
        P  = houghpeaks(H,NPeaks,'threshold',Tc);
        
        windowxc = round(size(window,2)/2);
        windowyc = round(size(window,1)/2);
        [rhos thetas] = transform_centered_peaks(P, R, T, windowxc, windowyc);
        %Rhos and thetas are now transformed into centered origin space
        
        %Find pairs of parallel lines equally spaced on opposite sides of
        %the origin of roughly equal length.
        
        %calculate constraints
        delRho = abs(bsxfun(@plus, rhos, rhos'));
        delTheta = abs(bsxfun(@minus, thetas, thetas'));
        C_r_t = H(sub2ind(size(H),P(:,1),P(:,2)));
        del_C_r_t = abs(bsxfun(@minus, C_r_t, C_r_t'));
        norm_C_r_t = abs(bsxfun(@plus, C_r_t, C_r_t'))/2;
        
        paired_c1c2 = (delTheta < Ttheta) & (delRho < Trho);%First 2 hard constraints
        heightmatch = ((del_C_r_t) < TL*norm_C_r_t);
        
        pairs = paired_c1c2 & heightmatch;
        
        [pk pl] = find(triu(pairs,1));
        %Combine pairs into superpeaks
        alpha = (thetas(pk)+thetas(pl))/2;
        csi = abs(rhos(pk)-rhos(pl))/2;
        
        %Detect candidate rectangles
        delAlpha = abs(abs(bsxfun(@minus, alpha, alpha')-90));
        [ak al] = find(delAlpha<Talpha,1 );
        
        if(~isempty(ak))
            %TODO remove duplicates
            
            for i=1:numel(ak)
                %Found rectangles!
                rect.xc = xc;
                rect.yc = yc;
                rect.width = 2*csi(ak(i));
                rect.height = 2*csi(al(i));
                rect.orientation = alpha(ak(i));
                Rects = [Rects {rect}];
            end
        end
    end
end


end
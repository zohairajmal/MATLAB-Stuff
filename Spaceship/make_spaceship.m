function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

ship_dish_profile= 2*sin(linspace(0, pi, 15));
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

        
% Mid Dish
trf_mid_root= hgtransform('Parent', trf_root);
set(trf_mid_root, 'Matrix', makehgtform('translate', [0, 0, 0.2]));
color_mid= [1, 0, 0];
myhandles(2)= surface(Xc, Yc, Zc, 'Parent', trf_mid_root, 'FaceColor', color_mid, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_mid, 'EdgeAlpha', transparency);

% Bottom dish
trf_bottom_root= hgtransform('Parent', trf_root);
set(trf_bottom_root, 'Matrix', makehgtform('translate', [0, 0, 0.6]));
color_bottom= [1, 0, 0];
myhandles(2)= surface(Xc, Yc, Zc, 'Parent', trf_bottom_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);


% creates x, y, z coordinates of unit cylinder to draw left tail
[Xt, Yt, Zt]= cylinder([0.4 , 0.3 , 0]);


% Left tail
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-3, 0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [0 1 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

% Right tail
trf_tailright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-3, -0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_tailright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_right= [0 1 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailright_root, 'FaceColor', color_tail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_right, 'EdgeAlpha', transparency);

[Xt, Yt, Zt]= cylinder([0.39 , 0 , 0]);

% Left headtail
trf_tailheadleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', pi/2);
trf_T= makehgtform('translate', [-3.3, 0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_tailheadleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_headtail_left= [1 0 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailheadleft_root, 'FaceColor', color_headtail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_headtail_left, 'EdgeAlpha', transparency);

% Right headtail
trf_tailheadright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', pi/2);
trf_T= makehgtform('translate', [-3.3, -0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_tailheadright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_headtail_right= [1 0 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailheadright_root, 'FaceColor', color_headtail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_headtail_right, 'EdgeAlpha', transparency);


[Xt, Yt, Zt]= cylinder([0.45 , 0.35 , 0 ]);


%left undertail
trf_tailheadleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/7);
trf_T= makehgtform('translate', [-2.8, 0.75, -0.5]);
% Interpret the order as BFT (left to right)
set(trf_tailheadleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_headtail_left= [0 0 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailheadleft_root, 'FaceColor', color_headtail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_headtail_left, 'EdgeAlpha', transparency);

%right undertail
trf_tailheadright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/7);
trf_T= makehgtform('translate', [-2.8, -0.75, -0.5]);
% Interpret the order as BFT (left to right)
set(trf_tailheadright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_headtail_right= [0 0 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailheadright_root, 'FaceColor', color_headtail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_headtail_right, 'EdgeAlpha', transparency);


[Xt, Yt, Zt]= cylinder([0.35 , 0.45 , 0 ]);

%left lasttail
trf_lasttailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-1.5, 0.75, -0.4]);
% Interpret the order as BFT (left to right)
set(trf_lasttailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_lasttail_left= [0 1 0]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_lasttailleft_root, 'FaceColor', color_lasttail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_lasttail_left, 'EdgeAlpha', transparency);

%right lasttail
trf_lasttailright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-1.5, -0.75, -0.4]);
% Interpret the order as BFT (left to right)
set(trf_lasttailright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_lasttail_right= [0 1 0]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_lasttailright_root, 'FaceColor', color_lasttail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_lasttail_right, 'EdgeAlpha', transparency);

[Xt, Yt, Zt]= cylinder([0.35 , 0.45 , 0 ]);

%left lasttail
trf_lasttailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', pi/2);
trf_T= makehgtform('translate', [-1.5, 0.75, -0.4]);
% Interpret the order as BFT (left to right)
set(trf_lasttailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_lasttail_left= [0 1 0]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_lasttailleft_root, 'FaceColor', color_lasttail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_lasttail_left, 'EdgeAlpha', transparency);

%right lasttail
trf_lasttailright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', pi/2);
trf_T= makehgtform('translate', [-1.5, -0.75, -0.4]);
% Interpret the order as BFT (left to right)
set(trf_lasttailright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_lasttail_right= [0 1 0]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_lasttailright_root, 'FaceColor', color_lasttail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_lasttail_right, 'EdgeAlpha', transparency);

ship_dish_profile= 2.05*cos(linspace(0, -pi/2, 15));
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

% Added a new base structure
trf_top_root= hgtransform('Parent', trf_root);
set(trf_top_root, 'Matrix', makehgtform('translate', [0, 0, -0.1]));
color_top= [0, 0, 0];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

end




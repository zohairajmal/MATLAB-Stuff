clear all
close all
clf
handle_axes= axes('XLim', [-0.8,0.8], 'YLim', [-0.8,0.8], 'ZLim', [0,0.8]);

xlabel('e_1'); 
ylabel('e_2');
zlabel('e_3');

view(-130, 26);
grid on;
axis equal
camlight
axis_length= 0.09;

%% Root frame E
trf_E_axes= hgtransform('Parent', handle_axes); 

%% Link-0: Base-link

trf_link0_E= make_transform([0, 0, 0], 0, 0, 90, trf_E_axes);
plot_axes(trf_link0_E, 'L_0', false, axis_length); 

trf_viz_link0= make_transform([0, 0, 0.1], 0, 0, 0, trf_link0_E);
length0= 0.2; radius0= 0.1;
h(1)= link_cylinder(radius0, length0, trf_viz_link0, [1 0 0]); 
plot_axes(trf_viz_link0, ' ', true, axis_length);

%% Link-1
trf_viz_link1= make_transform([0, 0, 0], 0, 0, 0); 
 radius1= 0.11;
h(2)= link_sphere(radius1, trf_viz_link1, [0, 1, 0]); 


%% Link-1_2
trf_viz_link1p2= make_transform([0.1, 0, 0], 0, 0, 0); 
h(3)= link_box([0.03, 0.04, 0.01], trf_viz_link1p2, [0, 0, 1]); 
plot_axes(trf_viz_link1p2, ' ', true, axis_length); 
%% Link-1_11
trf_viz_link1p11= make_transform([0.1, 0.1, 0], 0, 0, pi/2);
h(11)= link_box([0.2, 0.02, 0.01], trf_viz_link1p11, [0, 0, 0]); 
plot_axes(trf_viz_link1p11, ' ', true, axis_length); 
%% Link-1_12
trf_viz_link1p12= make_transform([0.1, -0.1, 0], 0, 0, pi/2);
h(12)= link_box([0.2, 0.02, 0.01], trf_viz_link1p12, [1, 1, 0]); 
plot_axes(trf_viz_link1p12, ' ', true, axis_length); 

%% Link-1_13
trf_viz_link1p13= make_transform([0.1, 0.2, 0], 0, 0, pi/2); 
h(13)= link_cylinder(0.04, 0.06, trf_viz_link1p13, [1, 0, 1]); 


%% Link-1_14
trf_viz_link1p14= make_transform([0.1, -0.2, 0], 0, 0, pi/2); 
h(14)= link_cylinder(0.04, 0.06, trf_viz_link1p14, [1, 1, 1]); 

%% Link-215
trf_viz_link215= make_transform([0, 0, 0], 0, 0, 0); 
h(17)= link_cylinder(0.05, 0.04, trf_viz_link215, [0, 0.6, 0]); 

%% Link-216
trf_viz_link216= make_transform([0, 0, 0], 0, 0, 0); 
h(18)= link_cylinder(0.05, 0.04, trf_viz_link216, [0, 0, 0/8]); 


%% Link 2-215
trf_viz_link215p215= make_transform([0, -0.05, 0], pi/2, 0, 0); 
h(15)= link_cylinder(0.030, 0.1, trf_viz_link215p215, [0.2, 0.2, 0.5]); 

%% Link 2-216
trf_viz_link216p216= make_transform([0, -0.05, 0], pi/2, 0, 0); 
h(16)= link_cylinder(0.030, 0.1, trf_viz_link216p216, [0.7, 0, 0.6]); 


%% Link-315
trf_viz_link315= make_transform([0, 0, -0.03], 0, 0, 0); 
h(32)= link_cylinder(0.020, 0.06, trf_viz_link315, [0, 0.8, 0]); 
%% Link-316
trf_viz_link316= make_transform([0, 0, -0.03], 0, 0, 0);
h(33)= link_cylinder(0.020, 0.06, trf_viz_link316, [0, 0.6, 0.2]); 

%% Link-3-215
trf_viz_link315p215= make_transform([0, 0, 0], pi/2, 0, 0); 
h(83)= link_cylinder(0.012, 0.04, trf_viz_link315p215, [0.196078, 0.803922, 0.196078]); 

%% Link-3-216
trf_viz_link316p216= make_transform([0, 0, 0], pi/2, 0, 0);
h(82)= link_cylinder(0.012, 0.04, trf_viz_link316p216, [0.196078, 0.803922, 0.196078]); 

%% Link-415
trf_viz_link415= make_transform([0, 0, -0.075], 0, 0, 0);
h(9)= link_cylinder(0.014, 0.15, trf_viz_link415, [0.482353 0.407843 0.933333]); 
%% Link-416
trf_viz_link416= make_transform([0, 0, -0.075], 0, 0, 0); 
h(9)= link_cylinder(0.014, 0.15, trf_viz_link416, [0.482353 0.407843 0.933333]); 

%% Link-End-Effector
trf_viz_linkEE= make_transform([0, 0, 0.001], 0, 0, 0);
h(10)= link_sphere(0.005, trf_viz_linkEE, [1, 0, 0]); 



%% Now define all the joints

%% Joint 1: Links 0,1: Revolute
j1_rot_axis_j1= [0,0,1]';
j1_rot_angle= 0; 

trf_joint1_link0= make_transform([0, 0, 0.225], 0, 0, 0, trf_link0_E); 
trf_link1_joint1= make_transform_revolute(j1_rot_axis_j1, j1_rot_angle, trf_joint1_link0); 
plot_axes(trf_link1_joint1, 'L_1', false, axis_length); 
make_child(trf_link1_joint1, trf_viz_link1);

%% Joint: Links 1,1_2: Fixed
trf_link1p2_link1= make_transform([0, 0, 0], 0, 0, 0, trf_link1_joint1); 
make_child(trf_link1p2_link1, trf_viz_link1p2);

%% Joint: Links 1,1_11: Fixed
trf_link1p11_link1= make_transform([0, 0, 0], 0, 0, 0, trf_link1_joint1); 
make_child(trf_link1p11_link1, trf_viz_link1p11);

%% Joint: Links 1,1_12: Fixed
trf_link1p12_link1= make_transform([0, 0, 0], 0, 0, 0, trf_link1_joint1); 
make_child(trf_link1p12_link1, trf_viz_link1p12);

%% Joint: Links 1,1_13: Fixed
trf_link1p13_link1= make_transform([0, 0, 0], 0, 0, 0, trf_link1_joint1); 
make_child(trf_link1p13_link1, trf_viz_link1p13);
%% Joint: Links 1,1_14: Fixed
trf_link1p14_link1= make_transform([0, 0, 0], 0, 0, 0, trf_link1_joint1); 
make_child(trf_link1p14_link1, trf_viz_link1p14);

%% Joint 2: Links 1,215: Revoulute
j215_rot_axis_j215= [0,0,1]';
j215_rot_angle= 0; 

trf_joint215_link1= make_transform([0.1, 0.2, 0.045], 0, 0, pi/2, trf_link1_joint1); 
trf_link215_joint215= make_transform_revolute(j215_rot_axis_j215, j215_rot_angle, trf_joint215_link1); 
plot_axes(trf_link215_joint215, 'L_215', false, axis_length); 
make_child(trf_link215_joint215, trf_viz_link215);
%% Joint 2: Links 1,216: Revoulute
j216_rot_axis_j216= [0,0,1]';
j216_rot_angle= 0; 

trf_joint216_link1= make_transform([0.1, -0.2, 0.045], 0, 0, pi/2, trf_link1_joint1); 
trf_link216_joint216= make_transform_revolute(j216_rot_axis_j216, j216_rot_angle, trf_joint216_link1); 
plot_axes(trf_link216_joint216, 'L_216', false, axis_length); 
make_child(trf_link216_joint216, trf_viz_link216);

%% Joint: Links 2,2_215: Fixed
trf_link215p215_link215= make_transform([0, 0, 0], 0, 0, 0, trf_link215_joint215); 
make_child(trf_link215p215_link215, trf_viz_link215p215);
%% Joint: Links 2,2_216: Fixed
trf_link216p216_link216= make_transform([0, 0, 0], 0, 0, 0, trf_link216_joint216); 
make_child(trf_link216p216_link216, trf_viz_link216p216);

%% Joint 315: Links 215,315: Revoulute
j315_rot_axis_j315= [0,0,1]';
j315_rot_angle= 0; % [-pi/2, pi/2]

trf_joint315_link215= make_transform([0, -0.15, 0], pi/2, 0, 0, trf_link215_joint215);
trf_link315_joint315= make_transform_revolute(j315_rot_axis_j315, j315_rot_angle, trf_joint315_link215); 
plot_axes(trf_link315_joint315, 'L_315', false, axis_length); 
make_child(trf_link315_joint315, trf_viz_link315);
%% Joint 315: Links 216,316: Revoulute
j316_rot_axis_j316= [0,0,1]';
j316_rot_angle= 0; 

trf_joint316_link216= make_transform([0, -0.15, 0], pi/2, 0, 0, trf_link216_joint216);
trf_link316_joint316= make_transform_revolute(j316_rot_axis_j316, j316_rot_angle, trf_joint316_link216); 
plot_axes(trf_link316_joint316, 'L_316', false, axis_length); 
make_child(trf_link316_joint316, trf_viz_link316);


%% Joint: Links 3,315_215: Fixed
trf_link315p215_link315= make_transform([0, 0, 0], 0, 0, 0, trf_link315_joint315); 
make_child(trf_link315p215_link315, trf_viz_link315p215);
%% Joint: Links 3,316_216: Fixed
trf_link316p216_link316= make_transform([0, 0, 0], 0, 0, 0, trf_link316_joint316); 
make_child(trf_link316p216_link316, trf_viz_link316p216);

%% Joint 415: Links 315,415: Prismatic
j415_translation_axis_j415= [0,0,1]';
j415_translation= 0; 

trf_joint415_link315= make_transform([0, -0.07, 0], pi/2, 0, 0, trf_link315_joint315); 
trf_link415_joint415= make_transform_prismatic(j415_translation_axis_j415, j415_translation, trf_joint415_link315);
plot_axes(trf_link415_joint415, 'L_415', false, axis_length); 
make_child(trf_link415_joint415, trf_viz_link415);
%% Joint 416: Links 316,416: Prismatic
j416_translation_axis_j416= [0,0,1]';
j416_translation= 0; 

trf_joint416_link316= make_transform([0, -0.07, 0], pi/2, 0, 0, trf_link316_joint316); 
trf_link416_joint416= make_transform_prismatic(j416_translation_axis_j416, j416_translation, trf_joint416_link316);
plot_axes(trf_link416_joint416, 'L_416', false, axis_length); 
make_child(trf_link416_joint416, trf_viz_link416);

%% Joint: Links 4,EE: Fixed
trf_linkEE_link415= make_transform([0, 0, 0], 0, 0, 0, trf_link415_joint415); 
make_child(trf_linkEE_link415, trf_viz_linkEE);
%% Joint: Links 4,EE: Fixed
trf_linkEE_link416= make_transform([0, 0, 0], 0, 0, 0, trf_link416_joint416); 
make_child(trf_linkEE_link416, trf_viz_linkEE);

%% Animation: One joint at a time
for q1=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q1= makehgtform('axisrotate', j1_rot_axis_j1, q1);
    set(trf_link1_joint1, 'Matrix', trf_q1);
    drawnow;
    pause(0.02);
end


for q5=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q5= makehgtform('axisrotate', j215_rot_axis_j215, q5);
    set(trf_link215_joint215, 'Matrix', trf_q5);
    drawnow;
    pause(0.02);
end
for q6=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q6= makehgtform('axisrotate', j216_rot_axis_j216, q6);
    set(trf_link216_joint216, 'Matrix', trf_q6);
    drawnow;
    pause(0.02);
end

for q7=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q7= makehgtform('axisrotate', j315_rot_axis_j315, q7);
    set(trf_link315_joint315, 'Matrix', trf_q7);
    drawnow;
    pause(0.02);
end
for q8=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_q8= makehgtform('axisrotate', j316_rot_axis_j316, q8);
    set(trf_link316_joint316, 'Matrix', trf_q8);
    drawnow;
    pause(0.02);
end


for a9=[linspace(0, -0.04, 30), linspace(-0.04, 0.04, 30), linspace(0.04, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_a9= makehgtform('translate', j415_translation_axis_j415*a9);
    set(trf_link415_joint415, 'Matrix', trf_a9);
    drawnow;
    pause(0.02);
end
for a10=[linspace(0, -0.04, 30), linspace(-0.04, 0.04, 30), linspace(0.04, 0, 30)]
    set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
    trf_a10= makehgtform('translate', j416_translation_axis_j416*a10);
    set(trf_link416_joint416, 'Matrix', trf_a10);
    drawnow;
    pause(0.02);
end

%% Animation: All joints together.
q_init= 0.5*ones(10,1); 

for i= 1:20
    q_next= rand(10,1); 
   
    
    for t=0:0.02:1
        q= q_init + t*(q_next - q_init);
        q1= (pi/2)*(2*q(1) - 1);
        q2= (pi/2)*(2*q(2) - 1);
        q5= (pi/2)*(2*q(5) - 1);
        q6= (pi/2)*(2*q(6) - 1);
       
        q7= (pi/2)*(2*q(7) - 1);
        q8= (pi/2)*(2*q(8) - 1);
      
        a9= (0.04)*(2*q(9) - 1);
        a10= (0.04)*(2*q(10) - 1);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q1= makehgtform('axisrotate', j1_rot_axis_j1, q1);
        set(trf_link1_joint1, 'Matrix', trf_q1);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q5= makehgtform('axisrotate', j315_rot_axis_j315, q5);
        set(trf_link315_joint315, 'Matrix', trf_q5);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q6= makehgtform('axisrotate', j316_rot_axis_j316, q6);
        set(trf_link316_joint316, 'Matrix', trf_q6);
        
    
        
          set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q7= makehgtform('axisrotate', j315_rot_axis_j315, q7);
        set(trf_link315_joint315, 'Matrix', trf_q7);
        
          set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_q8= makehgtform('axisrotate', j316_rot_axis_j316, q8);
        set(trf_link316_joint316, 'Matrix', trf_q8);
        
         
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_a9= makehgtform('translate', j415_translation_axis_j415*a9);
        set(trf_link415_joint415, 'Matrix', trf_a9);
        
        set(handle_axes, 'XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
        trf_a10= makehgtform('translate', j416_translation_axis_j416*a10);
        set(trf_link416_joint416, 'Matrix', trf_a10);
        drawnow;
        pause(0.005);
        
    end
    
    q_init= q_next;
    
end



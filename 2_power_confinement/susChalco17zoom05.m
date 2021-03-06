% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5 (COMSOL 3.5.0.494, $Date: 2008/09/19 16:09:48 $)
% Some geometry objects are stored in a separate file.
% The name of this file is given by the variable 'flbinaryfile'.
flclear fem
% COMSOL version
clear vrsn
vrsn.name = 'COMSOL 3.5';
vrsn.ext = '';
vrsn.major = 0;
vrsn.build = 494;
vrsn.rcs = '$Name:  $';
vrsn.date = '$Date: 2008/09/19 16:09:48 $';
fem.version = vrsn;



% Geometry
zooming=0.5;
SF=1.3;
% rc=500e-9*zooming; this was previous. now it will vary with sf 1.7 to 1.3
% has different rc. The core diameter at 1.7 to 1.3 sf are consequently
% 260nm, 300nm, 340nm, 380nm, 420nm. the size may overlap with air then
% lower the core size. practical is 375, 410 nm.
rc=410e-9;
%change file name and upper 3 line. file name at two places.
zoom=1e-6*zooming;
r0=1.8*zoom;
n=8;           %# of holes in the first ring
del_theta=360/n;        % angular displacement between two successive hole
theta=[0:del_theta:360-del_theta]*pi/180;
n1=3;           % # of ring in the pcf
[x,y]=pol2cart(theta,r0);
p=0.9;          % pitch of first ring
r_hole=sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)/2*.95*p;
% r_hole=160e-9;
n=length(theta);
X=[];
Y=[];
for j=1:n1
    r=r0+2*r_hole*(j-1)*.8;
    theta1=theta+del_theta/2*(j-1)*pi/180;
    [x,y]=pol2cart(theta1,r);
    X=[X,x];
    Y=[Y,y];
end
r_clad=(r+r_hole)*0.57;
% cor=r_clad;
% save cor cor
clad=ellip2(r_clad,r_clad,'base','center','pos',[0,0]);
r_core=r0-r_hole*1.1;
% core=ellip2(r_core,r_core,'base','center','pos',{'0','0'},'rot','0');
gc=ellip2(rc,rc,'base','center','pos',[0,0]);
radi=r_hole;

dist_1sthole2center=sqrt(X(1)^2+Y(1)^2);
dist_1sthole2center=dist_1sthole2center*SF;

t1=circ2(radi,'base','center','pos',{'0','0'},'rot','0');
carr={curve2([radi,0,-radi],[0,-dist_1sthole2center,0],[1,1/sqrt(2),1]), ...
  curve2([-radi,radi],[0,0],[1,1])};
t2=geomcoerce('solid',carr);
t3=geomcomp({t1,t2},'ns',{'g1','g2'},'sf','g1+g2','edge','none');
t4=geomdel(t3);

% [g1]=geomcopy({t4});
g1=move(t4,[X(1),Y(1)]);
g1=rotate(g1,6*pi/4,[X(1),Y(1)]);
g2=move(t4,[X(2),Y(2)]);
g2=rotate(g2,7*pi/4,[X(2),Y(2)]);
g3=move(t4,[X(3),Y(3)]);
g3=rotate(g3,8*pi/4,[X(3),Y(3)]);
g4=move(t4,[X(4),Y(4)]);
g4=rotate(g4,9*pi/4,[X(4),Y(4)]);
g5=move(t4,[X(5),Y(5)]);
g5=rotate(g5,10*pi/4,[X(5),Y(5)]);
g6=move(t4,[X(6),Y(6)]);
g6=rotate(g6,11*pi/4,[X(6),Y(6)]);
g7=move(t4,[X(7),Y(7)]);
g7=rotate(g7,12*pi/4,[X(7),Y(7)]);
g8=move(t4,[X(8),Y(8)]);
g8=rotate(g8,13*pi/4,[X(8),Y(8)]);
% % 
% [g5]=geomcopy({g4});
% g5=move(g5,[X(2),Y(2)]);
% g5=rotate(g5,0.7853981633974483,[0,0]);

% g1=circ2(radi,'base','center','pos',{X(1),Y(1)},'rot','0');
% g2=circ2(radi,'base','center','pos',{X(2),Y(2)},'rot','0');
% g3=circ2(radi,'base','center','pos',{X(3),Y(3)},'rot','0');
% g4=circ2(radi,'base','center','pos',{X(4),Y(4)},'rot','0');
% g5=circ2(radi,'base','center','pos',{X(5),Y(5)},'rot','0');
% g6=circ2(radi,'base','center','pos',{X(6),Y(6)},'rot','0');
% g7=circ2(radi,'base','center','pos',{X(7),Y(7)},'rot','0');
% g8=circ2(radi,'base','center','pos',{X(8),Y(8)},'rot','0');
% g9=circ2(radi,'base','center','pos',{X(9),Y(9)},'rot','0');
% g10=circ2(radi,'base','center','pos',{X(10),Y(10)},'rot','0');
% g11=circ2(radi,'base','center','pos',{X(11),Y(11)},'rot','0');
% g12=circ2(radi,'base','center','pos',{X(12),Y(12)},'rot','0');
% g13=circ2(radi,'base','center','pos',{X(13),Y(13)},'rot','0');
% g14=circ2(radi,'base','center','pos',{X(14),Y(14)},'rot','0');
% g15=circ2(radi,'base','center','pos',{X(15),Y(15)},'rot','0');
% g16=circ2(radi,'base','center','pos',{X(16),Y(16)},'rot','0');
% g17=circ2(radi,'base','center','pos',{X(17),Y(17)},'rot','0');
% g18=circ2(radi,'base','center','pos',{X(18),Y(18)},'rot','0');
% g19=circ2(radi,'base','center','pos',{X(19),Y(19)},'rot','0');
% g20=circ2(radi,'base','center','pos',{X(20),Y(20)},'rot','0');
% g21=circ2(radi,'base','center','pos',{X(21),Y(21)},'rot','0');
% g22=circ2(radi,'base','center','pos',{X(22),Y(22)},'rot','0');
% g23=circ2(radi,'base','center','pos',{X(23),Y(23)},'rot','0');
% g24=circ2(radi,'base','center','pos',{X(24),Y(24)},'rot','0');

clear s
% s.objs={h{1:end},clad};
% s.objs={g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16,g17,g18,g19,...
% g20,g21,g22,g23,g24,clad};
s.objs={g1,g2,g3,g4,g5,g6,g7,g8,gc,clad};
fem.draw = struct('s',s);
fem.geom=geomcsg(fem);




% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5 (COMSOL 3.5.0.494, $Date: 2008/09/19 16:09:48 $)

% Initialize mesh
fem.mesh=meshinit(fem, ...
                  'hauto',5);

% (Default values are not included)
%corgeneration

% xlo=-r_clad;
% xhi=r_clad;
% ylo=-r_clad
% yhi=r_clad;
% gridx=100;
% gridy=100;
% x=linspace(xlo,xhi,gridx);
% y=linspace(ylo,yhi,gridy);
% [X,Y] = meshgrid(x,y); 
% corxy=[X(:)'; Y(:)'];
% save corxy_susSilicaZoom150 corxy

load corxy_Zoom50

wave=1200e-9:100e-9:2800e-9;
for index=1:length(wave)
    tic
nsell=sell_chalco_AsSe(wave(index)*1e6);
% Application mode 1
clear appl
appl.mode.class = 'PerpendicularWaves';
appl.module = 'RF';
appl.gporder = 4;
appl.cporder = 2;
appl.sshape = 2;
appl.assignsuffix = '_rfwv';
clear prop
prop.inputvar='lambda';
appl.prop = prop;
clear bnd
bnd.type = {'E0','cont'};
bnd.ind = [1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2, ...
  1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2];
%subdomain 1 is clad, and 7 is core , all the rest are air holes.
appl.bnd = bnd;
clear equ
equ.n = {nsell,1};
equ.ind = [1,2,2,2,2,2,1,2,2,2];
appl.equ = equ;
appl.var = {'lambda0',wave(index)};
fem.appl{1} = appl;
fem.border = 1;

% Multiphysics
fem=multiphysics(fem);

% Extend mesh
fem.xmesh=meshextend(fem);

% Solve problem
fem.sol=femeig(fem, ...
               'solcomp',{'tHxHy20','tHxHy10','tHxHy21','hz'}, ...
               'outcomp',{'tHxHy20','tHxHy10','tHxHy21','hz'}, ...
               'blocksize','auto', ...
               'shift',-2*pi*nsell*i/wave(index));

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
% postplot(fem, ...
%          'tridata',{'Pozav_rfwv','cont','internal'}, ...
%          'trimap','jet(1024)', ...
%          'solnum',1, ...
%          'title','neff_rfwv(1)=1.419138    Surface: Power flow, time average, z component', ...
%          'axis',[-5.237803709241594E-6,5.23780370924159E-6,-2.4209883576986618E-6,2.4209883576986618E-6]);

pcore(index)=postint(fem,'Pozav_rfwv', ...
           'unit','', ...
           'recover','off', ...
           'dl',[7], ...
           'solnum','end');
ptotal(index)=postint(fem,'Pozav_rfwv', ...
           'unit','', ...
           'recover','off', ...
           'dl',[1,2,3,4,5,6,7,8,9,10], ...
           'solnum','end');
       
pair(index)=postint(fem,'Pozav_rfwv', ...
           'unit','', ...
           'recover','off', ...
           'dl',[2,3,4,5,6,8,9,10], ...
           'solnum','end');

index
save sus13zoom50airPowerfraction pcore ptotal pair index
toc
end
save sus13zoom50airPowerfraction pcore ptotal pair index

function presentacion_project

clear,clc,cla,close all

%build figure
figgui = figure('Units', 'Pixels',...
            'Position', [0.0725 0.725 0.57 0.57],...
            'Number','off','Name','Matlab for Aplications of Engenyering',...
            'Menubar', 'none','color',[0 0 0]);

%Put the axes in the fig.       
axes('Units','Normalized','Position', [0 0 1 1]) ; 

%Put the image in the center
scrsz = get(0, 'ScreenSize');
pos = get(gcf, 'Position');
xr = scrsz(3) - pos(3);
xp = round(xr/2);
yr = scrsz(4) - pos(4);
yp = round(yr/2);
set(gcf, 'Position', [xp yp pos(3) pos(4)]);

%import the image
[x,map]=imread('image.jpg','jpg');
image(x)
colormap(map)
axis off
hold on;

%Put the tittle
text(50,50,'Welcome to GUITAR TUNER', 'Fontname', 'Arial',...
     'Fontsize', 25);

%my name
text(50,130,'By: Javier Sánchez', 'Fontname', 'Arial',...
     'Fontsize', 14);

%button next

buttonok = uicontrol('Style', 'pushbutton', 'Units', 'normalized',...
    'Position', [.84 .03 .12 .05], 'String','Tuner','Callback',...
    'clear all; close all; clc; GUITAR_TUNER;');
buttonok1 = uicontrol('Style', 'pushbutton', 'Units', 'normalized',...
    'Position', [.70 .03 .12 .05], 'String','Turorial','Callback',...
    'clear all; close all; clc; tutorial;');

end
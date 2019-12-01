clear all
close all 
clc

%% Create a GUI window 
window = figure('position',[0 0 400 500],...
                'unit','pixels',...
                'name','Sudoko Solver',...
                'visible','on');
movegui(window,'northwest')
%% Create my Sudoku cells
CornerX = 25;
CornerY = 410;
dx = 35;
dy = 35;
for ii = 1:9
    for jj = 1:9
        xPos = CornerX + (jj-1)*dx;
        yPos = CornerY - (ii-1)*dy; 
        sudokugui.X(ii,jj) = uicontrol('unit','pixels',...
                                       'background','w',...
                                       'Style','edit',...
                                       'visible','on',...
                                       'position',[xPos,yPos,dx dy],...
                                       'fontsize',14',...
                                       'fontweight','normal',...
                                       'enable','on',...
                                       'KeyPressFcn',{@cbEntry,window,ii,jj});
    end
end
%% Insert a title textbox
sudokugui.title = uicontrol('Style','text',...  
                            'unit','pixels',...
                            'Fontweight','normal',...   
                            'string','Sudoku Solver',...
                            'Position',[0 455 400 30],...
                            'FontSize',24,...
                            'backgroundcolor',[0.2 0.7 0.7],...
                            'foregroundcolor',[1 1 0]);
%% Insert a SOLVE button
sudokugui.solve = uicontrol('Style','pushbutton',...
                            'callback',{@cbSolve,window},...
                            'string','Solve',...
                            'position',[275 55 100 30],...
                            'backgroundcolor',[0.2 0 0.7],...
                            'foregroundcolor',[0.2 0.9 0]);

%% Insert a CLEAR button
sudokugui.clear = uicontrol('Style','pushbutton',...
                            'callback',{@cbClear,window},...
                            'string','Clear',...
                            'position',[275 15 100 30],...
                            'backgroundcolor',[0.9 0.1 0.2],...
                            'foregroundcolor',[1 0.9 0]);
%% Insert a status bar
sudokugui.status = uicontrol('Style','text',...
                             'unit','pixels',...
                             'string','Hit SOLVE to solve me',...
                             'backgroundcolor',[0.7 0.8 0.7],...
                             'Fontsize',10,...
                             'Position',[25 35 250 50],...
                             'Horizontalalignment','left');
set(window,'UserData',sudokugui)

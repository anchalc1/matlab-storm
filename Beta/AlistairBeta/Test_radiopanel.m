function Test_radiopanel

panel.FigureH = figure;
set(panel.FigureH,'color',[.95,.95,.95], 'MenuBar','none','ToolBar','none',...
    'NumberTitle','off','Name','layers','Position',[1200,900,180,120]);
figure(panel.FigureH);
panel.radio(1) = uicontrol('Style', 'radiobutton', ...
                           'Callback', @myRadio, ...
                           'Units',    'pixels', ...
                           'Position', [10, 100, 80, 22], ...
                           'String',   'radio 1', ...
                           'Value',    1);
panel.radio(2) = uicontrol('Style', 'radiobutton', ...
                           'Callback', @myRadio, ...
                           'Units',    'pixels', ...
                           'Position', [10, 80, 80, 22], ...
                           'String',   'radio 2', ...
                           'Value',    0);

guidata(panel.FigureH, panel);

% Add a button 
addheight = 20;
currpos = get(panel.FigureH,'Position');
set(panel.FigureH,'Position',[currpos(1),currpos(2)-addheight,currpos(3),currpos(4)+addheight]);
for r=1:2
rp1 = get(panel.radio(r),'Position');
set(panel.radio(r),'Position',[rp1(1),rp1(2)+addheight,rp1(3:4)]);
end
panel.radio(r+1) = uicontrol('Style', 'radiobutton', ...
                           'Callback', @myRadio, ...
                           'Units',    'pixels', ...
                           'Position', rp1, ...
                           'String',   ['radio ',num2str(r+1)], ...
                           'Value',    0);
figure(panel.FigureH);

function myRadio(RadioH, EventData)
panel = guidata(RadioH)
set(RadioH,'String','channel 1');
otherRadio = panel.radio(panel.radio ~= RadioH);
set(otherRadio, 'Value', 0);
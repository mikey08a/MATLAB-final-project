%<SM: AFFIRM>
% -------------------------------------
% Submitted by: Mikey Walton
% Tested by:                           
% Credit:                              
%       Yair Altman (SoundVolume.m 
%       'Turntabe.png'
%       -https://yt3.ggpht.com/-V21wRUQFRV0/AAAAAAAAAAI/AAAAAAAAAAA/BK8ga4XY__M/s900-c-k-no/photo.jpg
%       'Loopoff.jpg'
%       http://cdn.flaticon.com/png/512/24210.png
%       'Shuffleoff'
%       -https://cdn1.iconfinder.com/data/icons/material-audio-video/16/shuffle-512.png
%   ALL OTHER IMAGES ARE MINE
%
%   Credit for testing:
%           Kenneth Gonzalez
%           Zach (my suite mate)
%                                     
% I did not cheat. All code is either  
% mine or used under license and cited 
% -------------------------------------


function OpenGUI()

    %<SM:READ>
    first = textread('First Time.txt');
    
    ud = {0,0,0,0,0,0};
    %<SM:BUILD>
    ud = [ud;ud;ud;ud];
    ud = [ud,ud];
    
    % Input images
    play = imread('play (1).jpg');
    play = imresize(play,.75);
    pause1 = imread('pause (1).jpg');
    pause1 = imresize(pause1,.75);
    turntable = imread('Turntable.png');
    open1 = imread('OpenMenu.jpg');
    open1 = imresize(open1,.9);
    open2 = imread('OpenMenu2.jpg');
    open2 = imresize(open2,.9);
    closed1 = imread('ClosedMenu.jpg');
    closed2 = imread('ClosedMenu2.jpg');
    loopoff = imread('loopoff.jpg');
    loopoff = imresize(loopoff,.1);
    loopon = imread('loopon.jpg');
    loopon = imresize(loopon,.1);
    shuffleoff = imread('shuffleoff.jpg');
    shuffleoff = imresize(shuffleoff,.05);
    shuffleon = imread('shuffleon.jpg');
    shuffleon = imresize(shuffleon,.05);
    loading = imread('loading.jpg');
    loading = imresize(loading,.75);
    
    % Assign images to userdata
    ud{2,4} = play;
    ud{2,5} = pause1;
    ud{2,6} = closed1;
    ud{2,7} = closed2;
    ud{2,8} = open1;
    ud{2,9} = open2;
    ud{2,10} = loopon;
    ud{2,11} = loopoff;
    ud{2,12} = loading;
    ud{3,1} = shuffleon;
    ud{3,2} = shuffleoff;
    
    frameh = figure();
    set(frameh, 'Resize', 'off');
    set(frameh, 'MenuBar', 'none');
    set(frameh, 'NumberTitle', 'off');
    set(frameh, 'Name', 'PC DJ');
    set(frameh, 'Position', [100, 100, 1000, 600]);
    set(frameh, 'color', 'w')
    
    % Add title
    a = uicontrol('style','text','string','PC DJ','fontsize',30);
    set(a,'foregroundcolor','r','backgroundcolor','w','fontname','Times New Roman');
    set(a,'position', [400,600,200,50])
    
    % Create directory of songs
    list = ls('*.mp3');
    ud{2,1} = cellstr(list);
    

           
    % Add turntable images
    t1 = axes('units','pixels','Position', [-470,150,470,470]);
    A = ones(size(turntable, 1), size(turntable, 2));
    transparent_color = turntable(:, :, 1)==255 & turntable(:, :, 2)==255 & turntable(:, :, 3)==255;
    A(transparent_color) = 0.0;
    ih1 = image(turntable);
    set(ih1,'alphadata',A);
    axis off
    axis image
    
    t2 = axes('units','pixels','Position', [1000,150,470,470]); 
    A = ones(size(turntable, 1), size(turntable, 2));
    transparent_color = turntable(:, :, 1)==255 & turntable(:, :, 2)==255 & turntable(:, :, 3)==255;
    A(transparent_color) = 0.0;
    ih1 = image(turntable);
    set(ih1,'alphadata',A);
    axis off
    axis image 
    
    % Add volume slider
    ud{4,3} = SoundVolume;
    vol1 = uicontrol('style','slider');
    set(vol1,'position',[485,-220,30,200])
    set(vol1,'value',ud{4,3})
    set(vol1,'backgroundcolor','r')
    set(vol1,'sliderstep',[.1,.25])
    
    % Add side menus
    menu1 = uicontrol('style', 'togglebutton', 'position', [-520,225,31,250]);
        set(menu1, 'cdata', ud{2,6},'userdata',1)
    menu2 = uicontrol('style', 'togglebutton', 'position', [1492,225,31,250]);
        set(menu2, 'cdata', ud{2,7})
    uistack(menu1,'top')
    uistack(menu2,'top')
    
    % Add loop/shuffle buttons
    loop1 = uicontrol('style','togglebutton','position',[-270,178,30,30]);
    set(loop1,'cdata',ud{2,11})
    shuffle1 = uicontrol('style','togglebutton','position',[-242,178,30,30]);
    set(shuffle1,'cdata',ud{3,2})
    loop2 = uicontrol('style','togglebutton','position',[1205,178,30,30]);
    set(loop2,'cdata',ud{2,11})
    shuffle2 = uicontrol('style','togglebutton','position',[1233,178,30,30]);
    set(shuffle2,'cdata',ud{3,2})
    
    p1 = get(t1,'position');
    p2 = get(t2,'position');
    m1 = get(menu1,'position');
    m2 = get(menu2,'position');
    v = get(vol1,'position');
    s1 = get(shuffle1,'position');
    s2 = get(shuffle2,'position');
    l1 = get(loop1,'position');
    l2 = get(loop2,'position');
    a1 = get(a,'position');
    %<SM:FOR>
    for x = 1:260;
        p1(1) = p1(1)+2;
        p2(1) = p2(1)-2;
        m1(1) = m1(1)+2;
        m2(1) = m2(1)-2;
        v(2) = v(2)+2;
        s1(1) = s1(1)+2;
        s2(1) = s2(1)-2;
        l1(1) = l1(1)+2;
        l2(1) = l2(1)-2;
        a1(2) = a1(2)-.288;
        set(t1,'position',p1)
        set(t2,'position',p2)
        set(menu1,'position',m1)
        set(menu2,'position',m2)
        set(vol1,'position',v)
        set(shuffle1,'position',s1)
        set(shuffle2,'position',s2)
        set(loop1,'position',l1)
        set(loop2,'position',l2)
        set(a,'position',a1)
        pause(.0001)
    end
    
    % Add track info panels
    track1 = text(-580,850,'Add Track From Browser');
    set(track1,'fontsize',14)
    track2 = text(400,850,'Add Track From Browser');
    set(track2,'fontsize',14)
    
    text(-3,550,'Volume')
    
    % Add the two pushbuttons
    play1 = uicontrol('Style', 'togglebutton', 'Position', [210, 311, 150, 150]);
    set(play1,'cdata',ud{2,4})
    uistack(play1,'bottom')
    play2 = uicontrol('Style', 'togglebutton', 'Position', [643, 311, 150, 150]);
    set(play2,'cdata',ud{2,4})
    
    % Create Timer
    timerval = 0;
    timer1 = timer('ExecutionMode','fixedrate','Period',1,'StartDelay',0,'userdata',{timerval},'timerfcn',{@cb_timer1,frameh,track1,play1});
    stop(timer1)
    timer2 = timer('ExecutionMode','fixedrate','Period',1,'StartDelay',0,'userdata',{timerval},'timerfcn',{@cb_timer2,frameh,track2,play2});
    stop(timer2)
    
        
    if first == 1;
        set(a,'visible','off')
        welcome = uicontrol('position',[450,5,100,30],'string','Continue');
        wtext = text(-275,0,'Welcome to PC DJ, Click Continue...');
        set(wtext,'fontsize',14,'backgroundcolor','r','margin',30)
        set(welcome,'callback',{@welcome1,wtext,frameh,track1,play1,timer1,menu1})
        ud{4,12} = 1;
    end

    % Set UserData
    %<SM:UDDEF>
    set(frameh, 'userdata', ud)

    % Specify the callback functions
    set(play1, 'callback', {@cb_play1,frameh,timer1});
    set(play2, 'callback', {@cb_play2,frameh,timer2});
    set(menu1, 'callback', {@cb_menu1,frameh,track1,play1,timer1});
    set(menu2, 'callback', {@cb_menu2,frameh,track2,play2,timer2});
    set(shuffle1, 'callback', {@cb_shuffle1,frameh});
    set(shuffle2, 'callback', {@cb_shuffle2,frameh});
    set(loop1, 'callback', {@cb_loop1,frameh});
    set(loop2, 'callback', {@cb_loop2,frameh});
    set(vol1, 'callback', @cb_vol);
end


function cb_play1(hObject, eventdata, frameh, timer1)
    
     % Play/Pause Music
    ud = get(frameh,'userdata');
    p = get(hObject,'value');
    %<SM:VALID>
    if ud{1,1} == 0;
        warndlg('Please Select a track first','ERROR: No Song Selected')
    else
    if p ==1;
        resume(ud{1,4})
        set(hObject,'cdata',ud{2,5})
        start(timer1)
    else
        set(hObject,'cdata',ud{2,4});
        pause(ud{1,4})
        stop(timer1)
    end
    end
end % of cb_pb1()

function cb_play2(hObject, eventdata, frameh, timer2)
    
     % Play/Pause Music
    ud = get(frameh,'userdata');
    p = get(hObject,'value');
    if ud{1,7} == 0;
        warndlg('Please Select a track first','ERROR: No Song Selected')
    else
    if p == 1;
        resume(ud{1,10})
        set(hObject,'cdata',ud{2,5})
        start(timer2)
    else
        set(hObject,'cdata',ud{2,4});
        pause(ud{1,10})
        stop(timer2)
    end
    end
end % of cb_pb2()

%<SM:PARAM>
function cb_menu1(hObject, eventdata, frameh, track1, play1,timer1)
    % Switch text
    ud = get(frameh, 'userdata');
    h = findobj('tag','list1');
    choice = get(h,'value');
    ud{3,7} = choice;
    delete(h)
    p = get(hObject,'value');
    browser1 = uicontrol('style','listbox','position',[0,225,100,250],'visible','off','tag','list1');
    set(browser1,'string',ud{2,1})
    %<SM:IF>
    if p == 1;
        set(hObject,'position',[100,225,31,250])
        set(hObject,'cdata',ud{2,8})
        set(browser1,'visible','on')
    else
        set(hObject,'position',[0,225,31,250])
        set(hObject,'cdata',ud{2,6})
        set(play1,'cdata',ud{2,12})
        pause(.1)
        list = ud{2,1};
        %<SM:SEARCH>
        choice = list(choice);
        ud{1,1} = choice{1};
        [ud{1,2},ud{1,3}] = audioread(ud{1,1});
        ud{1,4} = audioplayer(ud{1,2},ud{1,3});
        info = mmfileinfo(ud{1,1});
        ud{1,5} = info.Duration;
        ud{1,5} = ud{1,5}/60;
        ud{1,6} = mod(ud{1,5},1)*60;
        ud{1,5} = floor(ud{1,5});
        ud{1,6} = floor(ud{1,6});
        set(track1,'string',sprintf('%s\n0:00 / %2.0f:%02.0f',ud{1,1},ud{1,5},ud{1,6}))
        ud{3,3} = 0;
        ud{3,4} = 0;
        stop(timer1)
        set(play1,'value',0)
        set(play1,'cdata',ud{2,4})
    end
    set(frameh,'userdata',ud)
end

function cb_menu2(hObject, eventdata, frameh, track2, play2, timer2)
    % Switch text
    ud = get(frameh, 'userdata');
    h = findobj('tag','list2');
    choice = get(h,'value');
    ud{3,8} = choice;
    delete(h)
    p = get(hObject,'value');
    browser2 = uicontrol('style','listbox','position',[900,225,100,250],'visible','off','tag','list2');
    set(browser2,'string',ud{2,1})
    if p == 1;
        set(hObject,'position',[870,225,31,250])
        set(hObject,'cdata',ud{2,9})
        set(browser2,'visible','on')
    else
        set(hObject,'position',[970,225,31,250])
        set(hObject,'cdata',ud{2,7})
        set(play2,'cdata',ud{2,12})
        pause(.1)
        list = ud{2,1};
        choice = list(choice);
        ud{1,7} = choice{1};
        [ud{1,8},ud{1,9}] = audioread(ud{1,7});
        ud{1,10} = audioplayer(ud{1,8},ud{1,9});
        info = mmfileinfo(ud{1,7});
        ud{1,11} = info.Duration;
        ud{1,11} = ud{1,11}/60;
        ud{1,12} = mod(ud{1,11},1)*60;
        ud{1,11} = floor(ud{1,11});
        ud{1,12} = floor(ud{1,12});
        set(track2,'string',sprintf('%s\n0:00 / %2.0f:%02.0f',ud{1,7},ud{1,11},ud{1,12}))
        ud{3,5} = 0;
        ud{3,6} = 0;
        stop(timer2)
        set(play2,'value',0)
        set(play2,'cdata',ud{2,4})
    end
    set(frameh,'userdata',ud)
end

function cb_shuffle1(hObject, eventdata, frameh)
    
    ud = get(frameh, 'userdata');
    
    % Switch icon
    v = get(hObject,'value');
    if v == 1;
        set(hObject,'cdata',ud{3,1})
        ud{3,9} = 1;
    else
        set(hObject,'cdata',ud{3,2})
        ud{3,9} = 0;
    end
    
    set(frameh,'userdata',ud)
end

function cb_shuffle2(hObject, eventdata, frameh)
  
    ud = get(frameh,'userdata');
    
    % Switch icon & set shuffle value
    v = get(hObject,'value');
    if v == 1;
        set(hObject,'cdata',ud{3,1})
        ud{3,10} = 1;
    else
        set(hObject,'cdata',ud{3,2})
        ud{3,10} = 0;
    end
    
    set(frameh,'userdata',ud)
end

function cb_loop1(hObject, eventdata, frameh)

    ud = get(frameh,'userdata');
    
    % Change icon
    v = get(hObject,'value');
    if v == 1;
        set(hObject,'cdata',ud{2,10})
        ud{3,11} = 1;
    else
        set(hObject,'cdata',ud{2,11})
        ud{3,11} = 0;
    end
    set(frameh,'userdata',ud)
end

function cb_loop2(hObject, eventdata, frameh)
    
    ud = get(frameh,'userdata');
    
    % Change icon
    v = get(hObject,'value');
    if v == 1;
        set(hObject,'cdata',ud{2,10})
        ud{3,12} = 1;
    else
        set(hObject,'cdata',ud{2,11})
        ud{3,12} = 0;
    end
    set(frameh, 'userdata', ud)
end

function cb_vol(hObject, eventdata)
    volume = get(hObject, 'value');
    SoundVolume(volume); % SoundVolume IS NOT MY CODE!
    ud{4,3} = volume;
end

function cb_timer1(hObject, eventdata, frameh,track1,play1)
    ud = get(frameh,'userdata');
    %<SM:ARRAY>
    ud{3,3} = ud{3,3} + 1;
    if ud{3,3} == 60;
        ud{3,3} = 0;
        ud{3,4} = ud{3,4} + 1;
    end
    if ud{3,3} == ud{1,6} && ud{3,4} == ud{1,5};
        set(track1,'string',sprintf('%s\n%2.0f:%02.0f / %2.0f:%02.0f',ud{1,1},ud{3,4},ud{3,3},ud{1,5},ud{1,6}))
        stop(hObject)
        pause(2)
        ud{3,3} = 0;
        ud{3,4} = 0;
        list = ud{2,1};
        p = 0;
        if ud{3,9} == 1;
            %<SM:RAND>
            choice = randi(length(ud{2,1}));
            p = 1;
        else
            choice = ud{3,7}+1;
            if ud{3,11} == 1 && choice > length(ud{2,1});
                choice = 1;
                p = 1;
            end
        end
        if choice > length(ud{2,1})
            pause(.75)
            set(play1,'cdata',ud{2,4})
            set(play1,'value',0)
            choice = length(ud{2,1});
        end
        ud{3,7} = choice;
        choice = list(choice);
        ud{1,1} = choice{1};
        ud{2,2} = choice;
        [ud{1,2},ud{1,3}] = audioread(ud{1,1});
        ud{1,4} = audioplayer(ud{1,2},ud{1,3});
        info = mmfileinfo(ud{1,1});
        ud{1,5} = info.Duration;
        ud{1,5} = ud{1,5}/60;
        ud{1,6} = mod(ud{1,5},1)*60;
        ud{1,5} = floor(ud{1,5});
        ud{1,6} = floor(ud{1,6});
        set(track1,'string',sprintf('%s\n0:00 / %2.0f:%02.0f',ud{1,1},ud{1,5},ud{1,6}))
        ud{3,3} = 0;
        ud{3,4} = 0;
        pause(.5)
        if p == 1;
            play(ud{1,4})
            start(hObject)
        end
    end
    set(frameh,'userdata',ud)
    set(track1,'string',sprintf('%s\n%2.0f:%02.0f / %2.0f:%02.0f',ud{1,1},ud{3,4},ud{3,3},ud{1,5},ud{1,6}))
end

function cb_timer2(hObject, eventdata,frameh,track2,play2)
    ud = get(frameh,'userdata');
    ud{3,5} = ud{3,5} + 1;
    if ud{3,5} == 60;
        ud{3,5} = 0;
        ud{3,6} = ud{3,6} + 1;
    end
    if ud{3,5} == ud{1,12} && ud{3,6} == ud{1,11};
        set(track2,'string',sprintf('%s\n%2.0f:%02.0f / %2.0f:%02.0f',ud{1,7},ud{3,6},ud{3,5},ud{1,11},ud{1,12}))
        stop(hObject)
        pause(1)
        ud{3,5} = 0;
        ud{3,6} = 0;
        list = ud{2,1};
        p = 0;
        if ud{3,10} == 1;
            choice = randi(length(ud{2,1}));
            p = 1;
        else
            choice = ud{3,8}+1;
            if ud{3,12} == 1 && choice > length(ud{2,1});
                choice = 1;
                p = 1;
            end
        end
        if choice > length(ud{2,1})
            pause(.75)
            set(play2,'cdata',ud{2,4})
            set(play2,'value',0)
            choice = length(ud{2,1});
        end
        ud{3,8} = choice;
        choice = list(choice);
        ud{1,7} = choice{1};
        ud{2,3} = choice;
        [ud{1,8},ud{1,9}] = audioread(ud{1,7});
        ud{1,10} = audioplayer(ud{1,8},ud{1,9});
        info = mmfileinfo(ud{1,7});
        ud{1,11} = info.Duration;
        ud{1,11} = ud{1,11}/60;
        ud{1,12} = mod(ud{1,11},1)*60;
        ud{1,11} = floor(ud{1,5});
        ud{1,12} = floor(ud{1,12});
        set(track2,'string',sprintf('%s\n0:00 / %2.0f:%02.0f',ud{1,7},ud{1,11},ud{1,12}))
        pause(.5)
        if p == 1;
            play(ud{1,10})
            start(hObject)
        end
    end
    set(frameh,'userdata',ud)
    set(track2,'string',sprintf('%s\n%2.0f:%02.0f / %2.0f:%02.0f',ud{1,7},ud{3,6},ud{3,5},ud{1,11},ud{1,12}))
end

function welcome1(hObject,eventdata,wtext,frameh,track1,play1,timer1,menu1,first)
    
    % Tutorial
    %<SM:UDUSE>
    ud = get(frameh,'userdata');
    n = get(menu1,'userdata');
    h = findobj('tag','h');
    b = findobj('tag','b');
    delete(wtext)
    delete(h)
    delete(b)
    wtext = uicontrol('style','text','fontsize',14,'backgroundcolor','r','tag','h');
    b = uicontrol('style','frame','backgroundcolor','k','position',[345,445,310,85],'tag','b');
    uistack(wtext,'top')

    %<SM:SWITCH>
    switch n
    case 1;
        set(wtext,'string','In order to play music, you must have the files saved in the same folder as this program')
        set(wtext,'position',[350,450,300,75])
    case 2;
        set(wtext,'string','<--- To begin, open the browser and choose a song');
        set(wtext,'position',[30,300,300,50])
        set(b,'position',[25,295,310,60])
        set(hObject,'position',[0,225,31,250],'string','','cdata',ud{2,6})
    case 3;
        set(hObject,'position',[100,225,31,250],'cdata',ud{2,8})
        set(wtext,'position',[105,300,300,50],'string','<-- Choose the song you''d like to play, then click ''close browser''')
        set(b,'position',[100,295,310,60])
        browser1 = uicontrol('style','listbox','position',[0,225,100,250],'tag','list1');
        set(browser1,'string',ud{2,1},'tag','browser1')
    case 4;
        browser1 = findobj('tag','browser1');
        choice = get(browser1,'value');
        delete(browser1)
        set(hObject,'visible','off')
        set(wtext,'position',[400,350,300,50],'string','<--- Now the song is loading onto the track')
        set(b,'position',[395,345,310,60])
        set(play1,'cdata',ud{2,12})
        pause(.1)
        list = ud{2,1};
        choice = list(choice);
        ud{1,1} = choice{1};
        [ud{1,2},ud{1,3}] = audioread(ud{1,1});
        ud{1,4} = audioplayer(ud{1,2},ud{1,3});
        info = mmfileinfo(ud{1,1});
        ud{1,5} = info.Duration;
        ud{1,5} = ud{1,5}/60;
        ud{1,6} = mod(ud{1,5},1)*60;
        ud{1,5} = floor(ud{1,5});
        ud{1,6} = floor(ud{1,6});
        %<SM:STRING>
        set(track1,'string',sprintf('%s\n0:00 / %2.0f:%02.0f',ud{1,1},ud{1,5},ud{1,6}))
        ud{3,3} = 0;
        ud{3,4} = 0;
        stop(timer1)
        set(play1,'value',0)
        set(play1,'cdata',ud{2,4})
        set(frameh,'userdata',ud)
        set(wtext,'position',[350,400,300,50],'string','Now you''re all ready to start! Just press play')
        set(b,'position',[345,395,310,60])
        set(hObject,'position',[210,311,150,150],'cdata',ud{2,4},'visible','on')
    case 5;
        resume(ud{1,4})
        set(hObject,'cdata',ud{2,5})
        start(timer1)
        set(play1,'value',1,'cdata',ud{2,5})
        h = findobj('tag','h');
        b = findobj('tag','b');
        first = 0;
        %<SM:WRITE>
        csvwrite('First Time.txt',first)
        delete(h)
        delete(b)
        delete(hObject)
    end
    %<SM:RTOTAL>
    n = n+1;
    set(menu1,'userdata',n)
end
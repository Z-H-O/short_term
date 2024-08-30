clc; clear; close all;%清屏，清工作区，关闭所有窗口

function  graph_show(x)
     figure('Name','graph');
    subplot(211);
    plot(x);
    xlabel('Time/s');ylabel('Amplitude');
    title('信号的波形');
    grid;
    subplot(212);
    plot(abs(fft(x)));
    xlabel('Frequency/Hz');
    ylabel('Amplitude');
    title('信号的频谱');
    grid;
end     

function music_play(y,fs)
    player=audioplayer(y,fs);
    play(player)
    graph_show(y);
    disp("按下任意键暂停并继续")
    waitforbuttonpress;
    pause(player);
end 
 
function main()
    wav_change_path="18 The Slopes of the Blessure.wav";
    mp3__change_path="海浪.mp3";
    ogg_change_path="海浪.ogg";
   
    hFig = uifigure;
    hText1 = uicontrol('Style', 'text', 'Parent', hFig, 'Position', [75 300 200 50], 'String', '大数据23周弘毅');
    hText2 = uicontrol('Style', 'text', 'Parent', hFig, 'Position', [75 275 200 50], 'String', '序号:163');
    hText3 = uicontrol('Style', 'text', 'Parent', hFig, 'Position', [75 250 200 50], 'String', '学号:23152090125');
    set(hText1, 'FontSize', 14, 'FontWeight', 'bold', 'ForegroundColor', 'blue');
    set(hText2, 'FontSize', 14, 'FontWeight', 'bold', 'ForegroundColor', 'blue');
    set(hText3, 'FontSize', 14, 'FontWeight', 'bold', 'ForegroundColor', 'blue');
    hButton = uibutton(hFig, 'push');
    set(hButton, 'Position', [275 200 100 50], 'Text', '继续', 'FontSize', 14, 'FontWeight', 'bold');
    set(hButton, 'ButtonPushedFcn', @(src, ~)buttonClicked(hFig));  % 设置按钮的回调函数

    % 按钮点击时执行的函数
    function buttonClicked(hFig)
        close(hFig)  % 使用 hFig 句柄关闭对应的图形窗口
    end
    uiwait(hFig); % 等待当前窗口关闭
   %%播开始音乐
    [start_y,start_fs]=audioread("champion.mp3");
    sound(start_y,start_fs);
    pause(8); % 播放音乐八秒
    %%选择文件
        [wav_y,wav_Fs] = audioread("海浪.wav");%读取wav文件
        [mp3_y,mp3_Fs]=audioread("18 The Slopes of the Blessure.mp3");%读取MP3
        disp("选择你要转换的文件")
        disp("1.海浪.wav")
        disp("2.18 The Slopes of the Blessure.mp3")
        a=input("请输入数字：");
        switch a
            case 1
                disp("选择你要转换的文件")
                disp("1.wav转成mp3")
                disp("2.wav转成ogg")
                b=input("请输入数字：");
                switch b
                    case 1
                        audiowrite(mp3__change_path,wav_y,wav_Fs);
                        disp("转换成功")
                         clear wav_y;
                         clear wav_Fs;
                         [y,fs]=audioread("海浪.mp3");
                         music_play(y,fs)
                    
                    case 2
                        audiowrite(ogg_change_path,wav_y,wav_Fs);
                        disp("转换成功")
                        clear wav_y;
                        clear wav_Fs;
                        [y,fs]=audioread("海浪.ogg");
                        music_play(y,fs)
                end
            case 2
                disp("选择你要转化的文件")
                disp("1.mp3转成wav")
                disp("2.mp3转成ogg")
                b=input('请输入数字：');
                switch b
                    case 1
                        audiowrite( wav_change_path,mp3_y,mp3_Fs);
                        disp("转换成功")
                        clear mp3_y;
                        clear mp3_Fs;
                        [y,fs]=audioread("18 The Slopes of the Blessure.mp3");
                        music_play(y,fs)
                    case 2
                        audiowrite("18 The Slopes of the Blessure.ogg",mp3_y,mp3_Fs);
                        disp("转换成功")
                        clear mp3_y;
                        clear mp3_Fs;
                        [y,fs]=audioread("18 The Slopes of the Blessure.ogg");
                        music_play(y,fs)
                end
        end
    %     hFig2=uifigure;
        
    %     hButton2 = uibutton(hFig2, 'push');
    %     set(hButton2, 'Position', [275 200 100 50], 'Text', '退出', 'FontSize', 14, 'FontWeight', 'bold');   
    %     set(hButton2, 'ButtonPushedFcn', @(src, ~)exitbuttonClick2());
    %  %设置按钮的回调函数
    %     function exitbuttonClick2()
    %         exit;
    %     end
    while true
        disp("请按Esc退出");
        waitforbuttonpress;
        key=get(gcf,'CurrentCharacter');
        if  uint8(key)==27
           exit;
        end
    end
    
    
end
 
main();
               






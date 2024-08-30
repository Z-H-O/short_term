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


function main()
    wav_change_path="D:\\小学期\\18 The Slopes of the Blessure.wav";
    mp3__change_path="D:\\小学期\\海浪.mp3";


    hFig = uifigure;
    hText1 = uicontrol('Style', 'text', 'Parent', hFig, 'Position', [75 300 200 50], 'String', '大数据23周弘毅');
    hText2 = uicontrol('Style', 'text', 'Parent', hFig, 'Position', [75 275 200 50], 'String', '学号：23152090125');
    set(hText1, 'FontSize', 14, 'FontWeight', 'bold', 'ForegroundColor', 'blue');
    set(hText2, 'FontSize', 14, 'FontWeight', 'bold', 'ForegroundColor', 'blue');
    hButton = uibutton(hFig, 'push');
    set(hButton, 'Position', [275 200 100 50], 'Text', '继续', 'FontSize', 14, 'FontWeight', 'bold');
    set(hButton, 'ButtonPushedFcn', @(src, ~)buttonClicked(hFig));  % 设置按钮的回调函数

    % 按钮点击时执行的函数
    function buttonClicked(hFig)
        close(hFig)  % 使用 hFig 句柄关闭对应的图形窗口
    end
    uiwait(hFig); % 等待当前窗口关闭
   
        [wav_y,wav_Fs] = audioread("海浪.wav");%读取wav文件
        [mp3_y,mp3_Fs]=audioread("18 The Slopes of the Blessure.mp3");%读取MP3
        disp("选择你要转化的文件")
        disp("1.wav转mp3")
        disp("2.mp3转wav")
        disp("3.wav转AAC")
        disp("4.mp3转AAC")
        a=input("请输入数字：");

        switch a
            case 1
                audiowrite(mp3__change_path,wav_y,wav_Fs);
                disp("wav转mp3成功");
                clear mp3_y;
                clear mp3_Fs;
                [mp3_y,mp3_Fs]=audioread(mp3__change_path);%读取MP3
                graph_show(mp3_y);
                music_dynamic_show(mp3_y,mp3_Fs);
                
            case 2
                audiowrite(wav_change_path,mp3_y,mp3_Fs);
                disp("mp3转wav成功");
                clear wav_y;
                clear wav_Fs;
                [wav_y,wav_Fs] = audioread(wav_change_path);%读取wav文件
                graph_show(wav_y);
                music_dynamic_show(wav_y,wav_Fs);
                
            case 3
                disp("wav转AAC功能暂未开放");
            case 4
                disp("mp3转AAC功能暂未开放");

        end
        disp("请按Esc退出");
        pause(0.00001);
        key=get(gcf,'CurrentCharacter');
        if  uint8(key)==27
           close all
        end
end
    main();






clc; clear; close all;%清屏，清工作区，关闭所有窗口

function  graph_show(x)
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

function music_dynamic_show(data,fs)
    sound(data,fs);%播放wav文件
    figure('Name', 'The Chainsmokers - See You Again');
    subplot(121)
    axis off
    for i = 1:floor(fs/75):length(data)
        if i+0.1*fs<length(data)
            X = data(i:floor(i+0.1*fs),1);  
        else 
            break
        end
        L = length(X);
        Y = fft(X); %Y为复数
        P1 = abs(Y/L); %取模
        freq1 = fs*(0:L-1)/L; %频域范围

        P3 = P1(1:floor(L/2)+1);  %索引必须从1开始
        freq3 = fs*(0:floor(L/2))/L;

        nbins = 256; %将频域波分nbins份
        window = floor(length(freq3)/nbins);
        %平滑数据
        P4 = smooth(P3, window);
        P5 = P4(1:window:end);
        freq4 = freq3(1:window:end); 
        subplot(122)
        bar3(freq4,P5);
        view(290,45)
        axis off
        drawnow
   end

end

wav_change_path="D:\\小学期\\18 The Slopes of the Blessure.wav";
mp3__change_path="D:\\小学期\\海浪.mp3";

while true
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
            graph_show(mp3_y);%播放mp3文件
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
        break;
    end
end
   






clc; clear; close all;%清屏，清工作区，关闭所有窗口

wav_change_path="D:\\小学期\\18 The Slopes of the Blessure.wav";
mp3__change_path="D:\\小学期\\海浪.mp3";

[wav_y,wav_Fs] = audioread("海浪.wav");%读取wav文件
[mp3_y,mp3_Fs]=audioread("18 The Slopes of the Blessure.mp3");%读取MP3

%实现mp3转wav%%%%%%%%%%%%%%%%
audiowrite(wav_change_path,mp3_y,mp3_Fs);
%实现wav转mp3%%%%%%%%%%%%%%%%
audiowrite(mp3__change_path,wav_y,wav_Fs);

sound(wav_y,wav_Fs);%播放wav文件
sound(mp3_y,mp3_Fs);%播放mp3文件



clc; clear; close all;%�������幤�������ر����д���

wav_change_path="D:\\Сѧ��\\18 The Slopes of the Blessure.wav";
mp3__change_path="D:\\Сѧ��\\����.mp3";

[wav_y,wav_Fs] = audioread("����.wav");%��ȡwav�ļ�
[mp3_y,mp3_Fs]=audioread("18 The Slopes of the Blessure.mp3");%��ȡMP3

%ʵ��mp3תwav%%%%%%%%%%%%%%%%
audiowrite(wav_change_path,mp3_y,mp3_Fs);
%ʵ��wavתmp3%%%%%%%%%%%%%%%%
audiowrite(mp3__change_path,wav_y,wav_Fs);

sound(wav_y,wav_Fs);%����wav�ļ�
sound(mp3_y,mp3_Fs);%����mp3�ļ�



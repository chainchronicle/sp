clc; 
clear all; 
close all;
d=csvread('CO2.csv');
%t=linspace(0,2*pi,300); % ����t��Χ
t=d(:,1);
s1=d(:,2); %3*sin(2*t+10)+randn(1,length(t)); % �ź���s1, ��������

subplot(2,1,1); % ����һ�У���ͼ
plot(t, s1); % ��ʾs1
xlabel('ʱ��t');
ylabel('�ź���s1');
title('ͼ1���������ź���s1��ԭͼ');
grid on;


% ����Ҷ�任
% function [g] = FFTPF1D (X,binsize, f, P)
% Discrete Fourier Transform Low/High Pass Filter.
% This is a simply implement of such a filter for a given 1-D data.
% X: the array of you data, each data point is a bin of signal 
% binsize: the bin size in your data data
% f: the cutoff of wave length, 
% P: 1, or 0, true or false : true, low pass, which eliminating higher
% than f frequence signals, false, high pass, which eliminating lower
% than f frequence signals. 
% It could be easily modified into 2-D version, or translated into 
% R/S-language.
% Example:
% a=1:2:1000;
% b=sin(a) + sin(2.*a) + sin(0.1 .* a) + ...
% c=FFTPF1D(b, 2, 10, 1)

%{
function [g] = FFTPF1D(X, binsize, f, P)

    M=length(X);
    f = f / binsize;
    xidx=1:1:M;
    fftref = abs(ffs(sin(xidx .* 2 .* pi ./ f)));
    bounder = find( (max(fftref) - fftref) < (max(fftref) ./ 1000) );
    % filter
    fftx = fft(X)
    if (P)
        fftx(bounder(1):1:bounder(2))=0;
    else
        fftx(1:1:bounder(1)) = 0;
        fftx(bounder(2):1:M) = 0;
    end
    
    g = real(ifft(fftx));
    
end
%}

x=d(:,1);
y=d(:,2);
y2 = FFTPF1D(y, 2, 50, 1);
% print
hold on;
subplot(2,1,2);
plot(x, y2);
xlabel('ʱ��t');
ylabel('�ź���s2');
title('ͼ2������Ҷ�任');
grid on;
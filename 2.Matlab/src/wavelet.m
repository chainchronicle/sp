clc; 
clear all; 
close all;
% format long;
% cd('data');
raw_date = csvread('raw.csv');

x = raw_date(:,1);  % ʱ�� 50Hz
y = raw_date(:,2);  % �ź��� s1, ��������

% print
subplot(4,1,1); % ����һ�У���ͼ
plot(x, y); % ��ʾs1
%xlabel('ʱ��t');
%ylabel('�ź���s1');
%title('ͼ1���������ź���s1��ͼ');
grid on;

% ==========================================
% С���任
truesignal = y;
sn = 20;
truesignalN = awgn(truesignal, sn, 'measured');

level = 3;
wt = 'db13'; % 'db13' |'db40'|'sym13' |'sym21'
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wt);
[C,L] = wavedec(truesignalN,level,Lo_D,Hi_D);
cA3 = appcoef(C,L,wt,level); 
[cD1,cD2,cD3] = detcoef(C,L,[1,2,3]);
A3 = wrcoef('a',C,L,Lo_R,Hi_R,level);
D1 = wrcoef('d',C,L,Lo_R,Hi_R,1);
D2 = wrcoef('d',C,L,Lo_R,Hi_R,2);
D3 = wrcoef('d',C,L,Lo_R,Hi_R,3);

tptr = 'sqtwolog'; % 'heursure' | 'rigrsure' | 'minimaxi' | 'sqtwolog' 
thr_D1 = thselect(D1,tptr);
thr_D2 = thselect(D2,tptr);
thr_D3 = thselect(D3,tptr);
sorh = 's';  % 's' | 'h'
tD1 = wthresh(D1,sorh,thr_D1);
tD2 = wthresh(D2,sorh,thr_D2);
tD3 = wthresh(D3,sorh,thr_D3);
denoised = A3 + tD1 + tD2 + tD3;
err = max(abs(truesignalN-denoised));

%SNR = snr(truesignal,truesignalN);
%NoisySNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-truesignalN(:)) );
%SNR = snr(truesignal,denoised);
%DenoisedSNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-denoised(:)) );

% print
hold on;
subplot(4,1,2);
plot(x, denoised);
%xlabel('ʱ��t');
%ylabel('�ź���s2');
%title('ͼ2��С���任');
grid on;



% ==========================================
% С���任
truesignal = y;
sn = 20;
truesignalN = awgn(truesignal, sn, 'measured');

level = 5;
wt = 'db13'; % 'db13' |'db40'|'sym13' |'sym21'
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wt);
[C,L] = wavedec(truesignalN,level,Lo_D,Hi_D);
cA3 = appcoef(C,L,wt,level); 
[cD1,cD2,cD3] = detcoef(C,L,[1,2,3]);
A3 = wrcoef('a',C,L,Lo_R,Hi_R,level);
D1 = wrcoef('d',C,L,Lo_R,Hi_R,1);
D2 = wrcoef('d',C,L,Lo_R,Hi_R,2);
D3 = wrcoef('d',C,L,Lo_R,Hi_R,3);

tptr = 'sqtwolog'; % 'heursure' | 'rigrsure' | 'minimaxi' | 'sqtwolog' 
thr_D1 = thselect(D1,tptr);
thr_D2 = thselect(D2,tptr);
thr_D3 = thselect(D3,tptr);
sorh = 's';  % 's' | 'h'
tD1 = wthresh(D1,sorh,thr_D1);
tD2 = wthresh(D2,sorh,thr_D2);
tD3 = wthresh(D3,sorh,thr_D3);
denoised = A3 + tD1 + tD2 + tD3;
err = max(abs(truesignalN-denoised));

%SNR = snr(truesignal,truesignalN);
%NoisySNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-truesignalN(:)) );
%SNR = snr(truesignal,denoised);
%DenoisedSNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-denoised(:)) );

% print
hold on;
subplot(4,1,3);
plot(x, denoised);
%xlabel('ʱ��t');
%ylabel('�ź���s3');
%title('ͼ3��С���任');
grid on;



% ==========================================
% С���任
truesignal = y;
sn = 20;
truesignalN = awgn(truesignal, sn, 'measured');

level = 7;
wt = 'db13'; % 'db13' |'db40'|'sym13' |'sym21'
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wt);
[C,L] = wavedec(truesignalN,level,Lo_D,Hi_D);
cA3 = appcoef(C,L,wt,level); 
[cD1,cD2,cD3] = detcoef(C,L,[1,2,3]);
A3 = wrcoef('a',C,L,Lo_R,Hi_R,level);
D1 = wrcoef('d',C,L,Lo_R,Hi_R,1);
D2 = wrcoef('d',C,L,Lo_R,Hi_R,2);
D3 = wrcoef('d',C,L,Lo_R,Hi_R,3);

tptr = 'sqtwolog'; % 'heursure' | 'rigrsure' | 'minimaxi' | 'sqtwolog' 
thr_D1 = thselect(D1,tptr);
thr_D2 = thselect(D2,tptr);
thr_D3 = thselect(D3,tptr);
sorh = 's';  % 's' | 'h'
tD1 = wthresh(D1,sorh,thr_D1);
tD2 = wthresh(D2,sorh,thr_D2);
tD3 = wthresh(D3,sorh,thr_D3);
denoised = A3 + tD1 + tD2 + tD3;
err = max(abs(truesignalN-denoised));

%SNR = snr(truesignal,truesignalN);
%NoisySNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-truesignalN(:)) );
%SNR = snr(truesignal,denoised);
%DenoisedSNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-denoised(:)) );

% print
hold on;
subplot(4,1,4);
plot(x, denoised);
%xlabel('ʱ��t');
%ylabel('�ź���s3');
%title('ͼ3��С���任');
grid on;

% output
res(:,1) = x;
res(:,2) = denoised;
%%dlmwrite('wavlet-result-lv5.csv', res, 'precision', '%.5f', 'delimiter', ',')
% csvwrite('wavlet-result.csv', res);
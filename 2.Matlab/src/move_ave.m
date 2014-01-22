clc; 
clear all; 
close all;
d=csvread('raw.csv');

t=d(:,1);
s1=d(:,2); %3*sin(2*t+10)+randn(1,length(t)); % �ź���s1, ��������

subplot(4,1,1); % ����һ�У���ͼ
plot(t, s1); % ��ʾs1
%xlabel('ʱ��t');
%ylabel('�ź���s1');
%title('ͼ1���������ź���s1��ԭͼ');
grid on;

% -------------------------------------ƽ��5��
len = 10; %input('��������������len��');
for idx=1:length(t)-len+1
    index=idx:idx+len-1;
    average=sum(s1(index))/len;
    s2(idx)=average;
end
subplot(4,1,2);
plot(t(1:length(t)-len+1),s2);
%xlabel('ʱ��t');
%ylabel('�ź���s2');
%title('ͼ2���ƶ�ƽ���������ź���s2��ƽ������=5��');
grid on;

% -------------------------------------ƽ��10��
len = 50; %input('��������������len��');
for idx=1:length(t)-len+1
    index=idx:idx+len-1;
    average=sum(s1(index))/len;
    s3(idx)=average;
end
subplot(4,1,3);
plot(t(1:length(t)-len+1),s3);
%xlabel('ʱ��t');
%ylabel('�ź���s3');
%title('ͼ3���ƶ�ƽ���������ź���s3��ƽ������=10��');
grid on;

% -------------------------------------ƽ��50��
len = round(length(t)/10)-1; %input('��������������len��');
for idx=1:length(t)-len+1
    index=idx:idx+len-1;
    average=sum(s1(index))/len;
    s4(idx)=average;
end
subplot(4,1,4);
plot(t(1:length(t)-len+1),s4);
%xlabel('ʱ��t');
%ylabel('�ź���s4');
%title('ͼ4���ƶ�ƽ���������ź���s4��ƽ������=50��');
grid on;
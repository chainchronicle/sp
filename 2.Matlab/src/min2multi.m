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

% ��С���˷��������
x = d(:,1);
y = d(:,2);
p85 = polyfit(x, y, 85);
y2 = polyval(p85, x);
r = sum((y-y2).^2) % ���ƽ����

hold on;
subplot(2,1,2);
plot(x, y2);
xlabel('ʱ��t');
ylabel('�ź���s2');
title('ͼ2����С���˷��������');
grid on;
clc; 
clear all; 
close all;
% cd('data');
d=csvread('raw.csv');

t=d(:,1);
s1=d(:,2); %3*sin(2*t+10)+randn(1,length(t)); % �ź���s1, ��������

subplot(4,1,1); % ����һ�У���ͼ
plot(t, s1); % ��ʾs1
%xlabel('ʱ��t');
%ylabel('�ź���s1');
%title('ͼ1���������ź���s1��ԭͼ');
grid on;

% ========��С���˷��������
x = d(:,1);
y = d(:,2);
p2 = polyfit(x, y, 2);
y2 = polyval(p2, x, 2);
r2 = sum((y-y2).^2); % ���ƽ����

hold on;
subplot(4,1,2);
plot(x, y2);
%xlabel('ʱ��t');
%ylabel('�ź���s2');
%title('ͼ2����С���˷��������');
grid on;


% ========��С���˷��������
x = d(:,1);
y = d(:,2);
p20 = polyfit(x, y, 20);
y3 = polyval(p20, x, 2);
r3 = sum((y-y3).^2); % ���ƽ����

hold on;
subplot(4,1,3);
plot(x, y3);
%xlabel('ʱ��t');
%ylabel('�ź���s2');
%title('ͼ2����С���˷��������');
grid on;


% ========��С���˷��������
x = d(:,1);
y = d(:,2);
p70 = polyfit(x, y, 70);
y4 = polyval(p70, x, 2);
r4 = sum((y-y4).^2); % ���ƽ����

hold on;
subplot(4,1,4);
plot(x, y4);
%xlabel('ʱ��t');
%ylabel('�ź���s2');
%title('ͼ2����С���˷��������');
grid on;
%ͼ���˹ƽ���˲�����
%filename:�ļ���
%d0:��ֹƵ��
%t:����ȡֵ
%low_or_high:��ͨ/��ͨ
%filtertype:�˲�����

function my_filter(filename,d0,t,low_or_high,filtertype)
img=imread(filename);
info = imfinfo(filename);
% ����ǲ�ɫͼ��ת���ɻҶ�ͼ����
if(strcmp( 'grayscale', info.ColorType)~=1)
    f = rgb2gray(img);
else f = img;
end
subplot(1,2,1);imshow(f);
f=double(f);
%������Ҷ�任
f=fft2(f);
f=fftshift(f);
[m,n]=size(f); 
%���ú������˲�����
h=H_type(d0,t,low_or_high,filtertype,m,n);
%�����˲� ����
g=f.*h;
g=ifftshift(g);
%�ع�ͼ��
g=ifft2(g);
g=mat2gray(real(g)); 
subplot(1,2,2);imshow(g);
imwrite(g,'gauss_result.jpg');

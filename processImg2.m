function [X,Y]=processImg2()
%% ���������Ƭ
% clear;clc;
listing = dir('d:\Coding\Matlab\SVM\onfire\*.jpg');
Dir1='d:\Coding\Matlab\SVM\onfire\';
[onfireNum tmp]=size(listing);
X1=zeros(onfireNum,2);
Y1=ones(onfireNum,1);
fprintf('\nProcessing images\n');
dots=0;
for i = 1:onfireNum
    imgName = listing(i).name;
    imgData = imread([Dir1 imgName]);
    [X1(i,1),X1(i,2)]=calRatio(imgData);
    % ����
%     b = rgb2gray(imgData);
%     imgData = (b, graythresh(b));
    % �洢
%     imshow(imgData);
%     print -djpeg 2;
    
%     newName=sprintf('onfire%d.jpg', i);  % �����ַ���
%     imwrite(imgData,['d:\Coding\Matlab\SVM\onfire\', newName]); %���Ϊr:i.jpg
    fprintf('.');
    dots = dots + 1;
    if dots > 78
        dots = 0;
        fprintf('\n');
    end
%     pause
end

%% ����ɭ����Ƭ
listing = dir('d:\Coding\Matlab\SVM\forest\*.jpg');
Dir2='d:\Coding\Matlab\SVM\forest\';
[forestNum tmp]=size(listing);
X2=zeros(forestNum,2);
Y2=zeros(forestNum,1);
for i = 1:forestNum
    imgName = listing(i).name;
    imgData = imread([Dir2 imgName]);
    [X2(i,1),X2(i,2)]=calRatio(imgData);
    
    fprintf('.');
    dots = dots + 1;
    if dots > 78
        dots = 0;
        fprintf('\n');
    end
%     pause
end
fprintf('\n');
X=[X1;X2];
Y=[Y1;Y2];
%% ����ɢ��ͼ
scatter(X1(:,1),X1(:,2),'r*');
hold on
scatter(X2(:,1),X2(:,2),'go');
xlabel('red');
ylabel('green');


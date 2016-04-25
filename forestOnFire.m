%% SVM������
clear;clc;
%% ��ͼƬ���д���
% X�洢ͼ�����ݣ�ÿһ��Ϊһ��ͼ,��ͬ���д���ͬ��feature��YΪ��Ӧ��0��1��1Ϊonfire
% matlabpool local 4
tic
%processImg�����Ѿ���X��Y���ݱ�����svmdata���ˣ�ֱ��load svmdata��ȡ���ݣ�����Ҫÿ�����¼���X��Y
% [X,Y]=processImg();
load svmdata
%% SVM using linear kernel

[C1, sigma1] = optParams(X,Y,'linearKernel');
[avgaccuracy1,avgoriginal1]=crossValidation(X,Y,7,'linearKernel',C1,sigma1);
fprintf('SVM model original data fitting precision using linear kernel: %2.2f%%\n',avgoriginal1*100);
fprintf('SVM model prediction precision using linear kernel: %2.2f%%\n',avgaccuracy1*100);

% figure(2)
% visualizeBoundaryLinear(X, Y, model);%size(X,1)=2, 2 feature

%% SVM using gaussian kernel
[C2, sigma2] = optParams(X,Y,'gaussianKernel');
[avgaccuracy2,avgoriginal2]=crossValidation(X,Y,7,'gaussianKernel',C2,sigma2);
fprintf('SVM model original data fitting precision using gaussian kernel: %2.2f%%\n',avgoriginal2*100);
fprintf('SVM model prediction precision using gaussian kernel: %2.2f%%\n',avgaccuracy2*100);

% figure(3)
% visualizeBoundary(X, Y, model);%size(X,1)=2, 2 feature


toc
% matlabpool close
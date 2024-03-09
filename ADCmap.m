%DWIのADCmapを測定する

%lowbのDWI画像とhighbのDWI画像を取得する
lowbimg = dicomread('DWI＿b0');
highbimg = dicomread('DWI＿b1000');

figure(1);
imagesc(lowbimg);
colormap('gray');
title('b0');
axis image;

figure(2);
imagesc(highbimg);
colormap('gray');
title('b1000');
axis image;

%2枚の画像からADCmapを作成する
a = (double(highbimg))./(double(lowbimg));
figure(3);
imagesc(a);
colormap('gray');
axis image;

%logはdouble型(もしくはsingle型)が入力引数
b = log(a);
figure(4);
imagesc(b);
colormap('gray');
axis image;

ADC = -b/1000;
%ADC_1000000 = ADC * 1000000;
figure(5);
imagesc(ADC);
colormap('gray');
title('ADCmap');
axis image;
colorbar;
caxis([0,0.0018]);
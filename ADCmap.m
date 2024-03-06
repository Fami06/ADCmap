%DWIのADCmapを測定する

%lowbのDWI画像とhighbのDWI画像を取得する
lowbimg = dicomread('DWI＿b0.DCM');
highbimg = dicomread('DWI＿b1000.DCM');

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
a = lowbimg./highbimg;
figure(3);
imagesc(a);
colormap('gray');
axis image;

%logはsingle、もしくはdouble型が入力引数なので
b = log(double(a));
figure(4);
imagesc(b);
colormap('gray');
axis image;

ADC = b/1000;
figure(5);
imagesc(ADC);
colormap('gray');
title('ADCmap');
axis image;
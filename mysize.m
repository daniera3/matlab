function nowsize = mysize(img)
clc;
maskedRGBImage=SimpleColorDetectionByHue();
I=imread(img);
I=imresize(I,[280 280]);
im1=rgb2gray(maskedRGBImage);
im1 = imadjust (im1);
im1 = adapthisteq (im1);
imshow(I);
bw = im1 > 20;
stats = regionprops('table',bw,'all');
[r,~]=size(stats);
if r==0
im1=rgb2gray(I);
im1 = imadjust (im1);
im1 = adapthisteq (im1);
bw = im1 < 140;
stats = regionprops('table',bw,'all');
[r,~]=size(stats); 
end
i=1;
while i<=r
    a4=table2struct(stats(i,12));
    [m,n]=size(a4.Image);
    if (m*n==table2array(stats(i,11))||m*n==1||table2array(stats(i,1))<620)
        stats(i,:) = [];
        r=r-1;
        i=i-1;
    end
    i=i+1;
end
[r,~]=size(stats);
nowsize=0;
if(r>1)
for i=1:r
    temp=table2array(stats(i,17));
    if(nowsize<temp)
        nowsize= temp;
    end
end
elseif(r==1)
    nowsize=table2array(stats(1,17));
else
    message = sprintf('sorry no find fruit');
    questdlg(message, 'pass', 'OK', 'OK');
    return;
end

centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
hold on
viscircles(centers,radii);
hold off
end
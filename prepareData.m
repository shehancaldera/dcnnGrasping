%Reads in raw image files from Cornell Grasps Dataset and converts them to
%YCbCr color space and replace their Y channel information with depth
%values normalized in 0:255. Store the new image files in the subdirectory of .../processedImages
%Referred from the work of Ian Lenz and Kevin Lai.
%Set labels as the range of the scenes.
%Author: Shehan Caldera

addpath tools

%Scene data directory and scene instances
dataDir='D:\Cornell Grasps Dataset';
minRange = 100;
maxRange = 949;

newDir = sprintf('%s/processedImages',dataDir);
mkdir(newDir);

writeImages = false;

if writeImages
    for fileNum=minRange:maxRange
    
    pcdFile = sprintf('%s/pcd%04d.txt',dataDir,fileNum);
    imFile = sprintf('%s/pcd%04dr.png',dataDir,fileNum);

    [points, imPoints] = readGraspingPcd(pcdFile);

    I = double(imread(imFile));
    D = zeros(size(I,2),size(I,1));
    D(imPoints) = points(:,3);

    ycbcrImg =rgb2ycbcr(I);
    D = (D-min(D))./max(D)*255;
    ycbcrImg(:,:,1) = D';
    
    imwrite(ycbcrImg,sprintf('%s/pcd%04dr.png',newDir,fileNum));
    end
end

%Processed Data
sceneLabels = minRange:maxRange;
processedImageDir = newDir;

%build_cgd.m Builds the Cornell Grasping Data along with their grasp
%rectangles. Points to the data directory, prepares the rectangle vector
%and converts to grasp parameters (x,y,h,w,theta)
%Author: Shehan Caldera

imgDir = 'D:\Cornell Grasps Dataset\processedImages';
bboxDir = 'D:\Cornell Grasps Dataset';
minInstance = 100;
maxInstance = 949;

%Image files
%train_images = imageDatastore(imgDir);
train_images = zeros(480,640,3,850);
j=1;
for i=100:949
    imFile = sprintf('%s/pcd%04dr.png',imgDir,i);
    im = double(imread(imFile));
    
    train_images(:,:,:,j) = im;
end

%Bounding Boxes
bboxes = zeros(850,8);
i=1;
for instanceNum = minInstance:maxInstance
graspFile = sprintf('%s/pcd%04dcpos.txt',bboxDir,instanceNum);
grasp = dlmread(graspFile);

bboxes(i,1) = grasp(1,1);
bboxes(i,2) = grasp(1,2);
bboxes(i,3) = grasp(2,1);
bboxes(i,4) = grasp(2,2);
bboxes(i,5) = grasp(3,1);
bboxes(i,6) = grasp(3,2);
bboxes(i,7) = grasp(4,1);
bboxes(i,8) = grasp(4,2);
i = i+1;
end

%Grasp Rectangles (x, y, h, w, theta)
train_grasps = zeros(850,5);
for i=1:850
    train_grasps(i,1)=bboxes(i,1);
    train_grasps(i,2)=bboxes(i,2);
    train_grasps(i,3)=sqrt((bboxes(i,8)-bboxes(i,2))^2+(bboxes(i,7)-bboxes(i,1))^2);
    train_grasps(i,4)=sqrt((bboxes(i,4)-bboxes(i,2))^2+(bboxes(i,3)-bboxes(i,1))^2);
    train_grasps(i,5)=atand((bboxes(i,6)-bboxes(i,4))./(bboxes(i,5)-bboxes(i,3)));
end

%img = readimage(images,2);

%Result: Data for the training -> train_images, train_grasps


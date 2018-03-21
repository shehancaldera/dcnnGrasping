%Test the bboxes_grasps and grasp_bbox functions
%Author:Shehan Caldera

dir = 'D:\Cornell Grasps Dataset';
instanceNum = 831;
bboxFile = sprintf('%s/pcd%04dcpos.txt',dir,instanceNum);
bbox_mat = dlmread(bboxFile);
bbox=bbox_mat(1:4,:);

[x,y,h,w,tan] = bboxes_to_grasps(bbox);
calculated_bbox = grasps_to_bbox(x,y,h,w,tan);

img = sprintf('%s/pcd%04dr.png',dir,instanceNum);

disp(bbox)
disp(calculated_bbox)

bbox(5,:)=bbox(1,:);
calculated_bbox(5,:)=calculated_bbox(1,:);

figure
imshow(img);
hold on
line(bbox(:,1),bbox(:,2),'Color','Blue');
line(calculated_bbox(:,1),calculated_bbox(:,2),'Color','Red','LineStyle','-.');
hold off
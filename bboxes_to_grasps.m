%Reads in positive ground truths for valid grasps and converts them to
%grasp data: x,y,h,w,tan(theta)
%Author; Shehan Caldera

function [x,y,h,w,tan] = bboxes_to_grasps(bbox)
tan = (bbox(4,2)-bbox(1,2))/(bbox(4,1)-bbox(1,1));
x = sum(bbox(:,1))/4;
y = sum(bbox(:,2))/4;
h = sqrt((bbox(2,1)-bbox(1,1)).^2+(bbox(2,2)-bbox(1,2)).^2);
w = sqrt((bbox(4,1)-bbox(1,1)).^2+(bbox(4,2)-bbox(1,2)).^2);
end

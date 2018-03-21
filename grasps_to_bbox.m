%Converts a given a oriented rectangle data: x,y,h,w,tan(theta) to bounding
%boxes
%Author: Shehan Caldera

function bbox = grasps_to_bbox(x,y,h,w,tan)
theta = atan(tan);
bbox(1,:)=[x+((-w/2)*cos(theta))-((-h/2)*sin(theta)) y+((-h/2)*cos(theta))+((-w/2)*sin(theta))];
bbox(2,:)=[x+((-w/2)*cos(theta))-((h/2)*sin(theta)) y+((h/2)*cos(theta))+((-w/2)*sin(theta))];
bbox(3,:)=[x+((w/2)*cos(theta))-((h/2)*sin(theta)) y+((h/2)*cos(theta))+((w/2)*sin(theta))];
bbox(4,:)=[x+((w/2)*cos(theta))-((-h/2)*sin(theta)) y+((-h/2)*cos(theta))+((w/2)*sin(theta))];
end
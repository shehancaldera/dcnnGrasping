%Returns all of the ground truth grasps for the predicted scene
%Author: Shehan Caldera

function grasp = findGrasp(instanceNum, dataDir)

graspFile = sprintf('%s/pcd%04dcpos.txt',dataDir,instanceNum);
grasp = dlmread(graspFile);

grasp = grasp(1:4,1:2);
grasp(5,:) = grasp(1,:);

end
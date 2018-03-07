layers = [ ...
    imageInputLayer([480 640 3])
    convolution2dLayer(12,25)
    reluLayer
    fullyConnectedLayer(5)
    regressionLayer];

options = trainingOptions('sgdm','InitialLearnRate',0.001, ...
    'MaxEpochs',50);

net = trainNetwork(train_images,train_grasps,layers,options)

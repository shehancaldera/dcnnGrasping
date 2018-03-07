layers = [ ...
    imageInputLayer([224 224 3])
    convolution2dLayer(12,25)
    reluLayer
    fullyConnectedLayer(5)
    regressionLayer];

options = trainingOptions('sgdm','InitialLearnRate',0.001, ...
    'MaxEpochs',2, 'MiniBatchSize',4);

net = trainNetwork(train_data,layers,options)

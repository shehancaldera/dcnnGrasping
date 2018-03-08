deepnet = googlenet;
layersTransfer = deepnet.Layers(1:end-3);
layers = [
    %imageInputLayer([224 224 3])
    layersTransfer
    fullyConnectedLayer(5)
    regressionLayer];


options = trainingOptions('sgdm','InitialLearnRate',0.001, ...
    'MaxEpochs',2, 'MiniBatchSize',4);

trained_net = trainNetwork(train_data,layers,options)

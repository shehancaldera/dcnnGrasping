deepnet = googlenet;
layersTransfer = deepnet.Layers(1:end-3);
layers = [
    %imageInputLayer([224 224 3])
    layersTransfer
    fullyConnectedLayer(5)
    regressionLayer];

nnet = [
    imageInputLayer([224 224 3])
    %conv2d-1: filterSize(5x5), num. filters/ channels/ depth of next layer, and
    %so on explained by name values
    convolution2dLayer([5 5], 64, 'Stride',[2 2], 'Padding', 'same')
    reluLayer
    maxPooling2dLayer([2 2])
    %=======================
    
    %conv2d-2: filterSize(3x3), num. filters/ channels/ depth of next layer, and
    %so on explained by name values
    convolution2dLayer([3 3], 128, 'Stride',[2 2], 'Padding', 'same')
    reluLayer
    maxPooling2dLayer([2 2])
    %=======================
    
    %conv2d-3: filterSize(3x3), num. filters/ channels/ depth of next layer, and
    %so on explained by name values, No Max Pooling
    convolution2dLayer([3 3], 128, 'Stride',[2 2], 'Padding', 'same')
    reluLayer
    %=======================
    
    %conv2d-4: filterSize(3x3), num. filters/ channels/ depth of next layer, and
    %so on explained by name values, No Max Pooling
    convolution2dLayer([3 3], 128, 'Stride',[2 2], 'Padding', 'same')
    reluLayer
    %=======================
    
    %conv2d-5: filterSize(3x3), num. filters/ channels/ depth of next layer, and
    %so on explained by name values, 2x2 Max Pooling
    convolution2dLayer([3 3], 256, 'Stride',[1 1], 'Padding', 'same')
    reluLayer
    maxPooling2dLayer([2 2])
    %=======================
    
    %fc-1: 512x1
    reluLayer
    fullyConnectedLayer(512)
    %=======================
    
    %fc-2: 512x1
    reluLayer
    fullyConnectedLayer(512)
    %=======================
    
    %output
    fullyConnectedLayer(5)
    outputLayer
    %=======================
    ];
    


options = trainingOptions('sgdm','InitialLearnRate',0.001, ...
    'MaxEpochs',2, 'MiniBatchSize',4);

trained_net = trainNetwork(train_data,nnet,options)

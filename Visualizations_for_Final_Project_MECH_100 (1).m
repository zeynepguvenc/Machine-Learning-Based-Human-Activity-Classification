% Please run the code for each graph seperately. The computer may not
% generate all graphs at the same time.
XTrain
X = XTrain{1}(1,:);
classes = categories(YTrain{1});

figure
for j = 1:numel(classes)
    label = classes(j);
    idx = find(YTrain{1} == label);
    hold on
    plot(idx,X(idx))
end
hold off

xlabel("Time Step")
ylabel("Acceleration")
title("Training Sequence 1, Feature 1")
legend(classes,'Location','northwest')
% The code until now helps us to visualize our training data
%----------------------------------------------------------------
% The next code trains the algorithm with the given training data

numFeatures = 3;
numHiddenUnits = 200;
numClasses = 3;

layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits,'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',60, ...
    'GradientThreshold',2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
%----------------------------------------------------------------
% This part shows the accelerations of the sequences for the test data


figure
plot(XTest{1}')
xlabel("Time Step")
legend("Feature " + (1:numFeatures))
title("Test Data")

%----------------------------------------------------------------
% This part makes the predictions, and shows us the accuracy of the model
% as a graph and as a numerical value (acc)

YPred = classify(net,XTest{1});
acc = sum(YPred == YTest{1})./numel(YTest{1})
figure
plot(YPred,'.-')
hold on
plot(YTest{1})
hold off

xlabel("Time Step")
ylabel("Activity")
title("Predicted Activities")
legend(["Predicted" "Test Data"])

%----------------------------------------------------------------

%rng default
%[Xtrain, Ytrain] = cancer_dates;
%YTrain(:,1:10)

%net = trainNetwork(XTrain,YTrain,layers,options);

%YPredicted = net(XTest);
%YPredicted(:,1,10)
% In above part we occured some problems we cannot exacuted the code, we
% solve this issue by writing new shorter code.
C= confusionmat(YPred,YTest1)
plotconfusion(YPred,YTest1)


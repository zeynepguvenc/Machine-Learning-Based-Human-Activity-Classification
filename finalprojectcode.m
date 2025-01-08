% We take P as a raw sitting data from our drive
% Help of randperm code we ordered it randomly.
% And then we split ınto randomızed data time-stamped arrays
P = AccelerationSITTING1;
N = size(P,1); % N used for determining the size 
idx = randperm(N);
AccelerationSIT1= P(idx(1:round(N*0.8)),:);
AccelerationSIT3 = P(idx(round(N*0.8)+1:end),:);

% We take U as a raw walking data from our drive
% Help of randperm code we ordered it randomly.
% And then we split ınto randomızed data time-stamped arrays
U = AccelerationWALKING1;
K = size(U,1);% K used for determining the size 
idx = randperm(K);
AccelerationWALK1= U(idx(1:round(K*0.8)),:);
AccelerationWALK3 = U(idx(round(K*0.8)+1:end),:);

% We take T as a raw running data from our drive
% Help of randperm code we ordered it randomly.
% And then we split ınto randomızed data time-stamped arrays
T = AccelerationRUNNING1;
R = size(T,1); % R used for determining the size 
idx = randperm(R);
AccelerationRUN1= T(idx(1:round(R*0.8)),:);
AccelerationRUN3 = T(idx(round(R*0.8)+1:end),:);

%We convert time-stamped arrays to normal arrays
%Take the transpose of Accelerations(SIT-WALK-RUN)
AccelerationSIT1=table2array(AccelerationSIT1)
AccelerationSIT1=transpose(AccelerationSIT1);

AccelerationWALK1=table2array(AccelerationWALK1)
AccelerationWALK1=transpose(AccelerationWALK1);

AccelerationRUN1=table2array(AccelerationRUN1)
AccelerationRUN1=transpose(AccelerationRUN1);



%Concatenate Acceleration of different activities
XTrain1 = [AccelerationSIT1 AccelerationWALK1 AccelerationRUN1]



%Create YTrain (activity labels)
% We find the length of each sequence with the size
v=size(XTrain1);
v1=size(AccelerationSIT1);
v2=size(AccelerationWALK1);
v3=size(AccelerationRUN1);

YTrain1=zeros(1,v(2));
YTrain1=string(YTrain1);
 
%Concatenate different activity labels inside YTrain
for j=1:v1(2) 
    YTrain1(1,j)="sitting";
end

for j=v1(2)+1:v1(2)+v2(2)
    YTrain1(1,j)="walking";
end
for j=v1(2)+v2(2)+1:v(2)
    YTrain1(1,j)="running";
end


%Convert YTrain1 to categorical datatype
YTrain1=categorical(YTrain1);
%Create cell array to prepare XTrain
XTrain=cell(2,1);
%Add XTrain1 to XTrain
XTrain{1}= XTrain1;


% We take Z as a raw sitting data from our drive
% Help of randperm code we ordered it randomly.
% And then we split ınto randomızed data time-stamped arrays
Z = AccelerationSITTING2;
V = size(Z,1); % V used for determining the size 
idx = randperm(V);
AccelerationSIT2= Z(idx(1:round(V*0.8)),:);
AccelerationSIT4 = Z(idx(round(V*0.8)+1:end),:);


% We take H as a raw sitting data from our drive
% Help of randperm code we ordered it randomly.
% And then we split ınto randomızed data time-stamped arrays
H = AccelerationWALKING2;
A = size(H,1); % A used for determining the size 
idx = randperm(A);
AccelerationWALK2= H(idx(1:round(A*0.8)),:);
AccelerationWALK4 = H(idx(round(A*0.8)+1:end),:);


% We take C as a raw sitting data from our drive
% Help of randperm code we ordered it randomly.
% And then we split ınto randomızed data time-stamped arrays
C = AccelerationRUNNING2;
F = size(C,1);  % F used for determining the size 
idx = randperm(F);
AccelerationRUN2= C(idx(1:round(F*0.8)),:);
AccelerationRUN4 = C(idx(round(F*0.8)+1:end),:);

%We convert time-stamped arrays to normal arrays
%Take the transpose of Accelerations(SIT-WALK-RUN)
AccelerationSIT2=table2array(AccelerationSIT2)
AccelerationSIT2=transpose(AccelerationSIT2);

AccelerationWALK2 =table2array(AccelerationWALK2)
AccelerationWALK2 =transpose(AccelerationWALK2)

AccelerationRUN2 =table2array(AccelerationRUN2)
AccelerationRUN2 =transpose(AccelerationRUN2)

%Concatenate Acceleration of different activities 
XTrain2 = [AccelerationSIT2 AccelerationWALK2 AccelerationRUN2]


%Create YTrain (activity labels)
% We find the length of each sequence with the size
v=size(XTrain2);
v1=size(AccelerationSIT2);
v2=size(AccelerationWALK2);
v3=size(AccelerationRUN2);

YTrain2=zeros(1,v(2));
YTrain2=string(YTrain2);

%Concatenate different activity labels inside YTrain
for j=1:v1(2)
    YTrain2(1,j)="sitting";
end

for j=v1(2)+1:v1(2)+v2(2)
    YTrain2(1,j)="walking";
end
for j=v1(2)+v2(2)+1:v(2)
    YTrain2(1,j)="running";
end

%Convert YTrain2 to categorical datatype
YTrain2=categorical(YTrain2)
%Create cell array to prepare YTrain
YTrain=cell(2,1)
YTrain{1}= YTrain1

%Add YTrain2 to YTrain
YTrain{2}= YTrain2
%Add XTrain2 to XTrain
XTrain{2}= XTrain2

% -----------------------------------------------------------------------
% Until here we prepared the data for the first person
% and second person for XTrain and YTrain
% After this part the steps are the same for Xtest and Ytest
% -----------------------------------------------------------------------
%We convert time-stamped arrays to normal arrays
%Take the transpose of Accelerations(SIT-WALK-RUN)
AccelerationSIT3=table2array(AccelerationSIT3)
AccelerationSIT3=transpose(AccelerationSIT3);

AccelerationWALK3=table2array(AccelerationWALK3)
AccelerationWALK3=transpose(AccelerationWALK3);

AccelerationRUN3=table2array(AccelerationRUN3)
AccelerationRUN3=transpose(AccelerationRUN3);

%Concatenate Acceleration of different activities
XTest1 = [AccelerationSIT3 AccelerationWALK3 AccelerationRUN3]


%Create YTest (activity labels)
% We find the length of each sequence with the size
v=size(XTest1);
v1=size(AccelerationSIT3);
v2=size(AccelerationWALK3);
v3=size(AccelerationRUN3);

YTest1=zeros(1,v(2));
YTest1=string(YTest1);

%Concatenate different activity labels inside YTrain
for j=1:v1(2)
    YTest1(1,j)="sitting";
end

for j=v1(2)+1:v1(2)+v2(2)
    YTest1(1,j)="walking";
end
for j=v1(2)+v2(2)+1:v(2)
    YTest1(1,j)="running";
end

%Convert YTest1 to categorical datatype
YTest1=categorical(YTest1);
%Create cell array to prepare XTest
XTest=cell(2,1);
%Add XTest1 to XTest
XTest{1}= XTest1;


%We convert time-stamped arrays to normal arrays
%Take the transpose of Accelerations(SIT-WALK-RUN)
AccelerationSIT4=table2array(AccelerationSIT4)
AccelerationSIT4=transpose(AccelerationSIT4);

AccelerationWALK4 =table2array(AccelerationWALK4)
AccelerationWALK4 =transpose(AccelerationWALK4)

AccelerationRUN4 =table2array(AccelerationRUN4)
AccelerationRUN4 =transpose(AccelerationRUN4)

%Concatenate Acceleration of different activities 
XTest2 = [AccelerationSIT4 AccelerationWALK4 AccelerationRUN4]


%Create YTest2 (activity labels)
% We find the length of each sequence with the size
v=size(XTest2);
v1=size(AccelerationSIT4);
v2=size(AccelerationWALK4);
v3=size(AccelerationRUN4);

YTest2=zeros(1,v(2));
YTest2=string(YTest2);

%Concatenate different activity labels inside YTest
for j=1:v1(2)
    YTest2(1,j)="sitting";
end

for j=v1(2)+1:v1(2)+v2(2)
    YTest2(1,j)="walking";
end
for j=v1(2)+v2(2)+1:v(2)
    YTest2(1,j)="running";
end

%Convert YTest2 to categorical datatype
YTest2=categorical(YTest2)
%Create cell array to prepare YTrain
YTest=cell(2,1)
YTest{1}= YTest1

%Add YTrain2 to YTrain
YTest{2}= YTest2
%Add XTrain2 to XTrain
XTest{2}= XTest2







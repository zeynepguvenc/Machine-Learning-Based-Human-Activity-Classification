%We need to find the size due to take all values in for loop
%Execute them step by step 

vv1=size(AccelerationWALK1)
v_walking_x=0
v_walking_y=0
v_walking_z=0

for f = 1:vv1(2)
    v_walking_x=v_walking_x+AccelerationWALK1(1,f)*0.1
    v_walking_y=v_walking_y+AccelerationWALK1(2,f)*0.1
    v_walking_z=v_walking_z+(AccelerationWALK1(3,f)-9.8)*0.1
    %we take the momentary accelerations and multiply with the time of 0.1
    v_walking_final=sqrt(v_walking_x*v_walking_x+v_walking_y*v_walking_y+v_walking_z*v_walking_z)
    % To calculate the final speed we add the vectors 

end
%---------------------------------------------------------------------------
vv2=size(AccelerationRUN1)
v_running_x=0
v_running_y=0
v_running_z=0

for f = 1:vv2(2)
    v_running_x=v_running_x+AccelerationRUN1(1,f)*0.1
    v_running_y=v_running_y+AccelerationRUN1(2,f)*0.1
    v_running_z=v_running_z+(AccelerationWALK1(3,f)-9.8)*0.1
    %we take the momentary accelerations and multiply with the time of 0.1
    v_running_final=sqrt(v_running_x*v_running_x+v_running_y*v_running_y+v_running_z*v_running_z)
    % To calculate the final speed we add the vectors 

end





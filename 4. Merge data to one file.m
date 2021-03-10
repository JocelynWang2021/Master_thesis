clc;
clear;
close all;


Path = 'C:\Users\XWANG221\Downloads\Example';
Folder_Info =  dir(Path);
Folder_Num = length(Folder_Info)-2;


for i = 2:1:Folder_Num
    Folder_Name = Folder_Info(i+2).name;        % mat path
    cd(Path);
    cd(Folder_Name);                            % load mat path
    load('data.mat');                           % read mat file
    load('scenarios.mat'); 
      
    Data_Time_Day = data.Time.DateNumber;
    Data_Time_Hour = data.Time.Hour;
    Data_Time_Minute = data.Time.Minute;
    Data_Time_Second = data.Time.Second;
    % Ego
    Data_Lat = data.GPS.Lat;    
    Data_Long = data.GPS.Long;
    Data_Acceleration = data.Ego.Acceleration;
    Data_Decelerating = data.Ego.Decelerating;
    Data_Indicator = data.Ego.Indicator;
    Data_InReverse = data.Ego.InReverse;
    Data_Lane = data.Ego.Lane;
    Data_PositionInLane = data.Ego.PositionInLane;
    Data_Velocity = data.Ego.Velocity;
    Data_YawRate = data.Ego.YawRate;
    
    Data_DeviceID = str2double(Folder_Name(end-3:end)).*ones(size(Data_Lat));
    
    % Obj 
    %data.Obj.PosLgt
    [M,N] = size(data.Obj.PosLgt);
    Obj_PosLgt_Temp = NaN*ones(M,7);
    Obj_PosLgt_Temp(:,1:N) = data.Obj.PosLgt;
    
    Obj_PosLgt1 = Obj_PosLgt_Temp(:,1);
    Obj_PosLgt2 = Obj_PosLgt_Temp(:,2);
    Obj_PosLgt3 = Obj_PosLgt_Temp(:,3);
    Obj_PosLgt4 = Obj_PosLgt_Temp(:,4);
    Obj_PosLgt5 = Obj_PosLgt_Temp(:,5);
    Obj_PosLgt6 = Obj_PosLgt_Temp(:,6);
    Obj_PosLgt7 = Obj_PosLgt_Temp(:,7);
    clear Obj_PosLgt_Temp;
    
    % data.Obj.PosLat    
    [M,N] = size(data.Obj.PosLat);
    Obj_PosLat_Temp = NaN*ones(M,7);
    Obj_PosLat_Temp(:,1:N) = data.Obj.PosLat;
    
    Obj_PosLat1 = Obj_PosLat_Temp(:,1);
    Obj_PosLat2 = Obj_PosLat_Temp(:,2);
    Obj_PosLat3 = Obj_PosLat_Temp(:,3);
    Obj_PosLat4 = Obj_PosLat_Temp(:,4);
    Obj_PosLat5 = Obj_PosLat_Temp(:,5);
    Obj_PosLat6 = Obj_PosLat_Temp(:,6);  
    Obj_PosLat7 = Obj_PosLat_Temp(:,7);
    clear Obj_PosLat_Temp;
    
    % data.Obj.VelLgt
    [M,N] = size(data.Obj.VelLgt);
    Obj_VelLgt_Temp = NaN*ones(M,7);
    Obj_VelLgt_Temp(:,1:N) = data.Obj.VelLgt;
    
    Obj_VelLgt1 = Obj_VelLgt_Temp(:,1);
    Obj_VelLgt2 = Obj_VelLgt_Temp(:,2);
    Obj_VelLgt3 = Obj_VelLgt_Temp(:,3);
    Obj_VelLgt4 = Obj_VelLgt_Temp(:,4);
    Obj_VelLgt5 = Obj_VelLgt_Temp(:,5);
    Obj_VelLgt6 = Obj_VelLgt_Temp(:,6);
    Obj_VelLgt7 = Obj_VelLgt_Temp(:,7);
    clear Obj_VelLgt_Temp;
    
    % data.Obj.VelLat
    [M,N] = size(data.Obj.VelLat);
    Obj_VelLat_Temp = NaN*ones(M,7);
    Obj_VelLat_Temp(:,1:N) = data.Obj.VelLat;
    
    Obj_VelLat1 = Obj_VelLat_Temp(:,1);
    Obj_VelLat2 = Obj_VelLat_Temp(:,2);
    Obj_VelLat3 = Obj_VelLat_Temp(:,3);
    Obj_VelLat4 = Obj_VelLat_Temp(:,4);
    Obj_VelLat5 = Obj_VelLat_Temp(:,5);
    Obj_VelLat6 = Obj_VelLat_Temp(:,6);
    Obj_VelLat7 = Obj_VelLat_Temp(:,7);
    clear Obj_VelLat_Temp;
    
    %data.Obj.AccLgt
    [M,N] = size(data.Obj.AccLgt);
    Obj_AccLgt_Temp = NaN*ones(M,7);
    Obj_AccLgt_Temp(:,1:N) = data.Obj.AccLgt;
    
    Obj_AccLgt1 = Obj_AccLgt_Temp(:,1);
    Obj_AccLgt2 = Obj_AccLgt_Temp(:,2);
    Obj_AccLgt3 = Obj_AccLgt_Temp(:,3);
    Obj_AccLgt4 = Obj_AccLgt_Temp(:,4);
    Obj_AccLgt5 = Obj_AccLgt_Temp(:,5);
    Obj_AccLgt6 = Obj_AccLgt_Temp(:,6);  
    Obj_AccLgt7 = Obj_AccLgt_Temp(:,7);
    clear Obj_AccLgt_Temp;
        
    %data.Obj.AccLat
    [M,N] = size(data.Obj.AccLat);
    Obj_AccLat_Temp = NaN*ones(M,7);
    Obj_AccLat_Temp(:,1:N) = data.Obj.AccLat;
    
    Obj_AccLat1 = Obj_AccLat_Temp(:,1);
    Obj_AccLat2 = Obj_AccLat_Temp(:,2);
    Obj_AccLat3 = Obj_AccLat_Temp(:,3);
    Obj_AccLat4 = Obj_AccLat_Temp(:,4);
    Obj_AccLat5 = Obj_AccLat_Temp(:,5);
    Obj_AccLat6 = Obj_AccLat_Temp(:,6);  
    Obj_AccLat7 = Obj_AccLat_Temp(:,7); 
    clear Obj_AccLat_Temp;
    
    % data.Obj.Angle
    [M,N] = size(data.Obj.Angle);
    Obj_Angle_Temp = NaN*ones(M,7);
    Obj_Angle_Temp(:,1:N) = data.Obj.Angle;
    
    Obj_Angle1 = Obj_Angle_Temp(:,1);
    Obj_Angle2 = Obj_Angle_Temp(:,2);
    Obj_Angle3 = Obj_Angle_Temp(:,3);
    Obj_Angle4 = Obj_Angle_Temp(:,4);
    Obj_Angle5 = Obj_Angle_Temp(:,5);
    Obj_Angle6 = Obj_Angle_Temp(:,6);
    Obj_Angle7 = Obj_Angle_Temp(:,7);
    clear Obj_Angle_Temp;
    
    % data.Obj.Type
    [M,N] = size(data.Obj.Type);
    Obj_Type_Temp = NaN*ones(M,7);
    Obj_Type_Temp(:,1:N) = data.Obj.Type;  
    
    Obj_Type1 = Obj_Type_Temp(:,1);
    Obj_Type2 = Obj_Type_Temp(:,2);
    Obj_Type3 = Obj_Type_Temp(:,3);
    Obj_Type4 = Obj_Type_Temp(:,4);
    Obj_Type5 = Obj_Type_Temp(:,5);
    Obj_Type6 = Obj_Type_Temp(:,6); 
    Obj_Type7 = Obj_Type_Temp(:,7); 
    clear Obj_Type_Temp;
    
    % data.Obj.Id
    [M,N] = size(data.Obj.Id);
    Obj_Id_Temp = NaN*ones(M,7);
    Obj_Id_Temp(:,1:N) = data.Obj.Id;  
    
    Obj_Id1 = Obj_Id_Temp(:,1);
    Obj_Id2 = Obj_Id_Temp(:,2);
    Obj_Id3 = Obj_Id_Temp(:,3);
    Obj_Id4 = Obj_Id_Temp(:,4);
    Obj_Id5 = Obj_Id_Temp(:,5);
    Obj_Id6 = Obj_Id_Temp(:,6);
    Obj_Id7 = Obj_Id_Temp(:,7);
    clear Obj_Id_Temp;
    
    % data.Obj.Lane
    [M,N] = size(data.Obj.Lane);
    Obj_Lane_Temp = NaN*ones(M,7);
    Obj_Lane_Temp(:,1:N) = data.Obj.Lane;
    
    Obj_Lane1 = Obj_Lane_Temp(:,1);
    Obj_Lane2 = Obj_Lane_Temp(:,2);
    Obj_Lane3 = Obj_Lane_Temp(:,3);
    Obj_Lane4 = Obj_Lane_Temp(:,4);
    Obj_Lane5 = Obj_Lane_Temp(:,5);
    Obj_Lane6 = Obj_Lane_Temp(:,6);
    Obj_Lane7 = Obj_Lane_Temp(:,7);
    clear Obj_Lane_Temp;
    
    % data.Obj.PositionInLane
    [M,N] = size(data.Obj.PositionInLane);
    Obj_PositionInLane_Temp = NaN*ones(M,7);
    Obj_PositionInLane_Temp(:,1:N) = data.Obj.PositionInLane;
    
    Obj_PositionInLane1 = Obj_PositionInLane_Temp(:,1);
    Obj_PositionInLane2 = Obj_PositionInLane_Temp(:,2);
    Obj_PositionInLane3 = Obj_PositionInLane_Temp(:,3);
    Obj_PositionInLane4 = Obj_PositionInLane_Temp(:,4);
    Obj_PositionInLane5 = Obj_PositionInLane_Temp(:,5);
    Obj_PositionInLane6 = Obj_PositionInLane_Temp(:,6);    
    Obj_PositionInLane7 = Obj_PositionInLane_Temp(:,7);
    clear Obj_PositionInLane_Temp;
            
    Data_Result = zeros(length(Data_Lat),89);
    Data_Result(:,1) = Data_DeviceID;
    Data_Result(:,2) = Data_Lat;
    Data_Result(:,3) = Data_Long;
    Data_Result(:,4) = Data_Acceleration;
    Data_Result(:,5) = Data_Decelerating;
    Data_Result(:,6) = Data_Indicator;
    Data_Result(:,7) = Data_InReverse;
    Data_Result(:,8) = Data_Lane;
    Data_Result(:,9) = Data_PositionInLane;
    Data_Result(:,10) = Data_Velocity;
    Data_Result(:,11) = Data_YawRate;  
    
    Data_Result(:,12) = Obj_PosLgt1;
    Data_Result(:,13) = Obj_PosLgt2;
    Data_Result(:,14) = Obj_PosLgt3;
    Data_Result(:,15) = Obj_PosLgt4;
    Data_Result(:,16) = Obj_PosLgt5;
    Data_Result(:,17) = Obj_PosLgt6;  
    Data_Result(:,18) = Obj_PosLgt7;
    
    Data_Result(:,19) = Obj_PosLat1;
    Data_Result(:,20) = Obj_PosLat2;
    Data_Result(:,21) = Obj_PosLat3;
    Data_Result(:,22) = Obj_PosLat4;
    Data_Result(:,23) = Obj_PosLat5;
    Data_Result(:,24) = Obj_PosLat6;
    Data_Result(:,25) = Obj_PosLat7;
    
    Data_Result(:,26) = Obj_VelLgt1;
    Data_Result(:,27) = Obj_VelLgt2;
    Data_Result(:,28) = Obj_VelLgt3;
    Data_Result(:,29) = Obj_VelLgt4;
    Data_Result(:,30) = Obj_VelLgt5;
    Data_Result(:,31) = Obj_VelLgt6;
    Data_Result(:,32) = Obj_VelLgt7;   
    
    Data_Result(:,33) = Obj_VelLat1;
    Data_Result(:,34) = Obj_VelLat2;
    Data_Result(:,35) = Obj_VelLat3;
    Data_Result(:,36) = Obj_VelLat4;
    Data_Result(:,37) = Obj_VelLat5;
    Data_Result(:,38) = Obj_VelLat6;
    Data_Result(:,39) = Obj_VelLat7;
    
    Data_Result(:,40) = Obj_AccLgt1;
    Data_Result(:,41) = Obj_AccLgt2;
    Data_Result(:,42) = Obj_AccLgt3;
    Data_Result(:,43) = Obj_AccLgt4;
    Data_Result(:,44) = Obj_AccLgt5;
    Data_Result(:,45) = Obj_AccLgt6;
    Data_Result(:,46) = Obj_AccLgt7;
    
    Data_Result(:,47) = Obj_AccLat1;
    Data_Result(:,48) = Obj_AccLat2;
    Data_Result(:,49) = Obj_AccLat3;
    Data_Result(:,50) = Obj_AccLat4;
    Data_Result(:,51) = Obj_AccLat5;
    Data_Result(:,52) = Obj_AccLat6; 
    Data_Result(:,53) = Obj_AccLat6;
    
    Data_Result(:,54) = Obj_Angle1;
    Data_Result(:,55) = Obj_Angle2;
    Data_Result(:,56) = Obj_Angle3;
    Data_Result(:,57) = Obj_Angle4;
    Data_Result(:,58) = Obj_Angle5;
    Data_Result(:,59) = Obj_Angle6; 
    Data_Result(:,60) = Obj_Angle7;
    
    Data_Result(:,61) = Obj_Type1;
    Data_Result(:,62) = Obj_Type2;
    Data_Result(:,63) = Obj_Type3;
    Data_Result(:,64) = Obj_Type4;
    Data_Result(:,65) = Obj_Type5;
    Data_Result(:,66) = Obj_Type6; 
    Data_Result(:,67) = Obj_Type7; 
    
    Data_Result(:,68) = Obj_Id1;
    Data_Result(:,69) = Obj_Id2;
    Data_Result(:,70) = Obj_Id3;
    Data_Result(:,71) = Obj_Id4;
    Data_Result(:,72) = Obj_Id5;
    Data_Result(:,73) = Obj_Id6;  
    Data_Result(:,74) = Obj_Id7;  
    
    Data_Result(:,75) = Obj_Lane1;
    Data_Result(:,76) = Obj_Lane2;
    Data_Result(:,77) = Obj_Lane3;
    Data_Result(:,78) = Obj_Lane4;
    Data_Result(:,79) = Obj_Lane5;
    Data_Result(:,80) = Obj_Lane6;
    Data_Result(:,81) = Obj_Lane7;
    
    Data_Result(:,82) = Obj_PositionInLane1;
    Data_Result(:,83) = Obj_PositionInLane2;
    Data_Result(:,84) = Obj_PositionInLane3;
    Data_Result(:,85) = Obj_PositionInLane4;
    Data_Result(:,86) = Obj_PositionInLane5;
    Data_Result(:,87) = Obj_PositionInLane6;
    Data_Result(:,88) = Obj_PositionInLane7;
    
    Temp = struct2cell(scenarios.CutIn);
    Start = Temp(1,:);
    End = Temp(4,:);
    
    if(~isempty(Start))
        for k = 1:1:length(Start)
            Start_Temp = Start{k};
            End_Temp = End{k};
            Data_Result(Start_Temp:End_Temp,89) = 1;            
        end
    end
    
    
    cd('..\..\');  % return front path
    
    CSV_File_Name = ['LSTM_2019w20_Sensor_P514_EU_' Folder_Name(end-3:end) '.csv'];

    fid = fopen(CSV_File_Name,'a');
    csvwrite(CSV_File_Name,Data_Result);
    fclose all; 
end

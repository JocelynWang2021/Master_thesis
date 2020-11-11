clc;
clear;
close all;

File_Name = 'df10.csv';
Traffic_Net_Data = csvread(File_Name,1,0);
% save('Traffic_Net_Data.mat' , 'Traffic_Net_Data' ,'-v7.3' );

Data_Temp17 = NaN*ones(size(Traffic_Net_Data,1),10);
Data_Temp18 = NaN*ones(size(Traffic_Net_Data,1),10);
Data_Temp19 = NaN*ones(size(Traffic_Net_Data,1),10);
Data_Temp20 = NaN*ones(size(Traffic_Net_Data,1),10);
Data_Temp21 = NaN*ones(size(Traffic_Net_Data,1),10);
Data_Temp22 = NaN*ones(size(Traffic_Net_Data,1),10);

Target_ID = Traffic_Net_Data(:,16);
ObstacleId = Traffic_Net_Data(:,17);
Range = Traffic_Net_Data(:,18);
Rangerate = Traffic_Net_Data(:,19);
Transversal = Traffic_Net_Data(:,20);
TargetType = Traffic_Net_Data(:,21);
CIPV = Traffic_Net_Data(:,22);

Index = find(Target_ID > 1);
%Traffic_Net_Data(Index,23) = 0;
Traffic_Net_Data(Index,1) = 0;

for i = 1:1:length(Index)
    clc;
    fprintf('数据加载完成，处理进度：%3.6f%%\n',floor(i/length(Index)*100000000)/1000000);
    
    Target_ID_Temp = Target_ID(Index(i));
    Row = Index(i) - Target_ID_Temp + 1;
    Line = Target_ID_Temp;
    
    Data_Temp17(Row,Line) = ObstacleId(Index(i));
    Data_Temp18(Row,Line) = Range(Index(i));
    Data_Temp19(Row,Line) = Rangerate(Index(i));
    Data_Temp20(Row,Line) = Transversal(Index(i));
    Data_Temp21(Row,Line) = TargetType(Index(i));
    Data_Temp22(Row,Line) = CIPV(Index(i));
end

fprintf('Finishing reading data, start to merger the data);

Index_1 = find(Target_ID == 1);

Data_Temp17(Index_1,1) = ObstacleId(Index_1);
Data_Temp18(Index_1,1) = Range(Index_1);
Data_Temp19(Index_1,1) = Rangerate(Index_1);
Data_Temp20(Index_1,1) = Transversal(Index_1);
Data_Temp21(Index_1,1) = TargetType(Index_1);
Data_Temp22(Index_1,1) = CIPV(Index_1);

Traffic_Net_Data_New = [Traffic_Net_Data(:,1:2) Traffic_Net_Data(:,4:15) Data_Temp17 Data_Temp18 Data_Temp19 Data_Temp20 Data_Temp21 Data_Temp22];

Index_New = find(Traffic_Net_Data_New(:,1) ~= 0);
Traffic_Net_Data_New = Traffic_Net_Data_New(Index_New,:);

fprintf('数据拼接完成，开始存储');

File_Name_New = 'df10_ToVolvo.csv';
csvwrite(File_Name_New,Traffic_Net_Data_New);
fclose all;
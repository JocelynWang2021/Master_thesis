clc;
clear;
close all;

% All CutInEvents are in CutInEvents.csv;
Data_Result = csvread('C:\Users\XWANG221\Downloads\TrafficNet\CutInEvents.csv',0,0);

% DataFrontTargets.csv;
Data_Front = csvread('C:\Users\XWANG221\Downloads\TrafficNet\DataFrontTargets.csv',1,0);

% All events of lane change to left are in laneChangeLeft.csv;
Data_Left = csvread('C:\Users\XWANG221\Downloads\TrafficNet\laneChangeLeft.csv',0,0);

% All events of lane change to right are in laneChangeRight.csv;
Data_Right = csvread('C:\Users\XWANG221\Downloads\TrafficNet\laneChangeRight.csv',0,0);

% DataLane.csv;
Data_Lane = csvread('DataLane.csv',1,0);

% First doing annotation for Cutin and Car Following, then save the new file toDataFrontTargets_New.csv;
File_Name_New = 'DataFrontTargets_New.csv';

[M,N] = size(Data_Front);
Data_New = zeros(M,N+7);
Data_New(:,1:N) = Data_Front;
clear Data_Front;

Data_Result_Temp = [Data_Result(:,1:2),Data_Result(:,5)];
Data_Front_Temp = [Data_New(:,1:2),Data_New(:,5)];

tic
for i = 1:1:M-1
    toc
    clc;fprintf('Rate?%3.4f%%\n',floor(i/M*1000000)/10000);
    
    % Cutin annotation
    [~,Row_Result,~] = intersect(Data_Result_Temp,Data_Front_Temp(i,:),'rows');
    if(~isempty(Row_Result))
        if((Data_New(i,3) <= Data_Result(Row_Result,3)) && (Data_New(i,3) >= Data_Result(Row_Result,3)-490))
            Data_New(i,N+1) = 1;
        else
            Data_New(i,N+1) = 0;
        end
    else
        Data_New(i,N+1) = 0;
    end
    
    % Car Following annotation
    if((Data_New(i,11) == 1) && (Data_New(i,5) == Data_New(i+1,5)))   
        [~,Row_Left,~] = intersect(Data_Left(:,1:3),Data_New(i,1:3),'rows');           
        [~,Row_Right,~] = intersect(Data_Right(:,1:3),Data_New(i,1:3),'rows');
        
        if(isempty(Row_Left) && isempty(Row_Right))
            Data_New(i,N+2) = 1;
        else
            Data_New(i,N+2) = 0;
        end
    else
        Data_New(i,N+2) = 0;
    end
    
    % merge with Lane
    [~,Row_Lane,~] = intersect(Data_Lane(:,1:3),Data_New(i,1:3),'rows');
    if(~isempty(Row_Lane))
        Data_New(i,N+3:N+7) = Data_Lane(Row_Lane,4:8);
    else
        Data_New(i,N+3:N+7) = NaN;
    end
    
    % Save the data
    Fid = fopen(File_Name_New,'a+');
    fprintf(Fid,'%g,',Data_New(i,:));
    fprintf(Fid,'\n');
    fclose(Fid);
end


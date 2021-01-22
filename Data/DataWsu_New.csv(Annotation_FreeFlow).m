clc;
clear;
close all;

% DataFrontTargets.csv;
Data_Front = csvread('C:\Users\XWANG221\Downloads\TrafficNet\DataFrontTargets.csv',1,0);

% Data_Wsu.csv;
Data_Front = csvread('C:\Users\XWANG221\Downloads\TrafficNet\Data_Wsu.csv',1,0);

Data_Front_DTT = Data_Front(:,1:3);
Data_Wsu_DTT = Data_Wsu(:,1:3);

[~, Row_Front, Row_Wsu] = intersect(Data_Front_DTT,Data_Wsu_DTT,'rows');

clear Data_Front_DTT Data_Wsu_DTT

[M,N] = size(Data_Wsu);
Data_Wsu_New = zeros(M,N+3);
Data_Wsu_New(:,1:27) = Data_Wsu;
Data_Front_CF = Data_Front(:,12:13);

% 28th column is for Flow
Data_Wsu_New(Row_Wsu,28) = 1;

% 29th column is for Cutin and 30th column is for Car Following
Data_Wsu_New(Row_Wsu,29:30) = Data_Front_CF(Row_Front,:);

File_Name_New = 'DataWsu_New.csv';
csvwrite(File_Name_New, Data_Wsu_New);
fclose all;

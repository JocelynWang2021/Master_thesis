clc;
clear;
close all;

%load('Data_Front_New.mat');
File_Name = 'Following_1.csv';
Data_Front_New = csvread(File_Name,1,0);

%Data_Front_New = Data_Front_New(1:100000,:);

Cutin = Data_Front_New(:,9);
Following = Data_Front_New(:,10);
Trip = Data_Front_New(:,1);

L = size(Data_Front_New,1);

Count_Cutin = 0;
Count_Following = 1;
Flag_Temp = 0;
Trip_Temp = -100;

tic
for i = 1:1:L-20
    clc;
    toc
    fprintf('Rate：%3.6f%%\n',floor(i/L*100000000)/1000000);
    x = toc;
    fprintf('Surplus：%3.2f min\n',(L-i)*(x/i)/60);
    
    if(Cutin(i) == 1)
        if(Trip(i) ~= Trip_Temp) 
            Count_Cutin = Count_Cutin + 1;
        end
        
        Trip_Temp = Trip(i);
        
        File_Name_Cutin = ['Cutin_' num2str(Count_Cutin) '.csv'];
        Fid = fopen(File_Name_Cutin,'a+');
        fprintf(Fid,'%g,',Data_Front_New(i,1:11));
        fprintf(Fid,'\n');
        fclose(Fid);
    end
    
    if(i <= 20)
        File_Name_Following = ['Following_' num2str(Count_Following) '.csv'];
        Fid = fopen(File_Name_Following,'a+');
        fprintf(Fid,'%g,',Data_Front_New(i,1:11));
        fprintf(Fid,'\n');
        fclose(Fid);
    else
        if(Following(i) == 1)
            Count_Temp = 0;
            Flag = 0;
            for k = -19:1:20
                if(Count_Temp == 20)
                    Flag = 1;
                    break;
                else
                    if((Following(i+k) == 1) && (Trip(i+k) == Trip(i)))
                        Count_Temp = Count_Temp + 1;
                    else
                        Count_Temp = 0;
                    end
                end
            end
            
            if(Flag_Temp == 1 && Flag == 0)
                Count_Following = Count_Following + 1;
            end
            Flag_Temp = Flag;
            if(Flag == 1)
                File_Name_Following = ['Following_' num2str(Count_Following) '.csv'];
                Fid = fopen(File_Name_Following,'a+');
                fprintf(Fid,'%g,',Data_Front_New(i,1:11));
                fprintf(Fid,'\n');
                fclose(Fid);             
            end
        end
    end
end
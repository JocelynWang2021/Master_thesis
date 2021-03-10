# Master-thesis-codes
Title of the thesis: Traffic Scenario Clustering with Machine Learning
The goal of this thesis project is to release traffic scenario classification models to identify traffic scenarios from driving data.

Public data which are used in this project includes DataFrontTargets.csv, DataLane.csv and DataWsu.csv from the link below. https://data.transportation.gov/Automobiles/Safety-Pilot-Model-Deployment-Data/a7qq-9vfe
CutInEvents.csv, laneChangeLeft.csv and laneChangeRight.csv in Date come from the first authour of the paper "Trafficnet: An open naturalistic driving scenario library". Available at https://arxiv.org/pdf/1708.01872.pdf CutInEvents.csv includes all the events of Cutin. laneChangeLeft.csv and laneChangeRight.csv contain the events of the ego car changing the lane to left and right respectively.

The codes of Long Short Term Memory are presented including feature selection and building the models using Python. 1-4 are the code files for data annotation and extracting scenarios using MATLAB.

Version of python and library
python 3.7
tensorflow 1.14.0
sklearn 0.21.3

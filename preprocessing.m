% Pre-processing script for the EST Simulink model. This script is invoked
% before the Simulink model starts running (initFcn callback function).

%% Load the supply and demand data

timeUnit   = 's';

supplyFile = "Team58_supply (1).csv";
supplyUnit = "MW";

% load the supply data
Supply = loadSupplyData(supplyFile, timeUnit, supplyUnit);

demandFile = "Team58_demand.csv";
demandUnit = "MW";

% load the demand data
Demand = loadDemandData(demandFile, timeUnit, demandUnit);

%% Simulation settings

deltat = 5*unit("min");
stopt  = min([Supply.Timeinfo.End, Demand.Timeinfo.End]);

%% System parameters

% transport from supply
aSupplyTransport = 0.01; % Dissipation coefficient

LDratioSupply = 136.1;% ratio of the length over the diameter of the pipes to the supply
AreaSupply = 6.79;% area of the pipe to the supply
heightDifference = 300;% height difference between the reservoirs
pipeRoughnessSupply = 0.000045; %coefficient for the pipe roughness
PipeLengthSupply = 484;% length of the pipes to the supply
numberOfPipes = 5;
gAccel = 9.81;
rho = 1000;
mu = 0.0013;
dynamicViscosity = 0.001306;
PipeDiameter = 4.12;
K_bends = 1.5;


% injection system
aInjection = 0.3; % Dissipation coefficient

% storage system
EStorageMax     = 7000000*unit("kWh");  
EStorageMin     = 318825*unit("kWh");  
EStorageInitial = 318825*unit("kWh");  
bStorage        = 0.05/unit("year");   
% extraction system
aExtraction = 0.05; % Dissipation coefficient

% transport to demand
aDemandTransport = 0.0; % Dissipation coefficient
numberOfpipesDemand = 1;
PipediameterDemand = 3.08;
AreaDemand = 7.459;% area of the pipe to the supply
pipeRoughnessDemand = 0.000045; %coefficient for the pipe roughness
PipeLengthDemand = 484;% length of the pipes to the supply
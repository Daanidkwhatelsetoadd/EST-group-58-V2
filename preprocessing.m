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
LDratioSupply = 136.1; % ratio of the length over the diameter of the pipes to the supply
AreaSupply = 6.79; % area of the pipe to the supply
heightDifference = 300; % height difference between the reservoirs
pipeRoughnessSupply = 0.000001772; % coefficient for the pipe roughness
PipeLengthSupply = 484; % length of the pipes to the supply
numberOfPipes = 5; % number of pipes from supply
gAccel = 9.81; % The gravitational accelaration
rho = 1000;
mu = 0.0013; 
dynamicViscosity = 0.001306;
PipeDiameter = 4.12; % Pipe diameter that is used from supply
K_bends = 1.5; % The coefficient for minor losses in bends


% injection system
aInjection = 0.1; % Dissipation coefficient

% storage system
EStorageMax     = 5910525*unit("kWh"); % Maximum energy
EStorageMin     = 318825*unit("kWh");  % Minimum energy
EStorageInitial = 318825*unit("kWh");  % Initial energy
bStorage        = 0.05/unit("year");   % Evaporation losses during the year 

% extraction system
aExtraction = 0.05; % Dissipation coefficient

% transport to demand
LDratioDemand = 136.1; % ratio of the length over the diameter of the pipes to demand
aDemandTransport = 0.0; % Dissipation coefficient
numberOfpipesDemand = 1;
PipediameterDemand = 3.08; % Pipe diameter that is used in to demand
AreaDemand = 7.459;% area of the pipe to the supply
pipeRoughnessDemand = 0.000001772; %coefficient for the pipe roughness
PipeLengthDemand = 484;% length of the pipes to the supply
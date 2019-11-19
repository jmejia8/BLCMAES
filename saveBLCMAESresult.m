function saveBLCMAESresult(ins, fnum)
fnum = fnum;
problemName = 'pmm';             % Test problem name


ulEliteFunctionValue = ins.UF;
llEliteFunctionValue = ins.LF;
ulEliteIndiv = ins.UX;
llEliteIndiv = ins.LX;
ulFunctionEvaluations = ins.UFEs;
llFunctionEvaluations = ins.LFEs;

ulDim = length(ulEliteIndiv);
llDim = length(llEliteIndiv);

timeElapsed = ins.runTime;

nrun = ins.runNo;
mkdir(strcat('data_', int2str(ulDim), '_', int2str(llDim),'/'));

save(strcat('data_', int2str(ulDim), '_', int2str(llDim),'/BLCMEAES_PMM', int2str(fnum), 'run', int2str(nrun), 'DUL', int2str(ulDim), 'DLL', int2str(llDim)) );



    %      UF: -1.0498e-05
    %      LF: 1.0498e-05
    %      UX: [0.0032 4.0124e-05 0.1058 0.9814 0.1438]
    %      LX: [9.9997 10.0000 1.5945e-07 -0.9950 -1.8866e-07]
    %    UFEs: 3505
    %    LFEs: 288648
    %  record: [334×1 struct]
    % runPath: '/home/jmejia/develop/repos/BLCMAES'
    %   runNo: 26
    %      BI: [1×1 struct]
    %     alg: 'BLCMAES'
    % runTime: 58.1168

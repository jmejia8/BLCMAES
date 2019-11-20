function saveBLCMAESresult(ins, fnum)
fnum = fnum;
problemName = ins.BI.fn;             % Test problem name


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
benchmark = upper(problemName);
save(strcat('data_', int2str(ulDim), '_', int2str(llDim),'/BLCMEAES_',benchmark, 'run', int2str(nrun), 'DUL', int2str(ulDim), 'DLL', int2str(llDim)) );




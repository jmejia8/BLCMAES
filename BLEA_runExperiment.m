% run BLEAQ2
% cd D:\soft\BLEAQ2\bleaq2-master 
% cd D:\soft\NBLEA
% cd D:\soft\BLEAQ
% cd 'D:\workspace\Computational Intelligence'
addpath('BLEA_D/')
pwd

maxRuns = 31;
BI_list = [];
BI_list = [BI_list;getBLOPinfo('PMM',1:6,5)];
BI_list = [BI_list;getBLOPinfo('PMM',1:6,10)];
% BI_list = [BI_list;getBLOPinfo('TP',1:10)];
% BI_list = [BI_list;getBLOPinfo('SMD',1:12,10)];
% BI_list = [BI_list;getBLOPinfo('SMD',1:12,20)];

% BI_list = [BI_list;getBLOPinfo('GoldMining')];
% BI_list = [BI_list;getBLOPinfo('DecisionMaking')];

% BI_list = [BI_list;getBLOPinfo('TP',1:10)];
% BI_list = [BI_list;getBLOPinfo('SMD',9:12,5)];
% BI_list = [BI_list;getBLOPinfo('TP',10)];

algName = 'BLCMAES';
for BI = BI_list'
    if BI.dim == 3
        % for gold mining problem
        BI.UmaxFEs = 1500;
        BI.UmaxImprFEs = 70;
        BI.LmaxFEs = 1500;
        BI.LmaxImprFEs = 15;
    elseif BI.dim == 5 || BI.dim == 6 || strcmp(BI.fn(1:2),'tp')
        % for generic benchmark test problem or decision making problem 
        BI.UmaxFEs = 2500;
        BI.UmaxImprFEs = 350;
        BI.LmaxFEs = 2500;
        BI.LmaxImprFEs = 25;
    elseif BI.dim == 10
        BI.UmaxFEs = 3500;
        BI.UmaxImprFEs = 500;
        BI.LmaxFEs = 3500;
        BI.LmaxImprFEs = 35;
    elseif BI.dim == 20
        BI.UmaxFEs = 5000;
        BI.UmaxImprFEs = 750;
        BI.LmaxFEs = 5000;
        BI.LmaxImprFEs = 50;
    else
        error('unknown dimensionality');
    end
    
    BI.u_N = 50;
    BI.l_N = 50;

	parfor runNo = 1:maxRuns
    % for runNo = 1:31
		tic;
% 		ins = wapper(BI,true);
        ins = BLCMAES(BI);
		ins.runPath = pwd;
		ins.runNo = runNo;
		ins.BI = BI;
		ins.alg = algName;
		ins.runTime = toc;

        saveBLCMAESresult(ins, BI.fno);
        fprintf('%s %s #%d [%g,%g]\n', ins.alg, ins.BI.fn, ins.runNo, ins.UF, ins.LF);
        ins
        % n = norm( ins.LX - PMM_Psi(ins.UX, length(ins.LX), 4));
        % n
	end	
end




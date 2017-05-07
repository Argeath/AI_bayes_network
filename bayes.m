pB = 0.7;
pW = 0.007;
pSwW = 0.17;
pSwnW = 0.07;
pGwS = 0.1;
pGwnS = 0.03;
pZwBS = 0.6;
pZwnBS = 0.15;
pZwBnS = 0.35;
pZwnBnS = 0.05;
pUwZ = 0.1;
pUwnZ = 0.02;

% przyklad
pZwS = pZwBS * pB + pZwnBS * (1 - pB);
pZwnS = pZwBnS * pB + pZwnBnS * (1 - pB);
pZwW = pZwS * pSwW + pZwnS * (1 - pSwW);

% 1
pS = pSwW * pW + pSwnW * (1 - pW);
pZwnB = pZwnBS * pS + pZwnBnS * (1 - pS);
pUwnB = pUwZ * pZwnB + pUwnZ * (1 - pZwnB)

% 2
pUwS = pZwBS * pB + pZwnBS * (1 - pB);
pUS = pUwS * pS;
pUSwW = pUwS * pSwW;
pWwUS = (pUSwW * pW) / pUS

% 3
pG = pGwS * pS + pGwnS * (1 - pS);
pZ = pZwBS * pB * pS + pZwnBS * (1 - pB) * pS + pZwBnS * pB * (1 - pS) + pZwnBnS * (1 - pB) * (1 - pS);
pU = pUwZ * pZ + pUwnZ * (1 - pZ);
pUG = pU * pG

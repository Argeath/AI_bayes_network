liczba_prob = 10000000;
X = liczba_prob/100:liczba_prob/100:liczba_prob;

pS = 0;
pG = 0;
pZ = 0;
pU = 0;

pUnB = 0;
pWSU = 0;
pSU = 0;
sUG = 0;

tab1 = X;
tab2 = X;
tab3 = X;

for i = 1:liczba_prob
    rS = rand;
    rG = rand;
    rZ = rand;
    rU = rand;
    
    B = rand < 0.7;
    W = rand < 0.007;
    S = (W == 1 && rS < 0.17) || (W == 0 && rS < 0.07);
    G = (S == 1 && rG < 0.1) || (S == 0 && rG < 0.03);
    Z = (B == 1 && S == 1 && rZ < 0.6) || (B == 0 && S == 1 && rZ < 0.15) || (B == 0 && S == 0 && rZ < 0.05) || (B == 1 && S == 0 && rZ < 0.35);
    U = (Z == 1 && rU < 0.1) || (Z == 0 && rU < 0.02);
    
    %pS = pS + S;
    %pG = pG + G;
    %pZ = pZ + Z;
    %pU = pU + U;
    
    if(U == 1 && G == 1)
        sUG = sUG + 1;
    end
    
    if(U == 1 && B == 0)
        pUnB = pUnB + 1;
    end
    
    if(S == 1 && U == 1)
        if(W == 1)
            pWSU = pWSU + 1;
        end
        
        pSU = pSU + 1;
    end
    
    if(mod(i, liczba_prob/100) == 0)
        pUwnB = pUnB / (i * 0.3);
        tab1(i/(liczba_prob/100)) = pUwnB;
        
        pWwSU = pWSU / pSU;
        tab2(i/(liczba_prob/100)) = pWwSU;
        
        pUG = sUG / i;
        tab3(i/(liczba_prob/100)) = pUG;
    end
end

pUwnB = pUnB / (liczba_prob * 0.3)
pWwSU = pWSU / pSU
pUG = sUG / liczba_prob

podpisy = {'P(U|~B)' 'P(W|S,U)' 'P(U,G)'};

plot(X,tab1, 'Color', 'g');
hold on;
plot(X,tab2, 'Color','b');
hold on;
plot(X,tab3, 'Color','r');
hold on;
legend(podpisy, 4);

function [ PARAMS, misfit ] = findParams( CUR_SAMPLES )
% Tente de faire la régressions linéaire des CUR_SAMPLES,
% en effectuant cette regression d'abord sur la forme Z = [x y 1] [a;b;c] 
% Si le déterminant est proche 0 , on tente Y = [x z 1] [d;e;f]
% Si le déterminant est encore proche de 0 on tente X = [y;z;1][g;h;i]

% CUR_SAMPLES a le même format que SAMPLE.

epsilon =10e-9;

startIndex = 1;

while startIndex > 0

[x,G] = generateG(CUR_SAMPLES, startIndex);

% Calculer le modèle
if det(G'*G) > epsilon 
    m = inv(G'*G) * G' * x;
    
    if startIndex == 1 
        PARAMS = [m(1); m(2); 1; m(3)];
    elseif startIndex == 2
        PARAMS = [1; m(1); m(2); m(3)];
    elseif startIndex == 3
        PARAMS = [m(2); 1; m(1); m(3)];
    end
    
    xpred = G*m ;
    err = x - xpred;
    misfit = err' * err;
    startIndex = 0;
else
    startIndex = startIndex + 1;
end

if startIndex > 3
    startIndex = 0;
    PARAMS = [0;0;0;0];
    misfit = 0;
end


end


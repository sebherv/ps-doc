% Prend en entrée:
% - la matrice SAMPLES qui contient les points du nuages
% - le vecteur thetas la liste des angles horizontaux
% - le vecteur phis la liste des angles verticaux

WIDTH = length(thetas);
HEIGTH= length(phis);

epsilon = 10e-9;

OUT_OF_RANGE = 999; % REGION_ID DE OUT_OF_RANGE

% Tout d'abord marquer les out-of-range
n = length(SAMPLES);

for i = 1 : n
    if ~any(SAMPLES(i,1:3))
        SAMPLES(i,4) = OUT_OF_RANGE;
    end
end

% Cette variable contient les régions détectées
% ainsi que leur parametre
% format: [a b c d]
% L'index est le numéro de ligne.

global REGIONS;

leftSamples = SAMPLES(1:WIDTH:end,:);
rightSamples = SAMPLES(WIDTH:WIDTH:end, :);

sides = [leftSamples;rightSamples];
sides = removeOutOfRange(sides);

[params, misfit] = findParams(sides);

if misfit < epsilon
    regionId = regionAddIfNeeded
    SAMPLES(1:WIDTH:end,4) = regionId;
    SAMPLES(WIDTH:WIDTH:end, 4) = regionsId;
end





 
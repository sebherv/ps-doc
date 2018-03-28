function [ regionId ] = regionsAddIfNeeded( PARAMS )
% Adds a region to the list of regions if needed

global REGIONS;
epsilon = 10e-9;

rows = size(REGIONS,1);

regionId = 0;

normalVectorNorm = sqrt( PARAMS(1:3)' * PARAMS(1:3));
normPARAMS = PARAMS'/normalVectorNorm;

n = 1;
for region = REGIONS
    diff = region - normParam;
    err = diff'*diff;
    if(err < epsilon)
        regionId = n;
    end
    n = n + 1;
end

if regionId == 0
    REGIONS = [REGIONS;normPARAMS];
    regionId = size(REGIONS,1);
end
end


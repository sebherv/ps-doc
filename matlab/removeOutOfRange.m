function [ FILTERED_SAMPLES ] = removeOutOfRange( RAW_SAMPLES )
%REMOVEOUTOFRANGE Summary of this function goes here
%   Detailed explanation goes here


n = length(RAW_SAMPLES);
FILTERED_SAMPLES = zeros(0,4);

for i = 1 : n
    
    current = RAW_SAMPLES(i,:);
    if any(current(1:3))
        FILTERED_SAMPLES = [FILTERED_SAMPLES ; current];
    end
end

end


function [ x, G ] = generateG( CUR_SAMPLES, startIndex )
% G�n�re la matrice G et le vecteur X pour les donn�es
% pass�es en argument.
% si i = 1, g�n�rera pour trouve zn = [xn yn 1][a;b;c]
% si i = 2, on g�n�rera xn = [yn zn 1][a;b;c]
% si i = 3, on g�n�rera yn = [zn xn 1][a;b;c]

if startIndex == 1
    i = 1; j = 2; k = 3;
elseif startIndex == 2
    i = 2; j = 3; i = 1;
elseif startIndex == 3
    i = 3; j = 1; k = 2;
end

x = CUR_SAMPLES(:, k );

G = [CUR_SAMPLES(:,i) CUR_SAMPLES(:,j) ones(length(CUR_SAMPLES),1)];

end


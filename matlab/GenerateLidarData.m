% L'idée: parcourir un scan de rayons, à partir d'un model de mur

clear; close all;

% Données du mur, en metres
hWall = 1.5; % height - hauteur
lWall = 10;  % lenght, longueur
wWall = 0.5; % width, largeur

Xmax = lWall / 2;
Xmin = - Xmax;
Yw = - wWall;
Zw = hWall;

% Nous faisons les hypothèses suivantes:
% - les faces du mur sont bien perpendiculaires
% - le mur est orienté selon l'axe des X, centré.
% - la mur est "contre" l'axe des x, une des face à x = 0 et
% l'autre à x = wWall;

% Données du lidar
Mz = 1; % Hauteur du Lidar
Mx = 0; 
My = 10;

capLidar = 180; % cap en degrés
assLidar = 0; % inclinaison en degrés 

vertOuv = 30; % ouverture verticale en degrés
horiOuv = 140; % ouverture horizontale en degrés
echHori = 100;
echVert = 40;

% échantillons horizontaux:
thetaMin = degtorad((capLidar + 90) - (horiOuv /2));
thetaMax = degtorad((capLidar + 90) + (horiOuv /2));
thetas = linspace(thetaMin, thetaMax, echHori);


% échantillons verticaux:
phiMin = degtorad(-assLidar - vertOuv/2);
phiMax = degtorad(-assLidar + vertOuv/2);
phis = linspace(phiMin, phiMax, echVert);

% Init le tableau des echantillons
global SAMPLES;
SAMPLES = zeros(0,4); % les 3 coordonnées spatiales + 1 index de région


for phi = phis
    for theta = thetas
        % Calculer intersection avec façade
        z0 = Mz - My * tan(phi);
        x0 = Mx - My/tan(theta);
        
        % SI intersection avec façade, retourner
        if z0 > 0 && z0 < Zw && x0 > Xmin && x0 < Xmax
            x = x0;
            y = 0;
            z = z0;
            
        % Ajouter l'échantillon à la liste
        SAMPLES = [SAMPLES; [x y z 0]];
            
        else
            %Calculer intersection avec le sol
            y = My - Mz/tan(phi);
            x = Mx + (y - My)/tan(theta);
            z = 0;
            
            % Ajouter l'échantillon à la liste seulement si il est devant
            % le lidar
            if(y < My)
                SAMPLES = [SAMPLES; [x y z 0]];
                
            else
                SAMPLES = [SAMPLES; [0 0 0 0]]; % Le point mesuré est considéré hors de portée
            end
        
        end % SI intersction façade
        

    end;
end;

scatter3(SAMPLES(:,1), SAMPLES(:,2), SAMPLES(:,3))


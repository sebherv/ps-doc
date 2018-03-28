% L'id�e: parcourir un scan de rayons, � partir d'un model de mur

clear; close all;

% Donn�es du mur, en metres
hWall = 1.5; % height - hauteur
lWall = 10;  % lenght, longueur
wWall = 0.5; % width, largeur

Xmax = lWall / 2;
Xmin = - Xmax;
Yw = - wWall;
Zw = hWall;

% Nous faisons les hypoth�ses suivantes:
% - les faces du mur sont bien perpendiculaires
% - le mur est orient� selon l'axe des X, centr�.
% - la mur est "contre" l'axe des x, une des face � x = 0 et
% l'autre � x = wWall;

% Donn�es du lidar
Mz = 1; % Hauteur du Lidar
Mx = 0; 
My = 10;

capLidar = 180; % cap en degr�s
assLidar = 0; % inclinaison en degr�s 

vertOuv = 30; % ouverture verticale en degr�s
horiOuv = 140; % ouverture horizontale en degr�s
echHori = 100;
echVert = 40;

% �chantillons horizontaux:
thetaMin = degtorad((capLidar + 90) - (horiOuv /2));
thetaMax = degtorad((capLidar + 90) + (horiOuv /2));
thetas = linspace(thetaMin, thetaMax, echHori);


% �chantillons verticaux:
phiMin = degtorad(-assLidar - vertOuv/2);
phiMax = degtorad(-assLidar + vertOuv/2);
phis = linspace(phiMin, phiMax, echVert);

% Init le tableau des echantillons
global SAMPLES;
SAMPLES = zeros(0,4); % les 3 coordonn�es spatiales + 1 index de r�gion


for phi = phis
    for theta = thetas
        % Calculer intersection avec fa�ade
        z0 = Mz - My * tan(phi);
        x0 = Mx - My/tan(theta);
        
        % SI intersection avec fa�ade, retourner
        if z0 > 0 && z0 < Zw && x0 > Xmin && x0 < Xmax
            x = x0;
            y = 0;
            z = z0;
            
        % Ajouter l'�chantillon � la liste
        SAMPLES = [SAMPLES; [x y z 0]];
            
        else
            %Calculer intersection avec le sol
            y = My - Mz/tan(phi);
            x = Mx + (y - My)/tan(theta);
            z = 0;
            
            % Ajouter l'�chantillon � la liste seulement si il est devant
            % le lidar
            if(y < My)
                SAMPLES = [SAMPLES; [x y z 0]];
                
            else
                SAMPLES = [SAMPLES; [0 0 0 0]]; % Le point mesur� est consid�r� hors de port�e
            end
        
        end % SI intersction fa�ade
        

    end;
end;

scatter3(SAMPLES(:,1), SAMPLES(:,2), SAMPLES(:,3))


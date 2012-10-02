function V  = mdf(m, n, er1, er2, d, w, tol)
    
    %Creation des matrices et des variables
    V = zeros(n+1, m+1);
    permitivityMatrix = zeros(n+1, m+1);
    oldMatrix = zeros(n+1, m+1);
    tolerence = false;
    
    %Remplissage des permitivites
    if d == 0; 
        permitivityMatrix(2:n, 2:m) = er2;
    else
        permitivityMatrix(2:n-d, 2:m) = er2;
        permitivityMatrix(n+1-d:n, 2:m) = er1;
    end
    
    %Position du conducteur, de la permitivite du conducteur et du potentiel
    halfW = floor((w+1)/2);
    if mod(m+1,2) == 0
        halfM = (m+1)/2;
    else
        halfM = floor((m+1)/2);
    end    
    V(n+1-d, halfM+1-halfW:halfM+w+1-halfW) = 1;
    
    %Calcul du potentiel de chaque point
    while tolerence == false,
        for i=2:n,
            for j=2:m,
                %Calcul du potentiel du point avec sauvegarde de l'ancienne
                %valeur pour le calcul de tolerence.
                oldMatrix(i,j) = V(i,j);
                
                %Sur le conducteur
                if( i == (n+1-d) && ...
                  ( j >= halfM+1-halfW && j <=  halfM+w+1-halfW))
                    V(i,j) = 1;
                %Sur la ligne de separation du dielectrique
                elseif (i == n+1-d)
                    V(i,j) = (V(i,j-1) + V(i,j+1))/4 + ...
                    (permitivityMatrix(i+1,j) * V(i+1,j) + ...
                    permitivityMatrix(i-1,j) * V(i-1,j))/(2*(er2+er1));
                %Sur le reste
                else
                    V(i,j) = (V(i,j-1) + V(i,j+1) + V(i+1,j) + V(i-1,j))/4;
                end              
            end
        end
        
        %Verification de la tolerence : différence entre chaques matrices
        %et extraction de la valeur maximale
        if(max(abs(oldMatrix - V)) < tol)
            tolerence = true;
        else
            tolerence = false;
        end
    end
end


function C = IGauss(V, er1, er2, d, w)
    %Largeur et hauteur de la matrice avec correction
    [n,m] = size(V);
    n = n-1;
    m = m-1;
    
    %Milieu du systeme
    if mod(m+1,2) == 0
        halfM = (m+1)/2;
    else
        halfM = floor((m+1)/2);
    end 
    
    %Definition des constante
    e0 = 8.854*(10^(-12));
    Vab = V(n+1-d,halfM);
    
    %Remplissage des permitivites
    permitivityMatrix = zeros(n+1, m+1);
    if d == 0; 
        permitivityMatrix(2:n, 2:m) = er2;
    else
        permitivityMatrix(2:n-d, 2:m) = er2;
        permitivityMatrix(n+1-d, 2:m) = (er1+er2)/2;
        permitivityMatrix(n+2-d:n, 2:m) = er1;
    end
    
    %Calcul du potentiel pour le pourtour du systeme
    tourPotential = 0;

    %Nord et Sud
    for i=2:m   
        tourPotential = tourPotential + permitivityMatrix(n,i)*V(n,i);
        tourPotential = tourPotential + permitivityMatrix(2,i)*V(2,i);
    end
    
    %Est et Ouest
    for i=2:n
        tourPotential = tourPotential + permitivityMatrix(i,2)*V(i,2);
        tourPotential = tourPotential + permitivityMatrix(i,m)*V(i,m);
    end
    
    %Calcul de la capacite
    C = e0/Vab*tourPotential; 
end
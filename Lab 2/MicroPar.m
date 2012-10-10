function [Z_o, v_p] = MicroPar(m, n , er1, er2, d, w, tol)
    %Declaration des constantes
    c = 3*(10^8);
    
    %Creation des deux matrices de potentiel. La premiere avec une
    %permitivite dans le vide et l'autre avec les permitivites originales
    V_vide = mdf(m,n,1,1,d,w,tol);
    Vp_orig = mdf(m,n,er1,er2,d,w,tol);
    
    %Calcul des deux differentes capacites
    C0 = IGauss(V_vide,1,1,d,w);
    C = IGauss(Vp_orig,er1,er2,d,w);
    
    Z_o = 1/(c*sqrt(C0*C));
    v_p = c*sqrt(C0/C);
end

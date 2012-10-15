%Création des graphiques

%Cas 1 ( w fixe à 2 et d variable)
d = [2,4,6,10,20];
vecteur_z0 = zeros(5);
vecteur_vp = zeros(5);

for i=1:5
[vecteur_z0(i) vecteur_vp(i)] = MicroPar(80, 60 , 12, 1, d(i), 2, 0.000001);
end
figure;
subplot(2,1,1);
[ax, h1, h2] = plotyy(d, vecteur_z0, d, vecteur_vp, 'semilogx');
title('Z_0 et v_p en fonction de d, pour w =2');
xlabel('d (unite)');
set(get(ax(1),'Ylabel'),'String','Z_0 (Ohm)') 
set(get(ax(2),'Ylabel'),'String','v_p (m/s)') 

% Cas 2 ( w fixe à 2 et w variable)
w = [3,4,6,10,20];
vecteur_z01 = zeros(5);
vecteur_vp1 = zeros(5);

for j=1:5
[vecteur_z01(j) vecteur_vp1(j)] = MicroPar(80, 60 , 12, 1, 2, w(j), 0.000001);
end
subplot(2,1,2);
[ax1, h3, h4] = plotyy(d, vecteur_z0, d, vecteur_vp, 'semilogx');
title('Z_0 et v_p en fonction de w, pour d =2');
xlabel('w (unite)');
set(get(ax1(1),'Ylabel'),'String','Z_0 (Ohm)') 
set(get(ax1(2),'Ylabel'),'String','v_p (m/s)') ;


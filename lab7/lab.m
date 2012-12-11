m = 0:6;
n = 0:6;
a = 22.86/1000;
b = 10.16/1000;
vp = 3*10^8;
fc = zeros(7,7);

for i=m
    for j=n
       fc(i+1,j+1) = vp/2*sqrt((i/a)^2+(j/b)^2);
    end
end

fc2 = zeros(3,1);
fc2(1) = fc(2,1);
fc2(2) = fc(3,1);
fc2(3) = fc(1,2);


f = 0:1*10^9:25*10^9;
lambda = vp./f;
lambda_g = zeros(3,26);
for k = 1:3
    lambda_g(k,:) = real(lambda./sqrt(1-(fc2(k)./f).^2));
end

vpz = zeros(3,26);
for k = 1:3
    vpz(k,:) = real(vp./sqrt(1-(fc2(k)./f).^2));
end

vg = vp^2./vpz;

eta = zeros(3,26);

for k = 1:3
    eta(k,:) = real(377./sqrt(1-(fc2(k)./f).^2));
end

syms x
test = -0.2739*x^6 + 2.5479*x^5 - 8.6836*x^4 + 13.553*x^3 - 11.174*x^2 + 1.145*x - 30.8136;
solve(test,x)
%{
Section 6.3 の実験スクリプト
Sobol列、order 2 Sobol列、格子 によるQMC積分の誤差を比較する。
%}

%以下はパラメータ（手で変更する）
mmax = 20;
s = 4;
c = 2.5;
%weights = 1./(1:s).^2;
weights = ones(1,s);
integrand = @Sobolev_c;
%ここまでパラメータ（手で変更する）

Sob_err = Errors(integrand,s,weights,c,"Sobol",mmax); 
HoS_err = Errors(integrand,s,weights,c,"HOSobol",mmax); 
Lat_err = Errors(integrand,s,weights,c,"Lattice",mmax); 

III = (1:mmax);
f1 = figure;
hold on
plot(III, log2(Sob_err))
plot(III, log2(HoS_err))
plot(III, log2(Lat_err))
plot(III, -III)
plot(III, -2*III)
legend('Sobol','HOSobol','Lattice','1/N','1/N^2')
xlabel('log2(number of points)')
ylabel('log2(Error)')


%{
汎用実験ファイル
各種QMCの積分誤差をグラフ化するスクリプト
%}

%以下はパラメータ（手で変更する）
mmax = 20;
s = 19;
c = 1/3;
weights = 1./(1:s).^2;
%weights = ones(1,s);
integrand = @expsum;
%ここまでパラメータ（手で変更する）

Sob_err = Errors(integrand,s,weights,c,"Sobol",mmax); 
HoS_err = Errors(integrand,s,weights,c,"HOSobol",mmax); 
Lat_err = Errors(integrand,s,weights,c,"Lattice",mmax); 
MC_err  = Errors(integrand,s,weights,c,"Random",mmax); 
Hal_err = Errors(integrand,s,weights,c,"Halton",mmax); 

III = (1:mmax);

f1 = figure;
hold on
plot(III, log2(Sob_err))
plot(III, log2(HoS_err))
plot(III, log2(Lat_err))
plot(III, log2( MC_err))
plot(III, log2(Hal_err))
plot(III, -III)
plot(III, -1/2*III)
legend('Sobol','HOSobol','Lattice','MC','Hal','1/N','1/sqrt(N)')
xlabel('log2(number of points)')
ylabel('log2(Error)')


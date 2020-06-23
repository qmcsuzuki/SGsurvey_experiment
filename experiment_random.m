%{
RQMC(& MC)の比較をするスクリプト
Section 6.2 [乱択化QMCの例] が確認できる
Scrambled Sobol, shifted lattice, Monte Carlo を比較する
%}

addpath('./integrands')
%以下はパラメータ（手で変更する）
R = 10; % number of repetitions
mmax = 20;
s = 20;
c = 1.5;
%weights = 1./(1:s).^2;
weights = ones(1,s);
integrand = @expsum;
%ここまでパラメータ（手で変更する）

%誤差の計算
Sob_err = RQMCErrors(integrand,s,weights,c,"ScrambledSobol",mmax,R); 
Lat_err = RQMCErrors(integrand,s,weights,c,"Lattice+shift",mmax,R); 
MC_err  = RQMCErrors(integrand,s,weights,c,"Random",mmax,R); 


% グラフを作成
III = (1:mmax);
f1 = figure;
hold on
plot(III, log2(Sob_err))
plot(III, log2(Lat_err))
plot(III, log2( MC_err))
plot(III, -III)
plot(III, -2*III)
plot(III, -3*III)
legend('Sobol','Lattice','MC','1/N','1/N^2','1/N^3')
xlabel('log2(number of points)')
ylabel('log2(Error)')


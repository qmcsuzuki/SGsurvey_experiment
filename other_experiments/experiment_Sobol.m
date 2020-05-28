%{
目的：sobol列の各種バリアントの性能を調べる
結果：
おおむね理論通りの収束がみられる
%}

%以下はパラメータ（手で変更する）
mmax = 20;
s = 2;
c = 1.5;
weights = 1./(1:s).^2;
%weights = ones(1,s);
integrand = @prodroot;
%ここまでパラメータ（手で変更する）

%誤差の計算
Sob_err = Errors(integrand,s,weights,c,"Sobol",mmax); 
Sobshi_err = Errors(integrand,s,weights,c,"Sobol+shift",mmax); 
%HoS_err = Errors(integrand,s,weights,c,"HOSobol",mmax); 
ScrSob_err = Errors(integrand,s,weights,c,"ScrambledSobol",mmax); 

% グラフを作成
III = (1:mmax);
f1 = figure;
hold on
plot(III, log2(Sob_err))
plot(III, log2(Sobshi_err))
plot(III, log2(ScrSob_err))
plot(III, -III)
legend('Sobol','Sob+shift','Scrambled','1/N')
xlabel('log2(number of points)')
ylabel('log2(Error)')


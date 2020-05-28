%{
目的：
Halton列と各種スクランブルの性能を調べる
結果:
おおむね、（よい）leap > scramble > 生Halton （悪い）
%}


%以下はパラメータ（手で変更する）
mmax = 20;
s = 10;
c = 1/3;
%weights = 1./(1:s).^2;
weights = ones(1,s);
integrand = @expsum;
%ここまでパラメータ（手で変更する）


%誤差の計算
Halton_err = Errors(integrand,s,weights,c,"Halton",mmax); 
LeaHal_err = Errors(integrand,s,weights,c,"LeapedHalton",mmax); 
ScrHal_err = Errors(integrand,s,weights,c,"ScrambledHalton",mmax); 


% グラフを作成
III = (1:mmax);
f1 = figure;
hold on
plot(III, log2(Halton_err))
plot(III, log2(LeaHal_err))
plot(III, log2(ScrHal_err))
plot(III, -III)
legend('Halton','Leaped','ScrHal','1/N')
xlabel('log2(number of points)')
ylabel('log2(Error)')


%{
目的1：
Lattice, badLattice,Lattice_seq Lattice+Shiftの性能をしらべる
目的2：
badLatticeは本当に悪いのか？
結果：
weights = 1./(1:s) で expsumを積分すると、明らかに悪い結果となる。
%}

%以下はパラメータ（手で変更する）
mmax = 20;
s = 20;
c = 3;
weights = 1./(1:s).^2;
%weights = ones(1,s);
integrand = @Sobolev_c;
%ここまでパラメータ（手で変更する）

%誤差の計算
Lat_err = Errors(integrand,s,weights,c,"Lattice",mmax); 
Bad_err  = Errors(integrand,s,weights,c,"badLattice",mmax); 
LatShift_err = Errors(integrand,s,weights,c,"Lattice+shift",mmax); 
Latseq_err = Errors(integrand,s,weights,c,"Lattice_seq",mmax); 


% グラフを作成
III = (1:mmax);
f1 = figure;
hold on
plot(III, log2(Lat_err))
plot(III, log2(Bad_err))
plot(III, log2(LatShift_err))
plot(III, log2(Latseq_err))
plot(III, -III)
legend('lattice','bad lattice','lattice+shift','lattice sequence','1/N')
xlabel('log2(number of points)')
ylabel('log2(Error)')

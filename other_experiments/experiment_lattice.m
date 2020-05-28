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



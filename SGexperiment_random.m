R = 10; % number of repetitions
mmax = 20;
s = 10;
c = 1.5;
weights = 1./(1:s).^2;
%weights = ones(1,s);
integrand = @Bernoulli6;

%integrand = Sobolev_c(s,weights,3);
%integrand = expsum(s,weights,0);
%integrand = Discontinuous(s,weights,1/3);
%integrand = Bernoulli2(s,weights,0);
%integrand = cossum(s,weights,0);
%integrand = G_function(s,weights,0);
%integrand = prodroot(s,weights,0);

Sob_err = RQMCErrors(integrand,s,weights,c,"ScrambledSobol",mmax,R); 
Lat_err = RQMCErrors(integrand,s,weights,c,"Lattice+shift",mmax,R); 
MC_err  = RQMCErrors(integrand,s,weights,c,"Random",mmax,R); 


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


wt = "";
if weights == 1./(1:s).^2
    wt = "weighted";
end
if func2str(integrand) == "Sobolev_c"
    if isinteger(c)
        sob_c = num2str(c);
    else
        sob_c = erase(num2str(c),".");
    end
else
    sob_c = "";
end

name = strcat("Random_",func2str(integrand),sob_c,"_s",num2str(s),wt);
SaveFigPDF(f1,name)








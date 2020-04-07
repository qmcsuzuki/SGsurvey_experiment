mmax = 20;
s = 19;
c = 1/3;
weights = 1./(1:s).^2;
%weights = ones(1,s);
integrand = @conti3_nonper;

%integrand = Sobolev_c(s,weights,3);
%integrand = expsum(s,weights,0);
%integrand = Discontinuous(s,weights,1/3);
%integrand = Bernoulli2(s,weights,0);
%integrand = cossum(s,weights,0);
%integrand = G_function(s,weights,0);
%integrand = prodroot(s,weights,0);

tic
Halton_err = Errors(integrand,s,weights,c,"Halton",mmax); 
toc
tic
LeaHal_err = Errors(integrand,s,weights,c,"LeapedHalton",mmax); 
toc
tic
ScrHal_err = Errors(integrand,s,weights,c,"ScrambledHalton",mmax); 
toc
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

name = strcat('Halton_',func2str(integrand),sob_c,"_s",num2str(s),wt);
SaveFigPDF(f1,name)








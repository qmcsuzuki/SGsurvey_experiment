function MSerr = RQMCErrors(integ,s,weights,c,type,mmax,R)

integrand = integ(s,weights,c);
err = zeros(R,mmax);

switch type
    case "ScrambledSobol"
        for m = 1:mmax
            N = pow2(m); % Number of points
            for i = 1:R
                P = scramble(sobolset(s),'MatousekAffineOwen');
                err(i,m) = integrand(net(P,N));
            end
        end
    case "Lattice+shift"
        for m = 1:mmax
            P = LatticePoints(m,s);
            for i = 1:R
                shift = rand(1,s);
                err(i,m) = integrand(mod(P+shift,1));
            end
        end
    case "Random"
        for m = 1:mmax
            N = pow2(m); % Number of points
            for i = 1:R
                err(i,m) = integrand(rand(N,s));
            end
        end
end

MSerr = var(err)/R;        
end

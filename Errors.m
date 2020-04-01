function err = Errors(integ,s,weights,c,type,mmax)

integrand = integ(s,weights,c);

err = zeros(1,mmax);
switch type
    case "Sobol"
        P = sobolset(s);
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(net(P,N)));
        end
    case "HOSobol"
        for m = 1:mmax
            err(m) = abs(integrand(HOSobol(m,s,2)));
        end
    case "Lattice"
        for m = 1:mmax
            err(m) = abs(integrand(LatticePoints(m,s)));
        end
    case "Random"
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(rand(N,s)));
        end
end

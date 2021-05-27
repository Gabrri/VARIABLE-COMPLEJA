function m = maximo(M)
    m = M(1);
        for i=2:length(M)
            if (M(i) > m)
                 m = M(i);
            end
        end
end
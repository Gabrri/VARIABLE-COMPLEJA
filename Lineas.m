function [X,Y]= Lineas(p1,p2,n)
    lambda = linspace(0,1,n);
    for i=1:length(lambda)
        X(i) = lambda(i)*(p1(1))+(1-lambda(i))*p2(1);
        Y(i) = lambda(i)*(p1(2))+(1-lambda(i))*p2(2);
    end
end
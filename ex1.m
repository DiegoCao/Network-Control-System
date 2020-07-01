function ex1()
a=input('');
b=input('');
c=input('');
d=input('');
f=@(x)a*x^3+b*x^2+c*x+d;
x0=-100;
x1=-

end

function re = recu(invl, f)
a = invl(1); b = invl(2); c = mean(invl);
if abs(a-b)<1e-5
    re = c;
else
    tmp = ([c b;a c]);
    re = recu(tmp((f(a)*f(c)>0)+1,:),f);
end
end
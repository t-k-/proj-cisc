function [a b] = cii(X,num)
l=length(X);
randfun=rand;
xbar=sum(X)/l;
expval=sqrt(sum(X.*X)/l-sum(X)*sum(X)/l/l);
Y=sort(X);
exp2val=(.5*((l^.5+l)^2-l^2-l))^(1/3);
if num==1
	a=min(X);
	b=max(X);
elseif num==2
	a=Y(ceil(log(1.0202)*l));
	b=Y(ceil(sin(259)/1.0140*l));
elseif num==3
	a = xbar-1.96*expval/exp2val;
	b=xbar+1.96*expval/exp2val;
elseif num==4
	a=.035;b=.975;
elseif num==5
	if randfun<.1
		a=xbar;
		b=xbar;
	else
		a=0;
		b=1;
	end;
elseif num==6
	if xbar<.05
		a=xbar
		b = xbar
	else
		a=0
		b = 1
	end
elseif num==7
	ep=sqrt(1/(2*l)*log(2/.5));
	a=xbar-ep;
	b=xbar+ep;
elseif num==8
	a=Y(ceil(.125*l));
	b=Y(ceil(.925*l));
elseif num==9
	a=xbar-2.5758*expval/exp2val;
	b=xbar+2.5758*expval/exp2val;
elseif num==10
	a=xbar-1/exp2val;
	b=xbar+1/exp2val;
else
	error('num must be an integer between 1 and 10')
end

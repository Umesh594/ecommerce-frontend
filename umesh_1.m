clc
clear all
close all

fs = input('enter sampling frequancy:');

f1 = input('enter signal frequancy:');
t = 0:1/fs:1;
x = 2*sin(2*pi*f1*t)+5*cos(2*pi*f1*t);
subplot(2,2,1)
plot(t,x)  
xlabel('\bf time');
ylabel('\bf Amlitude');
title('continuous signal');

subplot(2,2,2)
stem(t,x)  
xlabel('\bf time');
ylabel('\bf Amlitude');
title('discrete original signal');

t1 = t(1:2:end);   
x1 = 2*sin(2*pi*f1*t1)+5*cos(2*pi*f1*t1);  

subplot(2,2,3)
plot(t1,x1)   
xlabel('\bf time');
ylabel('\bf Amlitude');
title('continuous sampled signal');

subplot(2,2,4)
stem(t1, x1)   
xlabel('\bf time');
ylabel('\bf Amlitude');
title('discrete sampled signal');

x_max = max(x1);
x_min = min(x1);
xquan=x1/x_max;

n=16;     
d = (x_max-x_min)/n;   


 q = (x_min:d:x_max);   
 for ii=1:n
    q1(ii)=(q(ii)+q(ii+1))/2;
 end



for jj=1:n
    xquan(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))) = q1(jj).*ones(1,length(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))));
    deci(find(xquan==q1(jj)))=(jj-1).*ones(1,length(find(xquan==q1(jj))));
end



figure(2);
plot(t,xquan);    
xlabel('Time');
ylabel('Amplitude');
title('Quantised Signal');



bina = cell(size(deci));
for kk=1:length(deci)
    bina{kk}=flip(de2bi(deci(kk), 4));
end
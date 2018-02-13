%Engin Yýlmaz 15253069 Arka Sesi kaldýrýp bir tek winter is coming sesi duyulur.
%Ýþaret Ýþleme Bonus Ödevi.
%Sesi Yükselterek dinleyiniz.
close all
clear all,clc

[xn fs]=audioread('kay_t.wav'); %Çalýþmassa wavread yerine deneyebilirsiniz. 
nf=1000; 

Y = fft(xn,nf);
f = fs/2*linspace(0,1,nf/2+1);
%Ses('winter is coming');
%figure();

N=size(xn,1);

df=fs/N;
w=(-(N/2):(N/2)-1)*df;
y=fft(xn(:,1),N)/N;
y2=fftshift(y);
%figure;

n=5;

beginFreq=6000/(fs/2);
endFreq=10000/(fs/2);
[b,a]=butter(n,[beginFreq,endFreq],'bandpass');

fOut=filter(b,a,xn);
p=audioplayer(fOut,fs);
p.play;
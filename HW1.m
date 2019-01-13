%Part 1
%Variables
A = 1;              %Amplitude 1V
F = 1000*10^6;      %Frequency 1000 MHz
Fs = 50*F;          %Sampling Frequency
Ts = 1/Fs;          %Time sampling
T0 = 0;             %Start Time 0sec
Tf = 20*10^(-9);    %End Time 20ns
P = 30*(pi/180);    %Phase shift 30 degrees
t = (T0:Ts:Tf);     %Time vector   (start:stepsize:stop)

%Plot cosine waveform
y = A*cos(2*pi*F*t+P);
figure(1)
plot(t,y);
title('1 GHz Cosine waveform between 0 and 20 ns');
xlabel('Time (ns)');
ylabel('Magnitude');
L=length(y)

%Calculate Power
power = sum(abs(y).^2)/length(y);

%Plot Power Spectral Density
S = (abs(fft(y))).^2;
freq = [-L/2:1:L/2-1]*Fs/L;
figure(2)
plot(freq,S);
title('Spectrum of Cosine waveform');
xlabel('Frequency');
ylabel('Magnitude');

%Part 2
%Plot square and triangular waveform
figure(3)
plot(t,square(2*pi*F*t));
plot(t,sawtooth(2*pi*F*t,0.5));
title('Square and triangular waveforms');
xlabel('Time (ns)');
ylabel('Magnitude');


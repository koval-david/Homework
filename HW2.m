fc = 20000;                     %Carrier frequency = 20 KHz
fm = 1000;                      %Modulating frequency = 1 KHz
fs = 50*fc;                     %Sampling frequency
ti = 0;                         %Intial time = 0 ms
tf = 0.002;                     %Final time = 2 ms
ts = 1/fs;                      %Sampling time
t = (ti:ts:tf-ts);              %Time vector

%1 amplitude modulated waveform (AM), K = 2V DC
K = 2;

m_t = cos(2*pi*fm*t);
c_t = cos(2*pi*fc*t);
s_t_1 = (m_t + K).*c_t;

spec_s_t_1 = (abs(fft(s_t_1))).^2;
L1=length(s_t_1);
freq1 = [-L1/2:1:L1/2-1]*fs/L1;
figure(1);
plot(freq1, spec_s_t_1);
title("Frequency spectrum of AM signal");
xlabel('Frequency');
ylabel('Magnitude');

figure(2);
subplot(3, 1, 1);
plot(t, m_t);
title("Subplot 1: modulating signal m(t)");
xlabel('Time (s)');
ylabel('Amplitude (volts)');

subplot(3, 1, 2);
plot(t, c_t);
title("Subplot 2: carrier signal c(t)");
xlabel('Time (s)');
ylabel('Amplitude (volts)');

subplot(3, 1, 3);
plot(t, s_t_1);
title("Subplot 3: amplitude modulating (AM) signal s(t)=subplot 1 + subplot 4");
xlabel('Time (s)');
ylabel('Amplitude (volts)');

%2 frequency modulated waveform (FM), A = 1 V (amplitude)
A = 1;
int_m_t = cumsum(m_t);
Kf = 2/(max(int_m_t));

s_t_2 = A*cos(2*pi*fc*t + 2*pi*Kf*int_m_t);

spec_s_t_2 = (abs(fft(s_t_2))).^2;
L2=length(s_t_2);
freq2 = [-L2/2:1:L2/2-1]*fs/L2;
figure(3);
plot(freq2, spec_s_t_2);
title("Frequency spectrum of FM signal");
xlabel('Frequency');
ylabel('Magnitude');

figure (4);
subplot(3, 1, 1);
plot(t, m_t);
title("Subplot 1: modulating signal m(t)");
xlabel('Time (s)');
ylabel('Amplitude (volts)');

subplot(3, 1, 2);
plot(t, c_t);
title("Subplot 2: carrier signal c(t)");
xlabel('Time (s)');
ylabel('Amplitude (volts)');

subplot(3, 1, 3);
plot(t, s_t_2);
title("Subplot 3: frequency modulating (FM) signal s(t)=subplot 1 + subplot 2");
xlabel('Time (s)');
ylabel('Amplitude (volts)');

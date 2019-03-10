A = 1;                          %Amplitdue 1 V
c = 3*10^8;                     %Speed of light
B = 150*10^6;                   %Bandwidth
fm = 1000;                      %Modulating frequency = 1 KHz
fc = 20000;                     %Carrier frequency = 20 KHz
fs = 50*fc;                     %Sampling frequency
ts = 1/fs;                      %Sampling time
ti = 0;
tf = 0.002;
t = (0:ts:0.002-ts);            %Time vector
Rinit = 2;

% File
filename = 'Bone_Data.xlsx';

% Battery Values: Ah | Volts
Bone_Data = xlsread(filename);

delta_theta = B/fc;
omega = delta_theta/tf;

m_t = cos(2*pi*fm*t);
int_m_t = cumsum(m_t);
Kf = 2/(max(int_m_t));

s_t = A*cos(2*pi*fc*t + 2*pi*Kf*int_m_t);

L=length(s_t);
spec_s_t_2 = (fftshift(abs(fft(s_t))).^2)/(L^2);
freq2 = [-L/2:1:L/2-1]*fs/L;

figure(1);
plot(t, s_t);
title("Linear frequency modulating (FM) signal");
xlabel('Time (s)');
ylabel('Amplitude (volts)');

figure(2);
plot(freq2, spec_s_t_2);
title("Frequency spectrum of FM signal");
xlabel('Frequency');
ylabel('Magnitude');

Rk = (Bone_Data(:,1))';
theta_degrees = (Bone_Data(:,2))';
Tk = (2.*Rk)./c;

Rck = Rk./cosd(theta_degrees);
fdk = 2*omega.*Rck.*sind(theta_degrees);

% y = Rk.*tand(theta_degrees);

% figure(3);
% plot(Rk, y,'LineStyle', 'none','Marker', 'o','MarkerSize', 3);

N = (Tk.*fs);
stnew = [s_t zeros(1,3*L)];
rt = zeros(1,3*L);
for i = 1:1:size(N,2)
    rt = rt + [zeros(1,N(i)) stnew(1:end-N(i))];
end

tfnew=8000;
tnew=(ti:ts:tfnew*ts-ts);


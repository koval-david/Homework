fc = 20000;         %Carrier frequency = 20 KHz
fm = 1000;          %Modulating frequency = 1 KHz
fs = 50*fc;         %Sampling frequency
ti = 0;             %Intial time = 0 ms
tf = 0.002;         %Final time = 2 ms
ts = 1/fs;          %Sampling time
t = (ti:ts:tf-ts);  %Time vector

%1, K = 2V
K = 2;              %K = 2 V DC

m_t = cos(2*pi*fm*t);
c_t = cos(2*pi*fc*t);
s_t_1 = (m_t + K).*c_t;

figure(1);
plot(t, m_t);
figure(2);
plot(t, s_t_1);

%2, A = 1 V
A = 1;
int_m_t = cumsum(m_t);
Kf = 2/(max(int_m_t));

s_t_2 = A*cos(2*pi*fc*t + 2*pi*Kf*int_m_t);

figure (3);
plot(t, s_t_2);

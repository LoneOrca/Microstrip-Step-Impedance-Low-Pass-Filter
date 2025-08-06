%-------------------------------------
% 620094-Srinivas N 
%-------------------------------------
%EE 414- 514 Project 1 LPF Ideal Lumped Elements
%-------------------------------------

clearvars
clc
close all
%-------------------------------------

% Units 
%-------------------------------------

G = 10^9;
Meg = 10^6;
k = 10^+3;
c = 10^-2;
m = 10^-3;
u = 10^-6;
n = 10^-9;
IFigure = 0;
NF = 32;

%f_min = 1;
%f_max = 2*G;

dfreq = 1;
f_min = 0;
f_max = 16*G;
df = 5*Meg;
j = 1*j;
theta_P_f0 = 90;

RLmin = 22; % dB
S11_dB = -22;
RLmin_W = 10^(((S11_dB)/20));

S21min = sqrt(1-abs(RLmin_W)^2);

Print_Real('S21min',S21min,'W/W')

S21min_dB = 20*log10(S21min);

Print_Real('S21min_dB',S21min_dB,'dB')

%%
% %----------------------------------------------------------------------
% % S-values_Array
% %----------------------------------------------------------------------

fs = 12*G;
fp = 8*G;
Ap = 0.0275;
As = 25; % dB 
wp = 2*pi*fp;
Ap1 = 10^(Ap/10); % W/W
Xp = Ap1 - 1;
epsilon = sqrt(Xp);
Xs = (10^(As/10)-1);
Omega_s = fs/ fp;
NC = acosh(sqrt(Xs)/epsilon ) / acosh(abs(Omega_s)); %
N = ceil(NC);
NS = ceil(N/2);
c = 3e8; % Speed of light in m/s
% %----------------------------------------------------------------------
% % Parameters
% %----------------------------------------------------------------------

Z0 = 50;
Y0 = 1/Z0;
z0L = 25;
y0L = 1/z0L;
z0H = 100;
y0H = 1/z0H;
fc = 8*G;
wc = 2*pi*fc;
g0 = 1;
g1 = 0.8859;
g2 = 1.4217;
g3 = 1.8300;
g4 = 1.6372;
g5 = 1.8300;
g6 = 1.4217;
g7 = 0.8859;
g8 = 1.0000;
lambda = c / fc;
% %----------------------------------------------------------------------
% % Components
% %----------------------------------------------------------------------

C1 = (1/wc)*g1*Y0; % Shunt
C3 = (1/wc)*g3*Y0; % Shunt 
C5 = (1/wc)*g5*Y0; % Shunt
C7 = (1/wc)*g7*Y0; % Shunt
L2 = (1/wc)*g2*Z0; % Series
L4 = (1/wc)*g4*Z0; % Series
L6 = (1/wc)*g6*Z0; % Series

thetak1 = (Y0/y0L)*g1; %radians cap
thetak2 = (Z0/z0H)*g2; %radians ind
thetak3 = (Y0/y0L)*g3;
thetak4 = (Z0/z0H)*g4;
thetak5 = (Y0/y0L)*g5;
thetak6 = (Z0/z0H)*g6;
thetak7 = (Y0/y0L)*g7;


thetak1_degrees = rad2deg(thetak1);
thetak2_degrees = rad2deg(thetak2);
thetak3_degrees = rad2deg(thetak3);
thetak4_degrees = rad2deg(thetak4);
thetak5_degrees = rad2deg(thetak5);
thetak6_degrees = rad2deg(thetak6);
thetak7_degrees = rad2deg(thetak7);
%%
% %----------------------------------------------------------------------
% %
% %----------------------------------------------------------------------
freq = f_min : df : f_max;
freq = sort(freq);
freq = freq';
%I_f0_Amp = freq_Amp == f0;

N_Freq = length(freq);
S_Filter = zeros(N_Freq,2,2);
for kk = 1 : N_Freq
fk = freq(kk);
T0 = eye(2); % ?
T1 = EE414_ABCD_Shunt_C1(C1, fk);
T2 = EE414_ABCD_Series_L2(L2,fk);
T3 = EE414_ABCD_Shunt_C3(C3, fk);
T4 = EE414_ABCD_Series_L4(L4,fk);
T5 = EE414_ABCD_Shunt_C5(C5, fk);
T6 = EE414_ABCD_Series_L6(L6,fk);
T7 = EE414_ABCD_Shunt_C7(C7, fk);
T = T0*T1*T2*T3*T4*T5*T6*T7; 
S_Filter(kk, :, :) = ABCD_to_S(T, [Z0, Z0]); 
end
%-----------------------------------------------------------------------
S11_Filter = S_Filter(:,1,1);
S11_Filter_Mag = abs(S11_Filter);
S11_Filter_dB = 20*log10(S11_Filter_Mag);
S21_Filter = S_Filter(:,2,1);
S21_Filter_Mag = abs(S21_Filter);
S21_Filter_dB = 20*log10(S21_Filter_Mag);

% %----------------------------------------------------------------------
% % Plots
% %----------------------------------------------------------------------
%Rl = 
IFigure = IFigure + 1;
figure_max(IFigure)
plot(freq/G, S11_Filter_dB, 'g', 'linewidth', 6)
hold on
plot(freq/G, S21_Filter_dB, 'r', 'linewidth', 6)
y_limit = [-50, 0]; % Adjust the length of the lines as needed
line([fs/G, fs/G], y_limit, 'Color', 'k', 'LineStyle', '--', 'LineWidth', 4);
line([fp/G, fp/G], y_limit, 'Color', 'k', 'LineStyle', '--', 'LineWidth', 4);
plot(fp/G, interp1(freq/G, S21_Filter_dB, fp/G), 'ro', 'linewidth', 10);
plot(fs/G, interp1(freq/G, S21_Filter_dB, fs/G), 'ro', 'linewidth', 10);
plot(fs/G, interp1(freq/G, S11_Filter_dB, fs/G), 'go', 'linewidth', 10);
plot(fp/G, interp1(freq/G, S11_Filter_dB, fp/G), 'go', 'linewidth', 10);
hold off
grid on
grid minor 
xlabel('{\itf} (GHz) ')
ylabel('| {\itS}_{k1} | ( dB ) ', ...
'VerticalAlignment', 'bottom')
set(gca, 'FontName', 'times new roman', 'FontSize', NF)
legend('|{\itS}_{11}|','|{\itS}_{21}|')
axis([f_min/G, f_max/G, -50, 0])
set(gca, 'xtick', f_min/G : 0.5 : f_max/G);
set(gca, 'linewidth', 2.0)

f_max2 = 9*G;
IFigure = IFigure + 1;
figure_max(IFigure)
hold on
x_limit = [f_min/G, f_max2/G]; % Adjust the length of the lines as needed
plot(freq/G, S21_Filter_dB, 'r', 'linewidth', 6)
plot(fp/G, interp1(freq/G, S21_Filter_dB, fp/G), 'ro', 'linewidth', 10);
line([fp/G, fp/G], y_limit, 'Color', 'k', 'LineStyle', '--', 'LineWidth', 4);
line(x_limit, [interp1(freq / G, S21_Filter_dB, fp / G), interp1(freq / G, S21_Filter_dB, fp / G)], 'Color', 'k', 'LineStyle', '--', 'LineWidth', 4); % Update this line
hold off
grid on
grid minor 
xlabel('{\itf} (GHz) ')
ylabel('| {\itS}_{21} | ( dB ) ', ...
'VerticalAlignment', 'bottom')
set(gca, 'FontName', 'times new roman', 'FontSize', NF)
%legend('|{\itS}_{21}|')
axis([f_min/G, f_max2/G, -0.8, 0])
set(gca, 'xtick', f_min/G : 0.5 : f_max2/G);
set(gca, 'linewidth', 2.0)
% %----------------------------------------------------------------------
% % Print Statements
% %----------------------------------------------------------------------

Print_Real_Unit('C1',C1,'F')
Print_Real_Unit('C3',C3,'F')
Print_Real_Unit('C5',C5,'F')
Print_Real_Unit('C7',C7,'F')
Print_Real_Unit('L2',L2,'H')
Print_Real_Unit('L4',L4,'H')
Print_Real_Unit('L6',L6,'H')

Print_Real_Unit('Ap',Ap,'W/W')
Print_Real_Unit('Ap1',Ap1,'W/W')
Print_Real_Unit('Xp',Xp,'W/W')
Print_Real_Unit('Xp',Xp,'W/W')
Print_Real('Epsilon',epsilon)
Print_Real('Oemga_s',Omega_s)
Print_Real('Np',NC)
Print_Real('N',N) % No even





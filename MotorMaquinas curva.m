% Esse programa tra�a a curva de conjugado do Motor de Indu��o
% Feito por gabriel  rezende 
% Em: 27 de setembro de 2019
% �ltima modifica�ao em 27 de Setembro de 2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do motor                                  %
%                                                 %
% Trif�sico, conex�o estrela, Tens�o:220v         %
% Par�metros:                                     %
%  r1= 0,294      r2=0,144                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comandos de Inicializa��o
clc                                      % Limpa a janela de comandos
clear                                    % Limpa a �rea de trabalho
close all                                % Limpa todas as janelas gr�ficas

% Declara��o e atribui��o de constantes do problema:

r1 = 0.294;                              % Resist�ncia de estator por fase
r2 = 0.144;                              % Resist�ncia do rotor de fase
x1 = 0.503;                              % Reat�ncia de dispers�o do estator
x2 = 0.209;                              % Reat�ncia de dispers�o do rotor
xm = 13.250;                             % Reat�ncia de magnetiza��o

VL = 220;                                % Tens�o de linha entre fases
V1 = 220/sqrt(3);                        % Tens�o de fase
Pn = 10*746;                             % Pot�ncia nominal do motor
P = 6;                                   % N�mero de polos
q = 3;                                   % N�mero de fases
Vo = 122.328;                            % Tens�o de Thev�nin
Ro = 0.272;                              % Resist�ncia de Th�venin
Xo = 0.49;                               % Reat�ncia de Th�venin
f = 60;                                  % Frequ�ncia da rede
ws = (4*pi*f/P);                         % Velocidade s�ncrona (rad/s)
PavPHF = 403;                            % Perdas mec�nicas e magn�ticas

% Cria��o do vetor de escorregamento com 1000 pontos

s = 1:-0.001:0.001;

% Cria��o de um vetor auxiliar de mesma dimens�o do vetor s

uns = ones(1,length(s));

% Cria��o dos valores com os par�metros do motor

r2vet = r2*uns;
r2ss = r2vet./s;
Vovet = Vo*uns;
Rovet = Ro*uns;
Xovet = Xo*uns;
x2vet = x2*uns;

% Velocidade Mec�nica

ns = 120*f/P;
nsvet = ns*uns;
nvet = nsvet-(s.*nsvet);
wvet = (2*pi/60)*nvet;

% Torque da carga

Tc = ((wvet.^2)/200)-(wvet/5)+(30*uns);

% Corrente do rotor

denIr = sqrt((Rovet+r2ss).^2+(Xovet+x2vet).^2);
Ir = Vovet./denIr;

Pg = q*r2ss.*Ir.^2;

Td = (1/ws)*Pg;

% Tra�ado das curvas

figure(1)
plot(s,Td,'k','linewidth',2);
s:set(gca,'xdir','reverse');
%coordTmax = ginput(1);
grid on;
xlabel('s')
ylabel('Torque [Nm]');
%axis([0.19 0.2 175 175.5])

figure(2)
plot(s,Tc,'k','linewidth',2);
s:set(gca,'xdir','reverse');
%coordTmax = ginput(1);
grid on;
xlabel('s')
ylabel('Torque [Nm]');

figure(3)
plot(s,Td,'k','linewidth',2);
s:set(gca,'xdir','reverse');
hold on;
plot(s,Tc,'k--','linewidth',2);
hold off;
legend('Torque do mot
%coordTmax = ginput(1);
grid on;
xlabel('s')
ylabel('Torque [Nm]');
%axis([0.19 0.2 175 175.5])



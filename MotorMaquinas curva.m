% Esse programa traça a curva de conjugado do Motor de Indução
% Feito por gabriel  rezende 
% Em: 27 de setembro de 2019
% Última modificaçao em 27 de Setembro de 2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do motor                                  %
%                                                 %
% Trifásico, conexão estrela, Tensão:220v         %
% Parâmetros:                                     %
%  r1= 0,294      r2=0,144                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comandos de Inicialização
clc                                      % Limpa a janela de comandos
clear                                    % Limpa a área de trabalho
close all                                % Limpa todas as janelas gráficas

% Declaração e atribuição de constantes do problema:

r1 = 0.294;                              % Resistência de estator por fase
r2 = 0.144;                              % Resistência do rotor de fase
x1 = 0.503;                              % Reatância de dispersão do estator
x2 = 0.209;                              % Reatância de dispersão do rotor
xm = 13.250;                             % Reatância de magnetização

VL = 220;                                % Tensão de linha entre fases
V1 = 220/sqrt(3);                        % Tensão de fase
Pn = 10*746;                             % Potência nominal do motor
P = 6;                                   % Número de polos
q = 3;                                   % Número de fases
Vo = 122.328;                            % Tensão de Thevénin
Ro = 0.272;                              % Resistência de Thévenin
Xo = 0.49;                               % Reatância de Thévenin
f = 60;                                  % Frequência da rede
ws = (4*pi*f/P);                         % Velocidade síncrona (rad/s)
PavPHF = 403;                            % Perdas mecânicas e magnéticas

% Criação do vetor de escorregamento com 1000 pontos

s = 1:-0.001:0.001;

% Criação de um vetor auxiliar de mesma dimensão do vetor s

uns = ones(1,length(s));

% Criação dos valores com os parâmetros do motor

r2vet = r2*uns;
r2ss = r2vet./s;
Vovet = Vo*uns;
Rovet = Ro*uns;
Xovet = Xo*uns;
x2vet = x2*uns;

% Velocidade Mecânica

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

% Traçado das curvas

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



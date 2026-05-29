% main.pl
%
% Ponto de entrada do sistema Smart Warehouse.
% Carrega o motor GOLOG, a taxonomia de frames e os módulos funcionais.

:- ensure_loaded('golog2_2026.pl').
:- ensure_loaded('taxonomia.pl').
:- ensure_loaded('seguranca.pl').
% :- ensure_loaded('climatizacao.pl').   % descomentar quando implementado

% ---------------------------------------------------------------------------
% init/0
%   Inicializa a base de conhecimento e regista os demons globais.
% ---------------------------------------------------------------------------
init :-
    inicializar_sistema,

    % Demon de segurança — reage a QUALQUER escrita em valor_atual de
    % sensor_presence (e de todas as suas instâncias, por herança de demons).
    %
    % new_demon(Frame, Slot, FuncaoDemon, Access,   When,   Effect)
    % Access  : if_read | if_write | if_execute | if_deleted
    % When    : before  | after
    % Effect  : side_effect | alter_value
    new_demon(sensor_presence, valor_atual,
              controlar_seguranca, if_write, before, side_effect),

    % Demon de climatização (FR6/FR7) — descomentar quando implementado:
    % new_demon(sensor_temp, valor_atual,
    %           controlar_climatizacao, if_write, before, side_effect),

    write('-> Todos os modulos e demonios carregados com sucesso!'), nl.

% ---------------------------------------------------------------------------
% executar_teste_seguranca/0
%   Testa o módulo de segurança:
%     1. Define o armazém como fechado.
%     2. Cria uma instância de sensor de presença.
%     3. Simula deteção de movimento (valor 1).
%     4. Verifica o estado dos atuadores alarm_system e automatic_doors.
% ---------------------------------------------------------------------------
executar_teste_seguranca :-
    nl,
    write('=== TESTE DO MODULO DE SEGURANCA ==='), nl,

    % 1. Armazém em modo fechado (fora de horas / zona restrita)
    new_value(warehouse, estado_operacional, fechado),
    write('[OK] Estado do armazem definido para: fechado'), nl,

    % 2. Criar instância concreta de sensor de presença
    %    A herança is_a permite herdar slots e demons de sensor_presence.
    new_frame(sensor_presenca_corredor_A),
    new_slot(sensor_presenca_corredor_A, is_a, sensor_presence),
    new_value(sensor_presenca_corredor_A, localizacao, 'Corredor A'),
    write('[OK] Instancia sensor_presenca_corredor_A criada'), nl,

    % 3. Simular deteção de movimento
    %    O demon controlar_seguranca (herdado de sensor_presence) dispara
    %    automaticamente antes do valor ser escrito.
    write('[TESTE] Simulando movimento (valor_atual = 1)...'), nl,
    new_value(sensor_presenca_corredor_A, valor_atual, 1),

    % 4. Verificar estado dos atuadores após disparo do demon
    nl,
    write('[RESULTADO] Estado dos atuadores:'), nl,
    get_value(alarm_system,    estado, EstadoAlarme),
    write('  alarm_system.estado    = '), write(EstadoAlarme), nl,
    get_value(automatic_doors, estado, EstadoPortas),
    write('  automatic_doors.estado = '), write(EstadoPortas), nl,

    nl, write('=== FIM DO TESTE ==='), nl, !.

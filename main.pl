%main.pl

:- ensure_loaded('golog2_2026.pl').
:- ensure_loaded('taxonomia.pl').
:- ensure_loaded('seguranca.pl').
%:- ensure_loaded('climatizacao.pl').

init :-
    inicializar_sistema,    %inicializa frames

    %demonio da seguranca
    new_demon(sensor_presence, valor_atual, controlar_seguranca, value, if_write, active),

    %demonio da climatizacao
    %new_demon(sensor_temp, valor_atual, controlar_climatizacao, value, if_write, active),

    write('-> Todos os modulos e demonios carregados com sucesso!'), nl.


%testes
executar_teste_seguranca :-
    nl, write('-- Iniciar teste do modulo de seguranca --'), nl,

    new_value(warehouse, estado_operacional, fechado),
    write('Teste - Estado do armazem definido para: fechado.'), nl,

    new_frame(sensor_presenca_corredor_A),
    new_slot(sensor_presenca_corredor_A, is_a, sensor_presence),
    new_value(sensor_presenca_corredor_A, localizacao, 'Corredor de alta segurança A'),
    
    new_demon(sensor_presenca_corredor_A, valor_atual, controlar_seguranca, value, if_write, active),
    write('Teste - Instancia sensor_presenca_corredor_A criada.'), nl,

    write('Teste - Simulado movimento (escrevendo valor 1 no sensor)...'), nl,
    new_value(sensor_presenca_corredor_A, valor_atual, 1),

    nl, write('Teste - Verificando estado do sistema de alarme:'), nl,
    get_value(alarm_system, estado, EstadoAlarme),
    write(' -> alarm_system estado = '), write(EstadoAlarme), nl,
    get_value(automatic_doors, estado, EstadoPortas),
    write(' -> automatic_doors estado = '), write(EstadoPortas), nl,

    write('-- FIM DO TESTE --'), nl, !.

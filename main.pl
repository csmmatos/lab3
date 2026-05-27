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

    write ('-> Todos os módulos e demonios carregados com sucesso!'), nl.


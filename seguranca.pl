%seguranca.pl

controlar_seguranca(Sensor, valor_atual, 1) :-
    get_value(Sensor, localizacao, Zona),
    ( get_value(warehouse, estado_operacional, fechado) ->
        new_value(alarm_system, estado, active),
        new_value(automatic_doors, estado, closed),
        write('[ALERTA] Movimento detetado em: '), write(Zona), nl,
        write(' -> ALARME DISPARADO E PORTAS TRANCADAS'), nl
    ;
        write('[INFO] Movimento detetado em: '), write(Zona), write(' (Armazem Aberto - Operacao Normal).'), nl, nl
    ).

controlar_seguranca(_, valor_atual, 0):-
    !. %se o sensor voltar a 0 (parar de detetar movimento), n acontece nada
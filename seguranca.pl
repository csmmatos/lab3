% seguranca.pl
%
% Demon de controlo de segurança do Smart Warehouse.
%
% O demon é registado com:
%   new_demon(sensor_presence, valor_atual, controlar_seguranca, if_write, before, side_effect)
%
% A assinatura de qualquer demon em GOLOG é SEMPRE de 4 parâmetros:
%   demon_fn(Frame, Slot, ValorRecebido, ValorRetornado)
%
%   - Frame         : frame sobre o qual a operação foi chamada
%   - Slot          : slot que despoletou o demon
%   - ValorRecebido : novo valor que vai ser escrito (before) ou o valor lido (after)
%   - ValorRetornado: para side_effect deve ser igual a ValorRecebido
%                     (o motor GOLOG faz Out=In automaticamente se não for instanciado,
%                      mas é boa prática fazê-lo explicitamente)

% --- Movimento detetado: valor_atual = 1 ---
controlar_seguranca(Sensor, _Slot, 1, 1) :-
    get_value(Sensor, localizacao, Zona),
    get_value(warehouse, estado_operacional, Estado),
    ( Estado == fechado ->
        % Armazém fechado: intruso potencial — disparar alarme e trancar portas
        new_value(alarm_system, estado, active),
        new_value(automatic_doors, estado, closed),
        nl,
        write('[ALERTA] Movimento detetado em: '), write(Zona), nl,
        write('  -> ALARME DISPARADO E PORTAS TRANCADAS'), nl, nl
    ;
        % Armazém aberto: operação normal
        nl,
        write('[INFO] Movimento detetado em: '), write(Zona),
        write(' (Armazem aberto - operacao normal)'), nl, nl
    ).

% --- Sem movimento: valor_atual = 0 — sem ação ---
controlar_seguranca(_, _, 0, 0) :- !.

% --- Fallback para outros valores (robustez) ---
controlar_seguranca(_, _, V, V).

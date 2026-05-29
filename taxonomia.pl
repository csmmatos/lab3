% taxonomia.pl
%
% Define a estrutura de frames do Smart Warehouse:
%   - Relação de herança is_a
%   - Frames base: warehouse, product, order, sensor, actuator
%   - Subframes de sensores e atuadores (ligados via is_a)
%
% Nota sobre strings: usa-se '' (átomo vazio) em vez de "" (string SWI-Prolog)
% para garantir compatibilidade com o motor GOLOG e operações de comparação.

% ---------------------------------------------------------------------------
% inicializar_sistema/0  — predicado de entrada chamado em main.pl
% ---------------------------------------------------------------------------
inicializar_sistema :-
    % Relação de herança:
    %   transitive  → herança transitiva (A is_a B, B is_a C ⟹ A herda de C)
    %   all         → herda todos os slots do pai
    %   nil         → sem relação inversa
    new_relation(is_a, transitive, all, nil),

    def_warehouse,
    def_product,
    def_order,
    def_sensor,
    def_actuator,
    def_sensor_types,
    def_actuator_types,

    write('Estrutura de frames do Smart Warehouse criada com sucesso!'), nl.

% ---------------------------------------------------------------------------
% def_warehouse/0
% ---------------------------------------------------------------------------
def_warehouse :-
    new_frame(warehouse),
    new_slot(warehouse, nome,               ''),
    new_slot(warehouse, localizacao,        ''),
    new_slot(warehouse, capacidade,         0),
    new_slot(warehouse, zonas,              []),
    new_slot(warehouse, temperatura_atual,  20.0),
    new_slot(warehouse, estado_operacional, ativo). % ativo | fechado

% ---------------------------------------------------------------------------
% def_product/0
% ---------------------------------------------------------------------------
def_product :-
    new_frame(product),
    new_slot(product, nome,                ''),
    new_slot(product, referencia,          ''),
    new_slot(product, categoria,           ''),
    new_slot(product, quantidade,          0),
    new_slot(product, validade,            ''),
    new_slot(product, temperatura_ideal,   20.0),
    new_slot(product, localizacao_armazem, ''),
    new_slot(product, preco_unitario,      0.0).

% ---------------------------------------------------------------------------
% def_order/0
% ---------------------------------------------------------------------------
def_order :-
    new_frame(order),
    new_slot(order, referencia,        ''),
    new_slot(order, produtos_incluidos, []),
    new_slot(order, quantidade,        0),
    new_slot(order, preco_total,       0.0),
    new_slot(order, estado,            pending). % pending|preparing|shipped|delivered

% ---------------------------------------------------------------------------
% def_sensor/0  — classe base de todos os sensores
% ---------------------------------------------------------------------------
def_sensor :-
    new_frame(sensor),
    new_slot(sensor, identificacao, ''),
    new_slot(sensor, tipo,          generic),
    new_slot(sensor, valor_atual,   0),
    new_slot(sensor, localizacao,   ''),
    new_slot(sensor, estado,        ativo). % ativo | inativo

% ---------------------------------------------------------------------------
% def_actuator/0  — classe base de todos os atuadores
% ---------------------------------------------------------------------------
def_actuator :-
    new_frame(actuator),
    new_slot(actuator, identificacao, ''),
    new_slot(actuator, tipo,          generic),
    new_slot(actuator, estado,        inactive). % inactive | active | cooling | ...

% ---------------------------------------------------------------------------
% def_sensor_types/0  — subclasses de sensor ligadas por is_a
%
% Cada subframe herda de sensor todos os slots (identificacao, tipo,
% valor_atual, localizacao, estado) e especializa o slot 'tipo'.
% Instâncias concretas (ex: sensor_presenca_corredor_A) são criadas em
% runtime com new_frame/new_slot(is_a, <subtipo>).
% ---------------------------------------------------------------------------
def_sensor_types :-
    % Sensor de temperatura
    new_frame(sensor_temp),
        new_slot(sensor_temp, is_a, sensor),
        new_value(sensor_temp, tipo, sensor_temp),

    % Sensor de humidade
    new_frame(sensor_humidity),
        new_slot(sensor_humidity, is_a, sensor),
        new_value(sensor_humidity, tipo, sensor_humidity),

    % Sensor de CO2
    new_frame(sensor_co2),
        new_slot(sensor_co2, is_a, sensor),
        new_value(sensor_co2, tipo, sensor_co2),

    % Sensor de presença
    new_frame(sensor_presence),
        new_slot(sensor_presence, is_a, sensor),
        new_value(sensor_presence, tipo, sensor_presence),

    % Sensor de porta
    new_frame(sensor_door),
        new_slot(sensor_door, is_a, sensor),
        new_value(sensor_door, tipo, sensor_door).

% ---------------------------------------------------------------------------
% def_actuator_types/0  — subclasses de actuator ligadas por is_a
%
% Cada subframe herda de actuator os slots (identificacao, tipo, estado)
% e especializa o slot 'tipo'.
% O slot 'estado' herdado tem valor inicial 'inactive'; pode ser alterado
% com new_value/3 em runtime (ex: new_value(alarm_system, estado, active)).
% ---------------------------------------------------------------------------
def_actuator_types :-
    % Sistema de arrefecimento
    new_frame(cooling_system),
        new_slot(cooling_system, is_a, actuator),
        new_value(cooling_system, tipo, cooling_system),

    % Ventilação
    new_frame(ventilation),
        new_slot(ventilation, is_a, actuator),
        new_value(ventilation, tipo, ventilation),

    % Humidificador
    new_frame(humidifier),
        new_slot(humidifier, is_a, actuator),
        new_value(humidifier, tipo, humidifier),

    % Sistema de alarme
    new_frame(alarm_system),
        new_slot(alarm_system, is_a, actuator),
        new_value(alarm_system, tipo, alarm_system),

    % Portas automáticas
    new_frame(automatic_doors),
        new_slot(automatic_doors, is_a, actuator),
        new_value(automatic_doors, tipo, automatic_doors).

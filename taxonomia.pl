%inicializar warehouse
%taxonomia.pl

inicializar_sistema :-
    %herança is_a
    new_relation(is_a, transitive, all, nil),

    %frames principais
    new_frame(warehouse),
    new_frame(product),
    new_frame(order),
    new_frame(sensor),
    new_frame(actuator),

    %slots da Frame 'warehouse'
    new_slot(warehouse, nome, ""),
    new_slot(warehouse, localizacao, ""),
    new_slot(warehouse, capacidade, 0),
    new_slot(warehouse, zonas, []),
    new_slot(warehouse, temperatura_atual, 20.0),
    new_slot(warehouse, estado_operacional, ativo),

    %slots da Frame 'PRODUCT'
    new_slot(product, nome, ""),
    new_slot(product, referencia, ""),
    new_slot(product, categoria, ""),
    new_slot(product, quantidade, 0),
    new_slot(product, validade, ""),
    new_slot(product, temperatura_ideal, 20.0),
    new_slot(product, localizacao_armazem, ""),
    new_slot(product, preco_unitario, 0.0),

    %slots da Frame 'order'
    new_slot(order, referencia, ""),
    new_slot(order, produtos_incluidos, []),
    new_slot(order, quantidade, 0),
    new_slot(order, preco_total, 0.0),
    new_slot(order, estado, pending), %pending, preparing, shipped, delivered

    %slots da Frame 'sensor'
    new_slot(sensor, identificacao, ""),
    new_slot(sensor, tipo, generic),
    new_slot(sensor, valor_atual, 0),
    new_slot(sensor, localizacao, ""),
    new_slot(sensor, estado, ativo),

    %slots da Frame 'actuator'
    new_slot(actuator, identificacao, ""),
    new_slot(actuator, tipo, generic),
    new_slot(actuator, estado, inactive), %inactive, cooling, ventilation...

    %subframes de sensores (ligação por is_a)
    new_frame(sensor_temp), new_slot(sensor_temp, is_a, sensor), new_value(sensor_temp, tipo, sensor_temp),
    new_frame(sensor_humidity), new_slot(sensor_humidity, is_a, sensor), new_value(sensor_humidity, tipo, sensor_humidity),
    new_frame(sensor_co2), new_slot(sensor_co2, is_a, sensor), new_value(sensor_co2, tipo, sensor_co2),
    new_frame(sensor_presence), new_slot(sensor_presence, is_a, sensor), new_value(sensor_presence, tipo, sensor_presence),
    new_frame(sensor_door), new_slot(sensor_door, is_a, sensor), new_value(sensor_door, tipo, sensor_door),

    %subframes de atuadores (ligação por is_a)
    new_frame(cooling_system), new_slot(cooling_system, is_a, actuator), new_value(cooling_system, tipo, cooling_system),
    new_frame(ventilation), new_slot(ventilation, is_a, actuator), new_value(ventilation, tipo, ventilation),
    new_frame(humidifier), new_slot(humidifier, is_a, actuator), new_value(humidifier, tipo, humidifier),
    new_frame(alarm_system), new_slot(alarm_system, is_a, actuator), new_value(alarm_system, tipo, alarm_system),
    new_frame(automatic_doors), new_slot(automatic_doors, is_a, actuator), new_value(automatic_doors, tipo, automatic_doors),

    write('Estrutura de Farms do Smart Warehouse criado com sucesso!'), nl.
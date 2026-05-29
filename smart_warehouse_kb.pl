:- dynamic frame_/1.

frame_(warehouse).
frame_(product).
frame_(order).
frame_(sensor).
frame_(actuator).
frame_(sensor_temp).
frame_(sensor_humidity).
frame_(sensor_co2).
frame_(sensor_presence).
frame_(sensor_door).
frame_(cooling_system).
frame_(ventilation).
frame_(humidifier).
frame_(alarm_system).
frame_(automatic_doors).
frame_(sensor_presenca_corredor_A).
frame_(sensor_presenca_zona_B).
frame_(produto_leite).
frame_(produto_agua).
frame_(encomenda_001).

:- dynamic warehouse/1.

warehouse(frame_).

:- dynamic warehouse/3.

warehouse(slot_, nome, data_or_method).
warehouse(value_, nome, '').
warehouse(slot_, localizacao, data_or_method).
warehouse(value_, localizacao, '').
warehouse(slot_, capacidade, data_or_method).
warehouse(value_, capacidade, 0).
warehouse(slot_, zonas, data_or_method).
warehouse(value_, zonas, []).
warehouse(slot_, temperatura_atual, data_or_method).
warehouse(value_, temperatura_atual, 20.0).
warehouse(slot_, estado_operacional, data_or_method).
warehouse(value_, estado_operacional, fechado).

:- dynamic product/1.

product(frame_).

:- dynamic product/3.

product(slot_, nome, data_or_method).
product(value_, nome, '').
product(slot_, referencia, data_or_method).
product(value_, referencia, '').
product(slot_, categoria, data_or_method).
product(value_, categoria, '').
product(slot_, quantidade, data_or_method).
product(value_, quantidade, 0).
product(slot_, validade, data_or_method).
product(value_, validade, '').
product(slot_, temperatura_ideal, data_or_method).
product(value_, temperatura_ideal, 20.0).
product(slot_, localizacao_armazem, data_or_method).
product(value_, localizacao_armazem, '').
product(slot_, preco_unitario, data_or_method).
product(value_, preco_unitario, 0.0).

:- dynamic order/1.

order(frame_).

:- dynamic order/3.

order(slot_, referencia, data_or_method).
order(value_, referencia, '').
order(slot_, produtos_incluidos, data_or_method).
order(value_, produtos_incluidos, []).
order(slot_, quantidade, data_or_method).
order(value_, quantidade, 0).
order(slot_, preco_total, data_or_method).
order(value_, preco_total, 0.0).
order(slot_, estado, data_or_method).
order(value_, estado, pending).

:- dynamic sensor/1.

sensor(frame_).

:- dynamic sensor/3.

sensor(slot_, identificacao, data_or_method).
sensor(value_, identificacao, '').
sensor(slot_, tipo, data_or_method).
sensor(value_, tipo, generic).
sensor(slot_, valor_atual, data_or_method).
sensor(value_, valor_atual, 0).
sensor(slot_, localizacao, data_or_method).
sensor(value_, localizacao, '').
sensor(slot_, estado, data_or_method).
sensor(value_, estado, ativo).

:- dynamic actuator/1.

actuator(frame_).

:- dynamic actuator/3.

actuator(slot_, identificacao, data_or_method).
actuator(value_, identificacao, '').
actuator(slot_, tipo, data_or_method).
actuator(value_, tipo, generic).
actuator(slot_, estado, data_or_method).
actuator(value_, estado, inactive).

:- dynamic sensor_temp/1.

sensor_temp(frame_).

:- dynamic sensor_temp/3.

sensor_temp(slot_, is_a, relation).
sensor_temp(value_, is_a, sensor).
sensor_temp(value_, tipo, sensor_temp).

:- dynamic sensor_humidity/1.

sensor_humidity(frame_).

:- dynamic sensor_humidity/3.

sensor_humidity(slot_, is_a, relation).
sensor_humidity(value_, is_a, sensor).
sensor_humidity(value_, tipo, sensor_humidity).

:- dynamic sensor_co2/1.

sensor_co2(frame_).

:- dynamic sensor_co2/3.

sensor_co2(slot_, is_a, relation).
sensor_co2(value_, is_a, sensor).
sensor_co2(value_, tipo, sensor_co2).

:- dynamic sensor_presence/1.

sensor_presence(frame_).

:- dynamic sensor_presence/3.

sensor_presence(slot_, is_a, relation).
sensor_presence(value_, is_a, sensor).
sensor_presence(value_, tipo, sensor_presence).

:- dynamic sensor_door/1.

sensor_door(frame_).

:- dynamic sensor_door/3.

sensor_door(slot_, is_a, relation).
sensor_door(value_, is_a, sensor).
sensor_door(value_, tipo, sensor_door).

:- dynamic cooling_system/1.

cooling_system(frame_).

:- dynamic cooling_system/3.

cooling_system(slot_, is_a, relation).
cooling_system(value_, is_a, actuator).
cooling_system(value_, tipo, cooling_system).

:- dynamic ventilation/1.

ventilation(frame_).

:- dynamic ventilation/3.

ventilation(slot_, is_a, relation).
ventilation(value_, is_a, actuator).
ventilation(value_, tipo, ventilation).

:- dynamic humidifier/1.

humidifier(frame_).

:- dynamic humidifier/3.

humidifier(slot_, is_a, relation).
humidifier(value_, is_a, actuator).
humidifier(value_, tipo, humidifier).

:- dynamic alarm_system/1.

alarm_system(frame_).

:- dynamic alarm_system/3.

alarm_system(slot_, is_a, relation).
alarm_system(value_, is_a, actuator).
alarm_system(value_, tipo, alarm_system).
alarm_system(value_, estado, active).

:- dynamic automatic_doors/1.

automatic_doors(frame_).

:- dynamic automatic_doors/3.

automatic_doors(slot_, is_a, relation).
automatic_doors(value_, is_a, actuator).
automatic_doors(value_, tipo, automatic_doors).
automatic_doors(value_, estado, closed).

:- dynamic sensor_presenca_corredor_A/1.

sensor_presenca_corredor_A(frame_).

:- dynamic sensor_presenca_corredor_A/3.

sensor_presenca_corredor_A(slot_, is_a, relation).
sensor_presenca_corredor_A(value_, is_a, sensor_presence).
sensor_presenca_corredor_A(value_, localizacao, 'Corredor A').
sensor_presenca_corredor_A(value_, valor_atual, 1).

:- dynamic sensor_presenca_zona_B/1.

sensor_presenca_zona_B(frame_).

:- dynamic sensor_presenca_zona_B/3.

sensor_presenca_zona_B(slot_, is_a, relation).
sensor_presenca_zona_B(value_, is_a, sensor_presence).
sensor_presenca_zona_B(value_, localizacao, 'Zona B - Armazem Principal').
sensor_presenca_zona_B(value_, valor_atual, 1).

:- dynamic produto_leite/1.

produto_leite(frame_).

:- dynamic produto_leite/3.

produto_leite(slot_, is_a, relation).
produto_leite(value_, is_a, product).
produto_leite(value_, nome, 'Leite UHT').
produto_leite(value_, referencia, 'REF-001').
produto_leite(value_, categoria, lacticinios).
produto_leite(value_, temperatura_ideal, 4.0).
produto_leite(value_, preco_unitario, 0.89).
produto_leite(value_, quantidade, 195).

:- dynamic produto_agua/1.

produto_agua(frame_).

:- dynamic produto_agua/3.

produto_agua(slot_, is_a, relation).
produto_agua(value_, is_a, product).
produto_agua(value_, nome, 'Agua Mineral').
produto_agua(value_, referencia, 'REF-002').
produto_agua(value_, quantidade, 500).
produto_agua(value_, preco_unitario, 0.35).

:- dynamic encomenda_001/1.

encomenda_001(frame_).

:- dynamic encomenda_001/3.

encomenda_001(slot_, is_a, relation).
encomenda_001(value_, is_a, order).
encomenda_001(value_, referencia, 'ORD-001').
encomenda_001(value_, produtos_incluidos, [produto_leite, produto_agua]).
encomenda_001(value_, quantidade, 2).
encomenda_001(value_, preco_total, 1.24).
encomenda_001(value_, estado, delivered).

:- dynamic relation_/1.

relation_(is_a).

:- dynamic is_a/4.

is_a(relation_, transitive, all, nil).

:- dynamic slot_/2.

slot_(warehouse, nome).
slot_(warehouse, localizacao).
slot_(warehouse, capacidade).
slot_(warehouse, zonas).
slot_(warehouse, temperatura_atual).
slot_(warehouse, estado_operacional).
slot_(product, nome).
slot_(product, referencia).
slot_(product, categoria).
slot_(product, quantidade).
slot_(product, validade).
slot_(product, temperatura_ideal).
slot_(product, localizacao_armazem).
slot_(product, preco_unitario).
slot_(order, referencia).
slot_(order, produtos_incluidos).
slot_(order, quantidade).
slot_(order, preco_total).
slot_(order, estado).
slot_(sensor, identificacao).
slot_(sensor, tipo).
slot_(sensor, valor_atual).
slot_(sensor, localizacao).
slot_(sensor, estado).
slot_(actuator, identificacao).
slot_(actuator, tipo).
slot_(actuator, estado).
slot_(sensor_temp, is_a).
slot_(sensor_humidity, is_a).
slot_(sensor_co2, is_a).
slot_(sensor_presence, is_a).
slot_(sensor_door, is_a).
slot_(cooling_system, is_a).
slot_(ventilation, is_a).
slot_(humidifier, is_a).
slot_(alarm_system, is_a).
slot_(automatic_doors, is_a).
slot_(sensor_presenca_corredor_A, is_a).
slot_(sensor_presenca_zona_B, is_a).
slot_(produto_leite, is_a).
slot_(produto_agua, is_a).
slot_(encomenda_001, is_a).

:- dynamic demon_/2.

demon_(sensor_presence, valor_atual).

:- dynamic valor_atual/6.

valor_atual(demon_, sensor_presence, controlar_seguranca, if_write, before, side_effect).


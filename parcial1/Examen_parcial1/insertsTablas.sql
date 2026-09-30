USE SelvaViva;

INSERT INTO area_resguardo (nombre, bioma, capacidad, cupo_disponible) VALUES
('Felinos - Zona A',    'Selva',   4, 4),
('Cuarentena Aves',     'Selva',   3, 1),
('Aviario General',     'Selva',  10, 10),
('Reptilario 1',        'Selva',   2, 0),
('Reptilario Desierto', 'Desierto',3, 2);

INSERT INTO especie (nombre, bioma) VALUES
('Jaguar',                'Selva'),
('Tucan',                 'Selva'),
('Iguana',                'Selva'),
('Boa',                   'Selva'),
('Serpiente de cascabel', 'Desierto');

INSERT INTO animal (num_expediente, id_especie, id_area_resguardo, estado_salud) VALUES
('EXP-2026-002', 2, 2, 'En observacion'),
('EXP-2026-004', 4, 4, 'Estable'),
('EXP-2026-005', 4, 4, 'Estable'),
('EXP-2026-006', 5, 5, 'Critico'),
('EXP-2026-007', 2, 2, 'Estable');

INSERT INTO movimiento (tipo_movimiento, id_animal, id_area_resguardo_anterior, id_area_resguardo_nuevo, motivo) VALUES
('Ingreso', 1, NULL, 2, 'Rescate de trafico ilegal'),
('Ingreso', 2, NULL, 4, 'Rescate de trafico ilegal'),
('Ingreso', 3, NULL, 4, 'Entrega voluntaria'),
('Ingreso', 4, NULL, 5, 'Rescate por ataque en su habitat'),
('Ingreso', 5, NULL, 2, 'Rescate de trafico ilegal');

INSERT INTO registro_medico (id_animal, estado, diagnostico, tratamiento) VALUES
(1, 'En observacion', 'Deshidratacion leve por transporte',    'Suero oral por 5 dias'),
(2, 'Estable',        'Revision de rutina sin hallazgos',      'Ninguno'),
(3, 'Estable',        'Desparasitacion preventiva',            'Antiparasitario dosis unica'),
(4, 'Critico',        'Mordedura infectada',                   'Antibiotico y curaciones diarias'),
(5, 'Estable',        'Perdida leve de plumaje',               'Suplemento vitaminico por 10 dias');

CREATE INDEX idx_animal_area   ON animal(id_area_resguardo);
CREATE INDEX idx_mov_animal    ON movimiento(id_animal);
CREATE INDEX idx_registro_anim ON registro_medico(id_animal);
USE SelvaViva;

SET @area = (SELECT id_area FROM area_resguardo WHERE nombre = 'Felinos - Zona A');
SET @esp  = (SELECT id_especie FROM especie WHERE nombre = 'Jaguar');

START TRANSACTION;

  INSERT INTO animal (num_expediente, id_especie, id_area_resguardo, estado_salud)
  VALUES ('EXP-2026-001', @esp, @area, 'En observacion');

  SET @id_animal = LAST_INSERT_ID();

  UPDATE area_resguardo
  SET cupo_disponible = cupo_disponible - 1
  WHERE id_area = @area;

  INSERT INTO movimiento (tipo_movimiento, id_animal, id_area_resguardo_anterior, id_area_resguardo_nuevo, motivo)
  VALUES ('Ingreso', @id_animal, NULL, @area, 'Rescate de trafico ilegal');

COMMIT;
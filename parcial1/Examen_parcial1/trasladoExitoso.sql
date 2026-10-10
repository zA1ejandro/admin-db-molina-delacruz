USE SelvaViva;

SET @id_animal = (SELECT id_animal FROM animal WHERE num_expediente = 'EXP-2026-002');
SET @origen    = (SELECT id_area FROM area_resguardo WHERE nombre = 'Cuarentena Aves');
SET @destino   = (SELECT id_area FROM area_resguardo WHERE nombre = 'Aviario General');

START TRANSACTION;

  UPDATE animal
  SET id_area_resguardo = @destino
  WHERE id_animal = @id_animal;

  UPDATE area_resguardo
  SET cupo_disponible = cupo_disponible + 1
  WHERE id_area = @origen;

  UPDATE area_resguardo
  SET cupo_disponible = cupo_disponible - 1
  WHERE id_area = @destino;

  INSERT INTO movimiento (tipo_movimiento, id_animal, id_area_resguardo_anterior, id_area_resguardo_nuevo, motivo)
  VALUES ('Traslado interno', @id_animal, @origen, @destino, 'Fin de cuarentena');

COMMIT;
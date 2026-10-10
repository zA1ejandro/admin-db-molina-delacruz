USE SelvaViva;

DROP PROCEDURE IF EXISTS sp_ingreso_iguana;

DELIMITER $$

CREATE PROCEDURE sp_ingreso_iguana()
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'ROLLBACK: no hay cupo en Reptilario 1' AS resultado;
  END;

  START TRANSACTION;

    INSERT INTO animal (num_expediente, id_especie, id_area_resguardo, estado_salud)
    VALUES ('EXP-2026-003', 3, 4, 'En observacion');

    UPDATE area_resguardo SET cupo_disponible = cupo_disponible - 1 WHERE id_area = 4;

    INSERT INTO movimiento (tipo_movimiento, id_animal, id_area_resguardo_anterior, id_area_resguardo_nuevo, motivo)
    VALUES ('Ingreso', LAST_INSERT_ID(), NULL, 4, 'Rescate de trafico ilegal');

  COMMIT;
END$$

DELIMITER ;

CALL sp_ingreso_iguana();
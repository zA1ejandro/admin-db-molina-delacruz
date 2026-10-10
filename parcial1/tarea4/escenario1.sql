START TRANSACTION;

INSERT INTO compra (id_pago) VALUES (NULL);
SET @id_compra_actual = LAST_INSERT_ID();

UPDATE producto
SET stock = stock - 2
WHERE id_producto = 3;

INSERT INTO detalle_compra (id_compra, id_producto, cantidad)
VALUES (@id_compra_actual, 3, 2);

INSERT INTO pago (monto, estatus)
VALUES (1798.00, 'COMPLETADO');
SET @id_pago_actual = LAST_INSERT_ID();

UPDATE compra
SET id_pago = @id_pago_actual
WHERE id_compra = @id_compra_actual;

COMMIT;

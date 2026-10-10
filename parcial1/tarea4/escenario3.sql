START TRANSACTION;

INSERT INTO compra (id_pago) VALUES (NULL);
SET @id_compra_actual = LAST_INSERT_ID();

UPDATE producto
SET stock = stock - 2
WHERE id_producto = 7;

INSERT INTO detalle_compra (id_compra, id_producto, cantidad)
VALUES (@id_compra_actual, 7, 2);

INSERT INTO pago (monto, estatus)
VALUES (0.00, 'RECHAZADO');

ROLLBACK;

SELECT stock FROM producto WHERE id_producto = 7;
SELECT * FROM detalle_compra WHERE id_compra = @id_compra_actual;

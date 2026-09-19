START TRANSACTION;

INSERT INTO compra (id_pago) VALUES (NULL);
SET @id_compra_actual = LAST_INSERT_ID();

UPDATE producto
SET stock = stock - 50
WHERE id_producto = 6;

ROLLBACK;

SELECT * FROM compra WHERE id_compra = @id_compra_actual;

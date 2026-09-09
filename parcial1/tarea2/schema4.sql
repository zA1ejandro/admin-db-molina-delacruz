insert into clientes (id_cliente, dni, nombre_cliente, telefono, correo_electronico) values
(1, '12345678', 'Maria Fernanda Lopez', '9991234567', 'maria.lopez@gmail.com'),
(2, '23456789', 'Carlos Alberto Ruiz', '9992345678', 'carlos.ruiz@hotmail.com'),
(3, '34567890', 'Ana Sofia Martinez', '9993456789', 'ana.martinez@yahoo.com'),
(4, '45678901', 'Jose Luis Hernandez', '9994567890', 'jose.hernandez@gmail.com'),
(5, '56789012', 'Laura Patricia Diaz', '9995678901', 'laura.diaz@outlook.com');

insert into mascota (id_mascota, nombre_mascota, especia, raza, fecha_nacimiento, id_cliente) values
(1, 'Firulais', 'Perro', 'Labrador', '2020-03-15', 1),
(2, 'Michi', 'Gato', 'Siames', '2021-07-22', 1),
(3, 'Rocky', 'Perro', 'Bulldog', '2019-11-05', 2),
(4, 'Luna', 'Gato', 'Persa', '2022-01-10', 3),
(5, 'Max', 'Perro', 'Pastor Aleman', '2018-05-30', 4);

insert into veterinario (id_veterinario, dni, nombre_veterinario, especialidad_medica, numero_telefono) values
(1, '11122233', 'Dr. Roberto Sanchez', 'Medicina General', '9981112233'),
(2, '22233344', 'Dra. Patricia Gomez', 'Cirugia', '9982223344'),
(3, '33344455', 'Dr. Miguel Torres', 'Dermatologia', '9983334455'),
(4, '44455566', 'Dra. Fernanda Castro', 'Odontologia', '9984445566'),
(5, '55566677', 'Dr. Alejandro Vega', 'Cardiologia', '9985556677');

insert into medicamento (id_medicamento, nombre_medicamento, laboratorio, precio) values
(1, 'Amoxicilina 250mg', 'Laboratorios Pfizer', 85.50),
(2, 'Meloxicam 1.5mg', 'Laboratorios Bayer', 120.00),
(3, 'Dexametasona 0.5mg', 'Laboratorios MSD', 65.75),
(4, 'Praziquantel 50mg', 'Laboratorios Elanco', 45.00),
(5, 'Tramadol 50mg', 'Laboratorios Zoetis', 95.25);

insert into atencionMedica (id_cita, fecha_hora, diagnostico, costo_consulta, id_mascota, id_veterinario) values
(1, '2025-01-10 09:30:00', 'Infeccion respiratoria leve', 350.00, 1, 1),
(2, '2025-01-12 11:00:00', 'Dermatitis alergica', 400.00, 2, 3),
(3, '2025-01-15 14:15:00', 'Chequeo general de rutina', 250.00, 3, 1),
(4, '2025-01-18 10:45:00', 'Fractura leve en pata trasera', 600.00, 4, 2),
(5, '2025-01-20 16:00:00', 'Problema cardiaco, arritmia detectada', 550.00, 5, 5);

insert into prescipcion (id_prescripcion, id_cita, id_medicamento, cantidad, indicaciones) values
(1, 1, 1, 14, '1 pastilla cada 12 horas por 7 dias'),
(2, 2, 3, 5, '1 pastilla cada 24 horas por 5 dias'),
(3, 3, 4, 1, 'Dosis unica de refuerzo antiparasitario'),
(4, 4, 5, 10, '1 pastilla cada 8 horas por 3-4 dias segun dolor'),
(5, 5, 2, 7, '1 pastilla cada dia por una semana con alimento');
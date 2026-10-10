USE molina_delacruz;

create table if not exists clientes(
    id_cliente int primary key,
    dni varchar(15),
    nombre_cliente varchar(100),
    telefono varchar(100),
    correo_electronico varchar(100)
);

create table if not exists mascota(
    id_mascota int primary key,
    nombre_mascota varchar(100),
    especia varchar(20),
    raza varchar(20),
    fecha_nacimiento date,
    id_cliente int
);

create table if not exists veterinario(
    id_veterinario int primary key,
    dni varchar(15),
    nombre_veterinario varchar(100),
    especialidad_medica varchar(100),
    numero_telefono varchar(100)
);

create table if not exists medicamento(
    id_medicamento int primary key,
    nombre_medicamento varchar(100),
    laboratorio varchar(100),
    precio decimal(10,2)
);

create table if not exists atencionMedica(
    id_cita int primary key,
    fecha_hora datetime,
    diagnostico text,
    costo_consulta decimal(10,2),
    id_mascota int,
    id_veterinario int
);

create table if not exists prescipcion(
    id_prescripcion int,
    id_cita int,
    id_medicamento int,
    cantidad int,
    indicaciones text,
    primary key(id_prescripcion,id_medicamento)
);
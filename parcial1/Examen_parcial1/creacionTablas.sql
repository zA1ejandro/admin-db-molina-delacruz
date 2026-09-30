CREATE DATABASE IF NOT EXISTS SelvaViva;
USE SelvaViva;

CREATE TABLE IF NOT EXISTS area_resguardo (
  id_area          INT AUTO_INCREMENT PRIMARY KEY,
  nombre           VARCHAR(80) NOT NULL UNIQUE,
  bioma            VARCHAR(40) NOT NULL,
  capacidad        INT NOT NULL,
  cupo_disponible  INT NOT NULL,
  CONSTRAINT chk_cupo CHECK (cupo_disponible >= 0 AND cupo_disponible <= capacidad)
);

CREATE TABLE IF NOT EXISTS especie (
  id_especie  INT AUTO_INCREMENT PRIMARY KEY,
  nombre      VARCHAR(80) NOT NULL UNIQUE,
  bioma       VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS animal (
  id_animal          INT AUTO_INCREMENT PRIMARY KEY,
  num_expediente     VARCHAR(20) NOT NULL UNIQUE,
  id_especie         INT NOT NULL,
  id_area_resguardo  INT NOT NULL,
  estado_salud       VARCHAR(20) NOT NULL,
  CONSTRAINT chk_animal_estado CHECK (estado_salud IN ('Critico','Estable','En observacion','Recuperado')),
  CONSTRAINT fk_animal_area    FOREIGN KEY (id_area_resguardo) REFERENCES area_resguardo(id_area),
  CONSTRAINT fk_animal_especie FOREIGN KEY (id_especie)        REFERENCES especie(id_especie)
);

CREATE TABLE IF NOT EXISTS registro_medico (
  id_registro_medico  INT AUTO_INCREMENT PRIMARY KEY,
  id_animal           INT NOT NULL,
  estado              VARCHAR(20) NOT NULL,
  diagnostico         VARCHAR(300) NOT NULL,
  tratamiento         VARCHAR(300) NOT NULL,
  fecha_registro      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_registro_estado CHECK (estado IN ('Critico','Estable','En observacion','Recuperado')),
  CONSTRAINT fk_registro_animal  FOREIGN KEY (id_animal) REFERENCES animal(id_animal)
);

CREATE TABLE IF NOT EXISTS movimiento (
  id_movimiento               INT AUTO_INCREMENT PRIMARY KEY,
  tipo_movimiento             VARCHAR(30) NOT NULL,
  id_animal                   INT NOT NULL,
  id_area_resguardo_anterior  INT NULL,
  id_area_resguardo_nuevo     INT NOT NULL,
  fecha_movimiento            DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  motivo                      VARCHAR(200) NOT NULL,
  CONSTRAINT chk_mov_tipo  CHECK (tipo_movimiento IN ('Ingreso','Traslado interno','Traslado externo','Alta')),
  CONSTRAINT chk_mov_areas CHECK (id_area_resguardo_nuevo != id_area_resguardo_anterior),
  CONSTRAINT fk_mov_animal   FOREIGN KEY (id_animal)                  REFERENCES animal(id_animal),
  CONSTRAINT fk_mov_anterior FOREIGN KEY (id_area_resguardo_anterior) REFERENCES area_resguardo(id_area),
  CONSTRAINT fk_mov_nuevo    FOREIGN KEY (id_area_resguardo_nuevo)    REFERENCES area_resguardo(id_area)
);
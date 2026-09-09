alter table mascota
    add constraint fk_mascota_clientes
    foreign key (id_cliente) references clientes(id_cliente);

alter table atencionMedica
    add constraint fk_atencionMedica_mascota
    foreign key (id_mascota) references mascota(id_mascota);

alter table atencionMedica
    add constraint fk_atencionMedica_veterinario
    foreign key (id_veterinario) references veterinario(id_veterinario);

alter table prescipcion
    add constraint fk_prescipcion_atencionMedica
    foreign key (id_cita) references atencionMedica(id_cita);

alter table prescipcion
    add constraint fk_prescipcion_medicamento
    foreign key (id_medicamento) references medicamento(id_medicamento);
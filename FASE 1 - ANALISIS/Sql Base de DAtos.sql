use warlocksoft

Create table Usuario(
id_usuario INT primary key,
usuario varchar(200),
nombre_completo varchar(200),
correo varchar(200),
fecha_nacimiento date,
contraseña varchar (20),
karma INT
);

create table Asociacion(
id_asociacion INT primary key,
nombre varchar(200),
resumen varchar(200),
logo varchar(200),
id_usuarioadministrador INT,
 foreign key (id_usuarioadministrador) references Usuario (id_usuario)
);

create table Contacto(
id_contacto INT primary key,
id_usuario INT,
id_amigo INT,
foreign key (id_usuario) references Usuario(id_usuario),
foreign key (id_amigo) references Usuario(id_usuario)
);

create table Mensaje(
id_mensaje INT primary key,
mensaje varchar(200),
id_contacto INT,
 foreign key (id_contacto) references Contacto(id_contacto)
);
create table Detalle_Asociacion(
id_detalleasociacion INT primary key,
id_asociacion INT,
 foreign key (id_asociacion) references Asociacion(id_asociacion),
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario),
papel varchar(200)
);
create table Notificacion(
id_notifiacion INT primary key,
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario),
id_usuariosolicitante INT,
 foreign key (id_usuariosolicitante) references Usuario(id_usuario),
mensaje varchar(200)
);
create table Habilidad(
id_habilidad INT primary key,
nombre varchar(200),
descripcion varchar(200)
);
create table Conocimiento(
id_conocimiento INT primary key,
nombre varchar(200),
descripcion varchar(200)
);
create table Detale_habilidadconocimiento(
id_detallehabilidadconocimiento INT primary key,
id_habilidad INT,
 foreign key (id_habilidad) references Habilidad(id_habilidad),
id_conocimiento INT,
 foreign key (id_conocimiento) references Conocimiento(id_conocimiento)
);
create table Detalle_habilidad(
id_detallehabilidad INT primary key,
karma_positivo INT,
karma_negativo INT,
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario),
id_habilidad INT,
 foreign key (id_habilidad) references Habilidad(id_habilidad)
);
create table Detalle_conocimiento(
id_detalleconocimiento INT primary key,
karma_positivo INT,
karma_negativo INT,
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario),
id_conocimiento INT,
 foreign key (id_conocimiento) references Conocimiento(id_conocimiento)
);
create table Tarea(
id_tarea INT primary key,
nombre varchar(200),
descripcion varchar(200),
fecha_inicio date,
valor INT
);
create table Conocimiento_necesarioTarea(
id_conocimientonecesariotarea INT primary key,
id_tarea INT,
 foreign key (id_tarea) references Tarea(id_tarea),
id_conocimiento INT,
 foreign key (id_conocimiento) references Conocimiento(id_conocimiento)
);
create table Tarea_asignada(
id_tareaasignada INT primary key,
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario),
id_tarea INT,
 foreign key (id_tarea) references Tarea(id_tarea)
);
create table Publicacion(
id_publicacion INT primary key,
descripcion varchar(200),
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario)
);
create table Comentario(
id_comentario INT primary key,
decripcion varchar(200),
id_publicacion INT,
 foreign key (id_publicacion) references Publicacion(id_publicacion),
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario)
);
create table Proyecto(
id_proyecto INT primary key,
nombre varchar(200),
fecha_inicio date,
fecha_fin date,
Estado varchar(200),
Presupuesto decimal,
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario)
);
create table Aviso(
id_aviso INT primary key,
mensaje varchar(200),
id_proyecto INT,
 foreign key (id_proyecto) references Proyecto(id_proyecto),
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario)
);
create table Colaboradorproyecto(
id_colaboradorproyecto INT primary key,
id_usuario INT,
 foreign key (id_usuario) references Usuario(id_usuario),
id_proyecto INT,
 foreign key (id_proyecto) references Proyecto(id_proyecto)
);
create table Detalle_tarea(
id_detalletarea INT primary key,
Fase_proyecto varchar(200),
id_tarea INT,
 foreign key (id_tarea) references Tarea(id_tarea),
id_proyecto INT,
 foreign key (id_proyecto) references Proyecto(id_proyecto)
);
create table Tarea_asignadaproyecto(
id_tareaasignadaproyecto INT primary key,
id_colaboradorproyecto INT,
 foreign key (id_colaboradorproyecto) references Colaboradorproyecto(id_colaboradorproyecto),
id_detalletarea INT,
 foreign key (id_detalletarea) references Detalle_tarea(id_detalletarea)
);
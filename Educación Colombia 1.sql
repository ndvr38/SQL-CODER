create schema if not exists Educación_Colombia ;
use educación_colombia

-- Detalle Descripción tabla 1. Universidad Información general de la universidad por código y tipo si es oficial o privada


create table Universidad (
Id_Universidad int primary key auto_increment ,
Nombre_Universidad varchar (30) ,
Sector_IES varchar (15) , 
Caracter_IES varchar (15) 
);

-- Detalle Descripción tabla 2. Ubicación Conoceremos la ubicación exacta por cada institución registrada

create table if not exists Ubicacion (
Id_Municipio int primary key ,
Id_Universidad int,
Departamento varchar (20) not null ,
Municipio varchar (20) not null ,
FOREIGN KEY (Id_Universidad) REFERENCES Universidad(Id_Universidad)
);

-- Detalle Descripción tabla 3. Programa Academico Identificar el tipo de programa académico, metodologías y cuántos graduados hay por programa

create table if not exists Programa_Academico (
Id_Programa_Academico int , 
Sector_IES varchar (15) , 
Id_Universidad int,
Programa_Academico varchar (30) ,
Nivel_Academico varchar (25),
Metodologia varchar (15),
Graduados int ,
Genero int ,
 CONSTRAINT PK_COMMENT PRIMARY KEY (Id_Programa_Academico,Id_Universidad) 
 );
 
 -- Detalle Descripción tabla 4. Genero Identificar cuántas mujeres y hombres se gradúan por universidad
 
 create table if not exists Genero (
Id_Genero int primary key auto_increment ,
Nombre_universidad varchar (30) ,
Id_universidad int ,
Genero varchar (10) ,
Graduados int ,
 FOREIGN KEY (Graduados) REFERENCES Programa_Academico(Genero)
);

-- Detalle Descripción tabla 5. Area de conocimiento Revisar la cantidad de áreas de conocimiento tenemos por universidad registrada
 
 create table if not exists Area_de_conocimiento (
Id_Area_de_conocimiento int primary key ,
Id_Institucion int ,
Area_de_conocimiento varchar (35)
);
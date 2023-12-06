/*-------------------------------------------------------------*/
/*                          Ejercicio 5                        */
/*-------------------------------------------------------------*/
CREATE DATABASE ejercicio5;
USE ejercicio5

CREATE TABLE PERSONA(
    Dni INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(45),
    Sexo VARCHAR(45),
    Direccion VARCHAR(45),
    FechaNac VARCHAR(45)
)ENGINE = InnoDB;

CREATE TABLE EMPLEADO(
    DniEmpleado INT NOT NULL,
    Salario VARCHAR(45),
    PRIMARY KEY(DniEmpleado),
    FOREIGN KEY (DniEmpleado) REFERENCES PERSONA (Dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ESTUDIANTE(
    DniEstudiante INT NOT NULL,
    DptoEspec VARCHAR(45),
    PRIMARY KEY (DniEstudiante),
    FOREIGN KEY (DniEstudiante) REFERENCES PERSONA (Dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ALUMNO(
    DniAlumno INT NOT NULL,
    PRIMARY KEY (DniAlumno),
    FOREIGN KEY (DniAlumno) REFERENCES PERSONA (Dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

/*Duda acerca de la llave*/
CREATE TABLE LICENCIATURA(
    DniAlumno INT NOT NULL,
    Anio INT NOT NULL,
    Grado INT NOT NULL,
    Especialidad INT NOT NULL,
    PRIMARY KEY (DniAlumno, Anio, Grado, Especialidad),
    FOREIGN KEY (DniAlumno) REFERENCES PERSONA (Dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ADMINISTRATIVO(
    DniEmpleado INT NOT NULL,
    Salario VARCHAR(45),
    Posicion VARCHAR(45),
    PRIMARY KEY (DniEmpleado),
    FOREIGN KEY (DniEmpleado) REFERENCES EMPLEADO (DniEmpleado)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE DOCENTE(
    DniEmpleado INT NOT NULL,
    Salario VARCHAR(45),
    Rango VARCHAR(45),
    PRIMARY KEY (DniEmpleado),
    FOREIGN KEY (DniEmpleado) REFERENCES EMPLEADO (DniEmpleado)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ADJUNTO(
    DniAdjunto INT NOT NULL PRIMARY KEY,
    Salario VARCHAR(45),
    DptoEspec VARCHAR(45),
    PorcenTiempo VARCHAR(45),
)ENGINE = InnoDB;

CREATE TABLE ESTUDIANTE_DIPLOMADO(
    DniEstudiante INT NOT NULL,
    DptoEspec VARCHAR(45),
    ProgGrado VARCHAR(45),
    PRIMARY KEY (DniEstudiante),
    FOREIGN KEY (DniEstudiante) REFERENCES ESTUDIANTE (DniEstudiante)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ESTUDIANTE_NO_DIPLOMADO(
    DniEstudiante INT NOT NULL,
    DptoEspec VARCHAR(45),
    Clase VARCHAR(45),
    PRIMARY KEY (DniEstudiante),
    FOREIGN KEY (DniEstudiante) REFERENCES ESTUDIANTE (DniEstudiante)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ADJUNTO_INVESTIGACION(
    DniAdjunto INT NOT NULL,
    Proyecto VARCHAR(45),
    PRIMARY KEY (DniAdjunto),
    FOREIGN KEY (DniAdjunto) REFERENCES (DniAdjunto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ADJUNTO_ESENNIANZA(
    DniAdjunto INT NOT NULL,
    Curso VARCHAR(45),
    PRIMARY KEY (DniAdjunto),
    FOREIGN KEY (DniAdjunto) REFERENCES (DniAdjunto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;
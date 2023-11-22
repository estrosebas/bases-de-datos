-- Crear base de datos y uso
CREATE DATABASE IF NOT EXISTS matriculas; -- Creacion de la base de dato en caso de no existir caso contraio no se crea
USE matriculas; -- Utiliza la base de datos

-- Crear tabla `distriitoalum` en caso de no existir
-- Propósito: Almacena información sobre los distritos de los alumnos, como el nombre del distrito.
CREATE TABLE IF NOT EXISTS `distriitoalum` ( 
  `id_distritoAlum` int(11) NOT NULL AUTO_INCREMENT, -- Identificador único para distritos de alumnos, no nulo y autoincrementado para evitar inserciones vacias y repeticion
  `distritoA` varchar(30) NOT NULL, -- Nombre del distrito de alumnos, no nulo para evitar inserciones vacias
  PRIMARY KEY (`id_distritoAlum`) -- Clave primaria para identificar de manera única a cada distrito de alumnos
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `distritorepre` en caso de no existir
-- Propósito: Almacena información sobre los distritos de los representantes, como el nombre del distrito.
CREATE TABLE IF NOT EXISTS `distritorepre` (
  `id_distritoR` int(11) NOT NULL AUTO_INCREMENT, -- Identificador único para distritos de representantes, no nulo y autoincrementado para evitar inserciones vacias y repeticion
  `distritoR` varchar(30) NOT NULL, -- Nombre del distrito de representantes, no nulo para evitar inserciones vacias
  PRIMARY KEY (`id_distritoR`) -- Clave primaria para identificar de manera única a cada distrito de representantes
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql) -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `telefono` en caso de no existir
-- Propósito: Gestiona números de teléfono asociados a los representantes.
CREATE TABLE IF NOT EXISTS `telefono` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT, -- Identificador único para teléfonos, no nulo y autoincrementado para evitar inserciones vacias y repeticion
  `telefono` int(9) NOT NULL, -- Número de teléfono, no nulo para evitar inserciones vacias
  PRIMARY KEY (`id_telefono`) -- Clave primaria para identificar de manera única a cada telefono
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `habilidad` en caso de no existir
-- Propósito: Registra diferentes habilidades, que pueden ser asignadas a los alumnos.
CREATE TABLE IF NOT EXISTS `habilidad` (
  `id_habilidad` int(11) NOT NULL AUTO_INCREMENT, -- Identificador único para habilidades, no nulo y autoincrementado para evitar inserciones vacias y repeticion
  `habilidad` varchar(30) NOT NULL, -- Nombre de la habilidad, no nulo para evitar inserciones vacias
  PRIMARY KEY (`id_habilidad`) -- Clave primaria para identificar de manera única a cada habilidad
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `representante` en caso de no existir
-- Propósito: Contiene detalles sobre los representantes, incluyendo información personal, de contacto y laboral.
CREATE TABLE IF NOT EXISTS `representante` (
  `id_Repre` int(11) NOT NULL AUTO_INCREMENT, -- Identificador único para representantes, no nulo y autoincrementado para evitar inserciones vacias y repeticion
  `dni_Repre` int(15) NOT NULL, -- DNI del representante, no nulo para evitar inserciones vacias
  `nom_Repre` varchar(30) NOT NULL, -- Nombre del representante, no nulo para evitar inserciones vacias
  `ape_PRe` varchar(30) NOT NULL, -- Apellido paterno del representante, no nulo para evitar inserciones vacias
  `ape_MRe` varchar(30) NOT NULL, -- Apellido materno del representante, no nulo para evitar inserciones vacias
  `sexo` varchar(30) NOT NULL, -- Género del representante, no nulo para evitar inserciones vacias
  `id_distritoR` int(15) NOT NULL, -- Identificador del distrito del representante, no nulo para evitar inserciones vacias
  `domicilio` varchar(30) NOT NULL, -- Domicilio del representante, no nulo para evitar inserciones vacias
  `ocupacion` varchar(30) NOT NULL, -- Ocupación del representante, no nulo para evitar inserciones vacias
  `lugar_traba` varchar(30) NOT NULL, -- Lugar de trabajo del representante, no nulo para evitar inserciones vacias
  `correo` varchar(30) NOT NULL, -- Correo electrónico del representante, no nulo para evitar inserciones vacias
  `id_telefono` int(15) NOT NULL, -- Identificador del teléfono del representante, no nulo para evitar inserciones vacias
  PRIMARY KEY (`id_Repre`), -- Clave primaria para identificar de manera única a cada representante
  KEY `tele` (`id_telefono`), -- Índice para optimizar búsquedas por teléfono
  KEY `distriRe` (`id_distritoR`), -- Índice para optimizar búsquedas por distrito
  CONSTRAINT `distriRe` FOREIGN KEY (`id_distritoR`) REFERENCES `distritorepre` (`id_distritoR`), -- Establece una relación con la tabla `distritorepre` mediante el identificador del distrito
  CONSTRAINT `tele` FOREIGN KEY (`id_telefono`) REFERENCES `telefono` (`id_telefono`) -- Establece una relación con la tabla `telefono` mediante el identificador del teléfono
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `alumno` en caso de no existir
-- Propósito: Almacena información detallada sobre los alumnos, incluyendo datos personales, de contacto, académicos y de representantes.
CREATE TABLE IF NOT EXISTS `alumno` (
  `id_Alumno` int(11) NOT NULL AUTO_INCREMENT, -- Identificador único para alumnos, no nulo y autoincrementado para evitar inserciones vacias y repeticion
  `dni_Alumno` int(15) NOT NULL, -- DNI del alumno, no nulo para evitar inserciones vacías
  `nom_Alu` varchar(30) NOT NULL, -- Nombre del alumno, no nulo para evitar inserciones vacías
  `ape_PAl` varchar(30) NOT NULL, -- Apellido paterno del alumno, no nulo para evitar inserciones vacías
  `ape_MAl` varchar(30) NOT NULL, -- Apellido materno del alumno, no nulo para evitar inserciones vacías
  `fec_Nac` date NOT NULL, -- Fecha de nacimiento del alumno, no nulo para evitar inserciones vacías
  `sexo` varchar(30) NOT NULL, -- Género del alumno, no nulo para evitar inserciones vacías
  `id_distritoAlum` int(15) NOT NULL, -- Identificador del distrito del alumno, no nulo para evitar inserciones vacías
  `domicilio` varchar(30) NOT NULL, -- Domicilio del alumno, no nulo para evitar inserciones vacías
  `nivel_ing` varchar(30) NOT NULL, -- Nivel de ingreso del alumno, no nulo para evitar inserciones vacías
  `grado_ing` int(15) NOT NULL, -- Grado de ingreso del alumno, no nulo para evitar inserciones vacías
  `colegio_ant` varchar(30) NOT NULL, -- Colegio anterior del alumno, no nulo para evitar inserciones vacías
  `id_habilidad` int(15) NOT NULL, -- Identificador de habilidad del alumno, no nulo para evitar inserciones vacías
  `id_Repre` int(15) NOT NULL, -- Identificador del representante del alumno, no nulo para evitar inserciones vacías
  `relacion` varchar(30) NOT NULL, -- Relación con el representante del alumno, no nulo para evitar inserciones vacías
  PRIMARY KEY (`id_Alumno`), -- Clave primaria para identificar de manera única a cada alumno
  KEY `habilidad` (`id_habilidad`), -- Índice para optimizar búsquedas por habilidad
  KEY `distriA` (`id_distritoAlum`), -- Índice para optimizar búsquedas por distrito de alumnos
  KEY `repre` (`id_Repre`), -- Índice para optimizar búsquedas por representante
  CONSTRAINT `distriA` FOREIGN KEY (`id_distritoAlum`) REFERENCES `distriitoalum` (`id_distritoAlum`),  -- Establece una relación con la tabla `distriitoalum` mediante el identificador del distrito de alumnos
  CONSTRAINT `habilidad` FOREIGN KEY (`id_habilidad`) REFERENCES `habilidad` (`id_habilidad`), -- Establece una relación con la tabla `habilidad` mediante el identificador de habilidad
  CONSTRAINT `repre` FOREIGN KEY (`id_Repre`) REFERENCES `representante` (`id_Repre`) -- Establece una relación con la tabla `representante` mediante el identificador del representante
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `administrador` en caso de no existir
-- Propósito: Registra información sobre los administradores del sistema, como sus nombres.
CREATE TABLE IF NOT EXISTS `administrador` (
  `id_admini` int(11) NOT NULL AUTO_INCREMENT, -- Identificador único para administradores, no nulo y autoincrementado para evitar inserciones vacias y repeticion
  `nombre_Admini` varchar(30) NOT NULL, -- Nombre del administrador, no nulo para evitar inserciones vacías
  PRIMARY KEY (`id_admini`) -- Clave primaria para identificar de manera única a cada administrador
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `iniciosesion` en caso de no existir
-- Propósito: Administra la información de inicio de sesión para los administradores, incluyendo nombres de usuario o correos y contraseñas.
CREATE TABLE IF NOT EXISTS `iniciosesion` (
  `id_Usuario` varchar(30) NOT NULL, -- Identificador único para usuarios de inicio de sesión, no nulo para evitar inserciones vacias (Maneja nombres de usuario o correos)
  `contra` varchar(30) NOT NULL, -- Contraseña del usuario, no nulo para evitar inserciones vacias
  `id_admini` int(15) NOT NULL, -- Identificador del administrador asociado, no nulo para evitar inserciones vacias
  PRIMARY KEY (`id_Usuario`), -- Clave primaria para identificar de manera única a cada usuario de inicio de sesión
  KEY `administrador` (`id_admini`),-- Índice para optimizar búsquedas por administrador asociado
  CONSTRAINT `administrador` FOREIGN KEY (`id_admini`) REFERENCES `administrador` (`id_admini`) -- Establece una relación con la tabla `administrador` mediante el identificador del administrador
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- Crear tabla `matricula` en caso de no existir
-- Propósito: Contiene datos relacionados con las matrículas de los alumnos, como nivel, grado, estado, método de pago, monto pagado, observaciones y usuario asociado a la creación de la matrícula.
CREATE TABLE IF NOT EXISTS `matricula` (
  `id_Matricula` int(15) NOT NULL AUTO_INCREMENT, -- Identificador único para matrículas, no nulo y autoincrementado para evitar inserciones vacías
  `id_Alumno` int(15) NOT NULL, -- Identificador del alumno asociado a la matrícula, no nulo para evitar inserciones vacías
  `nivel_m` varchar(30) NOT NULL, -- Nivel de la matrícula, no nulo para evitar inserciones vacías
  `grado_m` int(15) NOT NULL,  -- Grado de la matrícula, no nulo para evitar inserciones vacías
  `estado_m` varchar(30) NOT NULL, -- Estado de la matrícula, no nulo para evitar inserciones vacías
  `metodo_Pago` varchar(30) NOT NULL, -- Método de pago de la matrícula, no nulo para evitar inserciones vacías
  `monto_Pago` double NOT NULL, -- Monto pagado en la matrícula, no nulo para evitar inserciones vacías, double para poder manejar precios con decimales
  `observaciones` varchar(30) NOT NULL, -- Observaciones de la matrícula, no nulo para evitar inserciones vacías
  `id_Usuario` varchar(30) NOT NULL, --- Identificador del usuario asociado a la creacion de la matrícula, no nulo para evitar inserciones vacías
  PRIMARY KEY (`id_Matricula`), -- Clave primaria para identificar de manera única a cada matrícula
  KEY `alumno` (`id_Alumno`), -- Índice para optimizar búsquedas por alumno asociado
  KEY `usuario` (`id_Usuario`), -- Índice para optimizar búsquedas por usuario asociado
  CONSTRAINT `alumno` FOREIGN KEY (`id_Alumno`) REFERENCES `alumno` (`id_Alumno`), -- Establece una relación con la tabla `alumno` mediante el identificador del alumno
  CONSTRAINT `usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `iniciosesion` (`id_Usuario`) -- Establece una relación con la tabla `iniciosesion` mediante el identificador del usuario
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; -- Crea una tabla con el motor InnoDB, conjunto de caracteres utf8mb4, y regla de comparación insensible a mayúsculas y minúsculas(autogenerado por mysql)

-- (Script comentado y explicado por Diego Sebastian Gonzales Gomez)
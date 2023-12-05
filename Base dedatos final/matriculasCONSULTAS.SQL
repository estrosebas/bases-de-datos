-------------------
-----GROUP BY -----
-------------------

-- ---------------------------------------------------------------

-- Este script SQL cuenta el número total de estudiantes por distrito en la tabla 'distriitoalum' y 'alumno'.
-- Utiliza un JOIN para combinar las filas basadas en la igualdad de los identificadores de distrito de ambas tablas.

SELECT
    da.distritoA,                       -- Selecciona el nombre del distrito desde la tabla distriitoalum
    COUNT(*) AS total_estudiantes       -- Cuenta el número total de estudiantes y le asigna el alias total_estudiantes
FROM
    distriitoalum da                    -- Alias 'da' para la tabla distriitoalum
JOIN
    alumno a                            -- Alias 'a' para la tabla alumno
ON
    da.id_distritoAlum = a.id_distritoAlum  -- Realiza un JOIN basado en la igualdad de los identificadores de distrito
GROUP BY
    da.distritoA;                       -- Agrupa los resultados por el nombre del distrito en distriitoalum

-- ---------------------------------------------------------------


-- Este script SQL devuelve el número total de representantes por distrito.
-- Utiliza las tablas 'distritorepre' (alias 'dr') y 'representante' (alias 'r'),
-- realizando un JOIN basado en la igualdad de las columnas 'id_distritoR'.
-- El resultado incluye el nombre del distrito y el total de representantes en ese distrito.
-- La información se agrupa por distrito para obtener un resumen estructurado.

SELECT
    dr.distritoR,            -- Selecciona el nombre del distrito desde la tabla distritorepre
    COUNT(*) AS total_representantes  -- Cuenta el número total de representantes y le asigna el alias total_representantes
FROM
    distritorepre dr          -- Alias 'dr' para la tabla distritorepre
JOIN
    representante r           -- Alias 'r' para la tabla representante
ON
    dr.id_distritoR = r.id_distritoR  -- Realiza un JOIN basado en la igualdad de las columnas id_distritoR
GROUP BY
    dr.distritoR;            -- Agrupa los resultados por el nombre del distrito en distritorepre

-- ---------------------------------------------------------------

-- Este script SQL calcula el promedio del monto de pago para cada método de pago en la tabla 'matricula'.
-- La tabla 'matricula' se representa con el alias 'm'.

SELECT
    m.metodo_Pago,                  -- Selecciona el método de pago desde la tabla matricula
    AVG(m.monto_Pago) AS promedio_monto_pago  -- Calcula el promedio del monto de pago y le asigna el alias promedio_monto_pago
FROM
    matricula m                     -- Alias 'm' para la tabla matricula
GROUP BY
    m.metodo_Pago;                  -- Agrupa los resultados por el método de pago en la tabla matricula

-- ---------------------------------------------------------------

-- Este script SQL cuenta el número total de alumnos por nivel de ingreso en la tabla 'alumno'.
-- La tabla 'alumno' se representa con el alias 'a'.

SELECT
    a.nivel_ing,              -- Selecciona el nivel de ingreso desde la tabla alumno
    COUNT(*) AS total_alumnos -- Cuenta el número total de alumnos y le asigna el alias total_alumnos
FROM
    alumno a                   -- Alias 'a' para la tabla alumno
GROUP BY
    a.nivel_ing;              -- Agrupa los resultados por el nivel de ingreso en la tabla alumno

-- ---------------------------------------------------------------

-- Este script SQL cuenta el número total de representantes por género en la tabla 'representante'.
-- La tabla 'representante' se representa con el alias 'r'.

SELECT
    r.sexo,                   -- Selecciona el género desde la tabla representante
    COUNT(*) AS total_representantes  -- Cuenta el número total de representantes y le asigna el alias total_representantes
FROM
    representante r            -- Alias 'r' para la tabla representante
GROUP BY
    r.sexo;                   -- Agrupa los resultados por el género en la tabla representante

-- ---------------------------------------------------------------

-- Este script SQL calcula la edad promedio de los alumnos por nivel de ingreso en la tabla 'alumno'.
-- La tabla 'alumno' se representa con el alias 'a'.

SELECT
    a.nivel_ing,                             -- Selecciona el nivel de ingreso desde la tabla alumno
    AVG(YEAR(CURRENT_DATE) - YEAR(a.fec_Nac)) AS edad_promedio  -- Calcula la edad promedio y le asigna el alias edad_promedio
FROM
    alumno a                                  -- Alias 'a' para la tabla alumno
GROUP BY
    a.nivel_ing;                             -- Agrupa los resultados por el nivel de ingreso en la tabla alumno

-- ---------------------------------------------------------------

-----------------------------
-----CLAUSULA HAVING---------
-----------------------------

-- Este script SQL cuenta la cantidad de representantes por distrito en la tabla 'representante'
-- y filtra aquellos distritos que tienen más de un representante.

SELECT
    id_distritoR,                               -- Selecciona el identificador del distrito desde la tabla representante
    COUNT(*) AS cantidad_representantes         -- Cuenta la cantidad de representantes y le asigna el alias cantidad_representantes
FROM
    representante                                -- Tabla representante
GROUP BY
    id_distritoR                                 -- Agrupa los resultados por el identificador del distrito
HAVING
    cantidad_representantes > 1;                 -- Filtra aquellos distritos que tienen más de un representante

-- ---------------------------------------------------------------

-- Este script SQL cuenta la cantidad de estudiantes por distrito en la tabla 'alumno'
-- y filtra aquellos distritos que tienen más de un estudiante.

SELECT
    id_distritoAlum,                            -- Selecciona el identificador del distrito desde la tabla alumno
    COUNT(*) AS cantidad_estudiantes            -- Cuenta la cantidad de estudiantes y le asigna el alias cantidad_estudiantes
FROM
    alumno                                      -- Tabla alumno
GROUP BY
    id_distritoAlum                              -- Agrupa los resultados por el identificador del distrito
HAVING
    cantidad_estudiantes > 1;                    -- Filtra aquellos distritos que tienen más de un estudiante

-- ---------------------------------------------------------------

-- Este script SQL calcula el promedio de pago por nivel en la tabla 'matricula'
-- y filtra aquellos niveles cuyo promedio de pago es mayor que 350.

SELECT
    nivel_m,                           -- Selecciona el nivel desde la tabla matricula
    AVG(monto_Pago) AS promedio_pago    -- Calcula el promedio de pago y le asigna el alias promedio_pago
FROM
    matricula                           -- Tabla matricula
GROUP BY
    nivel_m                             -- Agrupa los resultados por el nivel en la tabla matricula
HAVING
    promedio_pago > 350;                -- Filtra aquellos niveles cuyo promedio de pago es mayor que 350

-- ---------------------------------------------------------------

-- Este script SQL cuenta la cantidad de matrículas realizadas por cada administrador
-- y filtra aquellos administradores que tienen más de una matrícula.
-- Utiliza las tablas 'iniciosesion' (alias 'i'), 'administrador' (alias 'a'), y 'matricula' (alias 'm').

SELECT
    i.id_admini,                              -- Selecciona el identificador del administrador desde la tabla iniciosesion
    a.nombre_Admini,                         -- Selecciona el nombre del administrador desde la tabla administrador
    COUNT(*) AS cantidad_matriculas           -- Cuenta la cantidad de matrículas y le asigna el alias cantidad_matriculas
FROM
    iniciosesion i                            -- Alias 'i' para la tabla iniciosesion
JOIN
    administrador a                           -- Alias 'a' para la tabla administrador
ON
    i.id_admini = a.id_admini                 -- Realiza un JOIN basado en la igualdad de las columnas id_admini
JOIN
    matricula m                               -- Alias 'm' para la tabla matricula
ON
    i.id_Usuario = m.id_Usuario               -- Realiza un JOIN basado en la igualdad de las columnas id_Usuario
GROUP BY
    i.id_admini                               -- Agrupa los resultados por el identificador del administrador en iniciosesion
HAVING
    cantidad_matriculas > 1;                  -- Filtra aquellos administradores que tienen más de una matrícula

-- ---------------------------------------------------------------

-------------------------
----FUNCIONES------------
-------------------------

-- Este script SQL cuenta la cantidad de representantes por distrito en la tabla 'representante'.
-- La tabla 'representante' se representa sin alias.

SELECT
    id_distritoR,                          -- Selecciona el identificador del distrito desde la tabla representante
    COUNT(*) AS cantidad_representantes    -- Cuenta la cantidad de representantes y le asigna el alias cantidad_representantes
FROM
    representante                           -- Tabla representante
GROUP BY
    id_distritoR;                          -- Agrupa los resultados por el identificador del distrito en la tabla representante

-- ---------------------------------------------------------------

-- Este script SQL calcula el promedio de edad de los alumnos por nivel de ingreso en la tabla 'alumno'.
-- Utiliza la función CURDATE() para obtener la fecha actual y YEAR() para calcular la diferencia de años.

SELECT
    nivel_ing,                                    -- Selecciona el nivel de ingreso desde la tabla alumno
    AVG(YEAR(CURDATE()) - YEAR(fec_Nac)) AS promedio_edad  -- Calcula el promedio de edad y le asigna el alias promedio_edad
FROM
    alumno                                        -- Tabla alumno
GROUP BY
    nivel_ing;                                   -- Agrupa los resultados por el nivel de ingreso en la tabla alumno

-- ---------------------------------------------------------------

-- Este script SQL cuenta la cantidad de hijos matriculados por representante en la tabla 'representante', 'alumno' y 'matricula'.
-- Utiliza JOIN para combinar las filas basadas en los identificadores de representante y alumno.

SELECT
    r.id_Repre,                                -- Selecciona el identificador del representante desde la tabla representante
    r.nom_Repre,                               -- Selecciona el nombre del representante desde la tabla representante
    COUNT(*) AS cantidad_hijos_matriculados    -- Cuenta la cantidad de hijos matriculados y le asigna el alias cantidad_hijos_matriculados
FROM
    representante r                            -- Alias 'r' para la tabla representante
JOIN
    alumno a                                   -- Alias 'a' para la tabla alumno
ON
    r.id_Repre = a.id_Repre                    -- Realiza un JOIN basado en la igualdad de los identificadores de representante
JOIN
    matricula m                               -- Alias 'm' para la tabla matricula
ON
    a.id_Alumno = m.id_Alumno                 -- Realiza un JOIN basado en la igualdad de los identificadores de alumno
GROUP BY
    r.id_Repre, r.nom_Repre                    -- Agrupa los resultados por el identificador y nombre del representante
ORDER BY
    cantidad_hijos_matriculados DESC           -- Ordena los resultados en orden descendente por la cantidad de hijos matriculados
LIMIT 1;                                      -- Limita los resultados a 1, mostrando el representante con más hijos matriculados

-- ---------------------------------------------------------------

------------------------------
------FUNCIONES CADENA--------
------------------------------

-- Este script SQL selecciona el identificador y el nombre completo de cada representante en la tabla 'representante'.
-- Utiliza CONCAT para combinar los nombres y apellidos de los representantes.

SELECT
    id_Repre,                                               -- Selecciona el identificador del representante desde la tabla representante
    CONCAT(nom_Repre, ' ', ape_PRe, ' ', ape_MRe) AS nombre_completo  -- Combina nombres y apellidos y le asigna el alias nombre_completo
FROM
    representante;                                          -- Tabla representante

-- ---------------------------------------------------------------

-- Este script SQL cuenta la cantidad de alumnos por habilidad en la tabla 'alumno' y 'habilidad'.
-- Utiliza JOIN para combinar las filas basadas en los identificadores de habilidad.

SELECT
    h.habilidad,                             -- Selecciona la habilidad desde la tabla habilidad
    COUNT(*) AS cantidad_alumnos             -- Cuenta la cantidad de alumnos y le asigna el alias cantidad_alumnos
FROM
    alumno a                                  -- Alias 'a' para la tabla alumno
JOIN
    habilidad h                              -- Alias 'h' para la tabla habilidad
ON
    a.id_habilidad = h.id_habilidad          -- Realiza un JOIN basado en la igualdad de los identificadores de habilidad
GROUP BY
    h.habilidad                              -- Agrupa los resultados por la habilidad en la tabla habilidad
ORDER BY
    cantidad_alumnos DESC                    -- Ordena los resultados en orden descendente por la cantidad de alumnos
LIMIT 1;                                     -- Limita los resultados a 1, mostrando la habilidad con más alumnos

-- ---------------------------------------------------------------

-- Este script SQL cuenta la cantidad de matrículas realizadas por cada administrador en las tablas 'iniciosesion', 'administrador' y 'matricula'.
-- Utiliza JOIN para combinar las filas basadas en los identificadores de administrador y usuario.

SELECT
    i.id_admini,                               -- Selecciona el identificador del administrador desde la tabla iniciosesion
    a.nombre_Admini,                           -- Selecciona el nombre del administrador desde la tabla administrador
    COUNT(*) AS cantidad_matriculas            -- Cuenta la cantidad de matrículas y le asigna el alias cantidad_matriculas
FROM
    iniciosesion i                             -- Alias 'i' para la tabla iniciosesion
JOIN
    administrador a                            -- Alias 'a' para la tabla administrador
ON
    i.id_admini = a.id_admini                  -- Realiza un JOIN basado en la igualdad de los identificadores de administrador
JOIN
    matricula m                                -- Alias 'm' para la tabla matricula
ON
    i.id_Usuario = m.id_Usuario                -- Realiza un JOIN basado en la igualdad de los identificadores de usuario
GROUP BY
    i.id_admini, a.nombre_Admini               -- Agrupa los resultados por el identificador y nombre del administrador

-- ---------------------------------------------------------------

-----------------------------
---FUNCIONES ESCALARES-------
-----------------------------

-- Cambiamos el delimitador para evitar conflictos con los puntos y coma dentro de la función
DELIMITER //

-- Creamos la función GetHabilidadName
CREATE FUNCTION GetHabilidadName(habilidad_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE habilidad_name VARCHAR(255);

  -- Seleccionamos el nombre de la habilidad basado en el id_habilidad proporcionado
  SELECT habilidad INTO habilidad_name
  FROM habilidad
  WHERE id_habilidad = habilidad_id;

  RETURN habilidad_name;  -- Devolvemos el nombre de la habilidad
END //

-- Restauramos el delimitador original
DELIMITER ;

-- Ahora usamos la función en una consulta para obtener los id_habilidad junto con los nombres de habilidades
SELECT id_habilidad, GetHabilidadName(id_habilidad) AS nombre_habilidad
FROM habilidad;

-- ---------------------------------------------------------------

-- Cambiamos el delimitador para evitar conflictos con los puntos y coma dentro de la función
DELIMITER //

-- Creamos la función GetDistrictName
CREATE FUNCTION GetDistrictName(distrito_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE distrito_name VARCHAR(255);

  -- Seleccionamos el nombre del distrito basado en el id_distritoAlum proporcionado
  SELECT distritoA INTO distrito_name
  FROM distriitoalum
  WHERE id_distritoAlum = distrito_id;

  RETURN distrito_name;  -- Devolvemos el nombre del distrito
END //

-- Restauramos el delimitador original
DELIMITER ;

-- Ahora usamos la función en una consulta para obtener los id_distritoAlum junto con los nombres de distritos
SELECT id_distritoAlum, GetDistrictName(id_distritoAlum) AS nombre_distrito
FROM distriitoalum;

-- ---------------------------------------------------------------

---------------------------------
---Prodecimientos almacenados----
---------------------------------

-- Cambiamos el delimitador para evitar conflictos con los puntos y coma dentro del procedimiento
DELIMITER //

-- Creamos el procedimiento ObtenerInformacionAlumno
CREATE PROCEDURE ObtenerInformacionAlumno(
    IN p_alumno_id INT
)
BEGIN
    SELECT *
    FROM alumno
    WHERE id_Alumno = p_alumno_id;
END //

-- Restauramos el delimitador original
DELIMITER ;

-- ---------------------------------------------------------------

-- Cambiamos el delimitador para evitar conflictos con los puntos y coma dentro del procedimiento
DELIMITER //

-- Creamos el procedimiento EliminarAlumno
CREATE PROCEDURE EliminarAlumno(
    IN p_alumno_id INT
)
BEGIN
    DELETE FROM alumno
    WHERE id_Alumno = p_alumno_id;
END //

-- Restauramos el delimitador original
DELIMITER ;

-- ---------------------------------------------------------------

-- Cambiamos el delimitador para evitar conflictos con los puntos y coma dentro del procedimiento
DELIMITER //

-- Creamos el procedimiento ObtenerAlumnosPorNivelYGrado
CREATE PROCEDURE ObtenerAlumnosPorNivelYGrado(
    IN p_nivel VARCHAR(30),
    IN p_grado INT
)
BEGIN
    SELECT *
    FROM alumno
    WHERE nivel_ing = p_nivel AND grado_ing = p_grado;
END //

-- Restauramos el delimitador original
DELIMITER ;


-- ---------------------------------------------------------------

-- Cambiamos el delimitador para evitar conflictos con los puntos y coma dentro del procedimiento
DELIMITER //

-- Creamos el procedimiento ActualizarInformacionAlumno
CREATE PROCEDURE ActualizarInformacionAlumno(
    IN p_alumno_id INT,
    IN p_nuevo_domicilio VARCHAR(30),
    IN p_nuevo_nivel_ingreso VARCHAR(30),
    IN p_nuevo_grado_ingreso INT
)
BEGIN
    UPDATE alumno
    SET domicilio = p_nuevo_domicilio,
        nivel_ing = p_nuevo_nivel_ingreso,
        grado_ing = p_nuevo_grado_ingreso
    WHERE id_Alumno = p_alumno_id;
END //

-- Restauramos el delimitador original
DELIMITER ;

-- ---------------------------------------------------------------

-- Cambiamos el delimitador para evitar conflictos con los puntos y coma dentro del procedimiento
DELIMITER //

-- Creamos el procedimiento InsertarAlumno
CREATE PROCEDURE InsertarAlumno(
    IN p_dni INT,
    IN p_nombre VARCHAR(30),
    IN p_apellido_paterno VARCHAR(30),
    IN p_apellido_materno VARCHAR(30),
    IN p_fecha_nacimiento DATE,
    IN p_sexo VARCHAR(30),
    IN p_distrito_id INT,
    IN p_domicilio VARCHAR(30),
    IN p_nivel_ingreso VARCHAR(30),
    IN p_grado_ingreso INT,
    IN p_colegio_anterior VARCHAR(30),
    IN p_habilidad_id INT,
    IN p_representante_id INT,
    IN p_relacion_representante VARCHAR(30)
)
BEGIN
    INSERT INTO alumno (dni_Alumno, nom_Alu, ape_PAl, ape_MAl, fec_Nac, sexo, id_distritoAlum, domicilio, nivel_ing, grado_ing, colegio_ant, id_habilidad, id_Repre, relacion)
    VALUES (p_dni, p_nombre, p_apellido_paterno, p_apellido_materno, p_fecha_nacimiento, p_sexo, p_distrito_id, p_domicilio, p_nivel_ingreso, p_grado_ingreso, p_colegio_anterior, p_habilidad_id, p_representante_id, p_relacion_representante);
END //

-- Restauramos el delimitador original
DELIMITER ;


-----------------
--Diccionario----
-----------------

-- Diccionario de Datos:

-- Tabla 'distritorepre':
--   id_distritoR (INT): Identificador único del distrito representado.
--   distritoR (VARCHAR): Nombre del distrito representado.

-- Tabla 'representante':
--   id_Repre (INT): Identificador único del representante.
--   nom_Repre (VARCHAR): Nombre del representante.
--   sexo (CHAR): Género del representante.
--   id_distritoR (INT): Identificador del distrito representado.

-- Tabla 'alumno':
--   id_Alumno (INT): Identificador único del alumno.
--   nom_Alumno (VARCHAR): Nombre del alumno.
--   fec_Nac (DATE): Fecha de nacimiento del alumno.
--   nivel_ing (VARCHAR): Nivel de ingreso del alumno.
--   id_distritoAlum (INT): Identificador del distrito del alumno.
--   id_habilidad (INT): Identificador de la habilidad del alumno.

-- Tabla 'matricula':
--   id_Matricula (INT): Identificador único de la matrícula.
--   id_Alumno (INT): Identificador del alumno matriculado.
--   monto_Pago (DECIMAL): Monto pagado en la matrícula.
--   metodo_Pago (VARCHAR): Método de pago utilizado.
--   nivel_m (VARCHAR): Nivel de la matrícula.

-- Tabla 'habilidad':
--   id_habilidad (INT): Identificador único de la habilidad.
--   habilidad (VARCHAR): Nombre de la habilidad.

-- Tabla 'iniciosesion':
--   id_admini (INT): Identificador único del administrador.
--   id_Usuario (INT): Identificador único del usuario que inicia sesión.

-- Tabla 'administrador':
--   id_admini (INT): Identificador único del administrador.
--   nombre_Admini (VARCHAR): Nombre del administrador.

-- Tabla 'distriitoalum':
--   id_distritoAlum (INT): Identificador único del distrito del alumno.
--   distritoA (VARCHAR): Nombre del distrito.

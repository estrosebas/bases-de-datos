# Base de Datos de Matrículas 📚

Este script SQL crea un esquema de base de datos para gestionar las matrículas de estudiantes. La base de datos incluye tablas para distritos, números de teléfono, habilidades, representantes, estudiantes, administradores, sesiones de inicio de sesión y matrículas. Desglosemos cada parte y entendamos cómo usarla.

## Tablas 📊

### Tabla `distriitoalum`
- Representa distritos para estudiantes.
- Campos:
  - `id_distritoAlum`: Identificador único del distrito.
  - `distritoA`: Nombre del distrito.

### Tabla `distritorepre`
- Representa distritos para representantes.
- Campos:
  - `id_distritoR`: Identificador único del distrito.
  - `distritoR`: Nombre del distrito.

### Tabla `telefono`
- Representa números de teléfono.
- Campos:
  - `id_telefono`: Identificador único del número de teléfono.
  - `telefono`: Número de teléfono.

### Tabla `habilidad`
- Representa habilidades.
- Campos:
  - `id_habilidad`: Identificador único de la habilidad.
  - `habilidad`: Nombre de la habilidad.

### Tabla `representante`
- Representa a los representantes (tutores) de los estudiantes.
- Campos:
  - `id_Repre`: Identificador único del representante.
  - `dni_Repre`: DNI del representante.
  - `nom_Repre`: Nombre del representante.
  - `ape_PRe`: Apellido paterno del representante.
  - `ape_MRe`: Apellido materno del representante.
  - `sexo`: Género del representante.
  - `id_distritoR`: Identificador del distrito del representante.
  - `domicilio`: Domicilio del representante.
  - `ocupacion`: Ocupación del representante.
  - `lugar_traba`: Lugar de trabajo del representante.
  - `correo`: Correo electrónico del representante.
  - `id_telefono`: Identificador del teléfono del representante.
  - Claves y restricciones para relaciones con otras tablas.

### Tabla `alumno`
- Representa a los estudiantes.
- Campos:
  - `id_Alumno`: Identificador único del estudiante.
  - `dni_Alumno`: DNI del estudiante.
  - `nom_Alu`: Nombre del estudiante.
  - `ape_PAl`: Apellido paterno del estudiante.
  - `ape_MAl`: Apellido materno del estudiante.
  - `fec_Nac`: Fecha de nacimiento del estudiante.
  - `sexo`: Género del estudiante.
  - `id_distritoAlum`: Identificador del distrito del estudiante.
  - `domicilio`: Domicilio del estudiante.
  - `nivel_ing`: Nivel de ingreso del estudiante.
  - `grado_ing`: Grado de ingreso del estudiante.
  - `colegio_ant`: Colegio anterior del estudiante.
  - `id_habilidad`: Identificador de la habilidad del estudiante.
  - `id_Repre`: Identificador del representante del estudiante.
  - `relacion`: Relación con el representante del estudiante.
  - Claves y restricciones para relaciones con otras tablas.

### Tabla `administrador`
- Representa a los administradores.
- Campos:
  - `id_admini`: Identificador único del administrador.
  - `nombre_Admini`: Nombre del administrador.

### Tabla `iniciosesion`
- Representa sesiones de inicio de sesión.
- Campos:
  - `id_Usuario`: Identificador único del usuario.
  - `contra`: Contraseña del usuario.
  - `id_admini`: Identificador del administrador asociado.
  - Claves y restricciones para relaciones con otras tablas.

### Tabla `matricula`
- Representa matrículas.
- Campos:
  - `id_Matricula`: Identificador único de la matrícula.
  - `id_Alumno`: Identificador del estudiante asociado a la matrícula.
  - `nivel_m`: Nivel de la matrícula.
  - `grado_m`: Grado de la matrícula.
  - `estado_m`: Estado de la matrícula.
  - `metodo_Pago`: Método de pago de la matrícula.
  - `monto_Pago`: Monto pagado en la matrícula.
  - `observaciones`: Observaciones de la matrícula.
  - `id_Usuario`: Identificador del usuario asociado a la matrícula.
  - Claves y restricciones para relaciones con otras tablas.

## Uso 🚀

1. **Creación de la Base de Datos:**
    - Ejecuta el script para crear la base de datos `matriculas`.

2. **Creación de Tablas:**
    - Las tablas se crean dentro de la base de datos `matriculas`.
    - Cada tabla tiene campos y relaciones específicas.

3. **Claves Externas:**
    - Presta atención a las claves externas que vinculan las tablas para mantener la integridad de los datos.

4. **Inserción de Datos:**
    - Usa declaraciones SQL `INSERT` para poblar las tablas con datos.

## Consultas Ejemplo 📝

### Seleccionar todos los estudiantes y sus representantes:
```sql
SELECT alumno.*, representante.*
FROM alumno
JOIN representante ON alumno.id_Repre = representante.id_Repre;
```
### Obtener detalles de matrícula para un estudiante específico:
```sql
SELECT *
FROM matricula
WHERE id_Alumno = [id_estudiante];
```
### Encontrar administradores y sus detalles de inicio de sesión:
```sql
SELECT administrador.*, iniciosesion.*
FROM administrador
JOIN iniciosesion ON administrador.id_admini = iniciosesion.id_admini;
```

## Notas Importantes 📌
- Asegúrate siempre de la consistencia de los datos al insertar registros.
- Utiliza claves y restricciones apropiadas para mantener las relaciones.

**¡Este script fue desarrollado unicamente para ser implementado en el programa matriculasutp desarrollado por Diego Sebastian Gonzales Gomez!**

**¡Los datos del volcado son inventados y rellenados aleatoriamente!**
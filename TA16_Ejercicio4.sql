# 4.1. Mostrar el nombre de todas las películas
SELECT NOMBRE FROM peliculas;

# 4.2. Mostrar las distintas calificaciones de edad que existen
SELECT DISTINCT CALIFICACIONEDAD FROM peliculas;

# 4.3. Mostrar todas las películas que no han sido calificadas
SELECT * FROM peliculas WHERE CALIFICACIONEDAD IS NULL;

# 4.4. Mostrar todas las salas que no proyectan ninguna película
SELECT * FROM salas WHERE PELICULA IS NULL;

# 4.5. Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la película
SELECT * FROM salas LEFT JOIN peliculas ON salas.PELICULA = peliculas.CODIGO;

# 4.6. Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala
SELECT * FROM salas RIGHT JOIN peliculas ON salas.PELICULA = peliculas.CODIGO;

# 4.7. Mostrar los nombres de las películas que no se proyectan en ninguna sala
SELECT peliculas.NOMBRE
FROM salas RIGHT JOIN peliculas ON salas.PELICULA = peliculas.CODIGO
WHERE salas.PELICULA IS NULL;

# 4.8. Añadir una nueva película 'Uno, Dos, Tres', para mayores de 7 años
INSERT INTO peliculas(CODIGO, NOMBRE,CALIFICACIONEDAD)
VALUES(11, 'Uno, Dos, Tres', 7);

# 4.9. Hacer constar que todas las películas no calificadas han sido calificadas 'no recomendables para menores de 13 años'
UPDATE peliculas SET CALIFICACIONEDAD=13
WHERE CALIFICACIONEDAD IS NULL;

# 4.10. Eliminar todas las salas que proyectan películas recomendadas para todos los públicos
DELETE FROM salas
WHERE PELICULA IN (
 SELECT CODIGO FROM peliculas WHERE CALIFICACIONEDAD = 'PG');
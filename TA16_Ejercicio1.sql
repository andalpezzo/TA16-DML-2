# 1.1. Obtener los NOMBREs de los productos de la tienda
SELECT NOMBRE FROM articulos;

# 1.2. Obtener los NOMBREs y los PRECIOs de los productos de la tienda
SELECT NOMBRE, PRECIO FROM articulos;

# 1.3. Obtener el NOMBRE de los productos cuyo PRECIO sea mayor o igual a 200 €
SELECT NOMBRE FROM articulos WHERE PRECIO > 200;

# 1.4. Obtener todos los datos de los artículos cuyo PRECIO esté entre los 60 € y los 120 € (ambas cantidades incluidas)
SELECT * FROM articulos WHERE PRECIO BETWEEN 60 AND 120;

# 1.5.  Obtener el NOMBRE y el PRECIO en pesetas (es decir, el PRECIO en euros multiplicado por 166'386)
SELECT NOMBRE, PRECIO * 166.386 AS PrecioPtas FROM articulos;

# 1.6. Seleccionar el precio medio de todos los productos
SELECT AVG(PRECIO) FROM articulos;

# 1.7. Obtener el precio medio de los artículos cuyo código de fabricante sea 2
SELECT AVG(PRECIO) FROM articulos WHERE FABRICANTE = 2;

# 1.8. Obtener el número de artículos cuyo precio sea mayor o igual a 180 €
SELECT COUNT(*) FROM articulos WHERE PRECIO >= 180;

# 1.9.  Obtener el NOMBRE y precio de los artículos cuyo precio sea mayor o igual a 180 €
# y ordenarlos descendentemente por PRECIO, y luego ascendentemente por NOMBRE
SELECT NOMBRE, PRECIO
FROM articulos
WHERE PRECIO >= 180
ORDER BY PRECIO DESC, NOMBRE;

# 1.10. Obtener un listado completo de artículos, incluyendo por cada articulo los datos del articulo y de su fabricante
SELECT *
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO;

# 1.11. Obtener un listado de artículos, incluyendo el NOMBRE del artículo, su precio, y el NOMBRE de su fabricante
SELECT articulos.NOMBRE, PRECIO, fabricantes.NOMBRE
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO;

#1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante
SELECT AVG(PRECIO), FABRICANTE
FROM articulos
GROUP BY FABRICANTE;

# 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el NOMBRE del fabricante
SELECT AVG(PRECIO), fabricantes.NOMBRE
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.NOMBRE;

# 1.14. Obtener los NOMBREs de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 €
SELECT AVG(PRECIO), fabricantes.NOMBRE
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.NOMBRE
HAVING AVG(PRECIO) >= 150;

# 1.15. Obtener el NOMBRE y precio del artículo más barato
SELECT NOMBRE, PRECIO
FROM articulos
WHERE PRECIO = (SELECT MIN(PRECIO) FROM articulos);

# 1.16. Obtener una lista con el NOMBRE y precio de los artículos más caros de cada proveedor (incluyendo el NOMBRE del proveedor)
SELECT A.NOMBRE, A.PRECIO, F.NOMBRE
FROM articulos A, fabricantes F
WHERE A.FABRICANTE = F.CODIGO
AND A.PRECIO = (
 SELECT MAX(A2.PRECIO)
 FROM articulos A2
 WHERE A2.FABRICANTE = F.CODIGO);
 
# 1.17. Añadir un nuevo producto: Altavoces de 70 € (del fabricante 2)
INSERT INTO articulos (CODIGO, NOMBRE, PRECIO ,FABRICANTE)
VALUES (11, 'Altavoces', 70, 2);

# 1.18. Cambiar el NOMBRE del producto 8 a 'Impresora Laser'
UPDATE articulos SET NOMBRE = 'Impresora Laser' WHERE CODIGO = 8;

# 1.19. Aplicar un descuento del 10 % (multiplicar el precio por 0'9) a todos los productos
UPDATE articulos SET PRECIO = PRECIO * 0.9;

#1.20. Aplicar un descuento de 10 € a todos los productos cuyo precio sea mayor o igual a 120 €
UPDATE articulos SET PRECIO = PRECIO - 10 WHERE PRECIO >= 120;
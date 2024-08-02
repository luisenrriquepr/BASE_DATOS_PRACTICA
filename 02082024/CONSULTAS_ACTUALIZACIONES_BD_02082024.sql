-- Pregunta 1
-- Mostrar todos los art�culos menos a los de marca MAXELL con sus nombres, modelo y precio de aquellos cuyo precio sea menor que 100.
SELECT 
    descripcion AS Nombre_Articulo,
    modelo AS Modelo_Articulo,
    precio AS Precio_Articulo
FROM 
    articulos
WHERE 
    marca <> 'MAXELL'
    AND precio < 100;

-- Pregunta 2
-- Se realiz� la compra de 5 unidades de los art�culos cuyo stock se hayan agotado o al menos sea menos que 5 y adem�s sea de marca �MAXELL� 
UPDATE articulos
SET stock = stock + 5
WHERE marca = 'MAXELL'
AND (stock <= 5 OR stock = 0);

-- Pregunta 3
-- Se decide aumentar en un 10% el precio de los art�culos de aquellos cuyo precio se encuentre entre 100 y 500 soles.
UPDATE articulos
SET precio = precio * 1.1
WHERE precio BETWEEN 100 AND 500;

-- Pregunta 4
-- Mostrar los art�culos con sus nombres, marca, precio y stock de aquellos cuyo precio sea menor que 200 y adem�s en stock ya est�n menos de 5 art�culos.
SELECT 
    descripcion AS Nombre_Articulo,
    marca AS Marca,
    precio AS Precio,
    stock AS Stock
FROM 
    articulos
WHERE 
    precio < 200
    AND stock < 5;

-- Pregunta 5
-- Mostrar las compras realizadas a trav�s de facturas durante el �ltimo semestre del a�o pasado
SELECT f.num_fac, f.fec_emi, f.cod_cli, c.raz_soc, f.cod_ven, v.apellidos, v.nombres, d.cod_art, a.descripcion, d.cantidad, d.pre_ven
FROM factura f
JOIN detalle d ON f.num_fac = d.num_fac
JOIN clientes c ON f.cod_cli = c.cod_cli
JOIN vendedores v ON f.cod_ven = v.cod_ven
JOIN articulos a ON d.cod_art = a.cod_art
WHERE f.fec_emi BETWEEN '2023-07-01' AND '2023-12-31'
ORDER BY f.fec_emi;

-- Pregunta 6
-- Mostrar a los clientes con su raz�n social, ruc, tel�fono y direcci�n de aquellos cuyo tel�fono sea tel�fono fijo 
SELECT cod_cli, raz_soc, ruc, telefono, direccion
FROM clientes
WHERE telefono LIKE '066%';

-- Pregunta 7
-- Mostrar a los clientes con su raz�n social, ruc, tel�fono y direcci�n de aquellos nacidos el 15 de enero de 1985
SELECT cod_cli, raz_soc, ruc, telefono, direccion
FROM clientes
WHERE fec_nac = '1985-01-15';

-- Pregunta 8
-- Mostrar las ventas realizadas en la factura �000005� con sus datos fecha de emisi�n, c�digo del cliente a quien se vendi� y el c�digo del vendedor que lo vendi�.
SELECT f.num_fac, f.fec_emi, f.cod_cli, f.cod_ven, d.cod_art, d.cantidad, d.pre_ven
FROM factura f
JOIN detalle d ON f.num_fac = d.num_fac
WHERE f.num_fac = '000005';

-- Pregunta 9
-- Mostrar a cuanto asciende la venta realizada en la factura �000005� con sus datos n� de factura, cantidad, precio de venta, sub_total, IGV (incluye en el precio)
SELECT d.num_fac, 
       d.cantidad, 
       d.pre_ven, 
       (d.cantidad * d.pre_ven) AS sub_total,
       (d.cantidad * d.pre_ven) * 0.18 AS IGV,
       (d.cantidad * d.pre_ven) AS total_venta
FROM detalle d
WHERE d.num_fac = '000005';

-- Pregunta 10
-- Mostrar a los clientes que viven en una avenida y que en su Ruc termine en 22
SELECT cod_cli, raz_soc, ruc, telefono, direccion
FROM clientes
WHERE direccion LIKE 'AV.%'
  AND ruc LIKE '%22';


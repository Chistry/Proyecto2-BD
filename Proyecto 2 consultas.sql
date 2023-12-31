SELECT P.*
FROM APLICACION A,
	PROVEEDOR P
WHERE (A.ID = P.ID)
GROUP BY A.ID
HAVING COUNT(A.ID_PRODUCTO) =
	(SELECT MAX(COUNT(ID_PRODUCTO)
													FROM APLICACION
													GROUP BY ID) SELECT U.COD_VVT,
			U.FECHA_VEN,
			U.NUM_TDC,
			COUNT(DISTINT(C.ID_PRODUCTO)))
FROM USUARIO U,
	COMPRA C
WHERE (U.ID = C.ID_USUARIO)
	AND (DATEDIFF(MONTH,

							CONVERT(date,GETDATE()),
							U.FECHA_VEN) <= 3)
GROUP BY C.ID_USUARIO

SELECT C.ID_USUARIO
FROM APLICACION A,
	CANCION CA,
	COMPRA C
WHERE (C.ID_PRODUCTO = A.ID_PRODUCTO)
	AND (C.ID_PRODUCTO = CA.ID_PRODUCTO)
	AND (CA.GENERO = ‘ELECTRONICA’)
	AND (A.TEMATICA = ‘COCINA’)
	SELECT ID_PRODUCTO,
		PUNTUACION,
		COSTO,
		TAMAÑO_MB,
		VERSION,
		NOMBRE,
		DESCRIPCION,
		TEMATICA,
		MAX(VERSION_IOS) AS VERSION_ACTUAL, ID
	FROM APLICACION WHERE (VERSION_IOS = VERSION_ACTUAL)
	AND (PUNTUACION > 4)
	SELECT A.NOMBRED,
		C.ID_PRODUCTO
	FROM ARTISTA A,
		CANCION C WHERE (C.ID_ARTISTA = A.ID_ARTISTA)
GROUP BY A.NOMBRED
HAVING COUNT(A.ID_ARTISTA) > 3
ORDER BY COUNT(A.ID_ARTISTA) INTERCEPT
SELECT A.NOMBRED,
	C.ID_PRODUCTO
FROM ARTISTA A,
	CANCION C
WHERE (C.ID_ARTISTA = A.ID_ARTISTA)
GROUP BY A.NOMBRED
HAVING MAX(C.UND_VENDIDAS)
ORDER BY COUNT(A.ID_ARTISTA)
-- Table: public.Aplicación

-- DROP TABLE IF EXISTS public."Aplicación";

CREATE TABLE IF NOT EXISTS public."Aplicación"
(
    "Id_producto" bigint NOT NULL DEFAULT nextval('"Aplicación_Id_producto_seq"'::regclass),
    "puntuación" "char",
    "tamaño_mb" bigint,
    "versión" "char",
    nombre "char",
    "descripción" "char",
    "temática" tematica_domain,
    "versión_ios" "char",
    "Id" bigint,
    costo real NOT NULL CHECK (costo > 0 AND costo < 100),
    CONSTRAINT "Aplicación_pkey" PRIMARY KEY ("Id_producto"),
    CONSTRAINT "Id" FOREIGN KEY ("Id")
        REFERENCES public."Proveedor" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto")
        REFERENCES public."Producto" ("Id_producto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Aplicación"
    OWNER to postgres;
PGDMP  1                
    {            PF2-Restricciones    16.1    16.1 `    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    17092    PF2-Restricciones    DATABASE     �   CREATE DATABASE "PF2-Restricciones" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 #   DROP DATABASE "PF2-Restricciones";
                postgres    false            `           1247    17094    genero_domain    DOMAIN     �   CREATE DOMAIN public.genero_domain AS "char" NOT NULL
	CONSTRAINT genero_check CHECK (((VALUE = 'P'::"char") OR (VALUE = 'R'::"char") OR (VALUE = 'B'::"char") OR (VALUE = 'o'::"char")));
 "   DROP DOMAIN public.genero_domain;
       public          postgres    false            d           1247    17097    tematica_domain    DOMAIN     �   CREATE DOMAIN public.tematica_domain AS "char" NOT NULL
	CONSTRAINT check_tematica CHECK (((VALUE = 'j'::"char") OR (VALUE = 'c'::"char") OR (VALUE = 'l'::"char") OR (VALUE = 'o'::"char")));
 $   DROP DOMAIN public.tematica_domain;
       public          postgres    false            �            1255    17257    actualizar_puntuacion_total()    FUNCTION     <  CREATE FUNCTION public.actualizar_puntuacion_total() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    total_ratings INTEGER;
    total_score REAL;
BEGIN
    -- Calcular la puntuación total
    SELECT COUNT(*), COALESCE(SUM(NEW.rating), 0)
    INTO total_ratings, total_score
    FROM public."Compra"
    WHERE "Id_producto" = NEW."Id_producto";

    -- Actualizar la puntuación total del producto
    UPDATE public."Producto"
    SET "puntuación" = total_score / NULLIF(total_ratings, 0)
    WHERE "Id_producto" = NEW."Id_producto";

    RETURN NEW;
END;
$$;
 4   DROP FUNCTION public.actualizar_puntuacion_total();
       public          postgres    false            �            1255    17249 !   crear_promocion_si_es_necesario()    FUNCTION     �  CREATE FUNCTION public.crear_promocion_si_es_necesario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (SELECT COUNT(*) FROM "Compra" WHERE "Id_Usuario" = NEW."Id_Usuario") > 3 THEN
    INSERT INTO public."Promoción" ("descuento", "duración", "fecha_inicio", "fecha_fin")
    VALUES ('30%', '30 days', CURRENT_DATE, CURRENT_DATE + INTERVAL '30 days');
  END IF;
  RETURN NEW;
END;
$$;
 8   DROP FUNCTION public.crear_promocion_si_es_necesario();
       public          postgres    false            �            1255    17260    validar_pais_promocion()    FUNCTION     (  CREATE FUNCTION public.validar_pais_promocion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    pais_usuario "char";
BEGIN
    IF NEW."Id_promoción" IS NOT NULL THEN
        SELECT "País" INTO pais_usuario
        FROM public."Usuario"
        WHERE "Id" = NEW."Id_Usuario";
        IF pais_usuario NOT IN (SELECT "País" FROM public."País" WHERE "Id_promo" = NEW."Id_promoción") THEN
            RAISE EXCEPTION 'El país del usuario no coincide con los países de la promoción.';
        END IF;
    END IF;

    RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.validar_pais_promocion();
       public          postgres    false            �            1255    17255    verificar_puntuacion()    FUNCTION     A  CREATE FUNCTION public.verificar_puntuacion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.rating IS NULL OR NEW.rating < 0 OR NEW.rating > 5 OR NEW.rating != TRUNC(NEW.rating) THEN
        RAISE EXCEPTION 'La puntuación debe ser un número entero entre 0 y 5.';
    END IF;

    RETURN NEW;
END;
$$;
 -   DROP FUNCTION public.verificar_puntuacion();
       public          postgres    false            �            1255    17253    verificar_version_ios()    FUNCTION     t  CREATE FUNCTION public.verificar_version_ios() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    dispositivo_ios "char";
BEGIN
    -- Obtener la versión del iOS del dispositivo
    SELECT version_ios INTO dispositivo_ios
    FROM public."Dispositivo"
    WHERE "Id_producto" = NEW."Id_producto";

    -- Verificar si la versión del iOS del dispositivo es mayor o igual a la versión requerida por la aplicación
    IF dispositivo_ios < NEW."versión_ios" THEN
        RAISE EXCEPTION 'La versión del iOS del dispositivo es menor que la versión requerida por la aplicación.';
    END IF;

    RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.verificar_version_ios();
       public          postgres    false            �            1259    17099 
   Aplicacion    TABLE     �  CREATE TABLE public."Aplicacion" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char",
    "tamaño_mb" bigint,
    "versión" "char",
    nombre "char",
    "descripción" "char",
    "temática" public.tematica_domain,
    "versión_ios" "char",
    "Id" bigint,
    costo real NOT NULL,
    CONSTRAINT "Aplicacion_costo_check1" CHECK (((costo >= (0)::double precision) AND (costo <= (100)::double precision))),
    CONSTRAINT "tamaño_mb_no_negativo" CHECK (("tamaño_mb" >= 0))
);
     DROP TABLE public."Aplicacion";
       public         heap    postgres    false    868            �            1259    17102    Aplicación_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Aplicación_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."Aplicación_Id_producto_seq";
       public          postgres    false    215            8           0    0    Aplicación_Id_producto_seq    SEQUENCE OWNED BY     `   ALTER SEQUENCE public."Aplicación_Id_producto_seq" OWNED BY public."Aplicacion"."Id_producto";
          public          postgres    false    216            �            1259    17103    Artista    TABLE     �   CREATE TABLE public."Artista" (
    "Id_artista" bigint NOT NULL,
    "nom_artístico" "char" NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    "nombreD" "char" NOT NULL
);
    DROP TABLE public."Artista";
       public         heap    postgres    false            �            1259    17106    Artista_Id_artista_seq    SEQUENCE     �   CREATE SEQUENCE public."Artista_Id_artista_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Artista_Id_artista_seq";
       public          postgres    false    217            9           0    0    Artista_Id_artista_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Artista_Id_artista_seq" OWNED BY public."Artista"."Id_artista";
          public          postgres    false    218            �            1259    17107    Cancion    TABLE       CREATE TABLE public."Cancion" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char" NOT NULL,
    genero public.genero_domain,
    nom_disco "char",
    "duración" bigint,
    fecha_lanz date NOT NULL,
    "nom_canción" "char" NOT NULL,
    und_vendidas bigint NOT NULL,
    "Id_artista" bigint NOT NULL,
    costo real NOT NULL,
    CONSTRAINT "Cancion_costo_check2" CHECK (((costo >= (0)::double precision) AND (costo <= (100)::double precision))),
    CONSTRAINT duracion_no_negativa CHECK (("duración" >= 0))
);
    DROP TABLE public."Cancion";
       public         heap    postgres    false    864            �            1259    17110    Canción_Id_artista_seq    SEQUENCE     �   CREATE SEQUENCE public."Canción_Id_artista_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Canción_Id_artista_seq";
       public          postgres    false    219            :           0    0    Canción_Id_artista_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public."Canción_Id_artista_seq" OWNED BY public."Cancion"."Id_artista";
          public          postgres    false    220            �            1259    17111    Canción_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Canción_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Canción_Id_producto_seq";
       public          postgres    false    219            ;           0    0    Canción_Id_producto_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public."Canción_Id_producto_seq" OWNED BY public."Cancion"."Id_producto";
          public          postgres    false    221            �            1259    17112    Casa_Disquera    TABLE     ]   CREATE TABLE public."Casa_Disquera" (
    nombre "char" NOT NULL,
    "dirección" "char"
);
 #   DROP TABLE public."Casa_Disquera";
       public         heap    postgres    false            �            1259    17115    Compra    TABLE     �   CREATE TABLE public."Compra" (
    "Id_producto" bigint NOT NULL,
    "Id_promoción" bigint NOT NULL,
    "Id_Usuario" bigint NOT NULL,
    fecha_compra date NOT NULL,
    rating "char",
    monto bigint
);
    DROP TABLE public."Compra";
       public         heap    postgres    false            �            1259    17118    Compra_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Compra_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Compra_Id_producto_seq";
       public          postgres    false    223            <           0    0    Compra_Id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Compra_Id_producto_seq" OWNED BY public."Compra"."Id_producto";
          public          postgres    false    224            �            1259    17119    Compra_Id_promoción_seq    SEQUENCE     �   CREATE SEQUENCE public."Compra_Id_promoción_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Compra_Id_promoción_seq";
       public          postgres    false    223            =           0    0    Compra_Id_promoción_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Compra_Id_promoción_seq" OWNED BY public."Compra"."Id_promoción";
          public          postgres    false    225            �            1259    17120    Dispositivo    TABLE     �  CREATE TABLE public."Dispositivo" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char" NOT NULL,
    modelo "char" NOT NULL,
    "generación" bigint NOT NULL,
    version_ios "char" NOT NULL,
    capacidad "char" NOT NULL,
    costo real NOT NULL,
    CONSTRAINT "Dispositivo_costo_check2" CHECK (((costo >= (0)::double precision) AND (costo <= (100)::double precision)))
);
 !   DROP TABLE public."Dispositivo";
       public         heap    postgres    false            �            1259    17123    Dispositivo_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Dispositivo_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."Dispositivo_Id_producto_seq";
       public          postgres    false    226            >           0    0    Dispositivo_Id_producto_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."Dispositivo_Id_producto_seq" OWNED BY public."Dispositivo"."Id_producto";
          public          postgres    false    227            �            1259    17124    Dispositivo_comp    TABLE     r   CREATE TABLE public."Dispositivo_comp" (
    "Id_aplicación" bigint NOT NULL,
    dispositivo "char" NOT NULL
);
 &   DROP TABLE public."Dispositivo_comp";
       public         heap    postgres    false            �            1259    17127 #   Dispositivo_comp_Id_aplicación_seq    SEQUENCE     �   CREATE SEQUENCE public."Dispositivo_comp_Id_aplicación_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."Dispositivo_comp_Id_aplicación_seq";
       public          postgres    false    228            ?           0    0 #   Dispositivo_comp_Id_aplicación_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public."Dispositivo_comp_Id_aplicación_seq" OWNED BY public."Dispositivo_comp"."Id_aplicación";
          public          postgres    false    229            �            1259    17128    Pais    TABLE     \   CREATE TABLE public."Pais" (
    "País" "char" NOT NULL,
    "Id_promo" bigint NOT NULL
);
    DROP TABLE public."Pais";
       public         heap    postgres    false            �            1259    17131    Producto    TABLE     F   CREATE TABLE public."Producto" (
    "Id_producto" bigint NOT NULL
);
    DROP TABLE public."Producto";
       public         heap    postgres    false            �            1259    17134 	   Promocion    TABLE     @  CREATE TABLE public."Promocion" (
    "Id_promo" bigint NOT NULL,
    descuento "char" NOT NULL,
    "duración" "char" NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    CONSTRAINT fechas_validas CHECK (((fecha_inicio IS NOT NULL) AND (fecha_fin IS NOT NULL) AND (fecha_inicio < fecha_fin)))
);
    DROP TABLE public."Promocion";
       public         heap    postgres    false            �            1259    17137 	   Proveedor    TABLE     �   CREATE TABLE public."Proveedor" (
    "Id" bigint NOT NULL,
    correo "char",
    nombre "char" NOT NULL,
    "dirección" "char",
    "fecha_afiliación" date NOT NULL,
    "esDesarrollador" boolean NOT NULL,
    "esEmpresa" boolean NOT NULL
);
    DROP TABLE public."Proveedor";
       public         heap    postgres    false            �            1259    17140    Usuario    TABLE     �   CREATE TABLE public."Usuario" (
    "Id" bigint NOT NULL,
    correo "char",
    "dirección" "char",
    cod_vvt bigint[] NOT NULL,
    fecha_venc date NOT NULL,
    num_tjt bigint[] NOT NULL,
    apellido "char" NOT NULL,
    name "char" NOT NULL
);
    DROP TABLE public."Usuario";
       public         heap    postgres    false            Z           2604    17145    Aplicacion Id_producto    DEFAULT     �   ALTER TABLE ONLY public."Aplicacion" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Aplicación_Id_producto_seq"'::regclass);
 I   ALTER TABLE public."Aplicacion" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    216    215            [           2604    17146    Artista Id_artista    DEFAULT     ~   ALTER TABLE ONLY public."Artista" ALTER COLUMN "Id_artista" SET DEFAULT nextval('public."Artista_Id_artista_seq"'::regclass);
 E   ALTER TABLE public."Artista" ALTER COLUMN "Id_artista" DROP DEFAULT;
       public          postgres    false    218    217            \           2604    17147    Cancion Id_producto    DEFAULT     �   ALTER TABLE ONLY public."Cancion" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Canción_Id_producto_seq"'::regclass);
 F   ALTER TABLE public."Cancion" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    221    219            ]           2604    17148    Cancion Id_artista    DEFAULT        ALTER TABLE ONLY public."Cancion" ALTER COLUMN "Id_artista" SET DEFAULT nextval('public."Canción_Id_artista_seq"'::regclass);
 E   ALTER TABLE public."Cancion" ALTER COLUMN "Id_artista" DROP DEFAULT;
       public          postgres    false    220    219            ^           2604    17149    Compra Id_producto    DEFAULT     ~   ALTER TABLE ONLY public."Compra" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Compra_Id_producto_seq"'::regclass);
 E   ALTER TABLE public."Compra" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    224    223            _           2604    17150    Compra Id_promoción    DEFAULT     �   ALTER TABLE ONLY public."Compra" ALTER COLUMN "Id_promoción" SET DEFAULT nextval('public."Compra_Id_promoción_seq"'::regclass);
 G   ALTER TABLE public."Compra" ALTER COLUMN "Id_promoción" DROP DEFAULT;
       public          postgres    false    225    223            `           2604    17151    Dispositivo Id_producto    DEFAULT     �   ALTER TABLE ONLY public."Dispositivo" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Dispositivo_Id_producto_seq"'::regclass);
 J   ALTER TABLE public."Dispositivo" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    227    226            a           2604    17152    Dispositivo_comp Id_aplicación    DEFAULT     �   ALTER TABLE ONLY public."Dispositivo_comp" ALTER COLUMN "Id_aplicación" SET DEFAULT nextval('public."Dispositivo_comp_Id_aplicación_seq"'::regclass);
 R   ALTER TABLE public."Dispositivo_comp" ALTER COLUMN "Id_aplicación" DROP DEFAULT;
       public          postgres    false    229    228                      0    17099 
   Aplicacion 
   TABLE DATA           �   COPY public."Aplicacion" ("Id_producto", "puntuación", "tamaño_mb", "versión", nombre, "descripción", "temática", "versión_ios", "Id", costo) FROM stdin;
    public          postgres    false    215   �                  0    17103    Artista 
   TABLE DATA           g   COPY public."Artista" ("Id_artista", "nom_artístico", fecha_inicio, fecha_fin, "nombreD") FROM stdin;
    public          postgres    false    217   	�       "          0    17107    Cancion 
   TABLE DATA           �   COPY public."Cancion" ("Id_producto", "puntuación", genero, nom_disco, "duración", fecha_lanz, "nom_canción", und_vendidas, "Id_artista", costo) FROM stdin;
    public          postgres    false    219   &�       %          0    17112    Casa_Disquera 
   TABLE DATA           ?   COPY public."Casa_Disquera" (nombre, "dirección") FROM stdin;
    public          postgres    false    222   C�       &          0    17115    Compra 
   TABLE DATA           m   COPY public."Compra" ("Id_producto", "Id_promoción", "Id_Usuario", fecha_compra, rating, monto) FROM stdin;
    public          postgres    false    223   `�       )          0    17120    Dispositivo 
   TABLE DATA           {   COPY public."Dispositivo" ("Id_producto", "puntuación", modelo, "generación", version_ios, capacidad, costo) FROM stdin;
    public          postgres    false    226   }�       +          0    17124    Dispositivo_comp 
   TABLE DATA           K   COPY public."Dispositivo_comp" ("Id_aplicación", dispositivo) FROM stdin;
    public          postgres    false    228   ��       -          0    17128    Pais 
   TABLE DATA           5   COPY public."Pais" ("País", "Id_promo") FROM stdin;
    public          postgres    false    230   ��       .          0    17131    Producto 
   TABLE DATA           3   COPY public."Producto" ("Id_producto") FROM stdin;
    public          postgres    false    231   Ԁ       /          0    17134 	   Promocion 
   TABLE DATA           b   COPY public."Promocion" ("Id_promo", descuento, "duración", fecha_inicio, fecha_fin) FROM stdin;
    public          postgres    false    232   �       0          0    17137 	   Proveedor 
   TABLE DATA           ~   COPY public."Proveedor" ("Id", correo, nombre, "dirección", "fecha_afiliación", "esDesarrollador", "esEmpresa") FROM stdin;
    public          postgres    false    233   �       1          0    17140    Usuario 
   TABLE DATA           m   COPY public."Usuario" ("Id", correo, "dirección", cod_vvt, fecha_venc, num_tjt, apellido, name) FROM stdin;
    public          postgres    false    234   +�       @           0    0    Aplicación_Id_producto_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Aplicación_Id_producto_seq"', 1, false);
          public          postgres    false    216            A           0    0    Artista_Id_artista_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Artista_Id_artista_seq"', 1, false);
          public          postgres    false    218            B           0    0    Canción_Id_artista_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Canción_Id_artista_seq"', 1, false);
          public          postgres    false    220            C           0    0    Canción_Id_producto_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Canción_Id_producto_seq"', 1, false);
          public          postgres    false    221            D           0    0    Compra_Id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Compra_Id_producto_seq"', 1, false);
          public          postgres    false    224            E           0    0    Compra_Id_promoción_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Compra_Id_promoción_seq"', 1, false);
          public          postgres    false    225            F           0    0    Dispositivo_Id_producto_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Dispositivo_Id_producto_seq"', 1, false);
          public          postgres    false    227            G           0    0 #   Dispositivo_comp_Id_aplicación_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."Dispositivo_comp_Id_aplicación_seq"', 1, false);
          public          postgres    false    229            i           2606    17154    Aplicacion Aplicación_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Aplicacion"
    ADD CONSTRAINT "Aplicación_pkey" PRIMARY KEY ("Id_producto");
 I   ALTER TABLE ONLY public."Aplicacion" DROP CONSTRAINT "Aplicación_pkey";
       public            postgres    false    215            k           2606    17156    Artista Artista_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Artista"
    ADD CONSTRAINT "Artista_pkey" PRIMARY KEY ("Id_artista");
 B   ALTER TABLE ONLY public."Artista" DROP CONSTRAINT "Artista_pkey";
       public            postgres    false    217            m           2606    17158    Cancion Canción_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Cancion"
    ADD CONSTRAINT "Canción_pkey" PRIMARY KEY ("Id_producto");
 C   ALTER TABLE ONLY public."Cancion" DROP CONSTRAINT "Canción_pkey";
       public            postgres    false    219            o           2606    17160     Casa_Disquera Casa_Disquera_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Casa_Disquera"
    ADD CONSTRAINT "Casa_Disquera_pkey" PRIMARY KEY (nombre);
 N   ALTER TABLE ONLY public."Casa_Disquera" DROP CONSTRAINT "Casa_Disquera_pkey";
       public            postgres    false    222            q           2606    17162    Compra Compra_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Compra_pkey" PRIMARY KEY (fecha_compra, "Id_Usuario", "Id_promoción", "Id_producto");
 @   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Compra_pkey";
       public            postgres    false    223    223    223    223            u           2606    17164 &   Dispositivo_comp Dispositivo_comp_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Dispositivo_comp"
    ADD CONSTRAINT "Dispositivo_comp_pkey" PRIMARY KEY ("Id_aplicación", dispositivo);
 T   ALTER TABLE ONLY public."Dispositivo_comp" DROP CONSTRAINT "Dispositivo_comp_pkey";
       public            postgres    false    228    228            s           2606    17166    Dispositivo Dispositivo_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Dispositivo"
    ADD CONSTRAINT "Dispositivo_pkey" PRIMARY KEY ("Id_producto");
 J   ALTER TABLE ONLY public."Dispositivo" DROP CONSTRAINT "Dispositivo_pkey";
       public            postgres    false    226            w           2606    17168    Pais País_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "País_pkey" PRIMARY KEY ("País", "Id_promo");
 =   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "País_pkey";
       public            postgres    false    230    230            y           2606    17170    Producto Producto_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Producto"
    ADD CONSTRAINT "Producto_pkey" PRIMARY KEY ("Id_producto");
 D   ALTER TABLE ONLY public."Producto" DROP CONSTRAINT "Producto_pkey";
       public            postgres    false    231            {           2606    17172    Promocion Promoción_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Promocion"
    ADD CONSTRAINT "Promoción_pkey" PRIMARY KEY ("Id_promo");
 G   ALTER TABLE ONLY public."Promocion" DROP CONSTRAINT "Promoción_pkey";
       public            postgres    false    232            }           2606    17174    Proveedor Proveedor_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Proveedor"
    ADD CONSTRAINT "Proveedor_pkey" PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY public."Proveedor" DROP CONSTRAINT "Proveedor_pkey";
       public            postgres    false    233                       2606    17176    Usuario Usuario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    234            �           2620    17258 *   Compra trigger_actualizar_puntuacion_total    TRIGGER     �   CREATE TRIGGER trigger_actualizar_puntuacion_total AFTER INSERT ON public."Compra" FOR EACH ROW EXECUTE FUNCTION public.actualizar_puntuacion_total();
 E   DROP TRIGGER trigger_actualizar_puntuacion_total ON public."Compra";
       public          postgres    false    223    238            �           2620    17251    Compra trigger_compra    TRIGGER     �   CREATE TRIGGER trigger_compra AFTER INSERT ON public."Compra" FOR EACH ROW EXECUTE FUNCTION public.crear_promocion_si_es_necesario();
 0   DROP TRIGGER trigger_compra ON public."Compra";
       public          postgres    false    235    223            �           2620    17261 %   Compra trigger_validar_pais_promocion    TRIGGER     �   CREATE TRIGGER trigger_validar_pais_promocion BEFORE INSERT ON public."Compra" FOR EACH ROW EXECUTE FUNCTION public.validar_pais_promocion();
 @   DROP TRIGGER trigger_validar_pais_promocion ON public."Compra";
       public          postgres    false    223    239            �           2620    17256 #   Compra trigger_verificar_puntuacion    TRIGGER     �   CREATE TRIGGER trigger_verificar_puntuacion BEFORE INSERT ON public."Compra" FOR EACH ROW EXECUTE FUNCTION public.verificar_puntuacion();
 >   DROP TRIGGER trigger_verificar_puntuacion ON public."Compra";
       public          postgres    false    223    237            �           2620    17254 $   Compra trigger_verificar_version_ios    TRIGGER     �   CREATE TRIGGER trigger_verificar_version_ios BEFORE INSERT ON public."Compra" FOR EACH ROW EXECUTE FUNCTION public.verificar_version_ios();
 ?   DROP TRIGGER trigger_verificar_version_ios ON public."Compra";
       public          postgres    false    236    223            �           2606    17177    Aplicacion Id    FK CONSTRAINT     u   ALTER TABLE ONLY public."Aplicacion"
    ADD CONSTRAINT "Id" FOREIGN KEY ("Id") REFERENCES public."Proveedor"("Id");
 ;   ALTER TABLE ONLY public."Aplicacion" DROP CONSTRAINT "Id";
       public          postgres    false    4733    215    233            �           2606    17182    Compra Id_Usuario    FK CONSTRAINT        ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_Usuario" FOREIGN KEY ("Id_Usuario") REFERENCES public."Usuario"("Id");
 ?   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Id_Usuario";
       public          postgres    false    223    4735    234            �           2606    17187    Dispositivo_comp Id_aplicacion    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dispositivo_comp"
    ADD CONSTRAINT "Id_aplicacion" FOREIGN KEY ("Id_aplicación") REFERENCES public."Aplicacion"("Id_producto");
 L   ALTER TABLE ONLY public."Dispositivo_comp" DROP CONSTRAINT "Id_aplicacion";
       public          postgres    false    228    4713    215            �           2606    17192    Cancion Id_artista    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cancion"
    ADD CONSTRAINT "Id_artista" FOREIGN KEY ("Id_artista") REFERENCES public."Artista"("Id_artista");
 @   ALTER TABLE ONLY public."Cancion" DROP CONSTRAINT "Id_artista";
       public          postgres    false    4715    219    217            �           2606    17197    Aplicacion Id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aplicacion"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");
 D   ALTER TABLE ONLY public."Aplicacion" DROP CONSTRAINT "Id_producto";
       public          postgres    false    215    4729    231            �           2606    17202    Cancion Id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cancion"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");
 A   ALTER TABLE ONLY public."Cancion" DROP CONSTRAINT "Id_producto";
       public          postgres    false    4729    219    231            �           2606    17207    Compra Id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");
 @   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Id_producto";
       public          postgres    false    223    4729    231            �           2606    17212    Pais Id_promo    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Id_promo" FOREIGN KEY ("Id_promo") REFERENCES public."Promocion"("Id_promo");
 ;   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Id_promo";
       public          postgres    false    230    232    4731            H           0    0    CONSTRAINT "Id_promo" ON "Pais"    COMMENT     v   COMMENT ON CONSTRAINT "Id_promo" ON public."Pais" IS 'Donde Id_promo es una Fk referencia de Id_promo en Promoción';
          public          postgres    false    4745            �           2606    17217    Compra Id_promoción    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_promoción" FOREIGN KEY ("Id_promoción") REFERENCES public."Promocion"("Id_promo");
 B   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Id_promoción";
       public          postgres    false    4731    223    232            �           2606    17222    Artista nombreD    FK CONSTRAINT     �   ALTER TABLE ONLY public."Artista"
    ADD CONSTRAINT "nombreD" FOREIGN KEY ("nombreD") REFERENCES public."Casa_Disquera"(nombre);
 =   ALTER TABLE ONLY public."Artista" DROP CONSTRAINT "nombreD";
       public          postgres    false    217    4719    222            I           0    0 !   CONSTRAINT "nombreD" ON "Artista"    COMMENT     x   COMMENT ON CONSTRAINT "nombreD" ON public."Artista" IS 'Donde nombreD es una Fk referencia de nombre en Casa_Disquera';
          public          postgres    false    4738                  x������ � �             x������ � �      "      x������ � �      %      x������ � �      &      x������ � �      )      x������ � �      +      x������ � �      -      x������ � �      .      x������ � �      /      x������ � �      0      x������ � �      1      x������ � �     
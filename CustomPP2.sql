PGDMP                   
    {            Proyecto-Fase2    16.1    16.1 T               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16405    Proyecto-Fase2    DATABASE     �   CREATE DATABASE "Proyecto-Fase2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
     DROP DATABASE "Proyecto-Fase2";
                postgres    false            �            1259    16466    Aplicación    TABLE       CREATE TABLE public."Aplicación" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char",
    costo "char",
    "tamaño_mb" bigint,
    "versión" "char",
    nombre "char",
    "descripción" "char",
    "temática" "char",
    "versión_ios" "char",
    "Id" bigint
);
 !   DROP TABLE public."Aplicación";
       public         heap    postgres    false            �            1259    16465    Aplicación_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Aplicación_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."Aplicación_Id_producto_seq";
       public          postgres    false    224                        0    0    Aplicación_Id_producto_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."Aplicación_Id_producto_seq" OWNED BY public."Aplicación"."Id_producto";
          public          postgres    false    223            �            1259    16412    Artista    TABLE     �   CREATE TABLE public."Artista" (
    "Id_artista" bigint NOT NULL,
    "nom_artístico" "char" NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    "nombreD" "char" NOT NULL
);
    DROP TABLE public."Artista";
       public         heap    postgres    false            �            1259    16411    Artista_Id_artista_seq    SEQUENCE     �   CREATE SEQUENCE public."Artista_Id_artista_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Artista_Id_artista_seq";
       public          postgres    false    217            !           0    0    Artista_Id_artista_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Artista_Id_artista_seq" OWNED BY public."Artista"."Id_artista";
          public          postgres    false    216            �            1259    16503    Canción    TABLE     K  CREATE TABLE public."Canción" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char" NOT NULL,
    costo "char" NOT NULL,
    genero "char",
    nom_disco "char",
    "duración" bigint,
    fecha_lanz date NOT NULL,
    "nom_canción" "char" NOT NULL,
    und_vendidas bigint NOT NULL,
    "Id_artista" bigint NOT NULL
);
    DROP TABLE public."Canción";
       public         heap    postgres    false            �            1259    16502    Canción_Id_artista_seq    SEQUENCE     �   CREATE SEQUENCE public."Canción_Id_artista_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Canción_Id_artista_seq";
       public          postgres    false    231            "           0    0    Canción_Id_artista_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Canción_Id_artista_seq" OWNED BY public."Canción"."Id_artista";
          public          postgres    false    230            �            1259    16501    Canción_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Canción_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Canción_Id_producto_seq";
       public          postgres    false    231            #           0    0    Canción_Id_producto_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Canción_Id_producto_seq" OWNED BY public."Canción"."Id_producto";
          public          postgres    false    229            �            1259    16406    Casa_Disquera    TABLE     ]   CREATE TABLE public."Casa_Disquera" (
    nombre "char" NOT NULL,
    "dirección" "char"
);
 #   DROP TABLE public."Casa_Disquera";
       public         heap    postgres    false            �            1259    16522    Compra    TABLE     �   CREATE TABLE public."Compra" (
    "Id_producto" bigint NOT NULL,
    "Id_promoción" bigint NOT NULL,
    "Id_Usuario" bigint NOT NULL,
    fecha_compra date NOT NULL,
    rating "char",
    monto bigint
);
    DROP TABLE public."Compra";
       public         heap    postgres    false            �            1259    16520    Compra_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Compra_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Compra_Id_producto_seq";
       public          postgres    false    234            $           0    0    Compra_Id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Compra_Id_producto_seq" OWNED BY public."Compra"."Id_producto";
          public          postgres    false    232            �            1259    16521    Compra_Id_promoción_seq    SEQUENCE     �   CREATE SEQUENCE public."Compra_Id_promoción_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Compra_Id_promoción_seq";
       public          postgres    false    234            %           0    0    Compra_Id_promoción_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Compra_Id_promoción_seq" OWNED BY public."Compra"."Id_promoción";
          public          postgres    false    233            �            1259    16495    Dispositivo    TABLE       CREATE TABLE public."Dispositivo" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char" NOT NULL,
    costo "char" NOT NULL,
    modelo "char" NOT NULL,
    "generación" bigint NOT NULL,
    version_ios "char" NOT NULL,
    capacidad "char" NOT NULL
);
 !   DROP TABLE public."Dispositivo";
       public         heap    postgres    false            �            1259    16494    Dispositivo_Id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public."Dispositivo_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."Dispositivo_Id_producto_seq";
       public          postgres    false    228            &           0    0    Dispositivo_Id_producto_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."Dispositivo_Id_producto_seq" OWNED BY public."Dispositivo"."Id_producto";
          public          postgres    false    227            �            1259    16483    Dispositivo_comp    TABLE     r   CREATE TABLE public."Dispositivo_comp" (
    "Id_aplicación" bigint NOT NULL,
    dispositivo "char" NOT NULL
);
 &   DROP TABLE public."Dispositivo_comp";
       public         heap    postgres    false            �            1259    16482 #   Dispositivo_comp_Id_aplicación_seq    SEQUENCE     �   CREATE SEQUENCE public."Dispositivo_comp_Id_aplicación_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."Dispositivo_comp_Id_aplicación_seq";
       public          postgres    false    226            '           0    0 #   Dispositivo_comp_Id_aplicación_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public."Dispositivo_comp_Id_aplicación_seq" OWNED BY public."Dispositivo_comp"."Id_aplicación";
          public          postgres    false    225            �            1259    16445    País    TABLE     ]   CREATE TABLE public."País" (
    "País" "char" NOT NULL,
    "Id_promo" bigint NOT NULL
);
    DROP TABLE public."País";
       public         heap    postgres    false            �            1259    16460    Producto    TABLE     F   CREATE TABLE public."Producto" (
    "Id_producto" bigint NOT NULL
);
    DROP TABLE public."Producto";
       public         heap    postgres    false            �            1259    16440 
   Promoción    TABLE     �   CREATE TABLE public."Promoción" (
    "Id_promo" bigint NOT NULL,
    descuento "char" NOT NULL,
    "duración" "char" NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);
     DROP TABLE public."Promoción";
       public         heap    postgres    false            �            1259    16455 	   Proveedor    TABLE     �   CREATE TABLE public."Proveedor" (
    "Id" bigint NOT NULL,
    correo "char",
    nombre "char" NOT NULL,
    "dirección" "char",
    "fecha_afiliación" date NOT NULL,
    "esDesarrollador" boolean NOT NULL,
    "esEmpresa" boolean NOT NULL
);
    DROP TABLE public."Proveedor";
       public         heap    postgres    false            �            1259    16423    Usuario    TABLE     �   CREATE TABLE public."Usuario" (
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
       public         heap    postgres    false            N           2604    16469    Aplicación Id_producto    DEFAULT     �   ALTER TABLE ONLY public."Aplicación" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Aplicación_Id_producto_seq"'::regclass);
 J   ALTER TABLE public."Aplicación" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    224    223    224            M           2604    16415    Artista Id_artista    DEFAULT     ~   ALTER TABLE ONLY public."Artista" ALTER COLUMN "Id_artista" SET DEFAULT nextval('public."Artista_Id_artista_seq"'::regclass);
 E   ALTER TABLE public."Artista" ALTER COLUMN "Id_artista" DROP DEFAULT;
       public          postgres    false    217    216    217            Q           2604    16506    Canción Id_producto    DEFAULT     �   ALTER TABLE ONLY public."Canción" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Canción_Id_producto_seq"'::regclass);
 G   ALTER TABLE public."Canción" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    229    231    231            R           2604    16507    Canción Id_artista    DEFAULT     �   ALTER TABLE ONLY public."Canción" ALTER COLUMN "Id_artista" SET DEFAULT nextval('public."Canción_Id_artista_seq"'::regclass);
 F   ALTER TABLE public."Canción" ALTER COLUMN "Id_artista" DROP DEFAULT;
       public          postgres    false    230    231    231            S           2604    16525    Compra Id_producto    DEFAULT     ~   ALTER TABLE ONLY public."Compra" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Compra_Id_producto_seq"'::regclass);
 E   ALTER TABLE public."Compra" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    234    232    234            T           2604    16526    Compra Id_promoción    DEFAULT     �   ALTER TABLE ONLY public."Compra" ALTER COLUMN "Id_promoción" SET DEFAULT nextval('public."Compra_Id_promoción_seq"'::regclass);
 G   ALTER TABLE public."Compra" ALTER COLUMN "Id_promoción" DROP DEFAULT;
       public          postgres    false    233    234    234            P           2604    16498    Dispositivo Id_producto    DEFAULT     �   ALTER TABLE ONLY public."Dispositivo" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Dispositivo_Id_producto_seq"'::regclass);
 J   ALTER TABLE public."Dispositivo" ALTER COLUMN "Id_producto" DROP DEFAULT;
       public          postgres    false    227    228    228            O           2604    16486    Dispositivo_comp Id_aplicación    DEFAULT     �   ALTER TABLE ONLY public."Dispositivo_comp" ALTER COLUMN "Id_aplicación" SET DEFAULT nextval('public."Dispositivo_comp_Id_aplicación_seq"'::regclass);
 R   ALTER TABLE public."Dispositivo_comp" ALTER COLUMN "Id_aplicación" DROP DEFAULT;
       public          postgres    false    225    226    226                      0    16466    Aplicación 
   TABLE DATA           �   COPY public."Aplicación" ("Id_producto", "puntuación", costo, "tamaño_mb", "versión", nombre, "descripción", "temática", "versión_ios", "Id") FROM stdin;
    public          postgres    false    224   �e                 0    16412    Artista 
   TABLE DATA           g   COPY public."Artista" ("Id_artista", "nom_artístico", fecha_inicio, fecha_fin, "nombreD") FROM stdin;
    public          postgres    false    217   f                 0    16503    Canción 
   TABLE DATA           �   COPY public."Canción" ("Id_producto", "puntuación", costo, genero, nom_disco, "duración", fecha_lanz, "nom_canción", und_vendidas, "Id_artista") FROM stdin;
    public          postgres    false    231   5f                 0    16406    Casa_Disquera 
   TABLE DATA           ?   COPY public."Casa_Disquera" (nombre, "dirección") FROM stdin;
    public          postgres    false    215   Rf                 0    16522    Compra 
   TABLE DATA           m   COPY public."Compra" ("Id_producto", "Id_promoción", "Id_Usuario", fecha_compra, rating, monto) FROM stdin;
    public          postgres    false    234   of                 0    16495    Dispositivo 
   TABLE DATA           {   COPY public."Dispositivo" ("Id_producto", "puntuación", costo, modelo, "generación", version_ios, capacidad) FROM stdin;
    public          postgres    false    228   �f                 0    16483    Dispositivo_comp 
   TABLE DATA           K   COPY public."Dispositivo_comp" ("Id_aplicación", dispositivo) FROM stdin;
    public          postgres    false    226   �f                 0    16445    País 
   TABLE DATA           6   COPY public."País" ("País", "Id_promo") FROM stdin;
    public          postgres    false    220   �f                 0    16460    Producto 
   TABLE DATA           3   COPY public."Producto" ("Id_producto") FROM stdin;
    public          postgres    false    222   �f       
          0    16440 
   Promoción 
   TABLE DATA           c   COPY public."Promoción" ("Id_promo", descuento, "duración", fecha_inicio, fecha_fin) FROM stdin;
    public          postgres    false    219    g                 0    16455 	   Proveedor 
   TABLE DATA           ~   COPY public."Proveedor" ("Id", correo, nombre, "dirección", "fecha_afiliación", "esDesarrollador", "esEmpresa") FROM stdin;
    public          postgres    false    221   g       	          0    16423    Usuario 
   TABLE DATA           m   COPY public."Usuario" ("Id", correo, "dirección", cod_vvt, fecha_venc, num_tjt, apellido, name) FROM stdin;
    public          postgres    false    218   :g       (           0    0    Aplicación_Id_producto_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Aplicación_Id_producto_seq"', 1, false);
          public          postgres    false    223            )           0    0    Artista_Id_artista_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Artista_Id_artista_seq"', 1, false);
          public          postgres    false    216            *           0    0    Canción_Id_artista_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Canción_Id_artista_seq"', 1, false);
          public          postgres    false    230            +           0    0    Canción_Id_producto_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Canción_Id_producto_seq"', 1, false);
          public          postgres    false    229            ,           0    0    Compra_Id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Compra_Id_producto_seq"', 1, false);
          public          postgres    false    232            -           0    0    Compra_Id_promoción_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Compra_Id_promoción_seq"', 1, false);
          public          postgres    false    233            .           0    0    Dispositivo_Id_producto_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Dispositivo_Id_producto_seq"', 1, false);
          public          postgres    false    227            /           0    0 #   Dispositivo_comp_Id_aplicación_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."Dispositivo_comp_Id_aplicación_seq"', 1, false);
          public          postgres    false    225            d           2606    16471    Aplicación Aplicación_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Aplicación"
    ADD CONSTRAINT "Aplicación_pkey" PRIMARY KEY ("Id_producto");
 J   ALTER TABLE ONLY public."Aplicación" DROP CONSTRAINT "Aplicación_pkey";
       public            postgres    false    224            X           2606    16417    Artista Artista_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Artista"
    ADD CONSTRAINT "Artista_pkey" PRIMARY KEY ("Id_artista");
 B   ALTER TABLE ONLY public."Artista" DROP CONSTRAINT "Artista_pkey";
       public            postgres    false    217            j           2606    16509    Canción Canción_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Canción"
    ADD CONSTRAINT "Canción_pkey" PRIMARY KEY ("Id_producto");
 D   ALTER TABLE ONLY public."Canción" DROP CONSTRAINT "Canción_pkey";
       public            postgres    false    231            V           2606    16410     Casa_Disquera Casa_Disquera_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Casa_Disquera"
    ADD CONSTRAINT "Casa_Disquera_pkey" PRIMARY KEY (nombre);
 N   ALTER TABLE ONLY public."Casa_Disquera" DROP CONSTRAINT "Casa_Disquera_pkey";
       public            postgres    false    215            l           2606    16528    Compra Compra_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Compra_pkey" PRIMARY KEY (fecha_compra, "Id_Usuario", "Id_promoción", "Id_producto");
 @   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Compra_pkey";
       public            postgres    false    234    234    234    234            f           2606    16488 &   Dispositivo_comp Dispositivo_comp_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Dispositivo_comp"
    ADD CONSTRAINT "Dispositivo_comp_pkey" PRIMARY KEY ("Id_aplicación", dispositivo);
 T   ALTER TABLE ONLY public."Dispositivo_comp" DROP CONSTRAINT "Dispositivo_comp_pkey";
       public            postgres    false    226    226            h           2606    16500    Dispositivo Dispositivo_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Dispositivo"
    ADD CONSTRAINT "Dispositivo_pkey" PRIMARY KEY ("Id_producto");
 J   ALTER TABLE ONLY public."Dispositivo" DROP CONSTRAINT "Dispositivo_pkey";
       public            postgres    false    228            ^           2606    16449    País País_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."País"
    ADD CONSTRAINT "País_pkey" PRIMARY KEY ("País", "Id_promo");
 >   ALTER TABLE ONLY public."País" DROP CONSTRAINT "País_pkey";
       public            postgres    false    220    220            b           2606    16464    Producto Producto_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Producto"
    ADD CONSTRAINT "Producto_pkey" PRIMARY KEY ("Id_producto");
 D   ALTER TABLE ONLY public."Producto" DROP CONSTRAINT "Producto_pkey";
       public            postgres    false    222            \           2606    16444    Promoción Promoción_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Promoción"
    ADD CONSTRAINT "Promoción_pkey" PRIMARY KEY ("Id_promo");
 H   ALTER TABLE ONLY public."Promoción" DROP CONSTRAINT "Promoción_pkey";
       public            postgres    false    219            `           2606    16459    Proveedor Proveedor_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Proveedor"
    ADD CONSTRAINT "Proveedor_pkey" PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY public."Proveedor" DROP CONSTRAINT "Proveedor_pkey";
       public            postgres    false    221            Z           2606    16429    Usuario Usuario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    218            o           2606    16472    Aplicación Id    FK CONSTRAINT     v   ALTER TABLE ONLY public."Aplicación"
    ADD CONSTRAINT "Id" FOREIGN KEY ("Id") REFERENCES public."Proveedor"("Id");
 <   ALTER TABLE ONLY public."Aplicación" DROP CONSTRAINT "Id";
       public          postgres    false    224    4704    221            t           2606    16539    Compra Id_Usuario    FK CONSTRAINT        ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_Usuario" FOREIGN KEY ("Id_Usuario") REFERENCES public."Usuario"("Id");
 ?   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Id_Usuario";
       public          postgres    false    218    234    4698            q           2606    16489    Dispositivo_comp Id_aplicacion    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dispositivo_comp"
    ADD CONSTRAINT "Id_aplicacion" FOREIGN KEY ("Id_aplicación") REFERENCES public."Aplicación"("Id_producto");
 L   ALTER TABLE ONLY public."Dispositivo_comp" DROP CONSTRAINT "Id_aplicacion";
       public          postgres    false    226    4708    224            r           2606    16515    Canción Id_artista    FK CONSTRAINT     �   ALTER TABLE ONLY public."Canción"
    ADD CONSTRAINT "Id_artista" FOREIGN KEY ("Id_artista") REFERENCES public."Artista"("Id_artista");
 A   ALTER TABLE ONLY public."Canción" DROP CONSTRAINT "Id_artista";
       public          postgres    false    217    231    4696            p           2606    16477    Aplicación Id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aplicación"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");
 E   ALTER TABLE ONLY public."Aplicación" DROP CONSTRAINT "Id_producto";
       public          postgres    false    222    224    4706            s           2606    16510    Canción Id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."Canción"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");
 B   ALTER TABLE ONLY public."Canción" DROP CONSTRAINT "Id_producto";
       public          postgres    false    222    231    4706            u           2606    16529    Compra Id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");
 @   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Id_producto";
       public          postgres    false    222    4706    234            n           2606    16450    País Id_promo    FK CONSTRAINT     �   ALTER TABLE ONLY public."País"
    ADD CONSTRAINT "Id_promo" FOREIGN KEY ("Id_promo") REFERENCES public."Promoción"("Id_promo");
 <   ALTER TABLE ONLY public."País" DROP CONSTRAINT "Id_promo";
       public          postgres    false    4700    220    219            0           0    0     CONSTRAINT "Id_promo" ON "País"    COMMENT     w   COMMENT ON CONSTRAINT "Id_promo" ON public."País" IS 'Donde Id_promo es una Fk referencia de Id_promo en Promoción';
          public          postgres    false    4718            v           2606    16534    Compra Id_promoción    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_promoción" FOREIGN KEY ("Id_promoción") REFERENCES public."Promoción"("Id_promo");
 B   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Id_promoción";
       public          postgres    false    4700    219    234            m           2606    16418    Artista nombreD    FK CONSTRAINT     �   ALTER TABLE ONLY public."Artista"
    ADD CONSTRAINT "nombreD" FOREIGN KEY ("nombreD") REFERENCES public."Casa_Disquera"(nombre);
 =   ALTER TABLE ONLY public."Artista" DROP CONSTRAINT "nombreD";
       public          postgres    false    217    215    4694            1           0    0 !   CONSTRAINT "nombreD" ON "Artista"    COMMENT     x   COMMENT ON CONSTRAINT "nombreD" ON public."Artista" IS 'Donde nombreD es una Fk referencia de nombre en Casa_Disquera';
          public          postgres    false    4717                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      
      x������ � �            x������ � �      	      x������ � �     
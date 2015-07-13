==========================
3.5. Organizaci?n de disco
==========================

.. raw:: html

   <div class="navheader">

3.5. Organizaci?n de disco
`Anterior <dirstructure.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <mount-unmount.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.5. Organizaci?n de disco
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La unidad m?s peque?a que FreeBSD utiliza para ubicar ficheros es el
nombre de fichero. Los nombres de fichero son sensibles a las
may?sculas, lo que significa que ``readme.txt`` y ``README.TXT`` son dos
ficheros distintos. FreeBSD no utiliza la extensi?n (``.txt``) de un
fichero para determinar si es un programa, o un documento o alguna otra
forma de datos.

Los ficheros se almacenan en directorios. Un directorio puede estar
vac?o, o puede contener cientos de ficheros. Un directorio tambi?n puede
contener otros directorios, permiti?ndole contruir una jerarqu?a de
directorios dentro de otro. Esto hace mucho m?s f?cil la organizaci?n de
sus datos.

Para referirse a ficheros o directorios se usa el nombre de archivo o de
directorio, seguido por una barra, ``/``, seguido por cualquier otro
nombre de directorio que sea necesario. Si tiene un directorio ``tal``,
el cual contiene el directorio ``cual``, el cual contiene el fichero
``readme.txt``, entonces el nombre completo o *ruta* al fichero es
``tal/cual/readme.txt``.

Los directorios y ficheros se almacenan en un sistema de ficheros. Cada
sistema de ficheros contiene un s?lo directorio en el nivel m?s elevado,
que es el *directorio ra?z* de ese sistema de ficheros. Este directorio
ra?z puede contener otros directorios.

Lo visto hasta ahora probablemente sea similar a cualquier otro sistema
operativo que pueda haber utilizado, pero hay unas cuantas diferencias;
por ejemplo, MS-DOS? utiliza ``\`` para separar nombres de fichero y
directorio, mientras que Mac?OS? usa ``:``.

FreeBSD no utiliza letras de unidades, u otro nombre de unidad en la
ruta. Por tanto, no podr? escribir ``c:/tal/cual/readme.txt`` en
FreeBSD.

En FreeBSD, en cambio, un sistema de ficheros recibe el nombre de
*sistema de ficheros ra?z*. El directorio ra?z del sistema de ficheros
ra?z se representa como ``/``. Cualquier otro sistema de ficheros, por
tanto, se *monta* bajo el sistema de ficheros ra?z. No importa cu?ntos
discos tenga en su sistema FreeBSD, cada directorio parecer? ser parte
del mismo disco.

Suponga que tiene tres sistemas de ficheros, denominados ``A``, ``B`` y
``C``. Cada sistema de ficheros tiene un directorio ra?z, el cual
contiene otros dos directorios, llamados ``A1``, ``A2`` (y de la misma
manera ``B1``, ``B2`` y ``C1``, ``C2``).

Usaremos ``A`` como sistema de ficheros ra?z. Si usara ``ls`` para ver
el contenido de este directorio ver?a dos subdirectorios, ``A1`` y
``A2``. El ?rbol de directorios ser?a como este:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

Un sistema de ficheros debe montarse en un directorio de otro sistema de
ficheros. Ahora suponga que monta el sistema de ficheros ``B`` en el
directorio ``A1``. El directorio ra?z de ``B`` reemplaza a ``A1``, y los
directorios en ``B`` aparecen de esta manera:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

Cualquier fichero que est? en el directorio ``B1`` o ``B2`` puede
encontrarse con la ruta ``/A1/B1`` o ``/A1/B2`` seg?n sea necesario.
Cualquier fichero que est? en ``/A1`` ha desaparecido temporalmente.
Aparecer?n de nuevo si ``B`` se *desmonta* de A.

Si ``B`` se monta en ``A2`` entonces el diagrama se ver?a as?:

.. raw:: html

   <div class="mediaobject">

|image2|

.. raw:: html

   </div>

y las rutas ser?an ``/A2/B1`` y ``/A2/B2`` respectivamente.

Pueden montarse sistemas de ficheros uno sobre otro. Continuando con el
ejemplo anterior, el sistema de ficheros ``C`` podr?a montarse en el
directorio ``B1`` en el sistema de ficheros ``B``, lo que nos llevar?a a
esto:

.. raw:: html

   <div class="mediaobject">

|image3|

.. raw:: html

   </div>

O ``C`` podr?a montarse directamente en el sistema de ficheros ``A``,
bajo el directorio ``A1``:

.. raw:: html

   <div class="mediaobject">

|image4|

.. raw:: html

   </div>

Si est? familiarizado con MS-DOS? esto es similar, aunque no id?ntico, a
utilizar ``join``.

Esto no es algo a lo deba usted dedicar tiempo de forma habitual.
Normalmente crear? sistemas de ficheros al instalar FreeBSD y decidir?
d?nde montarlos; lo m?s habitual es que no los cambie de sitio a menos
que agregue un disco nuevo.

Es perfectamente posible tener un sistema de ficheros ra?z extenso y no
necesitar crear otros. Este esquema tiene unos cuantos inconvenientes y
una ventaja:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ventajas de disponer de m?ltiples sistemas de ficheros

.. raw:: html

   </div>

-  Si dispone de varios sistemas de ficheros puede optar por usar
   distintas *opciones de montaje*. Por ejemplo, gracias a una
   planificaci?n cuidadosa, el sistema de ficheros ra?z puede montarse
   como s?lo-lectura, haciendo imposible borrar sin querer o editar un
   fichero cr?tico. Al mantener separados sistemas de ficheros en los
   que los usuarios pueden escribir, como ``/home``, de otros sistemas
   de ficheros tambi?n le permite montar con la opci?n *nosuid*; dicha
   opci?n previene que los bits *suid*/*guid* en los ejecutables
   almacenados en el sistema de ficheros tengan efecto, mejorando en
   cierto modo la seguridad.

-  FreeBSD optimiza autom?ticamente el esquema de ficheros en un sistema
   de ficheros, dependiendo de c?mo el sistema de ficheros est? siendo
   utilizado. Uno que contenga muchos ficheros peque?os tendr? una
   optimizaci?n distinta de uno que contenga menos ficheros y m?s
   grandes. Si s?lo tiene un gran sistema de ficheros no hay manera de
   aplicar esta optimizaci?n.

-  Los sistemas de ficheros de FreeBSD son muy robustos en caso de
   sufrir un ca?da el?ctrica. De todas maneras, un fallo el?ctrico en un
   momento cr?tico puede da?ar la estructura del sistema de ficheros. Si
   reparte sus datos en m?ltiples sistemas de ficheros har? que sea m?s
   probable que el sistema arranque despu?s de uno de esos fallos,
   haci?ndole adem?s m?s f?cil la tarea de restaurarlo desde un respaldo
   si fuera necesario.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ventajas de un s?lo sistema de ficheros

.. raw:: html

   </div>

-  Los sistemas de ficheros son de un tama?o fijo. Si crea un sistema de
   ficheros cuando instala FreeBSD y le da un tama?o espec?fico, tal vez
   descubra m?s tarde que necesita hacer la partici?n m?s grande. Esto
   no es f?cil de realizar sin hacer una copia de seguridad, crear de
   nuevo el sistema de ficheros con el nuevo tama?o y entonces restaurar
   los datos respaldados.

   .. raw:: html

      <div class="important" xmlns="">

   Importante:
   ~~~~~~~~~~~

   FreeBSD dispone de
   `growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8>`__,
   que permite incrementar el taman?o de un sistema de ficheros ?al
   vuelo?, eliminando esta limitaci?n.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Los sistemas de ficheros est?n alojados en particiones. Este es un
detalle muy importante, puesto que el t?rmino *partici?n* no significa
aqu? lo mismo que en otros entornos (por ejemplo, en MS-DOS?) debido a
la herencia UNIX? de FreeBSD. Cada partici?n se identifica con una letra
desde ``a`` hasta ``h``. Cada partici?n puede contener solamente un
sistema de ficheros, lo que significa que los sistemas de ficheros
suelen definirse mediante su punto de montaje en la jerarqu?a del
sistema de ficheros o por la letra de la partici?n en la que est?n
alojados.

FreeBSD tambi?n utiliza espacio de disco como *espacio de intercambio
(swap)*. El espacio de intercambio le brinda a FreeBSD *memoria
virtual*. Esto permite al su sistema comportarse como si tuviera m?s
memoria de la que realmente tiene. Cuando a FreeBSD se le agota la
memoria mueve algunos de los datos que no est? utilizando en ese momento
al espacio de intercambio, y los vuelve a poner donde estaban
(desplazando alguna otra cosa) cuando los necesita.

Algunas particiones tienen ciertas convenciones heredadas.

.. raw:: html

   <div class="informaltable">

+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Partici?n   | Representaci?n                                                                                                                                                                                                                                                                                                 |
+=============+================================================================================================================================================================================================================================================================================================================+
| ``a``       | Normalmente contiene el sistema de ficheros ra?z                                                                                                                                                                                                                                                               |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``b``       | Normalmente contiene el espacio de intercambio (swap)                                                                                                                                                                                                                                                          |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``c``       | Suele tener el mismo tama?o de la ?slice? que la encierra. Esto permite a las utilidades que necesitan trabajar en toda la ?slice? entera (por ejemplo durante una b?squeda de bloques da?ados) trabajar en la partici?n ``c``. Normalmente no deber?a usted crear un sistema de ficheros en esta partici?n.   |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``d``       | La partici?n ``d`` sol?a tuvo un significado especial asociado pero ya no lo tiene.                                                                                                                                                                                                                            |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Cada partici?n que contiene un sistema de ficheros se almacena en lo que
FreeBSD llama una ?slice?. ?slice? es en FreeBSD lo que en otros ?mbitos
se denomina partici?n; es un hecho que deriva de los or?genes de FreeBSD
como ya sabemos basado en UNIX?.

Los n?meros de ?slice? muestran el nombre de dispositivo, al que precede
una ``s`` y un n?mero que puede ser un 1 u otro n?mero mayor. Por lo
tanto ?da0*s1*? es la primera slice en la primera unidad SCSI. S?lo
puede haber cuatro ?slice? f?sicas en un disco, pero puede haber ?slice?
l?gicas dentro ?slice? f?sicas del tipo apropiado. Estas
?slice?extendidas se numeran a partir de 5, as? que ?ad0*s5*? es la
primera ?slice? extendida en el primer disco IDE. Estos dispositivos se
usan en sistemas de ficheros que se preve que ocupen una slice.

Tanto las ?slice? y las unidades f?sicas ?peligrosamente dedicadas?,
como otras unidades contienen *particiones*, que se designan mediante
letras desde la ``a`` hasta ``h``. Esta letra se a?ade al nombre del
dispositivo. Se ver? mucho mejor mediante ejemplos: ?da0*a*? es la
partici?n a en la primera unidad da y es una de esas a las que llamamos
?peligrosamente dedicada?. ?ad1s3*e*? es la quinta partici?n en la
tercera slice de la segunda unidad de disco IDE.

Para terminar, cada disco en el sistema tiene tambi?n su designaci?n. El
nombre de disco comienza por un c?digo que indica el tipo de disco,
luego un n?mero, que indica qu? disco es. A diferencia de las ?slice?,
la numeraci?n de discos comienza desde 0. Puede las numeraciones m?s
comunes en el `Tabla?3.1, “C?digos de dispositivos de
disco” <disk-organization.html#basics-dev-codes>`__.

Cuando se hace referencia a una partici?n, FreeBSD necesita que tambi?n
se nombre la ?slice? y el disco que contiene la partici?. Esto se hace
con el nombre de disco, ``s``, el n?mero ?slice? y por ?ltimo la letra
de la partici?n. Tiene varios casos en el `Ejemplo?3.1, “Ejemplo de
nombres de disco, ?slice? y
partici?n” <disk-organization.html#basics-disk-slice-part>`__.

En el `Ejemplo?3.2, “Modelo conceptual de un
disco” <disk-organization.html#basics-concept-disk-model>`__ muestra un
modelo conceptual del esquema de un disco que deber?a ayudarle a aclarar
las cosas.

Antes de instalar FreeBSD tendr? que configurar las ?slice? de disco,
despu?s crear particiones dentro de las ?slice? que vaya a usar en
FreeBSD y luego crear un sistema de ficheros (o swap) en cada partici?n
y luego decidir cu?l va a ser el punto de montaje del sistema de
ficheros.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabla 3.1. C?digos de dispositivos de disco

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------+--------------------------------+
| C?digo    | Significado                    |
+===========+================================+
| ``ad``    | Disco ATAPI (IDE)              |
+-----------+--------------------------------+
| ``da``    | Disco de acceso directo SCSI   |
+-----------+--------------------------------+
| ``acd``   | CDROM ATAPI (IDE)              |
+-----------+--------------------------------+
| ``cd``    | CDROM SCSI                     |
+-----------+--------------------------------+
| ``fd``    | Disquete (floppy)              |
+-----------+--------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 3.1. Ejemplo de nombres de disco, ?slice? y partici?n

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. raw:: html

   <div class="informaltable">

+--------------+------------------------------------------------------------------------------------------------+
| Nombre       | Significado                                                                                    |
+==============+================================================================================================+
| ``ad0s1a``   | La primera partici?n (``a``) en la primera slice (``s1``) en el primer disco IDE (``ad0``).    |
+--------------+------------------------------------------------------------------------------------------------+
| ``da1s2e``   | La quinta partici?n (``e``) en la segunda slice (``s2``) en el segundo disco SCSI (``da1``).   |
+--------------+------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 3.2. Modelo conceptual de un disco

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Este diagrama muestra c?mo ve FreeBSD el primer disco IDE en el sistema.
Se asume que el disco es de 4?GB, y contiene dos ?slices? de 2?GB
(particiones MS-DOS?). La primera partici?n contiene un disco MS-DOS?,
``C:``, y la segunda partici?n contiene una instalaci?n de FreeBSD. Esta
instalaci?n de ejemplo tiene tres particiones, y una partici?n swap.

Cada una de las tres particiones tiene un sistema de ficheros. La
partici?n ``a`` se utilizar? para el sistema de ficheros ra?z, ``e``
para la jerarqu?a del directorio ``/var``, y ``f`` para la jerarqu?a del
directorio ``/usr``.

.. raw:: html

   <div class="mediaobject">

|image5|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+------------------------------------------------------+
| `Anterior <dirstructure.html>`__?   | `Subir <basics.html>`__   | ?\ `Siguiente <mount-unmount.html>`__                |
+-------------------------------------+---------------------------+------------------------------------------------------+
| 3.4. Estructura de directorios?     | `Inicio <index.html>`__   | ?3.6. Montaje y desmontaje de sistemas de ficheros   |
+-------------------------------------+---------------------------+------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |image0| image:: install/example-dir1.png
.. |image1| image:: install/example-dir2.png
.. |image2| image:: install/example-dir3.png
.. |image3| image:: install/example-dir4.png
.. |image4| image:: install/example-dir5.png
.. |image5| image:: install/disk-layout.png

============================================
18.7. Crear y utilizar medios ?pticos (DVDs)
============================================

.. raw:: html

   <div class="navheader">

18.7. Crear y utilizar medios ?pticos (DVDs)
`Anterior <creating-cds.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <floppies.html>`__

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

18.7. Crear y utilizar medios ?pticos (DVDs)
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   <div>

Con colaboraciones de Andy Polyakov.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.1. Introducci?n
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Comparado con el CD, el DVD es la nueva generaci?n de tecnolog?a de
almacenamiento en medios ?pticos. El DVD puede almacenar m?s datos que
cualquier CD y hoy d?a es el est?ndar para publicaci?n de v?deo.

Se pueden definir cinco formatos de grabaci?n para lo que llamamos un
DVD grabable:

.. raw:: html

   <div class="itemizedlist">

-  DVD-R: Este fu? el primer formato de grabaci?n de DVD. El DVD-R
   est?ndar fu? definido por el `DVD
   Forum <http://www.dvdforum.com/forum.shtml>`__. Este formato es de
   una sola escritura.

-  DVD-RW: Esta es la versi?n reescribible del DVD-R est?ndar. Un DVD-RW
   puede reescribirse unas 1.000 veces.

-  DVD-RAM: Este es tambi?n un formato reescribible soportado por el DVD
   Forum. Un DVD-RAM puede verse como un disco duro extra?ble. Este
   medio no es compatible con la mayor?a de las unidades DVD-ROM y
   reproductores de video DVD; hay muy pocas grabadoras de DVD que
   soporten el formato DVD-RAM.

-  DVD+RW: Este es un formato reescribible definido por la `DVD+RW
   Alliance <http://www.dvdrw.com/>`__. Un DVD+RW puede reescribirse
   unas 1000 veces.

-  DVD+R: Este un formato es la versi?n de una sola escritura del
   formato DVD+RW.

.. raw:: html

   </div>

Un DVD grabable de una capa puede almacenar hasta 4.700.000.000?bytes,
es decir, 4'38?GB o 4485?MB (1 kilobyte son 1.024 bytes).

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Debemos hacer una distinci?n entre medio f?sico y aplicaci?n. Un DVD de
v?deo es una estructura de fichero espec?fica que puede escribirse en
cualquier medio f?sico consistente en un DVD grabable: DVD-R, DVD+R,
DVD-RW, etc. Antes de elegir el tipo de medio, debe asegurarse que la
grabadora y el reproductor de DVD de v?deo (un reproductor independiente
o una unidad DVD-ROM en una computadora) son compatibles con el medio
que pretende utilizar.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.2. Configuraci?n
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Utilice
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
para grabar el DVD. Forma parte de las herramientas dvd+rw-tools
(`sysutils/dvd+rw-tools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/dvd+rw-tools/pkg-descr>`__).
Las dvd+rw-tools permiten usar todos los tipos de DVD.

Estas herramientas utilizan el subsistema SCSI para acceder a los
dispositivos, por lo tanto el `soporte
ATAPI/CAM <creating-cds.html#atapicam>`__ debe estar presente en su
kernel. Si su grabadora usa el interfaz USB no tendr? que hacerlo, pero
tendr? que leer la `Secci?n?18.5, “Dispositivos de almacenamiento
USB” <usb-disks.html>`__ para m?s informaci?n sobre la configuraci?n de
dispositivos USB.

Tambi?n debe que habilitar el acceso DMA para dispositivos ATAPI. Para
ello a?ada la siguiente l?nea a ``/boot/loader.conf``:

.. code:: programlisting

    hw.ata.atapi_dma="1"

Antes de intentar utilizar dvd+rw-tools debe consultar las `notas de
compatibilidad de hardware de
dvd+rw-tools <http://fy.chalmers.se/~appro/linux/DVD+RW/hcn.html>`__ por
si apareciera cualquier informaci?n relacionada con su grabadora de DVD.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si desea un interfaz gr?fico deber?a echar un vistazo a K3b
(`sysutils/k3b <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/k3b/pkg-descr>`__),
que ofrece un interfaz de usuario amigable para
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
y muchas otras herramientas de grabaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.3. Quemado de DVD de datos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
es un “frontend” de `mkisofs <creating-cds.html#mkisofs>`__, invocar? a
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
para crear una estructura de sistema de ficheros y realizar? la
escritura del DVD. Esto significa que no necesita crear una imagen de
los datos antes del proceso de escritura.

La grabaci?n en DVD+R o DVD-R de los datos del directorio
``/ruta/a/los/datos``, se hace del siguiente modo:

.. code:: screen

    # growisofs -dvd-compat -Z /dev/cd0 -J -R /ruta/a/los/datos

Las opciones ``-J -R`` se suministran a
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
para la creaci?n del sistema de ficheros (en este caso: un sistema de
ficheros ISO 9660 con extensiones Joliet y Rock Ridge). Consulte la
p?gina de manual
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
para m?s detalles.

La opci?n ``-Z`` se usa la sesi?n inicial de grabaci?n en todos los
casos, sesiones m?ltiples o no. El dispositivo DVD del ejemplo,
*``/dev/cd0``*, debe ajustarse de acuerdo a la configuraci?n de su
sistema. El par?mero ``-dvd-compat`` cerrar? el disco (no se podr?
a?adir nada a la grabaci?n). Por contra, esto le brindar? una mejor
compatibilidad del medio con unidades DVD-ROM.

Tambi?n es posible grabar una imagen pre-masterizada, por ejemplo para
guardar la imagen *``ficheroimagen.iso``*:

.. code:: screen

    # growisofs -dvd-compat -Z /dev/cd0=ficheroimagen.iso

La velocidad de escritura se detecta y configura autom?ticamente seg?n
el medio y la unidad que se est? utilizando. Si quiere forzar la
velocidad de escritura utilice el par?metro ``-speed=``. Para m?s
informaci?n consulte la p?gina de manual
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.4. Grabaci?n de un DVD de v?deo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un DVD de v?deo es una estructura de ficheros espec?fica basada en las
especificiones ISO 9660 y micro-UDF (M-UDF). El DVD de v?deo tambi?n
dispone de una jerarqu?a de estructura de datos espec?fica; por esta
raz?n es necesario un programa especializado para crear tal DVD:
`multimedia/dvdauthor <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/dvdauthor/pkg-descr>`__.

Si ya tiene una imagen de un sistema de ficheros de DVD de v?deo gr?belo
de la misma manera que cualquier otra imagen; consulte la secci?n previa
para ver un ejemplo. Si ha creado el DVD y el resultado est? en, por
ejemplo, el directorio ``/ruta/al/v?deo``, use el siguiente comando para
grabar el DVD de v?deo:

.. code:: screen

    # growisofs -Z /dev/cd0 -dvd-video /ruta/al/v?deo

La opci?n ``-dvd-video`` de
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
har? posible la creaci?n de una estructura de sistema de ficheros de DVD
de v?deo. Adem?s, la opci?n ``-dvd-video`` implica la opci?n
``-dvd-compat`` de
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.5. Uso de un DVD+RW
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A diferencia de un CD-RW, un DVD+RW virgen necesita ser formateado antes
de usarse por primera vez. El programa
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
se encargar? de ello autom?ticamente cuando sea necesario, lo cual es el
m?todo *recomendado*. De todas formas puede usted usar el comando
``dvd+rw-format`` para formatear el DVD+RW:

.. code:: screen

    # dvd+rw-format /dev/cd0

Necesita ejecutar esta operaci?n solamente una vez, recuerde que s?lo
los DVD+RW v?rgenes necesitan ser formateados. Hecho eso ya puede usar
el DVD+RW de la forma expuesta en las secciones previas.

Si desea guardar nuevos datos (grabar un sistema de ficheros totalmente
nuevo, no a?adir m?s datos) en un DVD+RW no necesita borrarlo, s?lo
tiene que escribir sobre la grabaci?n anterior (realizando una nueva
sesi?n inicial):

.. code:: screen

    # growisofs -Z /dev/cd0 -J -R /ruta/alos/datosnuevos

El formato DVD+RW ofrece la posibilidad de a?adir datos f?cilmente a una
grabaci?n previa. La operaci?n consiste en fusionar una nueva sesi?n a
la existente, no es escritura multisesi?n;
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
*har? crecer* el sistema de ficheros ISO 9660 presente en el medio.

Si, por ejemplo, a?adir datos al DVD+RW del ejemplo anterior tenemos que
usar lo siguiente:

.. code:: screen

    # growisofs -M /dev/cd0 -J -R /ruta/alos/datosnuevos

Las mismas opciones de
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
que utilizamos para quemar la sesi?n inicial pueden usarse en ulteriores
escritura.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Puede usar la opci?n ``-dvd-compat`` si desea mejor la compatibilidad de
medios con unidades DVD-ROM. Si la usa en un DVD+RW no evitar? que pueda
a?adir m?s datos.

.. raw:: html

   </div>

Si por alguna raz?n desea borrar el contenido del medio, haga lo
siguiente:

.. code:: screen

    # growisofs -Z /dev/cd0=/dev/zero

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.6. Uso de un DVD-RW
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un DVD-RW acepta dos formatos de disco: el incremental secuencial y el
de sobreescritura restringida. Por defecto los discos DVD-RW est?n en
formato secuencial.

Un DVD-RW virgen puede utilizarse directamente sin necesidad de
formateo, sin embargo un DVD-RW no virgen en formato secuencial necesita
ser borrado antes de poder guardar una nueva sesi?n inicial.

Para borrar un DVD-RW en modo secuencial, ejecute:

.. code:: screen

    # dvd+rw-format -blank=full /dev/cd0

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Un borrado total (``-blank=full``) tardar? aproximadamente una hora en
un medio 1x. Un borrado r?pido puede realizarse con la opci?n ``-blank``
si el DVD-RW fu? grabado en modo Disk-At-Once (DAO). Para grabar el
DVD-RW en modo DAO use el comando:

.. code:: screen

    # growisofs -use-the-force-luke=dao -Z /dev/cd0=ficheroimagen.iso

La opci?n ``-use-the-force-luke=dao`` no es imprescindible, ya que
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
trata de detectar el medio (borrado r?pido) y entrar en escritura DAO.

Deber?a usarse el modo de reescritura restringida en los DVD-RW, pues
este formato es m?s flexible que el formato de incremento secuencial, el
formato por defecto.

.. raw:: html

   </div>

Para escribir datos en un DVD-RW secuencial proceda del mismo modo que
con los dem?s formatos de DVD:

.. code:: screen

    # growisofs -Z /dev/cd0 -J -R /ruta/alos/datos

Si desea a?adir datos a una grabaci?n previa tendr? que usar la opci?n
``-M`` de
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.
si a?ade datos a un DVD-RW en modo incremental secuencial se crear? en
el disco una nueva sesi?n y el resultado ser? un disco multisesi?n.

Un DVD-RW en formato de sobreescritura restringido no necesita ser
borrado antes de una nueva sesi?n inicial, s?lo tiene que sobreescribir
el disco con la opci?n ``-Z``. esto es similar al caso DVD+RW. Tambi?n
es posible ampliar un sistema de ficheros ISO 9660 ya existente y
escrito en el disco del mismo modo que para un DVD+RW con la opci?n
``-M``. El resultado ser? un DVD de una sesi?n.

Para poner un DVD-RW en el formato de sobreescritura restringido haga lo
siguiente:

.. code:: screen

    # dvd+rw-format /dev/cd0

Para devolverlo al formato secuencial use:

.. code:: screen

    # dvd+rw-format -blank=full /dev/cd0

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.7. Multisesi?n
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Muy pocas unidades DVD-ROM soportan DVDs multisesi?n. La mayor?a de las
veces (y si tiene suerte) solamente leer?n la primera sesi?n. Los DVD+R,
DVD-R y DVD-RW en formato secuencial pueden aceptar multisesiones. El
concepto de multisesi?n no existe en los formatos de sobreescritura
restringida de DVD+RW y DVD-RW.

Usando el siguiente comando despues de una sesi?n inicial (no-cerrada)
en un DVD+R, DVD-R o DVD-RW en formato secuencial a?adir? una nueva
sesi?n al disco:

.. code:: screen

    # growisofs -M /dev/cd0 -J -R /ruta/alos/nuevosdatos

Usando este comando con un DVD+RW o un DVD-RW en modo de sobreescritura
restringida, agregar? datos fusionando la nueva sesi?n a la ya
existente. El resultado ser? un disco de una sola sesi?n. Este es el
procedimiento habitual para a?adir datos tras la escritura inicial.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Una cierta cantidad de espacio en el medio se usa en cada sesi?n al
finalizar e iniciar sesiones; por tanto, se deben a?adir sesiones con
grandes cantidades de datos para optimizar el espacio del DVD. El n?mero
de sesiones est? limitado a 154 para un DVD+R, aproximadamente 2.000
para un DVD-R y 127 para un DVD+R de doble capa.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.7.8. Para mayor informaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para m?s informaci?n sobre un DVD,puede ejecutar el comando
``dvd+rw-mediainfo /dev/cd0`` con el disco en la unidad.

Tiene m?s informaci?n sobre dvd+rw-tools en la manual
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__,
en el `sitio web de
dvd+rw-tools <http://fy.chalmers.se/~appro/linux/DVD+RW/>`__ y en los
archivos de la `lista de correos de
cdwrite <http://lists.debian.org/cdwrite/>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si va a enviar un informe de problemas es imperativo que adjunte la
salida que ``dvd+rw-mediainfo`` produjo al grabar (o no grabar) el
medio. Sin esta salida ser? pr?cticamente imposible ayudarle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+---------------------------+-------------------------------------------------+
| `Anterior <creating-cds.html>`__?              | `Subir <disks.html>`__    | ?\ `Siguiente <floppies.html>`__                |
+------------------------------------------------+---------------------------+-------------------------------------------------+
| 18.6. Creaci?n y uso de medios ?pticos (CD)?   | `Inicio <index.html>`__   | ?18.8. Creaci?n y uso de disquetes (floppies)   |
+------------------------------------------------+---------------------------+-------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

===========================
2.2. Requisitos de hardware
===========================

.. raw:: html

   <div class="navheader">

2.2. Requisitos de hardware
`Anterior <install.html>`__?
Cap?tulo 2. Instalaci?n de FreeBSD
?\ `Siguiente <install-pre.html>`__

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

2.2. Requisitos de hardware
---------------------------

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

2.2.1. Configuraci?n m?nima
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n m?nima para instalar FreeBSD var?a seg?n la versi?n de
FreeBSD y la arquitectura de hardware.

Tiene informaci?n sobre la confuraci?n m?nima en las Notas de
Instalaci?n que encontrar? en la secci?n de `Informaci?n de
Releases <http://www.FreeBSD.org/releases/index.html>`__ del sitio web
de FreeBSD. En la siguiente secci?n se facilita un resumen de dicha
informaci?n. Dependiendo de cu?l sea el m?todo de instalaci?n que elija
para instalar FreeBSD necesitar? un floppy, un lector de CDROM que pueda
utilizar con FreeBSD o quiz?s un adaptador de red. Todo esto se explica
en la `Secci?n?2.3.7, “Preparaci?n del medio de
arranque” <install-pre.html#install-floppies>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.1. FreeBSD/i386 y FreeBSD/pc98
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tanto FreeBSD/i386 como FreeBSD/pc98 necesitan un procesador 486 o
superior y un m?nimo de 24?MB de RAM. Necesitar? tambi?n al menos 150?MB
de espacio libre en disco, que es lo que necesita la instalaci?n m?nima.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En sistemas muy antiguos la mayor?a de las veces ser? de mucha m?s ayuda
conseguir m?s RAM y espacio de disco que un procesador m?s r?pido.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.2. FreeBSD/alpha
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para instalar FreeBSD/alpha necesitar? una plataforma que est? soportada
(consulte `Secci?n?2.2.2, “Hardware
soportado” <install-hardware.html#install-hardware-supported>`__) y un
disco duro dedicado a FreeBSD. En este momento no es posible compartir
un disco con otro sistema operativo. Este disco debe estar
necesariamente conectado a una controladora SCSI que est? soportada por
el firmware SRM, o si se trata de un disco IDE el SRM de su m?quina debe
permitir el arranque desde discos IDE.

Necesitar? el firmware de la consola SRM de su plataforma. En ciertos
casos es posible pasar del firmware AlphaBIOS (o ARC) al SRM. En otros
casos no habr? m?s remedio que descargar un nuevo firmware desde el sito
web del fabricante.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

A partir de FreeBSD?7.0 no hay soporte para Alpha. La serie
FreeBSD?6.\ *``X``* es la ?ltima que ofrece soporte para esta
arquitectura.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.3. FreeBSD/amd64
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay dos tipos de procesadores capaces de ejecutar FreeBSD/amd64. La
primera son los procesadores AMD64, entre los que est?n los
AMD?Athlon™64, AMD?Athlon™64-FX, AMD?Opteron™ y los modelos superiores.

La segunda categor?a de procesadores que pueden usar FreeBSD/amd64 es la
de los procesadores de arquitectura EM64T de Intel?, por ejemplo las
familias de procesadores Intel??Core™?2 Duo, Quad, y Extreme, y la
secuencia de procesadores Intel??Xeon™ 3000, 5000 y 7000.

Si tiene una m?quina basada en una nVidia nForce3 Pro-150 *tendr? que
usar la configuraci?n de la BIOS* para deshabilitar IO ACPI. Si no tiene
la opci?n de hacerlo tendr? que deshabilitar ACPI. Hay errores en el
chipset Pro-150 para los que no hemos encontrado a?n una soluci?n.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.4. FreeBSD/sparc64
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para instalar FreeBSD/sparc64 necesita una plataforma que est? soportada
(consulte la `Secci?n?2.2.2, “Hardware
soportado” <install-hardware.html#install-hardware-supported>`__).

Necesitar? un disco dedicado a FreeBSD/sparc64. De momento es imposible
compartir un disco duro con otro sistema operativo.

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

2.2.2. Hardware soportado
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada versi?n de FreeBSD incluye una lista de hardware soportado en las
?FreeBSD Hardware Notes?. Este documento suele estar en un fichero
llamado ``HARDWARE.TXT``, que est? en el directorio raiz del CDROM o
distribuci?n FTP, o en el men? de documentaci?n de sysinstall. En este
documento se listan los dispositivos de hardware que se sabe que
funcionan con cada versi?n de FreeBSD y para qu? arquitectura. En la
p?gina de `Informaci?n de
Releases <http://www.FreeBSD.org/releases/index.html>`__ del sitio web
de FreeBSD encontrar? copias de esta lista para diversas releases y
arquitecturas.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+----------------------------+--------------------------------------------+
| `Anterior <install.html>`__?          | `Subir <install.html>`__   | ?\ `Siguiente <install-pre.html>`__        |
+---------------------------------------+----------------------------+--------------------------------------------+
| Cap?tulo 2. Instalaci?n de FreeBSD?   | `Inicio <index.html>`__    | ?2.3. Tareas anteriores a la instalaci?n   |
+---------------------------------------+----------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

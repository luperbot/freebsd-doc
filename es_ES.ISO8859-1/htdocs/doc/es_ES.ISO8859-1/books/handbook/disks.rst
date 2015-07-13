===========================
Cap?tulo 18. Almacenamiento
===========================

.. raw:: html

   <div class="navheader">

Cap?tulo 18. Almacenamiento
`Anterior <audit.html>`__?
Parte?III.?Administraci?n del sistema.
?\ `Siguiente <disks-naming.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Cap?tulo 18. Almacenamiento
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`18.1. Sinopsis <disks.html#disks-synopsis>`__
`18.2. Nombres de dispositivo <disks-naming.html>`__
`18.3. A?adir discos <disks-adding.html>`__
`18.4. RAID <raid.html>`__
`18.5. Dispositivos de almacenamiento USB <usb-disks.html>`__
`18.6. Creaci?n y uso de medios ?pticos (CD) <creating-cds.html>`__
`18.7. Crear y utilizar medios ?pticos (DVDs) <creating-dvds.html>`__
`18.8. Creaci?n y uso de disquetes (floppies) <floppies.html>`__
`18.9. Creaci?n y uso de cintas de datos <backups-tapebackups.html>`__
`18.10. Respaldos en disquetes <backups-floppybackups.html>`__
`18.11. Bases para respaldos <backup-basics.html>`__
`18.12. Sistemas de ficheros en red, memoria y respaldados en
fichero <disks-virtual.html>`__
`18.13. Instant?neas (“snapshots”) de sistemas de
ficheros <snapshots.html>`__
`18.14. Cuotas en sistemas de ficheros <quotas.html>`__
`18.15. Cifrado de particiones de disco <disks-encrypting.html>`__

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

18.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este cap?tulo trata sobre el uso de discos en FreeBSD. Esto incluye
discos basados en memoria, discos conectados a trav?s de la red,
dispositivos de almacenamiento SCSI/IDE est?ndar y dispositivos que
utilizan el interfaz USB.

Tras leer este cap?tulo:

.. raw:: html

   <div class="itemizedlist">

-  Conocer? la terminolog?a que se usa en FreeBSD para describir la
   organizaci?n de datos en un disco f?sico (particiones y porciones).

-  Sabr? c?mo a?adir discos duros a su sistema.

-  Sabr? c?mo configurar FreeBSD para utilizar dispositivos de
   almacenamiento USB.

-  Sabr? c?mo configurar sistemas virtuales de ficheros, como los discos
   de memoria.

-  Sabr? c?mo usar cuotas para limitar el uso del espacio en disco.

-  Sabr? c?mo cifrar discos para hacerlos m?s seguros ante un atacante.

-  Sabr? c?mo se crean y graban los CD y DVD en FreeBSD.

-  Conocer? diversas opciones de almacenamiento de copias de seguridad.

-  Sabr? c?mo usar diversos programas de respaldo que pueden utilizarse
   en FreeBSD.

-  Sabr? c?mo hacer copias de seguridad utilizando disquetes (floppy).

-  Sabr? en qu? consiste una instant?nea (“snapshot”) y c?mo utilizarla
   de forma eficiente.

.. raw:: html

   </div>

Antes de leer este cap?tulo:

.. raw:: html

   <div class="itemizedlist">

-  Debe saber c?mo configurar e instalar un nuevo kernel en FreeBSD
   (`Cap?tulo?8, *Configuraci?n del kernel de
   FreeBSD* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+------------------------------------------+----------------------------------------+
| `Anterior <audit.html>`__?                        | `Subir <system-administration.html>`__   | ?\ `Siguiente <disks-naming.html>`__   |
+---------------------------------------------------+------------------------------------------+----------------------------------------+
| Cap?tulo 17. Auditor?a de eventos de seguridad?   | `Inicio <index.html>`__                  | ?18.2. Nombres de dispositivo          |
+---------------------------------------------------+------------------------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

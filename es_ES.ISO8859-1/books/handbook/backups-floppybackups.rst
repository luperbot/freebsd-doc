=============================
18.10. Respaldos en disquetes
=============================

.. raw:: html

   <div class="navheader">

18.10. Respaldos en disquetes
`Anterior <backups-tapebackups.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <backup-basics.html>`__

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

18.10. Respaldos en disquetes
-----------------------------

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

18.10.1. ?Puedo utilizar disquetes para respaldar mis datos?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los disquetes no son realmente el medio ideal para hacer respaldos
debido a que:

.. raw:: html

   <div class="itemizedlist">

-  El medio no es fiable, especialmente despu?s de largos periodos de
   tiempo.

-  El respaldo y la restauraci?n es muy lento.

-  Tienen una capacidad muy limitada (los d?s de respaldar un disco duro
   entero en una docena de disquetes pasaron hace mucho).

.. raw:: html

   </div>

De todas maneras, si no tiene otro m?todo para respaldar sus datos los
disquetes son una mejor soluci?n que no tener ning?n respaldo.

Si tiene que utilizar disquetes aseg?rese de usar discos de buena
calidad. Los disquetes que han estado almacenados en la oficina durante
un par de a?os son una mala elecci?n. Lo mejor ser?a que utilizara
discos nuevos de un fabricante respetado.

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

18.10.2. ?C?mo respaldo mis datos a discos flexibles?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La mejor manera de respaldar a un disquete es usar
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ con
la opci?n ``-M`` (multi volumen), que permite que el respaldo se guarde
en varios disquetes.

Para respaldar todos los ficheros en el directorio actual y sus
subdirectorios use esto (como ``root``):

.. code:: screen

    # tar Mcvf /dev/fd0 *

Cuando el primer disquete est? lleno
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ le
solicitar? que inserte el siguiente volumen (debido a que
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ es
independiente del medio se refiere a vol?menes; en ?ste contexto se
refiere a disquetes).

.. code:: screen

    Prepare volume #2 for /dev/fd0 and hit return:

Esto se repite (con el n?mero de volumen incrementando) hasta que todos
los ficheros especificados hayan sido archivados.

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

18.10.3. ?Puedo comprimir mis respaldos?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desafortunadamente,
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ no
permite el uso de la opci?n ``-z`` para archivos multi-volumen. Puede,
por supuesto, hacer un
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__ a
todos los ficheros, mandarlos con
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ a
los disquetes, *y despu?s hacer
`gunzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gunzip&sektion=1>`__
a los archivos*

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

18.10.4. ?C?mo recupero mis respaldos?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para restaurar el archivo completo use:

.. code:: screen

    # tar Mxvf /dev/fd0

Hay dos maneras que puede usar para restaurar ficheros espec?ficos. La
primera, puede comenzar por el primer disco flexible y usar:

.. code:: screen

    # tar Mxvf /dev/fd0 nombredefichero

La utilidad
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ le
pedir? que inserte el resto de disquetes hasta que encuentre el fichero
requerido.

La segunda manera es: si sabe en qu? disco se encuentra el fichero puede
insertar ese disco y usar el comando expuesto arriba. Tenga en cuenta
que si el primer fichero en el disquete es la continuaci?n del anterior
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ le
advertir? que no puede restaurarlo *incluso si no se lo ha solicitado*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------+-----------------------------------------+
| `Anterior <backups-tapebackups.html>`__?   | `Subir <disks.html>`__    | ?\ `Siguiente <backup-basics.html>`__   |
+--------------------------------------------+---------------------------+-----------------------------------------+
| 18.9. Creaci?n y uso de cintas de datos?   | `Inicio <index.html>`__   | ?18.11. Bases para respaldos            |
+--------------------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

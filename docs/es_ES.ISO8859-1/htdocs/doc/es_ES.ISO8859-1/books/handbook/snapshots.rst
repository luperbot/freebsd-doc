=========================================================
18.13. Instant?neas (“snapshots”) de sistemas de ficheros
=========================================================

.. raw:: html

   <div class="navheader">

18.13. Instant?neas (“snapshots”) de sistemas de ficheros
`Anterior <disks-virtual.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <quotas.html>`__

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

18.13. Instant?neas (“snapshots”) de sistemas de ficheros
---------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD?5.0 ofrece una caracter?stica relacionada con `Soft
Updates <soft-updates.html>`__: las instant?neas del sistema de
ficheros.

Las instant?neas permiten a un usuario crear im?genes de uno o m?s
sistemas de ficheros dados, y tratarlas como un fichero. Los ficheros de
instant?nea deben crearse en el sistema de ficheros en el que se realiza
la acci?n, y un usuario puede crear hasta 20 (veinte) instant?neas por
sistema de ficheros. Las instant?neas activas se graban en el
superbloque, lo que hace que sigan ah? independientemente de montajes,
remontajes y reinicios del sistema. Cuando ya no necesite una
instant?nea puede borrarla con
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1>`__. Las
instant?neas pueden borrarse en cualquier orden pero puede que no pueda
recuperar todo el espacio debido a que otra instant?nea puede reclamar
algunos bloques liberados.

La bandera inalterable de fichero ``snapshot`` se activa con
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8>`__
despu?s de la creaci?n inicial de un fichero de instant?nea.
`unlink(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unlink&sektion=1>`__
hace una excepci?n con los ficheros de instant?nea, ya que permite que
se les borre.

Las instant?neas se crean con
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
Veamos un ejemplo. Vamos a colocar una instant?nea de ``/var`` en
``/var/snapshot/snap``:

.. code:: screen

    # mount -u -o snapshot /var/snapshot/snap /var

Tambi?n puede usar
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8>`__
para crear una instant?nea:

.. code:: screen

    # mksnap_ffs /var /var/snapshot/snap

Si busca ficheros de instant?nea en un sistema de de ficheros (por
ejemplo ``/var``) puede usar
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__:

.. code:: screen

    # find /var -flags snapshot

Una instant?nea tiene distintos usos:

.. raw:: html

   <div class="itemizedlist">

-  Algunos administradores usan un fichero de instant?nea como respaldo,
   puesto que la instant?nea puede guardarse en CD o cinta.

-  Integridad de ficheros;
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   puede ejecutarse en una instant?nea. Asumiendo que el sistema de
   ficheros estuviera limpio cuando se mont? se debe obtener un
   resultado limpio (e intacto). En esencia el proceso
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   hace esto mismo en segundo plano.

-  Ejecuci?n de
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   en la instant?nea. Se obtendr? un dump consistente con el sistema de
   ficheros y los sellos de hora de la instant?nea.
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   tambi?n puede leer una instant?nea, crear una imagen dump y eliminar
   la instant?nea en un comando usando la opci?n ``-L``.

-  Ejecutar un
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
   contra la instant?nea como una imagen congelada del sistema de
   ficheros. Para montar la instant?nea ``/var/snapshot/snap`` ejecute:

   .. code:: screen

       # mdconfig -a -t vnode -f /var/snapshot/snap -u 4
       # mount -r /dev/md4 /mnt

.. raw:: html

   </div>

Podr? recorrer la jerarqu?a de su sistema de ficheros ``/var`` congelado
montado en ``/mnt``. Todo estar? en el mismo estado en el que estaba
cuando cre? la instant?nea. La ?nica excepci?n es que cualquier
instant?nea anterior aparecer? como un fichero de longitud cero. Cuando
haya acabado de usar una instant?nea puede desmontarla con:

.. code:: screen

    # umount /mnt
    # mdconfig -d -u 4

Para m?s informaci?n sobre ``softupdates`` e instant?neas de sistemas
ficheros, incluyendo textos t?cnicos, visite el sitio web de Marshall
Kirk McKusick: ``http://www.mckusick.com/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------------------+---------------------------+------------------------------------------+
| `Anterior <disks-virtual.html>`__?                                      | `Subir <disks.html>`__    | ?\ `Siguiente <quotas.html>`__           |
+-------------------------------------------------------------------------+---------------------------+------------------------------------------+
| 18.12. Sistemas de ficheros en red, memoria y respaldados en fichero?   | `Inicio <index.html>`__   | ?18.14. Cuotas en sistemas de ficheros   |
+-------------------------------------------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

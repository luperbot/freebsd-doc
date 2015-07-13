===========================
7. Actualizaci?n de FreeBSD
===========================

.. raw:: html

   <div class="navheader">

7. Actualizaci?n de FreeBSD
`Anterior <firewall.html>`__?
?
?\ `Siguiente <procfs.html>`__

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

7. Actualizaci?n de FreeBSD
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay tres m?todos para actualizar FreeBSD: desde los fuentes, mediante
actualizaciones binarias y con los discos de instalaci?n.

Actualizar desde c?digo fuente es el m?todo m?s complejo pero el que
ofrece la mayor flexibilidad. Este proceso implica sincronizar su copia
en local del c?digo fuente de FreeBSD desde los servidores CVS
(Concurrent Versioning System). Una vez actualizado el c?digo puede
compilar nuevas versiones de kernel y utilidades. Si quiere m?s
informaci?n consulte el `cap?tulo
23 <../../../../doc/en_US.ISO8859-1/books/handbook/cutting-edge.html>`__
del Handbook.

Las actualizaciones binarias son semejantes a ``yum`` o ``apt-get`` de
Linux?. El programa
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
descargar? las actualizaciones pendientes del sistema y las instalar?.
Las actualizaciones pueden ser programadas con
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si usa
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
para programar las actualizaciones por favor, aseg?rese de poner
``freebsd-update cron`` en su
`crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1>`__
para reducir la posibilidad de que una gran cantidad de servidores
descarge actualizaciones al mismo tiempo.

.. code:: programlisting

    0 3 * * * root /usr/sbin/freebsd-update cron

.. raw:: html

   </div>

El ?ltimo m?todo de actualizaci?n es desde los discos de instalaci?n. Es
un proceso bastante claro. Encienda el sistema desde el disco y
seleccione la opci?n de actualizar.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+---------------------------+----------------------------------------+
| `Anterior <firewall.html>`__?   | ?                         | ?\ `Siguiente <procfs.html>`__         |
+---------------------------------+---------------------------+----------------------------------------+
| 6. Cortafuegos?                 | `Inicio <index.html>`__   | ?8. procfs: perdido pero no olvidado   |
+---------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

==========================
12.7. Secuencia de apagado
==========================

.. raw:: html

   <div class="navheader">

12.7. Secuencia de apagado
`Anterior <boot-init.html>`__?
Cap?tulo 12. El proceso de arranque en FreeBSD
?\ `Siguiente <users.html>`__

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

12.7. Secuencia de apagado
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que el apagado sea controlado, por medio de ``shutdown``,
``init`` ejecutar? el escrito ``/etc/rc.shutdown``, para posteriormente
enviar a todos los procesos la se?al ``TERM``, y subsecuentemente la
se?al ``KILL`` a cualquiera que no haya terminado en tiempo.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+---------------------------+-------------------------------------------------------------+
| `Anterior <boot-init.html>`__?                       | `Subir <boot.html>`__     | ?\ `Siguiente <users.html>`__                               |
+------------------------------------------------------+---------------------------+-------------------------------------------------------------+
| 12.6. Init: inicializaci?n del proceso de control?   | `Inicio <index.html>`__   | ?Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas   |
+------------------------------------------------------+---------------------------+-------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

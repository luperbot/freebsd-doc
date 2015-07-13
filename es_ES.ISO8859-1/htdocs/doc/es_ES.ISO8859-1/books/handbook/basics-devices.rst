==========================================
3.11. Dispositivos y nodos de dispositivos
==========================================

.. raw:: html

   <div class="navheader">

3.11. Dispositivos y nodos de dispositivos
`Anterior <editors.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <binary-formats.html>`__

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

3.11. Dispositivos y nodos de dispositivos
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dispositivo es un t?rmino utilizado la mayor?a de las veces para
actividades relacionadas con hardware del sistema, como discos,
impresoras, tarjetas gr?ficas y teclados. Cuando FreeBSD arranca, la
mayor?a de lo que FreeBSD despliega son dispositivos en el momento de
ser detectados. Si lo desea, puede volver a ver todos los mensajes que
el sistema emite durante el arranque consultando
``/var/run/dmesg.boot``.

Por ejemplo, ``acd0`` es la primera unidad CDROM IDE, mientras que
``kbd0`` representa el teclado.

En un sistema operativo UNIX? debe accederse a la mayor?a de estos
dispositivos a trav?s de ficheros especiales llamados nodos de
dispositivo, que se encuentran en el directorio ``/dev``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.11.1. Creaci?n de nodos de dispositivo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando agregue un nuevo dispositivo a su sistema, o compile soporte para
dispositivos adicionales, puede que necesite crear uno o m?s nodos de
dispositivo.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.11.1.1. ``DEVFS`` Dispositivo de sistema de ficheros (DEVice File System)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El dispositivo de sistema de ficheros, o ``DEVFS``, ofrece acceso a
dispositivos del espacio de nombres del kernel en el espacio de nombres
del sistema de ficheros global. En lugar de tener que crear y modificar
nodos de dispositivo, ``DEVFS`` se encarga del mantenimiento din?mico de
este sistema de fichero.

Consulte
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
si quiere m?s informaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+------------------------------------------+
| `Anterior <editors.html>`__?   | `Subir <basics.html>`__   | ?\ `Siguiente <binary-formats.html>`__   |
+--------------------------------+---------------------------+------------------------------------------+
| 3.10. Editores de texto?       | `Inicio <index.html>`__   | ?3.12. Formatos binarios                 |
+--------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

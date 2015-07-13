=======================
9. Comandos m?s comunes
=======================

.. raw:: html

   <div class="navheader">

9. Comandos m?s comunes
`Anterior <procfs.html>`__?
?
?\ `Siguiente <conclusion.html>`__

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

9. Comandos m?s comunes
-----------------------

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

9.1. Gesti?n de packages
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------------------------------------------------+----------------------------+--------------------------------------------------+
| Linux? command (Red?Hat/Debian)                             | FreeBSD equivalente        | Resultado                                        |
+=============================================================+============================+==================================================+
| ``yum install <package>`` / ``apt-get install <package>``   | ``pkg_add -r <package>``   | Instalar <package> desde un repositorio remoto   |
+-------------------------------------------------------------+----------------------------+--------------------------------------------------+
| ``rpm -ivh <package>`` / ``dpkg -i <package>``              | ``pkg_add -v <package>``   | Instalar package                                 |
+-------------------------------------------------------------+----------------------------+--------------------------------------------------+
| ``rpm -qa`` / ``dpkg -l``                                   | ``pkg_info``               | Ver packages instalados                          |
+-------------------------------------------------------------+----------------------------+--------------------------------------------------+

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

9.2. Gesti?n del sistema
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+-------------------------------+-------------------------------------+
| Linux? command   | FreeBSD equivalente           | Resultado                           |
+==================+===============================+=====================================+
| ``lspci``        | ``pciconf``                   | Ver dispositivos PCI                |
+------------------+-------------------------------+-------------------------------------+
| ``lsmod``        | ``kldstat``                   | Ver m?dulos cargados en el kernel   |
+------------------+-------------------------------+-------------------------------------+
| ``modprobe``     | ``kldload`` / ``kldunload``   | Cargar/Borrar m?dulos del kernel    |
+------------------+-------------------------------+-------------------------------------+
| ``strace``       | ``truss``                     | Seguir llamadas del sistema         |
+------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+--------------------------------------+
| `Anterior <procfs.html>`__?            | ?                         | ?\ `Siguiente <conclusion.html>`__   |
+----------------------------------------+---------------------------+--------------------------------------+
| 8. procfs: perdido pero no olvidado?   | `Inicio <index.html>`__   | ?10. Conclusi?n                      |
+----------------------------------------+---------------------------+--------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

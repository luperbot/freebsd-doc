===============
4. Distribuci?n
===============

.. raw:: html

   <div class="navheader">

4. Distribuci?n
`Anterior <release-build.html>`__?
?
?\ `Siguiente <extensibility.html>`__

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

4. Distribuci?n
---------------

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

4.1. Servidores de FTP
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando se ha probado exhaustivamente la release y se ha empaquetado
debidamente para proceder a su distribuci?n, se debe actualizar el sitio
maestro de FTP. Los sitios FTP oficiales de FreeBSD son mirrors del
sitio FTP maestro, tambi?n llamado ``ftp-master``. Cuando la release
est? lista, se deben modificar los siguientes ficheros en el servidor
``ftp-master``:

.. raw:: html

   <div class="variablelist">

``/pub/FreeBSD/releases/arch/X.Y-RELEASE/``
    El directorio de instalaci?n dde FTP que se crea con la salida del
    comando ``make release``.

``/pub/FreeBSD/ports/arch/packages-X.Y-release/``
    La construcci?n del paquete completo de la release.

``/pub/FreeBSD/releases/arch/X.Y-RELEASE/tools``
    Un enlace simb?lico a ``../../../tools``.

``/pub/FreeBSD/releases/arch/X.Y-RELEASE/packages``
    Un enlace simb?lico a ``../../../ports/arch/packages-X.Y-release``.

``/pub/FreeBSD/releases/arch/ISO-IMAGES/X.Y/X.Y-RELEASE-arch-*.iso``
    Las im?genes ISO. El “\*” se sustituye por ``disc1``, ``disc2``,
    etc. Solo si existe ``disc1`` junto con un CD de primera instalaci?n
    alternativo (por ejemplo una instalaci?n recortada o reducida sin
    sistema de ventanas) puede existir tambi?n un ``mini``.

.. raw:: html

   </div>

Para obtener m?s informaci?n sobre la arquitectura de mirrors para la
distribuci?n del sistema FreeBSD, se ruega al lector que consulte el
art?culo `Mirroring
FreeBSD <http://www.freebsd.org/doc/en_US.ISO8859-1/articles/hubs/>`__.

Puede que transcurran desde varias horas hasta varios d?as hasta que la
mayor?a de los sitios FTP Tier-1 se actualicen con respecto al
``ftp-master``, esto depende de si un determinado paquete se carg? o no
se carg? en determinado instante. Es imperativo que los ingenieros de
releases se coordinen con `lista de correo de avisos para
administradores de r?plicas de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/mirror-announce>`__
antes de anunciar la disponibilidad general del nuevo software en los
sitios FTP. Para que todo fuera bien el paquete de la release se deber?a
cargar al menos cuatro d?as antes del d?a oficial de lanzamiento de la
release. Los permisos para el grupo “other” deben desactivarse
completamente para que los sitios espejos puedan descargar la release
pero no as? los usuarios finales, hasta que llegue el d?a oficial del
lanzamiento. Se debe enviar un correo a `lista de correo de avisos para
administradores de r?plicas de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/mirror-announce>`__
cuando se publican la release con los permisos modificados, diciendo que
la release ha sido puesta en escena y proporcionando la fecha a partir
de la cual los mirrors deben comenzar a dar permisos de acceso para el
p?blico en general. Se debe comprobar que se incluye informaci?n
relativa a zonas horarias, por ejemplo informaci?n relativa a GMT.

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

4.2. Replicaci?n de CD-ROMs
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dentro de poco tiempo: Consejos para enviar ISOs de FreeBSD a un
replicador e informaci?n sobre las medidas de aseguramiento de la
calidad que se deben tomar.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------+-----------------------------------------+
| `Anterior <release-build.html>`__?   | ?                         | ?\ `Siguiente <extensibility.html>`__   |
+--------------------------------------+---------------------------+-----------------------------------------+
| 3. Construcci?n de la Release?       | `Inicio <index.html>`__   | ?5. Extensibilidad                      |
+--------------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

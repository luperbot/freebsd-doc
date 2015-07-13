=================
5. Extensibilidad
=================

.. raw:: html

   <div class="navheader">

5. Extensibilidad
`Anterior <distribution.html>`__?
?
?\ `Siguiente <lessons-learned.html>`__

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

5. Extensibilidad
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aunque FreeBSD consitituye un sistema operativo “completo”, no existe
nada que nos obligue a utilizarlo exactamente igual que como se ha
empaquetado para crear la distribuci?n. Es decir, el sistema FreeBSD se
ha dise?ado para ser tan extensible como sea posible de tal forma que se
puede utilizar como la base sobre la que se pueden construir productos
comerciales. La ?nica “regla” sobre este tema es que si se piensa
distribuir FreeBSD con una serie de cambios profundos en ?l , se anima a
que se *documenten adecuadamente dichos mejoras*. La comunidad FreeBSD
s?lo puede ayudar a los usuarios que utilizan el software que dicha
comunidad distribuye. Se anima encarecidamente hacia la innovaci?n tanto
en el proceso de instalaci?n como en las herramientas de administraci?n,
pero no se puede esperar un respuesta a todas las preguntas que surgan
sobre dichos temas.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. Creaci?n de disquetes de arranque a medida
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Muchas organizaciones poseen complejos requisitos que pueden consistir
en m?dulos del kernel adicionales o herramientas de entorno de usuario
que deben a?adirse en los discos de instalaci?n. La forma “r?pida y
sucia” de a?adir estas cosas consiste en modificar el directorio
temporal que contiene la estructura de un ``make       release``:

.. raw:: html

   <div class="itemizedlist">

-  Aplicar parches o a?adir archivos adicionales dentro del directorio
   chroot de construcci?n de la release.

-  ``rm         ${CHROOTDIR}/usr/obj/usr/src/release/release.[59]``

-  Reconstruir
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__,
   el kernel o cualquier otra parte del sistema que se vea afectada por
   los cambios.

-  ``chroot ${CHROOTDIR} ./mk floppies         ``

.. raw:: html

   </div>

Los nuevos disquetes de instalaci?n estar?n en
``${CHROOTDIR}/R/stage/floppies``.

Tambi?n se puede llamar el objetivo de make ``boot.flp`` o directamente
al “script” de creaci?n del sistema de ficheros
``src/release/scripts/doFS.sh``.

Los parches locales tambi?n se pueden proporcionar al proceso de
construcci?n de la release mediante la definici?n de la variable
``LOCAL_PATCH`` dentro de ``make release``.

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

5.2. “Scripts” para ``sysinstall``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La instalaci?n y configuraci?n del sistema FreeBSD a trav?s de
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
se puede modificar mediante “scripts” para que proporcione instalaciones
autom?ticas a grandes organizaciones. Esta funcionalidad se puede
utilizar conjuntamente con Intel? PXE[13] para arrancar sistemas a
trav?s de la red, o a trav?s de disquetes de arranque a medida
utilizando un “script” de sysinstall. Un ejemplo de gui?n sysinstall se
encuentra disponible en ``src/release/sysinstall/install.cfg``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+----------------------------------------------------+
| `Anterior <distribution.html>`__?   | ?                         | ?\ `Siguiente <lessons-learned.html>`__            |
+-------------------------------------+---------------------------+----------------------------------------------------+
| 4. Distribuci?n?                    | `Inicio <index.html>`__   | ?6. Lecciones aprendidas a partir de FreeBSD 4.4   |
+-------------------------------------+---------------------------+----------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

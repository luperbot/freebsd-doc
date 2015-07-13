====================================================
14. Interacciones entre el CVS de FreeBSD y Perforce
====================================================

.. raw:: html

   <div class="navheader">

14. Interacciones entre el CVS de FreeBSD y Perforce
`Anterior <renaming-files.html>`__?
?
?\ `Siguiente <offline-ops.html>`__

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

14. Interacciones entre el CVS de FreeBSD y Perforce
----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los repositorios de Perforce y de CVS de FreeBSD est?n completamente
separados. No obstante, los cambios que se producen en CVS se reflejan
casi en tiempo real en Perforce. Cada 2 minutos se pregunta al servidor
de CVS sobre cambios realizados en la rama HEAD, y dichos cambios se
entregan a Perforce dentro del ?rbol ``//depot/vendor/freebsd/...``. De
este modo este ?rbol permite la ramificaci?n y la integraci?n de
proyectos derivados. Cualquier proyecto que implique la modificaci?n del
c?digo fuente de FreeBSD deber?a tener este ?rbol como su rama padre (o
rama “abuela”, dependiendo de las necesidades concretas de cada
proyecto), y deber?an tener lugar integraciones peri?dicas y
sincronizaciones para que el ?rbol est? en consonancia con el desarrollo
de FreeBSD y evitar conflictos en la medida de lo posible.

El puente entre CVS y Perforce es de un s?lo sentido; los cambios del
CVS se reflejar?n en Perforce, pero los cambios en Perforce no se
reflejar?n en el CVS. Si es necesario, se pueden exportar partes del
repositorio de Perforce al CVSup y que as? se puedan distribuir. Por
favor, contacte con los administradores de Perforce de FreeBSD si ese es
su caso.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+-------------------------------------------+
| `Anterior <renaming-files.html>`__?   | ?                         | ?\ `Siguiente <offline-ops.html>`__       |
+---------------------------------------+---------------------------+-------------------------------------------+
| 13. Cambiar nombres de ficheros?      | `Inicio <index.html>`__   | ?15. Funcionamiento sin conexi?n de red   |
+---------------------------------------+---------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

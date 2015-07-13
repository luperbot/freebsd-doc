=================================================
Perforce en el contexto del desarrollo de FreeBSD
=================================================

.. raw:: html

   <div class="navheader">

Perforce en el contexto del desarrollo de FreeBSD
?
?
?\ `Siguiente <start.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="es" lang="es">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Scott Long
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| ``<scottl@FreeBSD.org>``
|  ??????????

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revisi?n: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Aviso Legal <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

por .

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`1. Introducci?n <index.html#intro>`__
`2. Los comienzos <start.html>`__
`3. Clientes <clients.html>`__
`4. Sincronizaciones <syncing.html>`__
`5. Ramas <branches.html>`__
`6. Integraciones <Integrations.html>`__
`7. Aplicaci?n de cambios en el repositorio <submit.html>`__
`8. Edici?n <editing.html>`__
`9. Cambios, descripciones e historial <changes.html>`__
`10. “diffs” <diffs.html>`__
`11. A?adir o eliminar ficheros <add-rm-files.html>`__
`12. El trabajo con “diffs” <working-with-diffs.html>`__
`13. Cambiar nombres de ficheros <renaming-files.html>`__
`14. Interacciones entre el CVS de FreeBSD y
Perforce <freebsd-cvs-and-p4.html>`__
`15. Funcionamiento sin conexi?n de red <offline-ops.html>`__
`16. Consideraciones finales para el “Google Summer of
Code” <soc.html>`__

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

1. Introducci?n
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El proyecto FreeBSD utiliza el sistema de control de versiones Perforce
para gestionar proyectos experimentales que todav?a no est?n listos para
ser incluidos en el repositorio principal de CVS.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1. Disponibilidad, documentaci?n y recursos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aunque que el producto Perforce es un producto comercial, el software
cliente que se encarga de interactuar con el servidor se distribuye
libremente. Pueden descargarse versiones binarias del mismo desde el
sitio web de Perforce:
``http://www.perforce.com/perforce/loadprog.html``.

Existe un cliente gr?fico, pero la mayor?a de la gente utiliza la
aplicaci?n de l?nea de ?rdenes, ``p4``. Este documento trata sobre el
uso de dicha herramienta para la l?nea de ?rdenes.

En ``http://www.perforce.com/perforce/technical.html`` encontrar?
documentaci?n “online” detallada.

Se recomienda encarecidamente leer la “gu?a de usuario” y el “manual de
Perforce”. La aplicaci?n p4 dispone de una extensa ayuda “online” a la
que puede accederse mediante la orden ``p4 help``.

El servidor FreeBSD Perforce se encuentra en ``perforce.freebsd.org``,
puerto ``1666``. Puede navegar por el repositorio desde
``http://perforce.freebsd.org``. Ciertas partes del repositorio se
exportan autom?ticamente hacia diversos servidores CVSup.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------------+
| ?   | ?   | ?\ `Siguiente <start.html>`__   |
+-----+-----+---------------------------------+
| ?   | ?   | ?2. Los comienzos               |
+-----+-----+---------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

===========================
4.7. Ports que no funcionan
===========================

.. raw:: html

   <div class="navheader">

4.7. Ports que no funcionan
`Anterior <ports-nextsteps.html>`__?
Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports
?\ `Siguiente <x11.html>`__

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

4.7. Ports que no funcionan
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si encuentra un port que no funciona hay varias cosas que puede hacer:

.. raw:: html

   <div class="orderedlist">

#. Consulte en la `Base de datos de informes de
   error <http://www.freebsd.org/support.html#gnats>`__ si ya se ha
   publicado un parche que lo solucione. Si es el caso puede aplicar
   aplicar el parche en su sistema.

#. Pida ayuda al responsable del mantenimiento (conocido como
   ?mantainer?) del port. Tecl?e ``make maintainer`` o consulte el
   ``Makefile`` del port si no sabe cu?l es la direcci?n de correo del
   ?mantainer?. Recuerde que debe incluir el nombre y la versi?n del
   port. Env?e la l?nea que contiene ``$FreeBSD:`` al principio del
   ``Makefile`` del port y salida con el error que obtiene al intentar
   usar la aplicaci?n.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Algunos ports no son responsabilidad de un individuo sino de `una
   lista de
   correo. <http://www.freebsd.org/doc/en_US.ISO-8859-1/articles/mailing-list-faq/article.html>`__
   Muchas, aunque no todas, tienen un aspecto parecido a
   ``<freebsd-nombredelalista@FreeBSD.org>``. Por favor, t?ngalo en
   cuenta cuando envie ese correo sobre el port que no funciona.

   Hay un caso especial: Los ports que tienen como ?mantainer?
   ``<freebsd-ports@FreeBSD.org>`` en realidad no son responsabilidad de
   nadie. Los parches y el soporte, en caso de existir, vienen de la
   comunidad de usuarios y desarrolladores que est?n suscritos a la
   lista. Por cierto, siempre hacen falta m?s voluntarios.

   .. raw:: html

      </div>

   Si no recibe respuesta utilice
   `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
   para enviar un informe de errores. Consulte `C?mo escribir informes
   de
   error <http://www.freebsd.org/doc/en_US.ISO8859-1/articles/problem-reports/article.html>`__)
   `:sup:`[5]` <#ftn.idp70498000>`__

#. *Arreglarlo*. El ?Porter's Handbook? incluye informaci?n detallada
   sobre la infraestructura de los ports, as? que puede arreglar un port
   roto o incluso enviar su propio port.

#. Descargue el paquete de alg?n sitio FTP. El servidor ?principal? de
   la colecci?n de paquetes est? en el `directorio de
   paquetes <ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/packages/>`__ de
   ``ftp.FreeBSD.org`` *pero aseg?rese de mirar antes en la r?plica m?s
   pr?xima*. Esta es una forma de instalar aplicaciones m?s f?cil y m?s
   r?pida. Instale el paquete mediante
   `pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp70498000" class="footnote">

`:sup:`[5]` <#idp70498000>`__ Hay traducci?n al castellano de este
art?culo. Est? aqu?:
``http://www.freebsd.org/doc/es_ES.ISO8859-1/articles/problem-reports/article``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+------------------------------------+
| `Anterior <ports-nextsteps.html>`__?   | `Subir <ports.html>`__    | ?\ `Siguiente <x11.html>`__        |
+----------------------------------------+---------------------------+------------------------------------+
| 4.6. Despu?s de instalar un port?      | `Inicio <index.html>`__   | ?Cap?tulo 5. El sistema X Window   |
+----------------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

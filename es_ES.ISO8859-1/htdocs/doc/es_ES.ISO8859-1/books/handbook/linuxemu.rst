=============================================
Cap?tulo 10. Compatibilidad binaria con Linux
=============================================

.. raw:: html

   <div class="navheader">

Cap?tulo 10. Compatibilidad binaria con Linux
`Anterior <printing-troubleshooting.html>`__?
Parte?II.?Tareas comunes
?\ `Siguiente <linuxemu-lbc-install.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Cap?tulo 10. Compatibilidad binaria con Linux
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reestructurado y actualizado por Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Brian N. Handy y Rich Murphey.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`10.1. Sinopsis <linuxemu.html#linuxemu-synopsis>`__
`10.2. Instalaci?n <linuxemu-lbc-install.html>`__
`10.3. Instalaci?n de Mathematica? <linuxemu-mathematica.html>`__
`10.4. Instalaci?n de Maple™ <linuxemu-maple.html>`__
`10.5. Instalaci?n de MATLAB? <linuxemu-matlab.html>`__
`10.6. Instalaci?n de Oracle? <linuxemu-oracle.html>`__
`10.7. Instalaci?n de SAP??R/3? <sapr3.html>`__
`10.8. Temas avanzados <linuxemu-advanced.html>`__

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

10.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD proporciona compatibilidad de binarios con muchos otros sistemas
operativos tipo UNIX?, incluyendo Linux. Puede estarse preguntando ?por
qu? necesita FreeBSD ejecutar binarios de Linux? La respuesta a esa
pregunta es muy simple. Muchos desarrolladores y compa??as desarrollan
s?lo para Linux, ya que ?ltimamente es el blanco de todas las miradas
dentro del mundo de las tecnolog?s de la informaci?n. Esto hace que la
comunidad FreeBSD tenga que exigir a esas compa??as y desarrolladores
que produzcan versiones nativas de sus aplicaciones para FreeBSD. El
problema es que la mayor?a de esas compa??as no suelen saber realmente
cu?nta gente utilizar?a su producto si existieran esas versiones para
FreeBSD, y la mayor?a contin?a desarrollando ?nicamente para Linux.
Vista la situaci?n ?que puede hacer un usuario de FreeBSD? Aqu? es donde
entra en juego la compatibilidad binaria con Linux.

Para expresarlo en pocas palabras, dicha compabitilidad permite a los
usuarios de FreeBSD cerca del 90% de las aplicaciones de Linux sin tener
que modificarlas en absoluto. Entre estas est? StarOffice™, la versi?n
Linux de Netscape?, Adobe??Acrobat?, RealPlayer, VMware, Oracle?,
WordPerfect, Doom, Quake y muchas m?s. En determinados casos los
binarios Linux rinden mejor en FreeBSD que en Linux.

Existen, por desgracia, ciertas caracter?sticas espec?ficas de Linux que
no funcionan en FreeBSD. Los binarios Linux no funcionar?n en FreeBSD si
recurren a llamadas espec?ficas de i386™ como la activaci?n del modo
virtual 8086.

Tras leer este cap?tulo sabr? usted:

.. raw:: html

   <div class="itemizedlist">

-  c?mo activar la compatibilidad binaria con Linux en su sistema.

-  c?mo instalar bibliotecas compartidas de Linux que pueda necesitar.

-  c?mo instalar aplicaciones de Linux en su sistema FreeBSD.

-  cu?les son los detalles de la implementaci?n de compatibilidad
   binaria con Linux en FreeBSD.

.. raw:: html

   </div>

Antes de leer este cap?tulo es necesario que sepa:

.. raw:: html

   <div class="itemizedlist">

-  c?mo instalar software de terceros (`Cap?tulo?4, *Instalaci?n de
   aplicaciones: ?packages? y ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+---------------------------------+------------------------------------------------+
| `Anterior <printing-troubleshooting.html>`__?   | `Subir <common-tasks.html>`__   | ?\ `Siguiente <linuxemu-lbc-install.html>`__   |
+-------------------------------------------------+---------------------------------+------------------------------------------------+
| 9.7. Soluci?n de problemas?                     | `Inicio <index.html>`__         | ?10.2. Instalaci?n                             |
+-------------------------------------------------+---------------------------------+------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

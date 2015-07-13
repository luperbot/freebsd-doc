===============================
Cap?tulo 27. Correo Electr?nico
===============================

.. raw:: html

   <div class="navheader">

Cap?tulo 27. Correo Electr?nico
`Anterior <firewalls.html>`__?
Parte?IV.?Comunicaciones en red
?\ `Siguiente <mail-using.html>`__

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

Cap?tulo 27. Correo Electr?nico
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Bill Lloyd.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reescrito por Jim Mock.

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

`27.1. Sinopsis <mail.html#mail-synopsis>`__
`27.2. Utilizaci?n del correo electr?nico <mail-using.html>`__
`27.3. Configuraci?n de sendmail <sendmail.html>`__
`27.4. Sustituci?n del Agente de Transferencia de
Correo <mail-changingmta.html>`__
`27.5. Depuraci?n de Problemas <mail-trouble.html>`__
`27.6. Conceptos Avanzados <mail-advanced.html>`__
`27.7. SMTP con UUCP <SMTP-UUCP.html>`__
`27.8. Configuraci?n para s?lamente enviar
correo <outgoing-only.html>`__
`27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico
(dial-up) <SMTP-dialup.html>`__
`27.10. Autentificaci?n utilizando SMTP <SMTP-Auth.html>`__
`27.11. Agente de Correo de Usuario <mail-agents.html>`__
`27.12. Manejo de fetchmail <mail-fetchmail.html>`__
`27.13. Uso de procmail <mail-procmail.html>`__

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

27.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El “Correo Electr?nico”, o “email”, es una de las formas de comunicaci?n
m?s usadas hoy en dia. Este cap?tulo es una introducci?n b?sica de c?mo
poner en marcha un servidor de correo en FreeBSD, aunque no es una gu?a
completa y se han omitido muchos conceptos importantes. Si se necesita
informaci?n exhaustiva sobre el tema puede recurrirse a los libros
listados en `Cap?tulo?31, *Bibliograf?a* <bibliography.html>`__.

Despu?s de leer este cap?tulo usted sabr?:

.. raw:: html

   <div class="itemizedlist">

-  Qu? software est? involucrado en el env?o y recepci?n de correo
   electr?nico.

-  D?nde se encuentran en FreeBSD los ficheros b?sicos de configuraci?n
   de sendmail.

-  C?mo bloquear a los “spammers” y evitar el uso no autorizado de su
   servidor de correo.

-  C?mo instalar y configurar agentes de transferencia de correo (MTA)
   en su sistema, para reemplazar sendmail.

-  C?mo resolver problemas comunes en servidores de correo.

-  C?mo usar SMTP con UUCP.

-  C?mo usar correo con una conexi?n dialup.

-  C?mo configurar SMTP con autentificaci?n para m?s seguridad.

.. raw:: html

   </div>

Antes de leer este cap?tulo deber?a usted:

.. raw:: html

   <div class="itemizedlist">

-  Configurar apropiadamente su conexi?n de red (`Cap?tulo?29,
   *Networking avanzado* <advanced-networking.html>`__).

-  Configurar apropiadamente la informaci?n de DNS de su servidor de
   correo (`Cap?tulo?29, *Networking
   avanzado* <advanced-networking.html>`__).

-  Saber como instalar software adicional (`Cap?tulo?4, *Instalaci?n de
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

+----------------------------------+------------------------------------------+---------------------------------------------+
| `Anterior <firewalls.html>`__?   | `Subir <network-communication.html>`__   | ?\ `Siguiente <mail-using.html>`__          |
+----------------------------------+------------------------------------------+---------------------------------------------+
| Cap?tulo 26. Cortafuegos?        | `Inicio <index.html>`__                  | ?27.2. Utilizaci?n del correo electr?nico   |
+----------------------------------+------------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

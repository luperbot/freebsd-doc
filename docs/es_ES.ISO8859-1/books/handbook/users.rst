========================================================
Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
========================================================

.. raw:: html

   <div class="navheader">

Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
`Anterior <boot-shutdown.html>`__?
Parte?III.?Administraci?n del sistema.
?\ `Siguiente <users-introduction.html>`__

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

Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
--------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Neil Blakey-Milner.

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

`13.1. Sinopsis <users.html#users-synopsis>`__
`13.2. Introducci?n <users-introduction.html>`__
`13.3. La cuenta superusuario <users-superuser.html>`__
`13.4. Cuentas de sistema <users-system.html>`__
`13.5. Cuentas de usuario <users-user.html>`__
`13.6. Modificaci?n de cuentas <users-modifying.html>`__
`13.7. Limitar a los usuarios <users-limiting.html>`__
`13.8. Personalizar a los usuarios <users-personalizing.html>`__
`13.9. Grupos <users-groups.html>`__

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

13.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD permite que varios usuarios usen el mismo ordenador. Obviamente,
s?lo uno de estos usuarios puede sentarse frente al monitor y al teclado
en un momento dado `:sup:`[6]` <#ftn.idp74613968>`__ , pero cualquier
n?mero de usuarios puede entrar por la red para hacer su trabajo. Para
usar el sistema cada usuario ha de tener una cuenta.

Despu?s de leer este cap?tulo sabr?s:

.. raw:: html

   <div class="itemizedlist">

-  Cu?les son las diferencias entre las distintas cuentas de usuario en
   sistemas FreeBSD.

-  C?mo a?adir cuentas.

-  C?mo eliminar cuentas.

-  C?mo cambiar detalles de las cuentas, como el nombre completo del
   usuario, o su shell preferida.

-  C?mo establecer l?mites por cuenta, para controlar los recursos como
   memoria o tiempo de CPU que las cuentas y grupos de cuentas pueden
   emplear.

-  C?mo usar grupos para facilitar la administraci?n de cuentas.

.. raw:: html

   </div>

Antes de leer este cap?tulo deber?as:

.. raw:: html

   <div class="itemizedlist">

-  Entender los conceptos b?sicos de Unix y FreeBSD (`Cap?tulo?3,
   *Conceptos b?sicos de Unix* <basics.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp74613968" class="footnote">

`:sup:`[6]` <#idp74613968>`__\ Bueno, a menos que conectes m?ltiples
terminales, pero dejaremos ese tema para el `Cap?tulo?24,
*Comunicaciones serie* <serialcomms.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+------------------------------------------+----------------------------------------------+
| `Anterior <boot-shutdown.html>`__?   | `Subir <system-administration.html>`__   | ?\ `Siguiente <users-introduction.html>`__   |
+--------------------------------------+------------------------------------------+----------------------------------------------+
| 12.7. Secuencia de apagado?          | `Inicio <index.html>`__                  | ?13.2. Introducci?n                          |
+--------------------------------------+------------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

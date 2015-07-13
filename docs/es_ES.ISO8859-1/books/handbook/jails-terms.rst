==========================================
15.2. T?rminos relacionados con las jaulas
==========================================

.. raw:: html

   <div class="navheader">

15.2. T?rminos relacionados con las jaulas
`Anterior <jails.html>`__?
Cap?tulo 15. Jaulas
?\ `Siguiente <jails-intro.html>`__

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

15.2. T?rminos relacionados con las jaulas
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para ayudar a comprender las partes de FreeBSD que intervienen en el
funcionamiento de las jaulas, su funcionamiento interno y el modo en que
interactuan con el resto de FreeBSD, durante el resto del cap?tulo se
utilizar?n los siguientes t?rminos:

.. raw:: html

   <div class="variablelist">

`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
(comando)
    Es una llamada al sistema de FreeBSD que restringe el directorio
    raiz de un proceso y sus hijos.

`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
(entorno)
    Es el entorno de procesos que se ejecutan en un “chroot”. Esto
    incluye recursos como la parte visible del sistema de ficheros, los
    ID de usuario y grupo disponibles, interfaces de red u otros
    mecanismos IPC.

`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
(comando)
    La herramienta de administraci?n que permite arrancar procesos
    dentro del entorno de una jaula.

servidor (sistema, proceso, usuario, etc)
    El sistema que controla una jaula. El servidor tiene acceso a todos
    los recursos de hardware y puede controlar procesos tanto dentro
    como fuera de la jaula. Una de las diferencias importantes entre el
    sistema que aloja la jaula y la jaula propiamente dicha: las
    limitaciones que afectan a los procesos que se ejecutan con
    privilegios de superusuario dentro de la jaula no dependen de los
    procesos del servidor que la aloja.

enjaulado (sistema, proceso, usuario, etc.)
    Un proceso, usuario u otra entidad, cuyo acceso a los recursos est?
    restringido por una jaula de FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+---------------------------------------+
| `Anterior <jails.html>`__?   | `Subir <jails.html>`__    | ?\ `Siguiente <jails-intro.html>`__   |
+------------------------------+---------------------------+---------------------------------------+
| Cap?tulo 15. Jaulas?         | `Inicio <index.html>`__   | ?15.3. Introducci?n                   |
+------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

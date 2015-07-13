==================
15.3. Introducci?n
==================

.. raw:: html

   <div class="navheader">

15.3. Introducci?n
`Anterior <jails-terms.html>`__?
Cap?tulo 15. Jaulas
?\ `Siguiente <jails-build.html>`__

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

15.3. Introducci?n
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dado lo dificil y desconcertante de la tarea de administrar sistemas se
han ido desarrollando poderosas herramientas con el fin de hacer la vida
del administrador m?s sencilla. Dichas herramientas suelen facilitar
cierto tipo de mejoras en la instalaci?n, configuraci?n o mantenimiento
de los sistemas. Una de las tareas que se espera que cumpla un
administrador de sistemas es la configuraci?n adecuada de la seguridad,
de modo que pueda dar el servicio para el que se ha destinado sin que
pueda verse comprometido.

Una de las herramientas disponibles para mejorar los niveles de
seguridad de un sistema FreeBSD es el uso de *jaulas*. Las jaulas fueron
introducidas en FreeBSD?4.X por Poul-Henning Kamp, pero en FreeBSD?5.X
sus capacidades fueron aumentadas hasta hacer de ellas un subsistema
poderoso y flexible. Su desarrollo sigue avanzando, aumentando as? su
utilidad, rendimiento, fiabilidad y seguridad.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.3.1. Qu? es una jaula
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los sistemas tipo BSD disponen de
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
desde la ?poca de 4.2BSD.
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
permite restringir el directorio raiz de un conjunto de procesos,
creando un entorno seguro y separado del resto del sistema. Los procesos
creados dentro de un entorno chroot no pueden acceder a ficheros o
recursos ubicados fuera del mismo. Por esta raz?n, si un atacante logra
comprometer un servicio que se ejecuta en un entorno chroot no deber?a
autom?ticamente poder acceder al resto del sistema.
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
es una buena herramienta para tareas sencillas que no requieran mucha
flexibilidad o caracter?sticas complejas o muy avanzadas. Por desgracia,
desde la invenci?n de chroot se han ido encontrando muchas formas de
saltarse las barreras que chroot impone y, aunque est?n corregidas en
las versiones m?s modernas del kernel de FreeBSD, era evidente que
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
no era la soluci?n ideal para ejecutar servicios con seguridad. Hab?a
que implementar un nuevo subsistema.

Este es uno de los principales motivos por los que se crearon las
*jaulas*.

Las jaulas llevan m?s all? en muchos sentidos el concepto tradicional de
entorno
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__.
En un entorno
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
tradicional los procesos solo ven limitada la parte del sistema de
ficheros a la que pueden acceder. El resto de recursos del sistema, es
decir, el conjunto de usuarios del sistema, los procesos en ejecuci?n o
el subsistema de red est?n compartidos entre el sistema alojado y el
servidor. Las jaulas extienden este modelo virtualizando no solamente el
acceso al sistema de ficheros, sino al conjunto de usuarios, al
subsistema de red del kernel de FreeBSD y unas cuantas cosas m?s. En la
`Secci?n?15.5, “Administraci?n y personalizaci?n a
fondo” <jails-tuning.html>`__ se detallan diversas opciones de control
exhaustivo para configurar el acceso a recursos de un entorno enjaulado.

Una jaula se caracteriza por disponer de cuatro elementos:

.. raw:: html

   <div class="itemizedlist">

-  Un “sub?rbol” de directorios: el punto desde el que se entra a una
   jaula. Una vez dentro de la jaula un proceso no puede escapar de
   dicho “sub?rbol”. Los t?picos problemas de seguridad que aparec?n una
   y otra vez en el dise?o del
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
   original no afectan a las jaulas de FreeBSD.

-  Un nombre de m?quina (“hostname”), que definir? a la jaula. Las
   jaulas se usan principalmente para albergar servicios de red, por lo
   que disponer de un nombre de m?quina descriptivo ayuda enormemente al
   administrador de sistemas.

-  Una direcci?n IP: debe asignarse a la jaula y no cambiarse durante el
   ciclo de vida de la jaula. La direcci?n IP de una jaula suele ser un
   alias de un interfaz de red, aunque no es imprescindible que as? sea.

-  Un comando: La ruta de un ejecutable ubicado dentro de la jaula. La
   ruta es relativa al directorio raiz de la jaula, por lo que puede ser
   muy diferentes seg?n el entorno.

.. raw:: html

   </div>

Adem?s, las jaulas pueden tener sus propios usuarios e incluso su propio
``root``. Es obvio que este usuario ``root`` tiene su poder para hacer
circunscrito a la jaula y, desde el punto de vista del servidor, el
usuario ``root`` de la jaula no es omnipotente. El usuario ``root`` de
la jaula no puede ejecutar tareas cr?ticas fuera de la jaula
(`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__)
a la que pertenece. M?s adelante, en la `Secci?n?15.5, “Administraci?n y
personalizaci?n a fondo” <jails-tuning.html>`__, se dar? m?s informaci?n
sobre las restricciones del usuario ``root``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+---------------------------+---------------------------------------+
| `Anterior <jails-terms.html>`__?              | `Subir <jails.html>`__    | ?\ `Siguiente <jails-build.html>`__   |
+-----------------------------------------------+---------------------------+---------------------------------------+
| 15.2. T?rminos relacionados con las jaulas?   | `Inicio <index.html>`__   | ?15.4. Creaci?n y gesti?n de jaulas   |
+-----------------------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

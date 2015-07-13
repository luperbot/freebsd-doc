=============================
7. Directrices para el futuro
=============================

.. raw:: html

   <div class="navheader">

7. Directrices para el futuro
`Anterior <lessons-learned.html>`__?
?
?\ `Siguiente <ackno.html>`__

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

7. Directrices para el futuro
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es de vital importancia para nuestras actividades de ingenier?a de
releases el ser capaces de crecer al mismo ritmo que nuestra base de
usuarios. Junto con estas l?neas estamos trabajando duramente en los
procedimientos involucrados en la producci?n de releases de FreeBSD.

.. raw:: html

   <div class="itemizedlist">

-  *Paralelismo* - Algunas partes de la construcci?n de la release son
   “vergonzosamente paralelas”. La mayor?a de las tareas que se realizan
   son intensivas en entrada-salida, de tal forma que resulta m?s
   importante poseer varios discos duros de alta velocidad que utilizar
   varios procesadores a la hora de acelerar el proceso del comando
   ``make release``. Si se utilizan varios discos para las distintas
   jerarqu?as de directorios dentro del entorno
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__,
   entonces el “checkout” de los ?rboles de ``ports`` y de los ``doc``
   se puede producir al mismo tiempo que la ejecuci?n en otro disco del
   comando ``make world``. Mediante la utilizaci?n de un sistema RAID
   (hardware o software) se puede reducir significativamente el tiempo
   total de construcci?n de la release.

-  *Releases construidas para otros sistemas finales (“cross building”)*
   : ?Se puede construir una release para IA-64 o Alpha en un hardware
   x86? ``make     TARGET=ia64 release``.

-  *Tests de Regresi?n* - Se necesitan mejores herramientas
   automatizadas para comprobar la correcci?n del sistema FreeBSD.

-  *Herramientas de Instalaci?n* - Nuestro programa de instalaci?n ha
   sobrepasado su tiempo de vida previsto. Se encuentran en desarrollo
   varios proyectos para proporcionar un mecanismo de instalaci?n m?s
   avanzado. Uno de los m?s prometedores es el proyecto libh[5] cuyo
   objetivo consiste en proporcionar un entorno de paquetes nuevo e
   inteligente junto con un programa de instalaci?n gr?fico.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+---------------------------+---------------------------------+
| `Anterior <lessons-learned.html>`__?               | ?                         | ?\ `Siguiente <ackno.html>`__   |
+----------------------------------------------------+---------------------------+---------------------------------+
| 6. Lecciones aprendidas a partir de FreeBSD 4.4?   | `Inicio <index.html>`__   | ?8. Agradecimientos             |
+----------------------------------------------------+---------------------------+---------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

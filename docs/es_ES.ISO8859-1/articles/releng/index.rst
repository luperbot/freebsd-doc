============================================
Proceso de generaci?n de releases en FreeBSD
============================================

.. raw:: html

   <div class="navheader">

Proceso de generaci?n de releases en FreeBSD
?
?
?\ `Siguiente <release-proc.html>`__

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

Murray Stokely
~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| ``<murray@FreeBSD.org>``?http://www.FreeBSD.org/~murray/
|  ?

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

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resumen

.. raw:: html

   </div>

Este art?culo describe la aproximaci?n utilizada por el equipo de
ingenier?a de productos de FreeBSD para generar releases de calidad y
listas para utilizar en entornos de producci?n. Se detalla la
metodolog?a utilizada para generar la release oficial de FreeBSD y se
describen las herramientas disponibles para aquellas personas
interesadas en generar sus propias releases a medida de sus necesidades,
en particular para demostraciones de empresa o para comercializar el
producto.

*Traducci?n de Juan F. Rodriguez ``<jrh@it.uc3m.es>``.*

.. raw:: html

   </div>

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

`1. Introducci?n <index.html#introduction>`__
`2. Proceso de ingenier?a de releases <release-proc.html>`__
`3. Construcci?n de la Release <release-build.html>`__
`4. Distribuci?n <distribution.html>`__
`5. Extensibilidad <extensibility.html>`__
`6. Lecciones aprendidas a partir de FreeBSD
4.4 <lessons-learned.html>`__
`7. Directrices para el futuro <future.html>`__
`8. Agradecimientos <ackno.html>`__
`9. Lecturas recomendadas <biblio.html>`__

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

El desarrollo de FreeBSD es un proceso realmente abierto al p?blico.
FreeBSD se alimenta de contribuciones de miles de personas del mundo
entero. El Proyecto FreeBSD proporciona acceso p?blico a trav?s de
CVS[1] de tal forma que cualquiera puede acceder a los mensajes de log y
a los archivos de diferencias (tambi?n conocidos como “diffs” o parches)
aplicados a distintas ramas de desarrollo, junto con el resto de
funcionalidad que el gestor de c?digo fuente pone a nuestra disposici?n.
Este hecho, aunque muchas veces pasa inadvertido, ha constituido uno de
los m?s importantes recursos de la comunidad y ha servido para captar y
motivar a muchos desarrolladores con talento. No obstante, y creo que
todo el mundo est? de acuerdo con lo que voy a decir, ser?a un completo
caos proporcionar acceso de escritura a todo el que pueda conectarse a
Internet. Es por esto que existe s?lo un “selecto” grupo de en torno a
300 personas que poseen dicho acceso de escritura en el repositorio de
CVS. Estos *committers[6]* se responsabilizan del desarrollo del coraz?n
de FreeBSD. Un *core-team[7]* compuesto por desarrolladores muy
experimentados proporciona ciertas directrices a la direcci?n que va a
tomar el proyecto.

El r?pido ritmo de desarrollo de ``FreeBSD`` deja poco tiempo para pulir
el sistema y proporcionar una release de calidad equivalente a las
releases de sistemas comerciales. Para resolver este problema, se
contin?a el desarrollo en dos caminos paralelos. La rama de desarrollo
principal se denomina *HEAD* o *trunk* (tronco) y constituye el punto de
desarrollo m?s avanzado del ?rbol CVS. Esta rama consituye lo que
llamamos “FreeBSD-CURRENT” o simplemente “-CURRENT” para abreviar.

Tambi?n se mantiene una rama m?s estable, conocida como “FreeBSD-STABLE”
o “-STABLE”. Ambas ramas conviven en el repositorio maestro de CVS
localizado en California y dicho repositorio se replica v?a CVSup[2]
creandose una serie de r?plicas (tambi?n llamadas espejos o mirrors) por
todo el mundo. FreeBSD-CURRENT[8] consituye el l?mite tecnol?gico (o
“bleeding-edge” en ingl?s) del desarrollo del sistema FreeBSD y es donde
se aplican en primer lugar cualquier cambio realizado al sistema.
FreeBSD-STABLE constituye la rama de desarrollo de la cual se generan
las releases principales. Los cambios en el sistema se producen a un
ritmo variable asumiendose que dichos cambios generalmente se aplican
primero a la rama -CURRENT, quedando a disposici?n de la comunidad de
usuarios para que comprueben el correcto funcionamiento global del
sistema de una forma exhaustiva antes de aplicarlos a -STABLE, en caso
de que fuera necesaria su aplicaci?n.

En el periodo entre releases, se construyen copias del sistema tomadas a
determinadas horas de la noche y se ponen a disposici?n del p?blico en
``ftp://stable.FreeBSD.org/``. La amplia disponibilidad de releases de
copias binarias actualizadas del sistema (“snapshosts”) y la tendencia
de nuestra comunidad de usuarios a mantenerse a la ?ltima del desarrollo
en la rama -STABLE mediante la utilizaci?n de CVSup y “``make``
``world``”[8] ayuda a mantener la rama FreeBSD-STABLE en unas
condiciones de fiabilidad excelentes que incluso llegan a ralentizar las
peticiones de nuevas releases basadas en actividades de depuraci?n de la
calidad del software.

Los informes de problemas y las solicitudes de nuevas caracter?sticas no
paran de producirse durante el ciclo de vida de una release. Los
informes de problemas se almacenan en la base de datos GNATS[9]
utilizando el correo eletr?nico, la aplicaci?n
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
o v?a la interfaz web proporcionada en
``http://www.FreeBSD.org/send-pr.html``. Adem?s de la multitud de listas
de correo de car?cter t?cnico que FreeBSD pone a nuestra disposici?n, el
`lista de correo sobre 'Quality Assurance' en
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-qa>`__
proporciona un foro de discusi?n sobre aspectos “a pulir” del sistema
antes de su salida.

Para dar servicio a nuestro usuarios m?s conservadores, con la aparici?n
de FreeBSDD 4.3 se introdujeron ramas individuales dentro del ?rbol CVS.
Estas ramas de releases se crean poco tiempo despu?s de la generaci?n de
una release final. Una vez generada la ?ltima release (la m?s actual o
m?s reciente), s?lo se aplican a esta release las modificaciones m?s
cr?ticas o necesarias, normalmente aquellas que provienen de fallos de
seguridad. Adem?s de las actualizaciones del c?digo fuente a trav?s de
CVS, existen paquetes de parches binarios para mantener las releases
*RELENG\_\ *``X``*\ \_\ *``Y``** actualizadas.

La `Secci?n?2, “Proceso de ingenier?a de
releases” <release-proc.html>`__ describe las distintas fases del
proceso de ingenier?a de releases que se utiliza para construir el
sistema real mientras que `Secci?n?3, “Construcci?n de la
Release” <release-build.html>`__ describe el proceso de contrucci?n en
s? mismo. `Secci?n?5, “Extensibilidad” <extensibility.html>`__ describe
c?mo la release base puede ser ampliada por terceras partes y
`Secci?n?6, “Lecciones aprendidas a partir de FreeBSD
4.4” <lessons-learned.html>`__ detalla algunas de las lecciones
aprendidas durante la generaci?n de la release FreeBSD 4.4. Por ?ltimo,
`Secci?n?7, “Directrices para el futuro” <future.html>`__ presenta
caminos futuros de desarrollo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------------+
| ?   | ?   | ?\ `Siguiente <release-proc.html>`__    |
+-----+-----+-----------------------------------------+
| ?   | ?   | ?2. Proceso de ingenier?a de releases   |
+-----+-----+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

============================================
Proceso de generaci?n de releases en FreeBSD
============================================

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

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

CVSup is a registered trademark of John D. Polstra.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

XFree86 is a trademark of The XFree86 Project, Inc.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

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

`1. Introducci?n <#introduction>`__
`2. Proceso de ingenier?a de releases <#release-proc>`__
`3. Construcci?n de la Release <#release-build>`__
`4. Distribuci?n <#distribution>`__
`5. Extensibilidad <#extensibility>`__
`6. Lecciones aprendidas a partir de FreeBSD 4.4 <#lessons-learned>`__
`7. Directrices para el futuro <#future>`__
`8. Agradecimientos <#ackno>`__
`9. Lecturas recomendadas <#biblio>`__

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

La `Secci?n?2, “Proceso de ingenier?a de releases” <#release-proc>`__
describe las distintas fases del proceso de ingenier?a de releases que
se utiliza para construir el sistema real mientras que `Secci?n?3,
“Construcci?n de la Release” <#release-build>`__ describe el proceso de
contrucci?n en s? mismo. `Secci?n?5,
“Extensibilidad” <#extensibility>`__ describe c?mo la release base puede
ser ampliada por terceras partes y `Secci?n?6, “Lecciones aprendidas a
partir de FreeBSD 4.4” <#lessons-learned>`__ detalla algunas de las
lecciones aprendidas durante la generaci?n de la release FreeBSD 4.4.
Por ?ltimo, `Secci?n?7, “Directrices para el futuro” <#future>`__
presenta caminos futuros de desarrollo.

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

2. Proceso de ingenier?a de releases
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las nuevas release de FreeBSD se generan a partir de la rama -STABLE en
intervalos de aproximadamente cuatro meses. El proceso comienza a
ejecutarse 45 d?as antes de la fecha de salida, cuando el ingeniero de
releases env?a un correo eletr?nico a las listas de desarrollo de
FreeBSD para recordar a los desarrolladores que disponen de tan solo 15
d?as para integrar nuevos cambios antes de la fase de congelaci?n de
c?digo fuente. Durante este periodo de tiempo, muchos desarrolladores
realizan lo que se ha dado en llamar “barrido MFC”. MFC significa en
ingl?s “Merge From CURRENT” (Integraci?n desde CURRENT) y describe el
proceso de unificaci?n de los cambios aplicados en la rama de desarrollo
-CURRENT a nuestra rama -STABLE.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1. Revisi?n de C?digo
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Treinta d?as antes del lanzamiento de una release dada el repositorio de
c?digo fuente entra en una fase de “code slush” (“c?digo aguanieve”, en
el sentido de no estar a?n congelado y ser por tanto ligeramente
moldeable). Durante este per?odo todos los commits de la rama -STABLE
deben ser aprobados por el Grupo de ingenier?a de releases
``<re@FreeBSD.org>``. Los cambios permitidos en esta fase de 15 d?as de
duraci?n son los siguientes:

.. raw:: html

   <div class="itemizedlist">

-  Arreglo de bugs o errores.

-  Actualizaciones de la documentaci?n.

-  Parches relacionados con cualquier tipo de fallo en la seguridad.

-  Cambios peque?os en controladores de dispositivos, tales como la
   adici?n de identificadores de dispositivo.

-  Cualquier cambio adicional que el equipo de ingenier?a de releases
   considere justificado, teniendo siempre en cuenta el riesgo potencial
   que puede conllevar.

.. raw:: html

   </div>

Despu?s de los primeros 15 d?as de c?digo “slush”, se genera una
*release candidate* (candidata a release) o “RC” para su testeo
exhaustivo por parte de la comunidad de usuarios y el c?digo fuente
entra en la fase de “code freeze” o congelamiento. En este punto resulta
mucho m?s dif?cil aceptar cambios a menos que se descubran serios fallos
de seguridad o bugs importantes. Durante esta fase, se genera al menos
una RC cada semana, hasta que la release final ve la luz. Durante el
periodo de tiempo comprendido desde el congelamiento del c?digo hasta la
generaci?n de la release final, el equipo de ingenier?a de releases se
comunica constantemente con el equipo del “security officer”, los
equipos encargados de mantener la documentaci?n y los mantenedores de
ports, para asegurarse de que los distintos componentes necesarios para
obtener una release existosa se encuentran disponibles y listos para ser
construidos.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2. Lista de tareas para la release final.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando todos los problemas encontrados en las releases candidatas se han
corregido, se puede comenzar con el procedimiento de “pulimiento o
enbellecimiento” de la release final.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1. Creaci?n de una Rama Release
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Como se describe en la introducci?n, la rama ``RELENG_X_Y`` es una
caracter?stica relativamente nueva de nuestra metodolog?a de generaci?n
de releases. El primer paso para crear esta rama consiste en asegurar
que el c?digo fuente utilizado “proviene” de la versi?n m?s reciente de
``RELENG_X``.

.. code:: screen

    /usr/src# cvs update -rRELENG_4 -P -d

El siguiente paso consiste en crear una etiqueta de rama, (*tag*), de
esta forma se pueden generar diferencias entre el c?digo actual y la
rama de inicio f?cilmente, utilizando CVS:

.. code:: screen

    /usr/src# cvs rtag -rRELENG_4 RELENG_4_8_BP src

Y a continuaci?n se crea la etiqueta de la rama:

.. code:: screen

    /usr/src# cvs rtag -b -rRELENG_4_8_BP RELENG_4_8 src

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

*Las etiquetas ``RELENG_*`` s?lo pueden ser utilizadas por los
CVS-meisters y los ingenieros de releases.*

.. raw:: html

   </div>

.. raw:: html

   <div class="sidebar">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   </div>

Una “*etiqueta o tag*” es una caracter?stica de CVS que sirve para
identificar el c?digo fuente en un determinado instante del tiempo.
Mediante el etiquetado del ?rbol, nos aseguramos de que las futuras
releases puedan generar diferencias con respecto al mismo c?digo fuente
que se utiliz? para generar las releases oficiales anteriores.

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject" align="center">

|Rama FreeBSD Development (Rama de Desarrollo)|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject" align="center">

|Rama FreeBSD 3.x STABLE|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject" align="center">

|Rama FreeBSD 4.x STABLE|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.2. Elevaci?n del n?mero de versi?n
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de que la release final se puede etiquetar, construir y antes de
que vea la luz, se deben modificar los siguientes ficheros de tal forma
que reflejen el n?mero de versi?n correcto:

.. raw:: html

   <div class="itemizedlist">

-  ``doc/en_US.ISO8859-1/books/handbook/mirrors/chapter.xml           ``

-  ``doc/en_US.ISO8859-1/books/porters-handbook/book.xml           ``

-  ``doc/share/xml/freebsd.ent``

-  ``src/Makefile.inc1``

-  ``src/UPDATING``

-  ``src/gnu/usr.bin/groff/tmac/mdoc.local``

-  ``src/release/Makefile``

-  ``src/release/doc/en_US.ISO8859-1/share/xml/release.dsl``

-  ``src/release/doc/share/examples/Makefile.relnotesng``

-  ``src/release/doc/share/xml/release.ent``

-  ``src/share/examples/cvsup/standard-supfile``

-  ``src/sys/conf/newvers.sh``

-  ``src/sys/sys/param.h``

-  ``src/usr.sbin/pkg_install/add/main.c``

-  ``www/en/docs.xml``

-  ``www/en/cgi/ports.cgi``

-  ``ports/Tools/scripts/release/config``

.. raw:: html

   </div>

El fichero “release notes” y el fichero “errata” tambi?n deben ajustarse
de acuerdo con la nueva release (en la rama de la release) y deben
cortarse adecuadamente en las ramas stable/currrent):

.. raw:: html

   <div class="itemizedlist">

-  ``src/release/doc/en_US.ISO8859-1/relnotes/common/new.xml           ``

-  ``src/release/doc/en_US.ISO8859-1/errata/article.xml           ``

.. raw:: html

   </div>

Sysinstall debe actualizarse para que proporcione el n?mero actual de
ports disponibles y la cantidad de espacio de disco requerida para
instalar dicha colecci?n de ports. Esta informaci?n se encuentra
almacenada actualmente en el fichero ``src/release/sysinstall/dist.c``.

Despu?s de construir la release se debe actualizar el n?mero almacenado
en los siguientes ficheros para anunciar la release al resto del mundo:

.. raw:: html

   <div class="itemizedlist">

-  ``www/share/xml/includes.release.xml``

-  ``www/share/xml/includes.release.xsl``

-  ``www/en/releases/*``

-  ``www/en/releng/index.xml``

-  ``www/en/news/news.xml``

-  ``www/en/search/web.atoz``

-  ``src/share/misc/bsd-family-tree``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.3. Creaci?n de las etiquetas de release
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando la release final se encuentra preparada se utiliza el siguiente
comando para crear la etiqueta (a modo de ejemplo)
``RELENG_4_8_0_RELEASE``.

.. code:: screen

    /usr/src# cvs rtag -rRELENG_4_8 RELENG_4_8_0_RELEASE src

Los gestores de los proyectos de Documentaci?n y de los Ports se
responsabilizan del correcto etiquetado de sus respectivos ?rboles
utilizando ``RELEASE_4_8_0``.

Ocasionalmente se puede presentar un apa?o o arreglo de ?ltima hora
justo *despu?s* de la creaci?n de las etiquetas finales. En la pr?ctica
esto no constituye un problema ya que CVS permite cierta manipulaci?n de
etiquetados mediante
``cvs tag -d     nombredeetiqueta nombredefichero ``. Es muy importante
que dichos cambios de ?ltima hora se etiqueten adecuadamente para que
pasen a formar parte de la nueva release. Las releases de FreeBSD deben
ser siempre “reproducibles”. Los “hacks” locales dentro del entorno de
ingenier?a de releases no est?n permitidos salvo que se efect?en
mediante una correcta manipulaci?n y notificaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

3. Construcci?n de la Release
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cualquier persona due?a de una potente m?quina y con acceso de lectura
al repositorio de c?digo fuente puede “construir” las “releases” de
FreeBSD. En la pr?ctica esto significa que cualquiera puede generar el
proceso de construcci?n de releases, ya que, como se coment? con
anterioridad, FreeBSD ofrece acceso CVS an?nimo a todo el mundo
(consulte el Handbook para m?s detalles). El ?nico requisito
imprescindible para realizar este proceso es la existencia del
dispositivo
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4>`__. (En
-CURRENT, este dispositivo ha sido reemplazado por el nuevo driver de
discos en memoria denominado
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__.) Si
el dispositivo no se encuentra cargado en el kernel, deber?a cargarse
autom?ticamente al ejecutar el comando
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__
como parte de la fase de creaci?n del medio de arranque. Todas las
herramientas necesarias para construir la release se encuentran
disponibles en el repositorio de CVS dentro del directorio
``src/release``. Estas herramientas proporcionan una forma consistente y
robusta de construir releases de FreeBSD. Una release completa se puede
construir utilizando un ?nico comando, incluyendo la creaci?n de las
im?genes ISO necesarias para realizar copias en CDROM, junto con
disquetes de instalaci?n y un directorio para la instalaci?n por FTP.
Este comando fue adecuadamente bautizado como ``make release``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1. ``make release``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para poder construir la releases de una forma exitosa se debe rellenar
primero el directorio ``/usr/obj`` ejecutando el comando ``make world``
o simplemente ``make       buildworld``. El target release que utiliza
el comando make necesita varias variables, tal como se muestra a
continuaci?n:

.. raw:: html

   <div class="itemizedlist">

-  ``CHROOTDIR`` - El directorio que se utiliza para el entorno de
   chroot durante la construcci?n de la release entera.

-  ``BUILDNAME`` - El nombre de la release que se va a construir.

-  ``CVSROOT`` - La ubicaci?n del repositorio de CVS.

-  ``RELEASETAG`` - La etiqueta CVS correspondiente con la release que
   se quiere construir.

.. raw:: html

   </div>

Si no se dispone de acceso a un repositorio de CVS local, se puede
realizar una copia espejo (un mirror) con
`CVSup <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/synching.html#CVSUP>`__.
El fichero ``/usr/share/examples/cvsup/cvs-supfile``, sirve como buen
punto de partida para realizar un mirror del repositorio de CVS.

Si se omite ``RELEASETAG``, la release se construir? a partir de la rama
``HEAD`` (tambi?n conocida como -CURRENT). Las releases que se
construyen desde el principio se conocen normalmente con el nombre de
“-CURRENT snapshots”.

Existen otras variables que se pueden editar para adaptar el proceso de
construcci?n de la release. La mayor?a de estas variables se encuentran
documentadas al comienzo de ``src/release/Makefile``. El comando exacto
para contruir la release oficial de FreeBSD 4.7 (x86) fue:

.. code:: screen

    make release CHROOTDIR=/local3/release \
           BUILDNAME=4.7-RELEASE \
           CVSROOT=/host/cvs/usr/home/ncvs \
           RELEASETAG=RELENG_4_7_0_RELEASE
           
         

El ``Makefile`` de la release se puede dividir en varios pasos
distintos.

.. raw:: html

   <div class="itemizedlist">

-  Creaci?n de un entorno de sistema limpio en una jerarqu?a de
   directorios separada utilizando “``make installworld``”.

-  Comprobaci?n de la correcta versi?n de los ficheros fuentes
   almacenados en la jerarqu?a de directorios reci?n creada, junto con
   el chequeo de la documentaci?n y de los ports utilizando, todo ello a
   trav?s de CVS.

-  Relleno de los directorios ``/etc`` y ``/dev`` dentro del entorno
   chroot.

-  Creaci?n de un “chroot” dentro de la jerarqu?a de directorios creada,
   para que resulte m?s dificil que el entorno de la m?quina se vea
   contaminado por la construcci?n de la release.

-  ``make world`` dentro del entorno de chroot.

-  Contrucci?n de los binarios relacionados con Kerberos.

-  Construcci?n del kernel ``GENERIC``.

-  Creaci?n de un esqueleto del ?rbol de directorios donde se
   construir?n y empaquetar?n las distribuciones binarias.

-  Construcci?n e instalaci?n del conjunto de herramientas de
   documentaci?n necesarias para convertir los fuentes de la
   documentaci?n (SGML) en los documentos HTML y de texto que pasar?n a
   formar parte de la release.

-  Construcci?n e instalaci?n de la documentaci?n real (manuales de
   usuario, tutoriales, release notes, listas de compatibilidad de
   hardware, etc.)

-  Construcci?n de los “decisivos” binarios utilizados en los disquetes
   de instalaci?n.

-  Colocaci?n adecuada de los de los paquetes de distribuci?n de
   binarios y de fuentes.

-  Creaci?n del medio de arranque y del disquete “fixit” o salvamento.

-  Creaci?n de la jerarqu?a de directorios de instalaci?n por FTP.

-  ** Creaci?n de im?genes ISO para CDROM/DVD(opcional).

.. raw:: html

   </div>

Para m?s informaci?n sobre la infraestructura involucrada en el proceso
de construcci?n de la release, el lector puede consultar
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2. Construcci?n deXFree86™
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XFree86™ es un componente importante para muchos usuarios de entornos
gr?ficos. Antes de la release FreeBSD 4.6 las se usaba
XFree86™3.\ *``X``* por defecto. La forma m?s sencilla de construir
estas versiones consiste en utilizar el script
``src/release/scripts/X11/build_x.sh``. Este script requiere que
XFree86™ y Tcl/Tk se encuentren instalados previamente en la m?quina
donde se realiza la construcci?n. Despu?s de compilar los servidores X
necesarios, el script empaqueta todos los ficheros en “tarballs” que
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
sabe c?mo localizar utilizando el directorio ``XF86336`` del medio de
instalaci?n.

A partir de FreeBSD 4.6,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
instala XFree86™ 4.\ *``X``* por defecto, como cualquier otro conjunto
de paquetes. Estos paquetes se pueden construir a partir del
“package-building cluster” o a partir de las etiquetas del ?rbol de
ports adecuadas.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Es importante borrar cualquier configuraci?n particular almacenada en
``/etc/make.conf``. Por ejemplo, no ser?a una idea muy inteligente
distribuir binarios que se construyeron en un sistema con la variable
``CPUTYPE`` asignada a un determinado procesador.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3. Software Contribuido (“ports”)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La colecci?n de `FreeBSD Ports <http://www.FreeBSD.org/ports>`__ est?
compuesta por m?s de 24,000 paquetes de software de terceras partes que
se encuentran disponibles para FreeBSD. El Grupo de administraci?n de
ports ``<portmgr@FreeBSD.org>`` se responsabiliza de mantener un ?rbol
de ports consistente que se pueda utilizar para crear paquetes binarios,
los cuales se a?aden a las releases oficiales de FreeBSD.

Las actividades de ingenier?a de releases para nuestra colecci?n de
paquetes software de terceras partes se encuentra m?s all? del objetivo
de este documento. Otro art?culo,
``http://www.freebsd.org/doc/en_US.ISO8859-1/articles/releng-packages/``,
cubre este tema en profundidad.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.4. ISOs de la release
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A partir de FreeBSD 4.4, el Proyecto FreeBSD decidi? lanzar
gratuitamente al p?blico las cuatro im?genes ISO que anteriormente se
vend?an en *BSDi/Wind River Systems/FreeBSD Mall* como distribuciones en
CDROM “oficiales”. Cada uno de los cuatro discos debe contener un
``README.TXT`` que explica el contenido de cada disco, un ``CDROM.INF``
que proporciona metadatos para que
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
pueda validar la informaci?n en ?l contenida y un ``filename.txt`` que
proporciona un “manifiesto”. Este *manifiesto* se puede crear utilizando
un simple comando:

.. code:: screen

    /stage/cdrom# find . -type f | sed -e 's/^\.\///' | sort > filename.txt

Los requisitos concretos de cada CD se resumen a continuaci?n.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.4.1. Disco 1
^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El primer disco se crea casi en su totalidad a partir del comando
``make release``. Los ?nicos cambios que se deben realizar dentro del
directorio ``disc1`` son la adici?n de un directorio ``tools``, de
XFree86™ y de los paquetes de terceras partes m?s populares que quepan
dentro del espacio remanente de dicho primer disco. El directorio
``tools`` contiene el software que permite a los usuarios crear
disquetes de instalaci?n desde otros sistemas operativos. Este disco
debe crearse como autoarrancable para que los usuarios de PCs modernos
no necesiten crear disquetes de arranque y puedan utilizar la
caracter?stica de autoarranque desde CD.

Si se proporciona una versi?n alternativa de XFree86™,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
debe actualizarse para reflejar la nueva localizaci?n y las
instrucciones de instalaci?n. El c?digo relevante se encuentra en
``src/release/sysinstall`` en -STABLE o en ``src/usr.sbin/sysinstall``
en -CURRENT. Espec?ficamente, se deben actualizar ``dist.c``,
``menus.c`` y ``config.c``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.4.2. Disco 2
^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El segundo disco se crea en su mayor parte a partir del comando
``make release``. Este disco contiene un “sistema de ficheros vivo”, que
se puede utilizar a partir de
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
para resolver problemas durante el proceso de instalaci?n de FreeBSD.
Este disco se debe construir como autoarrancable y debe contener una
copia comprimida del repositorio de CVS dentro del directorio
``CVSROOT``, junto con demostraciones de software comercial localizadas
dentro del directorio ``commerce``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.4.3. Discos 3 and 4
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los dos discos que quedan contienen paquetes de software para FreeBSD.
Estos paquetes deben agruparse de tal forma que un paquete y todas sus
*dependencias* quepan en el mismo disco. Se puede obtener m?s
informaci?n sobre la creaci?n de estos discos en el art?culo
``http://www.freebsd.org/doc/en_US.ISO8859-1/articles/releng-packages/``
.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

4. Distribuci?n
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1. Servidores de FTP
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando se ha probado exhaustivamente la release y se ha empaquetado
debidamente para proceder a su distribuci?n, se debe actualizar el sitio
maestro de FTP. Los sitios FTP oficiales de FreeBSD son mirrors del
sitio FTP maestro, tambi?n llamado ``ftp-master``. Cuando la release
est? lista, se deben modificar los siguientes ficheros en el servidor
``ftp-master``:

.. raw:: html

   <div class="variablelist">

``/pub/FreeBSD/releases/arch/X.Y-RELEASE/``
    El directorio de instalaci?n dde FTP que se crea con la salida del
    comando ``make release``.

``/pub/FreeBSD/ports/arch/packages-X.Y-release/``
    La construcci?n del paquete completo de la release.

``/pub/FreeBSD/releases/arch/X.Y-RELEASE/tools``
    Un enlace simb?lico a ``../../../tools``.

``/pub/FreeBSD/releases/arch/X.Y-RELEASE/packages``
    Un enlace simb?lico a ``../../../ports/arch/packages-X.Y-release``.

``/pub/FreeBSD/releases/arch/ISO-IMAGES/X.Y/X.Y-RELEASE-arch-*.iso``
    Las im?genes ISO. El “\*” se sustituye por ``disc1``, ``disc2``,
    etc. Solo si existe ``disc1`` junto con un CD de primera instalaci?n
    alternativo (por ejemplo una instalaci?n recortada o reducida sin
    sistema de ventanas) puede existir tambi?n un ``mini``.

.. raw:: html

   </div>

Para obtener m?s informaci?n sobre la arquitectura de mirrors para la
distribuci?n del sistema FreeBSD, se ruega al lector que consulte el
art?culo `Mirroring
FreeBSD <http://www.freebsd.org/doc/en_US.ISO8859-1/articles/hubs/>`__.

Puede que transcurran desde varias horas hasta varios d?as hasta que la
mayor?a de los sitios FTP Tier-1 se actualicen con respecto al
``ftp-master``, esto depende de si un determinado paquete se carg? o no
se carg? en determinado instante. Es imperativo que los ingenieros de
releases se coordinen con `lista de correo de avisos para
administradores de r?plicas de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/mirror-announce>`__
antes de anunciar la disponibilidad general del nuevo software en los
sitios FTP. Para que todo fuera bien el paquete de la release se deber?a
cargar al menos cuatro d?as antes del d?a oficial de lanzamiento de la
release. Los permisos para el grupo “other” deben desactivarse
completamente para que los sitios espejos puedan descargar la release
pero no as? los usuarios finales, hasta que llegue el d?a oficial del
lanzamiento. Se debe enviar un correo a `lista de correo de avisos para
administradores de r?plicas de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/mirror-announce>`__
cuando se publican la release con los permisos modificados, diciendo que
la release ha sido puesta en escena y proporcionando la fecha a partir
de la cual los mirrors deben comenzar a dar permisos de acceso para el
p?blico en general. Se debe comprobar que se incluye informaci?n
relativa a zonas horarias, por ejemplo informaci?n relativa a GMT.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2. Replicaci?n de CD-ROMs
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dentro de poco tiempo: Consejos para enviar ISOs de FreeBSD a un
replicador e informaci?n sobre las medidas de aseguramiento de la
calidad que se deben tomar.

.. raw:: html

   </div>

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

5. Extensibilidad
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aunque FreeBSD consitituye un sistema operativo “completo”, no existe
nada que nos obligue a utilizarlo exactamente igual que como se ha
empaquetado para crear la distribuci?n. Es decir, el sistema FreeBSD se
ha dise?ado para ser tan extensible como sea posible de tal forma que se
puede utilizar como la base sobre la que se pueden construir productos
comerciales. La ?nica “regla” sobre este tema es que si se piensa
distribuir FreeBSD con una serie de cambios profundos en ?l , se anima a
que se *documenten adecuadamente dichos mejoras*. La comunidad FreeBSD
s?lo puede ayudar a los usuarios que utilizan el software que dicha
comunidad distribuye. Se anima encarecidamente hacia la innovaci?n tanto
en el proceso de instalaci?n como en las herramientas de administraci?n,
pero no se puede esperar un respuesta a todas las preguntas que surgan
sobre dichos temas.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. Creaci?n de disquetes de arranque a medida
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Muchas organizaciones poseen complejos requisitos que pueden consistir
en m?dulos del kernel adicionales o herramientas de entorno de usuario
que deben a?adirse en los discos de instalaci?n. La forma “r?pida y
sucia” de a?adir estas cosas consiste en modificar el directorio
temporal que contiene la estructura de un ``make       release``:

.. raw:: html

   <div class="itemizedlist">

-  Aplicar parches o a?adir archivos adicionales dentro del directorio
   chroot de construcci?n de la release.

-  ``rm         ${CHROOTDIR}/usr/obj/usr/src/release/release.[59]``

-  Reconstruir
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__,
   el kernel o cualquier otra parte del sistema que se vea afectada por
   los cambios.

-  ``chroot ${CHROOTDIR} ./mk floppies         ``

.. raw:: html

   </div>

Los nuevos disquetes de instalaci?n estar?n en
``${CHROOTDIR}/R/stage/floppies``.

Tambi?n se puede llamar el objetivo de make ``boot.flp`` o directamente
al “script” de creaci?n del sistema de ficheros
``src/release/scripts/doFS.sh``.

Los parches locales tambi?n se pueden proporcionar al proceso de
construcci?n de la release mediante la definici?n de la variable
``LOCAL_PATCH`` dentro de ``make release``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2. “Scripts” para ``sysinstall``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La instalaci?n y configuraci?n del sistema FreeBSD a trav?s de
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
se puede modificar mediante “scripts” para que proporcione instalaciones
autom?ticas a grandes organizaciones. Esta funcionalidad se puede
utilizar conjuntamente con Intel? PXE[13] para arrancar sistemas a
trav?s de la red, o a trav?s de disquetes de arranque a medida
utilizando un “script” de sysinstall. Un ejemplo de gui?n sysinstall se
encuentra disponible en ``src/release/sysinstall/install.cfg``.

.. raw:: html

   </div>

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

6. Lecciones aprendidas a partir de FreeBSD 4.4
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El proceso de ingenier?a de releases de FreeBSD 4.4 comenz? formalmente
el 1 de Agosto de 2001. Despu?s de esa fecha todos los “commits” o
modificaciones sobre la rama ``RELENG_4`` de FreeBSD tuvieron que ser
aprobados expl?citamente por el Grupo de ingenier?a de releases
``<re@FreeBSD.org>``. La primera “release candidate” para la
arquitectura x86 apareci? el 16 de Agosto, seguida por otras cuatro
releases candidatas hasta que vi? la luz la release final el 18 de
Septiembre. El “security officer” estuvo muy involucrado en la ?ltima
semana del proceso ya que se descubrieron varios problemas de seguridad
en las “release candidates” iniciales. M?s de *500* correos electr?nicos
fueron enviados al Grupo de ingenier?a de releases ``<re@FreeBSD.org>``
en poco m?s de un mes.

Nuestra comunidad de usuarios ha dejado muy claro que la seguridad y
estabilidad de las releases de FreeBSD no pueden sacrificarse por culpa
de plazos autoimpuestos o fechas de lanzamiento. El Proyecto FreeBSD ha
crecido tremendamente durante su tiempo de vida y se ha visto claramente
la necesidad de estandarizar los procedimientos de ingenier?a de
releases. Este hecho ser? incluso m?s importante a medida que FreeBSD
vaya estando disponible para m?s plataformas.

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

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8. Agradecimientos
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Me gustar?a agradecer a Jordan Hubbard por darme la oportunidad de
colaborar en algunas de las responsabilidades del equipo de ingenier?a
de releases en FreeBSD 4.4 y tambi?n me gustar?a agradecer p?blicamente
su trabajo y dedicaci?n durante todos estos a?os para poder situar a
FreeBSD en el sitio de honor que le corresponde hoy d?a. Por supuesto
que la release 4.4 no hubiera visto la luz sin el trabajo de Satoshi
Asami, Steve Price, Bruce A. Mah, Nik Clayton, David O'Brien, Kris
Kennaway, John Baldwin y del resto de la comunidad FreeBSD. Tambi?n me
gustar?a agradecer especialmente a Rodney Grimes, Poul-Henning Kamp y
muchos otros que trabajaron en las herramientas de ingenier?a de
releases en los comienzos del sistema FreeBSD. Este art?culo est? basado
en documentos de ingenier?a de releases del CSRG[14], el NetBSD
Project[11] y en las notas del proceso de ingenier?a de releases
propuestas por John Baldwin[12].

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

9. Lecturas recomendadas
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

[1] CVS - Concurrent Versions System ``http://www.cvshome.org``

[2] CVSup - The CVS-Optimized General Purpose Network File Distribution
System ``http://www.polstra.com/projects/freeware/CVSup``

[3] ``http://bento.FreeBSD.org``

[4] FreeBSD Ports Collection ``http://www.FreeBSD.org/ports``

[5] The libh Project ``http://www.FreeBSD.org/projects/libh.html``

[6] FreeBSD Committers
``http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/contributors/staff-committers.html``

[7] FreeBSD Core-Team
``http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/contributors/staff-core.html``

[8] FreeBSD Handbook
``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook``

[9] GNATS: The GNU Bug Tracking System
``http://www.gnu.org/software/gnats``

[10] FreeBSD PR Statistics ``http://www.FreeBSD.org/prstats/index.html``

[11] NetBSD Developer Documentation: Release Engineering
``http://www.NetBSD.org/developers/releng/index.html``

[12] John Baldwin's FreeBSD Release Engineering Proposal
``http://people.FreeBSD.org/~jhb/docs/releng.txt``

[13] PXE Jumpstart Guide
``http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/pxe/index.html``

[14] Marshall Kirk McKusick, Michael J. Karels, and Keith Bostic: `*The
Release Engineering of
4.3BSD* <http://docs.FreeBSD.org/44doc/papers/releng.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |Rama FreeBSD Development (Rama de Desarrollo)| image:: branches-head.png
.. |Rama FreeBSD 3.x STABLE| image:: branches-releng3.png
.. |Rama FreeBSD 4.x STABLE| image:: branches-releng4.png

==========
Qu? es BSD
==========

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Greg Lehey
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<grog@FreeBSD.org>``

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

En el mundo del c?digo abierto la palabra “Linux” suele ser utilizada
como sin?nimo de “Sistema Operativo” pero no es el ?nico sistema
operativo libre UNIX?. En Abril de 1.999 el `Internet Operating System
Counter <http://www.leb.net/hzo/ioscount/data/r.9904.txt>`__ reflejaba
que el 31'3% de los sistemas que ofrec?an alg?n servicio en Internet
usaban Linux y el 14'6% usaban BSD UNIX?. Alguna de las empresas m?s
grandes de Internet, como por ejemplo
`Yahoo! <http://www.yahoo.com/>`__, usan BSD. El servidor de FTP con m?s
carga en 1999 (ahora desaparecido) ,
`ftp.cdrom.com <ftp://ftp.cdrom.com/>`__, transfer?a 1'4TB diariamente
usando BSD. Es f?cil suponer que no se trata de un nicho de mercado: BSD
es un secreto bien guardado.

?As? que cu?l es el secreto? ?Por qu? BSD no es m?s conocido? ?ste
art?culo trata sobre esa y otras cuestiones.

A lo largo de ?ste art?culo ser?n destacadas de *?ste modo*.

*Traducci?n de Jos? Ram?n Baz ``<jr_baz@hartu.net>`` y Jos? Vicente
Carrasco ``<carvay@es.FreeBSD.org>``.*

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

`1. ?Qu? es BSD? <#idp61571920>`__
`2. Entonces ?es un UNIX verdadero? <#idp61594576>`__
`3. ?Por qu? BSD no se conoce mejor? <#idp61631184>`__
`4. Comparemos BSD y Linux <#idp61661904>`__

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

1. ?Qu? es BSD?
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD son las siglas de “Berkeley Software Distribution”. As? se llam? a
las distribuciones de c?digo fuente que se hicieron en la Universidad de
Berkeley en California y que en origen eran extensiones del sistema
operativo UNIX? de AT&T Research. Varios proyectos de sistemas
operativos de c?digo abierto tienen su origen en una distribuci?n de
?ste c?digo conocida como 4.4BSD-Lite. A?aden adem?s un buen n?mero de
paquetes de otros proyectos de C?digo Abierto, incluyendo de forma
destacada al proyecto GNU. El sistema operativo completo incluye:

.. raw:: html

   <div class="itemizedlist">

-  El kernel BSD, que se encarga de la programaci?n del tiempo de
   ejecuci?n de los procesos, la gesti?n de memoria, el multiproceso
   sim?trico (SMP), los controladores de dispositivos, etc.

   *A diferecia del kernel Linux existen varios kernel BSD con diversas
   funciones.*

-  La biblioteca C, la API base del sistema.

   *La biblioteca C de BSD est? basada en c?digo procedente de Berkeley
   no del proyecto GNU.*

-  Aplicaciones como las distintas shells, aplicaciones de gesti?n de
   ficheros, compiladores y enlazadores.

   *Algunas de las aplicaciones derivan del proyecto GNU, otras no.*

-  El sistema X Window, que gestiona el entorno gr?fico.

   El sistema X Window que se usa en la mayor?a de versiones de BSD es
   producto de un proyecto aparte, el `Proyecto
   XFree86 <http://www.XFree86.org/>`__. Se usa el mismo c?digo que en
   Linux. BSD por lo general no predetermina un “gestor de ventanas”
   como KDE o GNOME, aunque ?stos y otros muchos esten disponibles.

-  Muchos otros programas y utilidades.

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

2. Entonces ?es un UNIX verdadero?
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los sistemas operativos BSD no son clones sino derivados de c?digo
abierto del sistema operativo de AT&T Research, el cual es a su vez
ancestro del moderno UNIX System V. ?sto puede sorprenderle. ?C?mo puede
haber sucedido esto si AT&T jam?s ha liberado su c?digo?

Cierto es que AT&T UNIX no es c?digo abierto y que en un sentido
estricto de copyright BSD no es *en absoluto* UNIX, pero por otra parte
AT&T ha inclu?do fuentes de otros proyectos, teniendo como caso notable
el Computer Sciences Research Group de la Universidad de Berkeley,
California. En 1.976 el CSRG comienza a distribuir su software en
cintas, d?ndoles la denominaci?n *Berkeley Software Distribution*, o
*BSD*.

Las primeras distribuciones BSD consist?an principalmente en
aplicaciones de entorno de usuario (“userland”) pero la situaci?n cambi?
de modo dr?stico cuando el CSRG firm? un contrato con la Agencia de
Investigaci?n de Proyectos Avanzados (DARPA) para mejorar los protocolos
de comunicaci?n en su red ARPANET. A los nuevos protocolos se les dio el
nombre de *Internet Protocols*, y m?s adelante *TCP/IP*, que m?s tarde
se habr?an de covertir en los protocolos m?s importantes. La primera
implementaci?n ampliamente distribu?da lo fue como parte de 4.2BSD, en
1.982.

Durante la d?cada de los 80 comienzan a surgir compa??as que ofrec?an
estaciones de trabajo. La mayor?a opt? por adquirir licencias de UNIX en
lugar de desarrollar sistemas operativos ellos mismos. En particular Sun
Microsystems adquiri? una licencia de UNIX e implement? una versi?n de
4.2BSD, a la que llamaron SunOS. Cuando la propia AT&T fue autorizada
para vender UNIX iniciaron una implementaci?n un tanto rudimentaria
llamada System III, seguida r?pidamente por System V. El c?digo base de
System V no inclu?a capacidad de trabajo en redes, de manera que todas
sus implementaciones hab?an de usar software de BSD, incluyendo TCP/IP,
as? como aplicaciones como la shell *csh* y el editor *vi*. En conjunto
esas inclusiones fueron conocidas como las *Berkeley Extensions*.

Las cintas BSD conten?an c?digo fuente de AT&T y en consecuencia
requer?an una licencia de c?digo UNIX. Hacia 1.990 al CSRG se le retiran
los fondos y se enfrenta al cierre. Algunos de los miembros del grupo
deciden distribuir el c?digo BSD, que era C?digo Abierto, sin el c?digo
propiedad de AT&T. Finalmente esto sucede con la *Networking Tape 2*,
m?s conocida como *Net/2*. Net/2 no era un sistema operativo completo:
faltaba aproximadamente un 20% del c?digo del kernel. Uno de los
miembros del CSRG, William F. Jolitz, escribi? el c?digo restante y lo
distribuy? a comienzos de 1.992 como *386BSD*. Al mismo tiempo otro
grupo de antiguos miembros del CSRG fundaron una empresa llamada
`Berkeley Software Design Inc. <http://www.bsdi.com/>`__ y distribuy?
una versi?n beta de un sistema operativo llamado
`BSD/386 <http://www.bsdi.com/>`__, que se basa en las mismas fuentes.
El sistema operativo pas? a denominarse BSD/OS.

386BSD jam?s lleg? a ser un sistema operativo estable. En lugar de ello
dos proyectos surgen de ?l en 1.993: `NetBSD <http://www.NetBSD.org/>`__
y `FreeBSD <../../../../index.html>`__. Ambos proyectos se forman
gracias a la falta de paciencia que origina la espera de mejoras en
386BSD: el proyecto NetBSD comenz? a primeros de a?o y la primera
versi?n de FreeBSD no estuvo lista hasta finales del mismo. En ese
proceso el c?digo base tom? caminos diferentes hasta tal punto que se
hizo dif?cil de mezclar. Adem?s los proyectos tienen objetivos
diferentes, como veremos m?s adelante. En 1.996 otro proyecto,
`OpenBSD <http://www.OpenBSD.org/>`__, se separa de NetBSD.

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

3. ?Por qu? BSD no se conoce mejor?
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen diversas razones por las que BSD es relativamente desconocido:

.. raw:: html

   <div class="orderedlist">

#. Los desarrolladores de BSD con frecuencia est?n m?s interesados en
   depurar su c?digo que en promocionarlo.

#. La mayor parte de la popularidad de Linux se debe a factores externos
   a los proyectos Linux, como la prensa y las compa??as que ofrecen
   servicios relacionados con Linux. Hasta hace poco los BSD de fuente
   abierta carec?an de tales abogados.

#. Los desarrolladores de BSD suelen estar m?s experimentados que los de
   Linux y ponen menos de su parte a la hora de hacer el sistema f?cil
   de usar. Los reci?n llegados suelen sentirse m?s c?modos con Linux.

#. En 1.992 AT&T denunci? a `BSDI <http://www.bsdi.com/>`__, el
   distribuidor de BSD/386, alegando que el producto conten?a c?digo
   propiedad de AT&T. El caso fu? sobrese?do en 1.994 pero la huella del
   litigio perdura. A?n en Marzo de 2.000 en un art?culo publicado en la
   web se aseguraba que el caso hab?a sido “resuelto hace poco”.

   Un detalle que el proceso judicial aclar? fue el de la nomenclatura:
   en los 80 BSD era conocido como “BSD UNIX ”. Tras la eliminaci?n del
   ?ltimo vestigio de c?digo de AT&T, BSD perdi? el derecho a llamarse
   UNIX. Es por esto que es posible encontrar t?tulos de libros
   referentes a “the 4.3BSD UNIX operating system” y “the 4.4BSD
   operating system”.

#. Existe la creencia de que los proyectos BSD est?n fragmentados y
   enfrentados entre s?. El `Wall Street
   Journal <http://interactive.wsj.com/bin/login?Tag=/&URI=/archive/retrieve.cgi%253Fid%253DSB952470579348918651.djm&>`__
   habl? de la “balcanizaci?n ” de los proyectos BSD. Como en el caso
   del pleito, esa creencia se fundamenta en historia antigua.

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

4. Comparemos BSD y Linux
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

De manera que, ?cu?l es la diferencia entre, digamos, Debian Linux y
FreeBSD? Para el usuario avanzado la diferencia es sorprendentemente
peque?a: ambos son sistemas operativos tipo UNIX. Ambos son
desarrollados por proyectos no comerciales (esto, por supuesto, no es
aplicable a la mayor?a del resto de distribuciones de Linux). En el
siguiente apartado tomaremos BSD como punto de partida y lo compararemos
con Linux. La descripci?n se ajusta m?s a FreeBSD, que posee
aproximadamente el 80% de los sistemas BSD instalados, pero las
diferencias con NetBSD y OpenBSD son peque?as.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1. ?Qui?n posee BSD?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ninguna persona o empresa posee BSD. Su creaci?n y distribuci?n es obra
de una comunidad de voluntarios altamente cualificados y comprometidos a
lo largo y ancho del mundo. Algunos de los componentes de BSD son
proyectos de C?digo Abierto que cuentan con responsables ajenos al
proyecto BSD.

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

4.2. ?C?mo se desarrolla y actualiza BSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los kernel BSD son desarrollados y actualizados siguiendo el modelo de
desarrollo de C?digo Abierto. Cada proyecto mantiene un *?rbol de
fuentes* accesible p?blicamente mediante un `“Sistema Concurrente de
Versiones” <http://www.sourcegear.com/CVS/>`__ (Concurrency Versions
System, CVS), que contiene todos los ficheros fuente del proyecto,
incluidos los de la documentaci?n y otros ficheros relacionados. CVS
permite a los usuarios “hacer un check out” (en otras palabras, extraer
una copia) de los ficheros que componen la versi?n elegida del sistema.

Un gran n?mero de desarrolladores de muy diversas partes del mundo
contribuye con mejoras a BSD. Estan divididos en tres categor?as:

.. raw:: html

   <div class="itemizedlist">

-  *Contributors* son aquellos que escriben c?digo o documentaci?n. No
   se les permite “hacer commit” (es decir, a?adir c?digo) directamente
   al ?rbol de fuentes. Para que su c?digo sea incluido en el sistema
   debe ser revisado y probado por un desarrollador registrado o
   *committer*.

-  *Committers* son desarrolladores que disponen de acceso de escritura
   en el ?rbol de fuentes. Para convertirse en committer es necesario
   demostrar habilidad en el ?rea en la cual ?l o ella trabaja.

   Depende del criterio individual de cada committer cu?ndo pedir
   autorizaci?n antes de hacer cambios en el ?rbol de fuentes. En
   general un committer experimentado puede incluir cambios que son
   obviamente correctos sin necesidad de consenso. Por ejemplo, un/a
   committer que trabaje en un proyecto de documentaci?n puede corregir
   errores tipogr?ficos o gramaticales sin necesidad de revisi?n. Por
   otra parte, se espera de desarrolladores que pretendan realizar
   cambios de gran calado o complicados que env?en sus cambios para que
   sean revisados antes de ser incluidos. En casos extremos un miembro
   del “core team” con una funci?n como la del Principal Architect puede
   pedir que los cambios sean retirados del ?rbol; es lo que llamamos
   *backing out*. Todos los/las committers reciben un correo electr?nico
   acerca de cada cambio concreto en el ?rbol de fuentes as? que no es
   posible hacerlo en secreto.

-  El *Core team*. Tanto FreeBSD como NetBSD disponen de un “core team”
   que coordina el proyecto. Los “core team” dirigen el rumbo de los
   proyectos pero sus funciones no siempre est?n claras. No es necesario
   ser desarrollador para ser un miembro de un “core team” pero suele
   ser lo habitual. Las normas de un “core team” var?an de un proyecto a
   otro pero en general tienen m?s influencia sobre la direcci?n del
   proyecto.

.. raw:: html

   </div>

?te sistema difiere del de Linux en algunos aspectos:

.. raw:: html

   <div class="orderedlist">

#. Nadie posee el principio de autoridad. En la pr?ctica eso es muy
   relativo, puesto que el “Chief Architect” puede solicitar que cierta
   entrada del ?rbol de fuentes sea eliminada e incluso en el proyecto
   Linux a ciertas personas les est? permitido hacer cambios.

#. Por otra parte *hay* un repositorio central, un ?nico lugar donde
   encontrar las fuentes del sistema operativo ?ntegro, incluyendo todas
   las versiones anteriores.

#. Los BSD mantienen el “Sistema Operativo” completo, no ?nicamente el
   kernel. ?sta distinci?n es v?lida ?nicamente como definici?n puesto
   que ni BSD ni Linux son ?tiles sin aplicaciones: las aplicaciones que
   se usan en BSD suelen ser las mismas que las que se usan en Linux.

#. Como resultado del mantenimiento estructurado de un ?nico ?rbol de
   fuentes mediante CVS el desarrollo de BSD es limpio y es posible
   acceder a cualquier versi?n del sistema por su n?mero de versi?n o
   por la fecha. Del mismo modo CVS permite actualizaciones
   incrementales del sistema: por ejemplo el repositorio de FreeBSD es
   actualizado en torno a 100 veces al d?a, aunque la mayor?a de esos
   cambios son peque?os.

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

4.3. Versiones de BSD
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada proyecto BSD pone a disposici?n p?blica tres “releases” (versiones)
distintas. Igual que en Linux, las “releases ” tienen asignado un n?mero
como por ejemplo 1.4.1 ? 3.5. Adem?s el n?mero de versi?n tiene un
sufijo que indica su prop?sito:

.. raw:: html

   <div class="orderedlist">

#. La versi?n de desarrollo del sistema recibe el nombre de *CURRENT*.
   FreeBSD asigna un n?mero a CURRENT, por ejemplo FreeBSD 5.0-CURRENT.
   NetBSD utiliza un sistema ligeramente diferente y a?ade un sufijo
   compuesto por una ?nica letra que indica cambios en las interfaces
   internas, por ejemplo NetBSD 1.4.3G. OpenBSD no asigna ning?n n?mero
   ("OpenBSD-current"). ?sta rama es la que incluye todo el desarrollo.

#. A intervalos regulares, entre dos y cuatro veces al a?o, los
   proyectos liberan una versi?n *RELEASE* del sistema, que est?
   disponible en CD-ROM y mediante FTP para su descarga gratu?ta, por
   ejemplo OpenBSD 2.6-RELEASE o NetBSD 1.4-RELEASE. La versi?n RELEASE
   est? dirigida al usuario final y es la versi?n “est?ndar ” del
   sistema. NetBSD tambi?n dispone de *patch releases* que incluyen un
   tercer d?gito, como por ejemplo NetBSD 1.4.2.

#. A medida que se van encontrando errores en la versi?n RELEASE son
   corregidos y las soluciones son incluidas en el ?rbol CVS. En FreeBSD
   la versi?n resultante se denomina versi?n *STABLE*, mientras que en
   NetBSD y OpenBSD contin?a siendo la versi?n RELEASE. Nuevas
   caracter?sticas m?s peque?as pueden ser a?adidas en esta rama tras un
   per?odo de pruebas en la rama CURRENT.

.. raw:: html

   </div>

*Linux, en cambio, mantiene dos ?rboles de c?digo separados: la versi?n
estable y la versi?n de desarrollo. Las versiones estables a?aden un
n?mero par de versi?n, como 2.0, 2.2 ? 2.4. Las versiones de desarrollo
a?aden un n?mero impar, como en 2.1, 2.3 ? 2.5. En ambos casos a ese
n?mero se le a?ade otro m?s que indica la versi?n exacta. Por si fuera
poco cada distribuidor a?ade sus propios programas y aplicaciones de
entorno de usuario, as? que el n?mero de versi?n es importante. Cada
distribuidor adem?s asigna n?meros de versi?n a la distribuci?n, as?
pues la descripci?n completa podr?a ser algo como “TurboLinux 6.0 with
kernel 2.2.14”*

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

4.4. ?Cu?ntas versiones de BSD existen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A diferencia de las numerosas distribuciones de Linux tan s?lo hay tres
BSD libres. Cada proyecto BSD mantiene su propio ?rbol de fuentes y su
propio kernel. En la pr?ctica, sin embargo, las diferencias en el
entorno de usuario (“userland”) entre los distintos BSD son menores que
las que hay en Linux.

Es dif?cil enumerar los objetivos de cada proyecto puesto que las
diferencias son muy subjetivas. En general,

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD tiene como meta ofrecer alto rendimiento y facilidad de uso
   al usuario final y es uno de los favoritos entre proveedores de
   contenidos web. Funciona en PC y en procesadores Alpha de Compaq. El
   proyecto FreeBSD cuenta con un n?mero de usuarios significativamente
   mayor que los otros proyectos.

-  NetBSD tiene como meta la Portabilidad: No en vano su lema es “of
   course it runs NetBSD” (que podr?a traducirse como “claro que
   funciona con NetBSD”). Funciona en m?quinas que abarcan desde PDAs a
   grandes servidores e incluso ha sido usado por la NASA en misiones
   espaciales. Es una excelente elecci?n para utilizar viejo hardware no
   Intel.

-  OpenBSD tiene como meta la seguridad y la integridad del c?digo:
   combina del concepto de c?digo abierto y una revisi?n rigurosa del
   c?digo que dan como fruto un sistema muy correcto, elegido por
   instituciones preocupadas por la seguridad como bancos, entidades de
   cambio y departamentos gubernamentales de los EEUU. Al igual que
   NetBSD funciona en gran variedad de plataformas.

.. raw:: html

   </div>

Existen dos sistemas operativos BSD m?s que no son de c?digo abierto,
BSD/OS y el MacOS X de Apple:

.. raw:: html

   <div class="itemizedlist">

-  BSD/OS es el derivado m?s ant?guo de 4.4BSD. No es c?digo abierto
   pero es posible conseguir licencias de su c?digo fuente a un precio
   relativamente bajo. Se parece a FreeBSD en muchos aspectos.

-  `Mac OS X <http://www.apple.com/macosx/server/>`__ es la ?ltima
   versi?n del sistema operativo para la gama Macintosh de `Apple
   Computer Inc. <http://www.apple.com/>`__ El n?cleo BSD Unix de ?ste
   sistema operativo, `Darwin <http://developer.apple.com/darwin/>`__,
   est? libremente disponible como sistema operativo de fuente abierto
   totalmente funcional para arquitecturas x86 y PPC. El sistema gr?fico
   Aqua/Quartz y la mayor?a de las dem?s aspectos caracter?sticos de Mac
   OS X son c?digo cerrado. Varios desarrolladores de Darwin son tambi?n
   “committers” de FreeBSD y viceversa.

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

4.5. ?Qu? diferencias hay entre la licencia BSD y la licencia p?blica GNU?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux est? disponible bajo la `GNU General Public
License <http://www.fsf.org/copyleft/gpl.html>`__ (GPL), que fue
dise?ada para evitar el software cerrado. M?s concretamente, cualquier
trabajo derivado de un producto con licencia GPL debe suministrar el
c?digo fuente si es requerido. En contraste, la `licencia
BSD <http://www.opensource.org/licenses/bsd-license.html>`__ es menos
restrictiva: permite la distribuci?n en forma exclusivamente binaria.
Este aspecto es especialmente atractivo para aplicaciones empotradas.

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

4.6. ?Qu? m?s deber?a saber?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dado que existen menos aplicaciones para BSD que para Linux los
desarrolladores de BSD han creado un paquete de compatibilidad con Linux
que permite hacer funcionar programas de Linux bajo BSD. El paquete
contiene tanto modificaciones del kernel, con el fin de gestionar
correctamente las llamadas al sistema de Linux, como ficheros necesarios
para la compatibilidad con Linux como la Biblioteca C. No hay
diferencias notables en velocidad de ejecuci?n entre una aplicaci?n de
Linux ejecut?ndose en un sistema Linux y una aplicaci?n Linux
ejecut?ndose en un sistema BSD de la misma velocidad.

El modelo “todo del mismo proveedor” de BSD implica que las
actualizaciones son mucho m?s sencillas de gestionar de lo que con
frecuencia son en Linux. BSD maneja las actualizaciones de versiones de
bibliotecas suministrando m?dulos de compatibilidad para versiones
anteriores, de modo que es posible ejecutar binarios con varios a?os de
antiguedad sin problemas.

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

4.7. Entonces ?Qu? deber?a usar, BSD o Linux?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?Qu? significa realmente esa pregunta? ?Qui?n deber?a utilizar BSD y
qui?n Linux?.

?sta es una pregunta muy dif?cil de responder. He aqu? varias pautas:

.. raw:: html

   <div class="itemizedlist">

-  “Si no est? roto no lo arregles”: Si ya usa un sistema operativo de
   c?digo abierto y est? satisfecho con ?l, probablemente no hay ninguna
   buena raz?n para cambiar.

-  Los sistemas BSD, especialmente FreeBSD, pueden proporcionar un
   rendimiento notablemente superior que Linux, pero esto no es una ley
   inmutable. En muchos casos no hay diferencia de rendimiento o esta es
   muy peque?a. En algunos casos Linux podr?a tener un rendimiento mejor
   que FreeBSD.

-  En general los sistemas BSD gozan de una mejor reputaci?n en cuanto a
   disponibilidad, principalmente por la mayor madurez de su c?digo
   base.

-  La licencia BSD puede resultar m?s atractiva que la GPL.

-  BSD puede ejecutar c?digo de Linux, mientras que Linux no puede hacer
   lo propio con c?digo de BSD. Como resultado de esto hay una mayor
   cantidad de software disponible para BSD que para Linux.

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

4.8. ?Qui?n ofrece soporte, servicios y formaci?n orientada a BSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSDi siempre ha ofrecido soporte para BSD/OS y en fechas recientes
anunci? contratos de soporte para FreeBSD.

Adem?s cada uno de los proyectos tiene una lista de consultores:
`FreeBSD <../../../../commercial/consulting_bycat.html>`__,
`NetBSD <http://www.netbsd.org/gallery/consultants.html>`__, y
`OpenBSD <http://www.openbsd.org/support.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

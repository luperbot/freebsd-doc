================================
1.3. Acerca del Proyecto FreeBSD
================================

.. raw:: html

   <div class="navheader">

1.3. Acerca del Proyecto FreeBSD
`Anterior <nutshell.html>`__?
Cap?tulo 1. Introducci?n
?\ `Siguiente <install.html>`__

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

1.3. Acerca del Proyecto FreeBSD
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En la siguiente secci?n se explican ciertos aspectos b?sicos del
Proyecto, una breve historia, sus objetivos y el modelo de desarrollo
del mismo.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.3.1. Breve historia de FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Elaborado por Jordan Hubbard.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La g?nesis del proyecto FreeBSD se remonta a comienzos de 1993, en parte
como una extensi?n del “Unofficial 386BSD Patchkit” debida a los tres
?ltimos coordinadores del patchkit: Nate Williams, Rod Grimes y yo
mismo.

Nuestro objetivo original era producir una instant?nea de 386BSD
intermedia para arreglar una serie de problemas que no se pod?an
solventar con uno de nuestros parches. Quiz?s haya quien recuerde que el
primer nombre del proyecto fue “386BSD 0.5” o “386BSD Interim” debido a
esto.

386BSD era el sistema operativo de Bill Jolitz, que hasta ese punto
hab?a estado sufriendo severamente las consecuencias de pr?cticamente un
a?o que m?s valdr?a olvidar. A medida que el “patchkit” se iba haciendo
haciendo m?s inc?modo cada dia que pasaba, as? que acordamos ayudar a
Bill con una instant?nea del sistema. Estos planes se vieron bruscamente
interrumpidos cuando Bill Jolitz decidi? repentinamente retirar su
aprobaci?n al proyecto sin dejar ninguna indicaci?n clara de qu? deb?a
hacerse a continuaci?n.

No tardamos mucho en decidir que el objetivo segu?a valiendo la pena,
aun sin el soporte de Bill, as? que adoptamos el nombre de “FreeBSD”,
una idea de David Greenman. Nuestros objetivos iniciales se fijaron tras
consultar a los usuarios del sistema y cuando qued? claro que el
proyecto estaba en marcha y que pod?a llegar a ser una realidad contact?
con Walnut Creek CDROM con idea de mejorar los canales de distribuci?n
de FreeBSD y hacer m?s f?cil llegar a aquellas personas que no ten?an la
suerte de tener acceso a Internet. Walnut Creek CDROM no solo nos ayud?
con la idea de distribuir FreeBSD en CD; tambi?n facilit? al Proyecto
una m?quina en la que trabajar y una conexi?n r?pida a Internet. Sin la
fe casi sin precedentes que tuvo Walnut Creek CDROM en lo que era en
aqu?l momento un proyecto completamente desconocido, es bastante
improbable que FreeBSD hubiera logrado tanto y tan r?pido como ha
logrado hasta el dia de hoy.

La primera distribuci?n en CDROM (y disponible por la red) fue FreeBSD
1.0, publicado en diciembre de 1993. Estaba basado en la cinta de U.C.
Berkeley del 4.3BSD-Lite (“Net/2”), con bastantes componentes de 386BSD
y de trabajos proveniente de la Free Software Foundation. Fue un logro
bastante apreciable para una primera versi?n; pronto le sigui? FreeBSD
1.1 en mayo de 1994, que tuvo un gran ?xito.

Por entonces se formaron unos inesperados nubarrones en el horizonte ya
que Novell y la Universidad de Berkeley resolvieron el largo juicio
acerca del estatus legal de la cinta de Berkeley Net/2. Una condici?n
del acuerdo fue la concesi?n por parte de Berkeley de que una gran parte
de Net/2 era c?digo “gravado” y propiedad de Novell, quien a su vez lo
hab?a adquirido de AT&T anteriormente. Berkeley obtuvo a cambio de
Novell el “benepl?cito” para que 4.4BSD-Lite, cuando saliera, fuera
declarado como “no gravado” y se instara a los usuarios de Net/2 a
cambiar. Esto repercuti? sobre el Proyecto FreeBSD, a quienes se dio
hasta julio de 1994 para dejar de sacar su producto basado en Net/2.
Bajo los t?rminos de aquel acuerdo se permit?a al Proyecto sacar una
?ltima versi?n antes de la fecha l?mite: esa versi?n fue FreeBSD
1.1.5.1.

FreeBSD tuvo entonces que acometer la ardua tarea de (literalmente)
reinventarse a s? mismo a partir de partes nuevas y bastante incompletas
de 4.4BSD-Lite. Las versiones “Lite” eran ligeras en parte porque el
CSRG de Berkeley quit? grandes partes del c?digo necesario para
construir un sistema que pudiera arrancar (debido a diversos requisitos
legales) y porque la versi?n del 4.4 para Intel era muy incompleta.
Hasta noviembre de 1994 el proyecto al fin realiz? esa transici?n;
apareci? FreeBSD 2.0 en la red y (a finales de diciembre) en CDROM. A
pesar de no estar suficientemente pulida esta distribuci?n fue un ?xito
significativo, al cual sigui? el m?s robusto y f?cil de instalar FreeBSD
2.0.5; era junio de 1995.

Sacamos FreeBSD?2.1.5 en Agosto de 1996; pareci? ser suficientemente
popular entre ISPs y otras comunidades comerciales como para que
mereciera otra versi?n de la rama 2.1-STABLE. Fue FreeBSD 2.1.7.1,
publicada en febrero de 1997, que marc? el final de la l?nea principal
de desarrollo en 2-1.STABLE. Una vez en puesta en mantenimiento, en esa
rama (RELENG\_2\_1\_0) s?lo se har?an ya mejoras en seguridad y se
corregir?an errores cr?ticos.

FreeBSD se ramific? desde la l?nea principal de desarrollo (“-CURRENT”)
en noviembre de 1996 como la rama RELENG\_2\_2, y la primera versi?n
completa (2.2.1) sali? en abril de 1997. Se hicieron m?s versiones de la
rama 2.2 en verano y oto?o de 1997, la ?ltima de las cuales (2.2.8)
apareci? en noviembre de 1998. La primera versi?n 3.0 oficial sali? en
octubre de 1998 y marc? el inicio del fin de la rama 2.2.

El ?rbol se ramific? de nuevo el 20 de Enero de 1999, dando lugar a las
ramas 4.0-CURRENT y 3.X-STABLE. A partir de la 3.X-STABLE sali? 3.1 el
15 de febrero de 1999, 3.2 el 15 de mayo de 1999, 3.3 el 16 de
septiembre de 1999, 3.4 el 20 de diciembre de 1999 y 3.5 el 24 de junio
de 2000. Pocos dias despu?s de esta apareci? una actualizaci?n menor, la
3.5.1, que incorporaba parches de seguridad de ?ltima hora para
Kerberos. Esa fue la ?ltima versi?n de la rama 3.X.

Hubo otra ramificaci?n el 13 de Marzo de 2000 que dio lugar a la rama
4.X-STABLE. Ha habido varias versiones de la misma desde entonces:
4.0-RELEASE sali? en marzo de 2000 y la ?ltima versi?n de la rama,
4.11-RELEASE, apareci? en enero de 2005.

La largamente esperada 5.0-RELEASE se anunci? el 19 de enero de 2003,
culminando casi tres a?os de trabajo; esta versi?n situ? a FreeBSD en el
escenario del multiproceso avanzado y el soporte de hilos para las
aplicaciones, e introdujo soporte para las plataformas UltraSPARC? y
``ia64``. Sigui? a esta la versi?n 5.1 lanzada en Junio de 2003. La
?ltima versi?n de 5.X como la rama -CURRENT fu? 5.2.1-RELEASE, que sali?
en febrero de 2004.

La rama RELENG\_5, creada en agosto de 2004, desemboc? en 5.3-RELEASE,
que marc? el inicio de la rama de versiones 5-STABLE. La versi?n
5.5-RELEASE m?s reciente apareci? en mayo de 2006. No aparecer?n m?s
versiones a partir de la rama RELENG\_5.

El ?rbol se dividi? de nuevo en julio de 2005, en esta ocasi?n para
crear RELENG\_6. 6.0-RELEASE, la primera versi?n de la rama 6.X,
apareci? en noviembre de 2005. 9.3-RELEASE apareci? en July 2014. Ir?n
apareciendo m?s versiones a partir de la rama RELENG\_6.

La rama RELENG\_7

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

1.3.2. Objetivos del Proyecto FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto original de Jordan Hubbard.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los objetivos del Proyecto FreeBSD son producir software que pueda
usarse con cualquier prop?sito y sin ning?n tipo de restricci?n. Muchos
de nosotros participamos de forma significativa en el c?digo (y en el
proyecto) y ciertamente no nos importar?a recibir una peque?a
compensaci?n econ?mica de vez en cuando, pero no vamos a insistir en
ello. Creemos que nuestra “misi?n” m?s importante y primordial es
facilitar el acceso al c?digo a cualquiera, para lo que quiera usarlo y
de forma que se use tanto y para sacarle tanto provecho para sea
posible. Creo que ?ste es uno de los objetivos m?s fundamentales del
software libre y algo que nosotros apoyamos con entusiasmo.

El c?digo fuente de nuestro ?rbol que se halla bajo la GNU General
Public License (GPL) o la Library General Public License (LGPL) viene
con algunas restricciones m?s, si bien para garantizar acceso al mismo,
y no al contrario como es lo habitual. Debido a las complicaciones
adicionales que pueden surgir en el uso comercial de software con
licencia GPL preferimos que el software que incluyamos en el ?rbol venga
bajo la licencia BSD, menos restrictiva, siempre y cuando sea una opci?n
razonable.

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

1.3.3. El modelo de desarrollo de FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Satoshi Asami.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El desarrollo de FreeBSD es un proceso muy abierto y flexible: FreeBSD
est? literalmente compuesto de partes hechas por centenares de personas
de todo el mundo, como puede verse en `este
texto <http://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributors/article.html>`__.
la infraestructura de desarrollo del proyecto FreeBSD permite a estos
cientos de desarrolladores trabajar a trav?s de Internet. Estamos
buscando constantemente de nuevos desarrolladores e ideas. Las personas
interesadas en vincularse m?s al proyecto tienen que ponerse en contacto
con nosotros en la `lista de correo de discusiones t?cnicas en
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__.
La `lista de anuncios importantes del Proyecto
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__
est? a disposici?n de quienes deseen dar a conocer a otros usuarios de
FreeBSD grandes ?reas de trabajo.

Veamos unas cuantas cosas ?tiles sobre el Proyecto FreeBSD y su proceso
de desarrollo, ya sea trabajando de forma independiente o en estrecha
cooperaci?n:

.. raw:: html

   <div class="variablelist">

Los repositorios SVN y CVS
    El ?rbol central de c?digo de FreeBSD se ha mantenido mediante
    `CVS <http://ximbiot.com/cvs/wiki/>`__ (Concurrent Versions System,
    o sistema concurrente de versiones), una herramienta de control de
    c?digo totalmente libre que forma parte de FreeBSD. En junio de 2008
    el Proyecto adopt? `SVN <http://subversion.tigris.org>`__
    (Subversion). La necesidad de un cambio como este ven?a de largo a
    medida que las limitaciones t?cnicas que el uso de CVS impon?a se
    iban haciendo m?s y m?s obvias con la r?pida expansi?n del ?rbol de
    c?digo y de la cantidad de historial de cambios que hay que
    almacenar y gestionar. Aunque el repositorio principal use SVN las
    aplicaciones del lado del cliente como CVSup y csup, que dependen de
    la infraestructura anterior basada en CVS, siguen funcionando
    normalmente; los cambios que se hacen en el repositorio SVN se van
    replicando en el repositorio CVS con este fin. Actualmente (octubre
    2008) solamente el ?rbol central de c?digo usa SVN. Los repositorios
    de documentaci?n, WWW y Ports siguen usando still using CVS. El
    `repositorio <http://www.FreeBSD.org/cgi/cvsweb.cgi>`__ primario
    est? alojado en una m?quina en Santa Clara (California, EEUU), que
    constituye el original del que todas las r?plicas (a las que
    llamamos a veces “mirrors”) son copias exactas actualizadas cada muy
    poco tiempo. El ?rbol SVN, que contiene tambi?n los ?rboles
    `-CURRENT <current-stable.html#current>`__ y
    `-STABLE <current-stable.html#stable>`__, puede replicarse muy
    f?cilmente en local en su m?quina. Consulte la secci?n
    `Sincronizaci?n del ?rbol de c?digo <synching.html>`__ para m?s
    informaci?n.

La lista de committers
    Los *committers* son la gente que tienen permisos de *escritura* en
    el los fuentes de FreeBSD (el t?rmino “committer” viene de la orden
    ``commit`` de
    `cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1>`__,
    que sirve para hacer cambios en el repositorio CVS). La mejor manera
    de enviar aportaciones para que sean revisadas por los committers es
    usar
    `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__.
    Si le parece que si pareciera que algo va mal en el sistema tambi?n
    puede enviar correo electr?nico a la lista de correo para
    'committers' de FreeBSD.

El Core Team de FreeBSD
    El *Core Team de FreeBSD* ser?a el equivalente a una junta directiva
    si el Proyecto FreeBSD fuese una compa??a. La tarea principal del
    Core Team es la de garantizar que el Proyecto como un todo tenga
    salud y se mueva en las direcciones adecuadas. Otra de sus funciones
    es invitar a desarrolladores comprometidos y responsables a que se
    unan a nuestro equipo, adem?s de reclutar nuevos miembros del Core
    Team cuando alguno se va. El Core Team actual fue elegido entre un
    conjunto de candidatos committers en julio de 2008. Se celebran
    elecciones cada dos a?os.

    Algunos miembros del Core Team tienen tambi?n ?reas espec?ficas de
    responsabilidad, pues se encargan de garantizar que grandes
    secciones del sistema funcionen seg?n lo previsto. Hay una lista
    completa de desarrolladores de FreeBSD con sus ?reas de
    responsabilidad en la `lista de
    colaboradores <http://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributors/article.html>`__.
    .

    .. raw:: html

       <div class="note" xmlns="">

    Nota:
    ~~~~~

    La mayor?a de los miembros del Core Team trabaja de forma altru?sta
    en el desarrollo de FreeBSD y no reciben beneficio econ?mico del
    Proyecto; es por esto que “compromiso” no debe confundirse con
    “soporte garantizado”. La anterior analog?a de la “junta directiva”
    en realidad no es del todo exacta; quiz? fuera m?s acertado decir
    que esa es la gente que dedica su vida a FreeBSD *en contra de lo
    que les aconseja su propio sentido com?n*.

    .. raw:: html

       </div>

Contribuidores externos
    Por ?ltimo, y no por ello menos importante, el mayor grupo de
    desarrolladores est? formado por los mismos usuarios, quienes
    constantemente nos aportan comentarios y correcci?n de errores. La
    mejor manera de seguir de cerca el desarrollo (al estilo
    descentralizado de FreeBSD) es suscribirse a la `lista de correo de
    discusiones t?cnicas en
    FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__,
    que es donde se habla de este tipo de cosas. Consulte el
    `Ap?ndice?A, *Recursos en Internet* <eresources.html>`__ si necesita
    m?s informaci?n sobre las diferentes listas de correo de FreeBSD.

    *La lista de colaboradores* es larga y no para de crecer. ?Por qu?
    no apuntarse y hacer algo en FreeBSD hoy mismo?

    Aportar c?digo no es la ?nica manera de ayudar al proyecto; hay una
    lista completa de tareas pendientes en el `sitio web del Proyecto
    FreeBSD <http://www.freebsd.org/index.html>`__.

.. raw:: html

   </div>

En resumen, nuestro modelo de desarrollo est? organizado como un
conjunto de c?rculos conc?ntricos. El modelo centralizado est? dise?ado
pensando el la comodidad de los “usuarios” de FreeBSD, que as? tienen un
modo sencillo de estar al dia con una base de c?digo central y por
supuesto *no para excluir a quien quiera ayudar*. Nuestro af?n es
ofrecer un sistema operativo estable con un gran conjunto de
`aplicaciones <ports.html>`__ coherentes que los usuarios puedan
instalar y usar f?cilmente (y este modelo est? dando buenos resultados)

Lo ?nico que pedimos a quienes quieran unirse a nosotros como
desarrolladores de FreeBSD es la misma dedicaci?n que los integrantes
actuales tienen.

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

1.3.4. En qu? consiste el FreeBSD que distribuimos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD es un sistema operativo libre y gratuito que se distribuye con
el c?digo fuente ?ntegro. Est? basado en 4.4BSD-Lite y est? dise?ado
para funcionar en sistemas Intel i386™, i486™, Pentium?, Pentium??Pro,
Celeron?, Pentium??II, Pentium??III, Pentium??III, Pentium?4 (o
compatible), Xeon™, DEC Alpha™ y sistemas basados en SUN UltraSPARC?.
Est? basado principalmente en software del grupo CSRG de la Universidad
de Berkeley (California), y tiene mejoras importadas de NetBSD, OpenBSD,
386BSD y c?digo creado al amparo de la Free Software Foundation.

Desde la versi?n 2.0 de FreeBSD de finales del 94 el rendimiento,
conjunto de funcionalidades, y estabilidad del sistema han mejorado
dr?sticamente. El ?ltimo cambio consiste en un redise?o del sistema de
memoria virtual con una cach? unificada de VM/buffer que no solo aumenta
el rendimiento sino que reduce el consumo de memoria de FreeBSD,
haciendo que una configuraci?n de 5 MB sea un m?nimo m?s aceptable.
Otras mejoras incluyen soporte completo para clientes y servidores NIS,
soporte para transacciones TCP, llamada bajo demanda PPP, soporte para
DHCP integrado, un subsistema SCSI mejorado, soporte para RDSI (ISDN),
soporte para ATM, FDDI, adaptadores Fast y Gigabit Ethernet (1000 Mbit),
soporte mejorado para los ?ltimos controladores Adaptec y cientos de
correcciones de errores.

Adem?s de la distribuci?n base FreeBSD ofrece una colecci?n de software
con miles de programas de uso com?n. *En el momento de escribir esto hay
unos 24,000 “Ports”* La lista de Ports comprende desde servidores HTTP
(WWW), juegos, lenguajes de programaci?n, editores, y pr?cticamente
cualquier cosa. La colecci?n de Ports completa requiere un espacio de
aproximadamente 500?MB, todos ellos expresados como “deltas” de sus
fuentes originales. Esto hace que nos sea mucho m?s f?cil actualizar
Ports y reduce notablemente el espacio en disco que necesitaba la
anterior Colecci?n de Ports 1.0. Para compilar un port uno simplemente
se sit?a bajo el directorio del programa que desea instalar, escribe
``make install`` y deja que el sistema se encargue del resto. La
distribuci?n original completa de cada port que compile se descargar?
din?micamente de un CDROM o un sitio FTP, de modo que s?lo necesita el
espacio necesario para compilar los ports que quiera. La mayor?a de los
ports tambi?n est?n precompilados como “packages”, que quienes no
quieran compilar Ports pueden instalar con una simple orden:
``pkg_add``. En el `Cap?tulo?4, *Instalaci?n de aplicaciones: ?packages?
y ports* <ports.html>`__ tiene m?s informaci?n sobre los “packages” y
Ports.

Algunos documentos que pueden ser de ayuda en el proceso de instalaci?n
y al utilizar FreeBSD pueden tambi?n encontrarse el directorio
``/usr/share/doc`` de cualquier m?quina con una versi?n reciente de
FreeBSD encontrar? varios documentos que pueden serle de ayuda en el
proceso de instalaci?n o al usar FreeBSD. Para poder consultarlos
utilice cualquier navegador para seguir estos enlaces:

.. raw:: html

   <div class="variablelist">

El *Handbook* de FreeBSD
    `/usr/share/doc/handbook/index.html <file://localhost/usr/share/doc/handbook/index.html>`__

Las FAQ de FreeBSD
    `/usr/share/doc/faq/index.html <file://localhost/usr/share/doc/faq/index.html>`__

.. raw:: html

   </div>

Tambi?n puede ver la copia original (y m?s frecuentemente actualizada)
en http://www.FreeBSD.org/.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+---------------------------------+---------------------------------------+
| `Anterior <nutshell.html>`__?   | `Subir <introduction.html>`__   | ?\ `Siguiente <install.html>`__       |
+---------------------------------+---------------------------------+---------------------------------------+
| 1.2. Bienvenido a FreeBSD?      | `Inicio <index.html>`__         | ?Cap?tulo 2. Instalaci?n de FreeBSD   |
+---------------------------------+---------------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

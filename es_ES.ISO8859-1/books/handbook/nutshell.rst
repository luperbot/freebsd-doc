=========================
1.2. Bienvenido a FreeBSD
=========================

.. raw:: html

   <div class="navheader">

1.2. Bienvenido a FreeBSD
`Anterior <introduction.html>`__?
Cap?tulo 1. Introducci?n
?\ `Siguiente <history.html>`__

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

1.2. Bienvenido a FreeBSD
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD es un sistema operativo basado en 4.4BSD-Lite para ordenadores
Intel (x86 e Itanium?), AMD64, Alpha™ y Sun UltraSPARC?. Se est?
trabajando tambi?n en versiones para otras arquitecturas. Tambi?n puede
leer sobre `la historia de FreeBSD <history.html>`__, o sobre la
`distribuci?n actual <history.html#relnotes>`__. Si cree que puede
ayudar al proyecto de alg?n modo (desarrollando c?digo, donando
hardware, dinero, etc) consulte el art?culo `Contribuir a
FreeBSD <../../articles/contributing/index.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.2.1. ?Qu? puede hacer FreeBSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD tiene muchas caracter?sticas notables. Algunas de ellas son:

.. raw:: html

   <div class="itemizedlist">

-  

   *Multitarea expropiativa* con prioridades din?micamente ajustadas
   para asegurar que distintas aplicaciones y usuarios compartan los
   recursos del sistema de un modo equitativo, incluso bajo la mayor de
   las cargas.

-  

   *Servicios multiusuario* que permiten a mucha gente usar un sistema
   FreeBSD simult?neamente para distintas cosas. ?sto significa, por
   ejemplo, que los perif?ricos del sistema como impresoras y
   dispositivos de cinta son compartidos adecuadamente por varios
   usuarios del sistema o la red, y que pueden establecerse l?mites
   sobre recursos concretos para usuarios o grupos de usuarios,
   protegiendo los recursos cr?ticos del sistema de un uso abusivo.

-  

   Conexi?n de *redes TCP/IP* muy robusta, con soporte para est?ndares
   industriales como SCTP, DHCP, NFS, NIS, PPP, SLIP, IPSec e IPv6. Esto
   quiere decir que su sistema FreeBSD puede interactuar f?cilmente con
   otros sistemas y hacer de servidor en una empresa, proporcionando
   servicios clave como NFS (acceso a ficheros remotos) y servicios de
   correo electr?nico, o proporcinando la presencia en Internet de su
   organizaci?n mediante WWW, FTP, servicios de encaminamiento y
   cortafuegos.

-  

   La *protecci?n de memoria* garantiza que las aplicaciones (o los
   usuarios) no se estorben los unos a los otros. Un error catastr?fico
   en una aplicaci?n no afecta al resto.

-  FreeBSD es un sistema operativo de *32-bits* (de *64-bits* en Alpha,
   Itanium?, AMD64, y UltraSPARC?) y fue dise?ado como tal desde el
   principio.

-  

   *X Window System* (X11R6), est?ndar de la industria, dota a los
   usuarios una interfaz gr?fica (GUI) por el coste de una tarjeta VGA y
   un monitor comunes, y viene con los fuentes completos.

-  

   *Compatibilidad binaria* con muchos programas nativos de Linux, SCO,
   SVR4, BSDI y NetBSD.

-  Hay en Internet miles y miles de aplicaciones *listas para su uso*.
   FreeBSD es compatible a nivel de c?digo fuente con la mayor?a de
   sistemas UNIX? comerciales; por tanto la mayor?a de aplicaciones
   requieren poco o ning?n cambio para compilar en FreeBSD.

-  En Internet hay miles de aplicaciones *f?ciles de portar*. El c?digo
   fuente de FreeBSD es compatible con el de los sistemas UNIX?
   comerciales m?s populares y por ello la mayor?a de las aplicaciones
   tan s?lo necesitan pocos cambios, si es que necesitan alguno, para
   compilar.

-  

   El dise?o de la *memoria virtual* con paginaci?n bajo demanda y de la
   “cach? unificada de VM/buffer” satisface a aplicaciones que requieren
   grandes cantidades de memoria de forma eficiente aun dando respuestas
   interactivas a otros usuarios.

-  

   Soporte para *SMP* en m?quinas con m?ltiples CPUs.

-  

   Una colecci?n completa de herramientas de desarrollo en *C*, *C++*,
   *Fortran*, y *Perl*. Podr? encontrar muchos otros lenguajes avanzados
   para investigaci?n y desarrollo tanto en la la Colecci?n de Ports
   como en forma de *packace*.

-  

   Disponer del *c?digo fuente* del sistema entero significa contar con
   el mayor nivel de control posible sobre su entorno. ?Para qu? atarse
   a una soluci?n propietaria a merced de un fabricante cuando puede
   tener un verdadero sistema abierto?

-  Documentaci?n exhaustiva *en l?nea*.

-  *?Y mucho m?s!*

.. raw:: html

   </div>

FreeBSD est? basado en la versi?n 4.4BSD-Lite del Computer Systems
Research Group (CSRG) de la Universidad de California en Berkeley, y
contin?a la distinguida tradici?n de desarrollo de sistemas BSD. Adem?s
del excelente trabajo del CSRG, el Proyecto FreeBSD ha invertido miles
de horas en ajustar el sistema para conseguir un rendimiento y una
fiabilidad m?ximas en situaciones de carga reales. Mientras que muchos
de los gigantes comerciales se esfuerzan en dotar a los sistemas
operativos para PC de esas caracter?sticas, rendimiento y fiabilidad,
FreeBSD puede ofrecerlas ?*ya*!

Los usos que pueda darle a FreeBSD se ven limitados tan s?lo por su
imaginaci?n. Desde el desarrollo de programas hasta la automatizaci?n de
f?bricas, desde control de inventarios hasta correcci?n de azimut de
antenas de sat?lites remotos; Si puede hacerse con un UNIX? comercial lo
m?s seguro es que tambi?n pueda llevarse a cabo con FreeBSD. FreeBSD
tambi?n hace buen uso de las literalmente miles de aplicaciones de alta
calidad que se desarrollan en centros de investigaci?n y universidades
de todo el mundo, frecuentemente disponibles por poco o ning?n coste.
Tambi?n existen aplicaciones comerciales, cuyo n?mero aumenta cada dia.

Dado que el c?digo fuente de FreeBSD est? disponible para todo el mundo
el sistema puede personalizarse en un grado nunca visto para
aplicaciones o proyectos especiales, y de maneras generalmente
imposibles con los sistemas operativos de la mayor?a de los fabricantes
comerciales. Aqu? damos tan s?lo una muestra de aplicaciones en las que
se est? usando actualmente FreeBSD:

.. raw:: html

   <div class="itemizedlist">

-  *Servicios de Internet:* La robusta conectividad TCP/IP integrada en
   FreeBSD hace de este sistema una plataforma ideal para servicios de
   Internet como:

   .. raw:: html

      <div class="itemizedlist">

   -  

      Servidores FTP

   -  

      Servidores web (est?ndares o seguros [SSL])

   -  

      Cortafuegos y pasarelas NAT (“enmascaramiento IP”).

   -  

      Servidores de correo electr?nico

   -  

      USENET y BBSs

   -  y muchos m?s.

   .. raw:: html

      </div>

   Con FreeBSD puede empezar f?cilmente con un peque?o y econ?mico PC de
   tipo 386 e ir actualizando su equipo hasta un tetraprocesador Xeon
   con almacenamiento RAID a medida que su proyecto crezca.

-  *Educaci?n:* ?Es estudiante de inform?tica o de alg?n campo
   relacionado con la ingenier?a? No hay mejor modo de estudiar sistemas
   operativos, arquitectura de computadores y redes que la experiencia a
   bajo nivel que FreeBSD puede aportar. Para aqu?llos cuyo principal
   inter?s en los ordenadores no es otro que el de poder realizar su
   trabajo existe una serie de paquetes gratuitos de CAD, matem?ticas y
   dise?o gr?fico que hacen de FreeBSD un sistema verdaderamente ?til.

-  *Investigaci?n:* Encontr?ndose disponible el c?digo fuente del
   sistema entero FreeBSD es una excelente plataforma para la
   investigaci?n en sistemas operativos y otras ramas de la inform?tica.
   El hecho de que FreeBSD est? disponible gratu?tamente hace posible
   que grupos remotos puedan colaborar con ideas o compartan desarrollos
   sin tener que preocuparse de acuerdos de licencias especiales o de
   limitaciones acerca de lo que puede discutirse en foros p?blicos.

-  

   *Redes:* ?Necesita un nuevo “router”? ?Un servidor de nombres (DNS)?
   ?Un cortafuegos que haga m?s segura su red interna? FreeBSD puede
   convertir ese PC 386 o 486 que tiene arrinconado en un “router”
   avanzado con sofisticadas capacidades de filtrado de paquetes.

-  

   *Estaci?n de trabajo X:* FreeBSD es una magn?fica elecci?n como
   terminal X de bajo coste gracias al servidor libre X11. A diferencia
   de las terminales X FreeBSD permite ejecutar muchas aplicaciones en
   local si as? se quiere, aligerando de este modo la carga soportada
   por el servidor central. FreeBSD puede incluso arrancar “sin disco”,
   permitiendo que las estaciones sean a?n m?s econ?micas y f?ciles de
   administrar.

-  

   *Desarrollo de software:* El sistema base de FreeBSD incluye una
   completa colecci?n de herramientas de desarrollo que incluyen el
   famoso compilador y depurador de C/C++ de GNU.

.. raw:: html

   </div>

Puede conseguir FreeBSD tanto en forma de c?digo fuente como binaria por
FTP an?nimo o en CDROM. Por favor, consulte el `Cap?tulo?30, *C?mo
obtener FreeBSD* <mirrors.html>`__ para m?s informaci?n.

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

1.2.2. ?Qui?n usa FreeBSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos de los mayores sitios web de Internet utilizan FreeBSD; he aqu?
algunos de ellos:

.. raw:: html

   <div class="itemizedlist">

-  

   `Yahoo! <http://www.yahoo.com/>`__

-  

   `Apache <http://www.apache.org/>`__

-  

   `Blue Mountain Arts <http://www.bluemountain.com/>`__

-  

   `Pair Networks <http://www.pair.com/>`__

-  

   `Sony Jap?n <http://www.sony.co.jp/>`__

-  

   `Netcraft <http://www.netcraft.com/>`__

-  

   `Weathernews <http://www.wni.com/>`__

-  

   `Supervalu <http://www.supervalu.com/>`__

-  

   `TELEHOUSE America <http://www.telehouse.com/>`__

-  

   `Sophos Anti-Virus <http://www.sophos.com/>`__

-  

   `JMA Wired <http://www.jmawired.com/>`__

.. raw:: html

   </div>

y muchos m?s.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------+-------------------------------------+
| `Anterior <introduction.html>`__?   | `Subir <introduction.html>`__   | ?\ `Siguiente <history.html>`__     |
+-------------------------------------+---------------------------------+-------------------------------------+
| Cap?tulo 1. Introducci?n?           | `Inicio <index.html>`__         | ?1.3. Acerca del Proyecto FreeBSD   |
+-------------------------------------+---------------------------------+-------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

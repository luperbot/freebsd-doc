===================================
Informaci?n de Seguridad en FreeBSD
===================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Cabecera y Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

Enlaces externos
----------------

.. raw:: html

   <div id="SEARCHNAV">

-  `Donaciones <../../donations/>`__
-  `Contactar <../mailto.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div id="SEARCH">

.. raw:: html

   <div>

Buscar
------

.. raw:: html

   <div>

?

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

   <div id="topnav">

-  `Inicio <../>`__
-  `Sobre <../about.html>`__
-  `Descargar <../where.html>`__
-  `Documentaci?n <../docs.html>`__
-  `Comunidad <../community.html>`__
-  `Desarrollo <../projects/index.html>`__
-  `Soporte <../support.html>`__
-  `Fundaci?n <http://www.freebsdfoundation.org/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Navegaci?n por secciones
------------------------

-  `Soporte <../support.html>`__
-  `Distribuidores comerciales <../../commercial/>`__

   -  `Software <../../commercial/software_bycat.html>`__
   -  `Hardware <../../commercial/hardware.html>`__
   -  `Consultor?a <../../commercial/consult_bycat.html>`__
   -  `ISP <../../commercial/isp.html>`__
   -  `Otros <../../commercial/misc.html>`__

-  `Informaci?n de seguridad <../security/index.html>`__

   -  `Avisos <../security/advisories.html>`__

-  `Informes de error <../../support/bugreports.html>`__

   -  `Enviar un informe de error <../send-pr.html>`__

-  `Recursos web <../../support/webresources.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Informaci?n de Seguridad en FreeBSD
===================================

Introducci?n
------------

El objetivo de esta p?gina es orientar a los usuarios, tanto noveles
como experimentados, en el ?rea de seguridad del Sistema Operativo
FreeBSD. El equipo de Desarrollo de FreeBSD se toma la seguridad muy en
serio y trabaja constantemente para hacer el Sistema Operativo tan
seguro como sea posible.

Aqu? podr?s encontrar informaci?n adicional, o enlaces a informaci?n,
acerca de c?mo proteger tu sistema contra varios tipos de ataque del
exterior, con qui?n contactar si encuentra un error de software
relacionado con la seguridad, etc. Tambi?n hay una secci?n que trata de
las distintas formas en que el programador de sistemas puede
concienciarse acerca de la seguridad, de modo que sea menos probable la
introducci?n de defectos de seguridad en el software.

Contenidos
----------

-  `Informaci?n acerca del FreeBSD Security Officer <#sec>`__
-  `FreeBSD Security Advisories <#adv>`__
-  `Informaci?n sobre Listas de Distribuci?n sobre seguridad en
   FreeBSD <#ml>`__
-  `Consejos sobre seguridad en FreeBSD <#tat>`__
-  `Pautas para la programaci?n segura <#spg>`__
-  `Otra informaci?n relacionada con la seguridad <#misc>`__

El FreeBSD Security Officer
---------------------------

Con el objetivo de coordinar mejor el intercambio de informaci?n con
otras personas o entidades relacionadas con el ?mbito de la seguridad,
FreeBSD tiene un punto focal para las comunicaciones relacionadas con la
seguridad: el FreeBSD `security
officer <mailto:security-officer@FreeBSD.org>`__. El puesto est?
actualmente ocupado por un equipo de security officers dedicados, siendo
sus tareas principales emitir advisories cuando hay defectos de
seguridad conocidos y actuar ante los informes de posibles problemas de
seguridad con FreeBSD.

Si necesitas contactar con alguien del equipo de FreeBSD acerca de un
posible error de software relacionado con la seguridad por favor hazlo
por `correo al Security
Officer <mailto:security-officer@FreeBSD.org>`__, incluyendo una
descripci?n de lo que has encontrado y el tipo de vulnerabilidad que
representa. El Security Officer tambi?n est? en contacto con los
diferentes equipos `CERT <http://www.cert.org>`__\ y
`FIRST <http://www.first.org/>`__ en todo el mundo, con los que comparte
informaci?n acerca de posibles vulnerabilidades en FreeBSD o programas
de utilidad usados por FreeBSD. Los Security Officers tambi?n son
miembros activos de dichas organizaciones.

Si necesitas contactar con el Security Officer acera de alg?n asunto
especialmente delicado, usa su `clave
PGP <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/public_key.asc>`__ para
encriptar el mensaje antes de enviarlo.

FreeBSD Security Advisories
---------------------------

Los FreeBSD Security Officers proporcionan security advisories para las
releases de FreeBSD siguientes:

-  La release oficial de FreeBSD m?s reciente.
-  FreeBSD-current.
-  FreeBSD-stable, cuando hay al menos 2 releases basadas en ?l.
-  FreeBSD-stable anterior cuando un "nuevo stable" aun no tiene 2
   releases basadas en ?l.

En este momento hay disponibles security advisories para:

-  FreeBSD 2.2.8
-  FreeBSD 3.1
-  FreeBSD 3.2
-  FreeBSD-current
-  FreeBSD-stable

No hay mantenimiento para releases anteriores a estas. Se recomienda a
los usuarios se actualicen a una de las releases arriba mencionadas.

Como todos los esfuerzos de desarrollo, las reparaciones de seguridad se
incorporan primero en la rama
`FreeBSD-current <../../handbook/cutting-edge.html#CURRENT>`__. Despu?s
de un par de d?as de prueba la reparaci?n se incorpora en las ramas
FreeBSD-stable soportadas y se emite un advisory.

Los advisories se env?an a las siguientes listas de distribuci?n de
FreeBSD:

-  FreeBSD-security-notifications@FreeBSD.org
-  FreeBSD-security@FreeBSD.org
-  FreeBSD-announce@FreeBSD.org

Los advisories se firman siempre usando la `clave
PGP <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/public_key.asc>`__ del
FreeBSD Security Officer y se archivan, junto con los patches asociados,
en nuestro `repositorio FTP
CERT <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/index.html>`__. En el
momento de escribir esto est?n disponibles los advisories siguientes:

-  `FreeBSD-SA-96:01.sliplogin.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:01.sliplogin.asc>`__
-  `FreeBSD-SA-96:02.apache.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:02.apache.asc>`__
-  `FreeBSD-SA-96:03.sendmail-suggestion.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:03.sendmail-suggestion.asc>`__
-  `FreeBSD-SA-96:08.syslog.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:08.syslog.asc>`__
-  `FreeBSD-SA-96:09.vfsload.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:09.vfsload.asc>`__
-  `FreeBSD-SA-96:10.mount\_union.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:10.mount_union.asc>`__
-  `FreeBSD-SA-96:11.man.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:11.man.asc>`__
-  `FreeBSD-SA-96:12.perl.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:12.perl.asc>`__
-  `FreeBSD-SA-96:13.comsat.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:13.comsat.asc>`__
-  `FreeBSD-SA-96:14.ipfw.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:14.ipfw.asc>`__
-  `FreeBSD-SA-96:15.ppp.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:15.ppp.asc>`__
-  `FreeBSD-SA-96:16.rdist.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:16.rdist.asc>`__
-  `FreeBSD-SA-96:17.rzsz.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:17.rzsz.asc>`__
-  `FreeBSD-SA-96:18.lpr.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:18.lpr.asc>`__
-  `FreeBSD-SA-96:19.modstat.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:19.modstat.asc>`__
-  `FreeBSD-SA-96:20.stack-overflow.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:20.stack-overflow.asc>`__
-  `FreeBSD-SA-96:21.talkd.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-96:21.talkd.asc>`__
-  `FreeBSD-SA-97:01.setlocale <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-97:01.setlocale>`__
-  `FreeBSD-SA-97:02.lpd.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-97:02.lpd.asc>`__
-  `FreeBSD-SA-97:03.sysinstall.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-97:03.sysinstall.asc>`__
-  `FreeBSD-SA-97:04.procfs.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-97:04.procfs.asc>`__
-  `FreeBSD-SA-97:05.open.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-97:05.open.asc>`__
-  `FreeBSD-SA-97:06.f00f.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-97:06.f00f.asc>`__
-  `FreeBSD-SA-98:01.land.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:01.land.asc>`__
-  `FreeBSD-SA-98:02.mmap.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:02.mmap.asc>`__
-  `FreeBSD-SA-98:03.ttcp.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:03.ttcp.asc>`__
-  `FreeBSD-SA-98:04.mmap.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:04.mmap.asc>`__
-  `FreeBSD-SA-98:05.nfs.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:05.nfs.asc>`__
-  `FreeBSD-SA-98:06.icmp.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:06.icmp.asc>`__
-  `FreeBSD-SA-98:07.rst.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:07.rst.asc>`__
-  `FreeBSD-SA-98:08.fragment.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:08.fragment.asc>`__
-  `FreeBSD-SA-99:01.chflags.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-99:01.chflags.asc>`__
-  `FreeBSD-SA-99:02.profil.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-99:02.profil.asc>`__
-  `FreeBSD-SA-99:03.ftpd.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-99:03.ftpd.asc>`__
-  `FreeBSD-SA-99:04.core.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-99:04.core.asc>`__
-  `FreeBSD-SA-99:05.fts.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-99:05.fts.asc>`__
-  `FreeBSD-SA-99:06.amd.asc <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-99:06.amd.asc>`__

Informaci?n acerca de las Listas de Distribuci?n sobre Seguridad en FreeBSD
---------------------------------------------------------------------------

Si eres administrador o usuario de uno o m?s sistemas FreeBSD, quiz?s
quieras suscribirte a alguna de las listas siguientes:

::

    FreeBSD-security                Discusiones relacionadas con la seguridad en general
    FreeBSD-security-notifications  Notificaciones sobre seguridad (lista moderada)

Env?e un mensaje a
`majordomo@FreeBSD.ORG <mailto:majordomo@FreeBSD.org>`__ con
::

         subscribe <nombre_de_la_lista>  [<direcci?n_email_opcional>]

en el cuerpo del mensaje para suscribirse. Por ejemplo:
::

    % echo "subscribe FreeBSD-security" | mail majordomo@FreeBSD.org

y si quieres desuscribirte de una lista de distribuci?n:
::

    % echo "unsubscribe FreeBSD-security" | mail majordomo@FreeBSD.org

Pautas para la Programaci?n Segura
----------------------------------

-  Nunca te f?es de ninguna fuente de entrada, i.e. argumentos en la
   l?nea de comando, variables de entorno, ficheros de configuraci?n,
   paquetes TCP/UDP/ICMP entrantes, argumentos de funciones, etc. Si la
   longitud o el contenido de los datos recibidos est?n sujetos,
   siquiera m?nimamente, al control desde el exterior, el programa o la
   funci?n deber?a tenerlo en cuenta cuando maneja dichos datos. Podemos
   considerar los apartados siguientes desde el punto de vista de la
   seguridad:

   -  Llamadas a strcpy() y sprintf() para datos de longitud ilimitada.
      Usa strncpy() y snprintf() cuando la longitud sea conocida (o
      implementa algun otro m?todo de control de l?mites cuando sea
      desconocida). No uses nunca gets() ni sprintf(), punto. Si lo
      haces, te acosar?n sin tregua duendes malvados.

   -  Si tienes que validar los datos de entrada del usuario para evitar
      que contengan caracteres err?neos de cualquier clase, NO valides
      la presencia de dichos caracteres err?neos. Simplemente verifica
      que la entrada consiste SOLO en los caracteres permitidos. La idea
      es: todo lo que no est? expl?citamente permitido est? prohibido.

   -  Lee las p?ginas del manual para las llamadas strncpy() y
      strncat(). Aseg?rate de entender c?mo funcionan!!! As? como
      strncpy() puede no a?adir un \\0 final, strncat() s? lo a?ade.

   -  Vigila el abuso de strvis() y getenv(). Con strvis() es f?cil
      cometer un error con la cadena de destino, y getenv() podr?a
      devolver cadenas mucho m?s largas de lo que el programa espera.
      Estas dos funciones son, a menudo, una de las v?as principales de
      ataque contra un programa, provocando que este sobreescriba la
      pila o las variables al recibir variables de entorno con valores
      no contemplados. Si tu programa lee variables de entorno, se
      paranoico. Se muy paranoico!

   -  Cada vez que uses las llamadas open() o stat() preg?ntate: " Y si
      es un enlace simb?lico ?"

   -  Aseg?rate de usar mkstemp() en lugar de mktemp(), tempnam(), etc.
      Aseg?rate tambi?n de buscar problemas de acceso concurrente en
      general en /tmp, teniendo en cuenta que hay muy pocas cosas que
      pueden ser at?micas en /tmp:

      -  Crear un directorio. O funciona o no funciona.
      -  Abrir un fichero O\_CREAT \| O\_EXECL

      Si se usa mkstemp() la funci?n tratar? por t? estos casos
      adecuadamente. De aqu? que todos los ficheros temporales deber?an
      usar mkstemp() para garantizar que no se produzcan problemas de
      acceso concurrente y que los permisos son correctos.

   -  Un atacante que consiga que los paquetes vayan a/vengan de un
      sistema arbitrario tendr? el control completo de los datos que
      recibimos, por lo tanto **NINGUNO** de estos datos ser? de fiar.

   -  Nunca d?s por hecho que un fichero de configuraci?n estar?
      correctamente formateado o que habr? sido generado por el programa
      de utilidad apropiado. No conf?es en que las entradas del usuario
      tales como nombres de terminal o cadenas del lenguaje estar?n
      libres de '/' o '../../../' si hay la m?nima posibilidad de que
      puedan ser usadas en un nombre de path. No conf?es en **NINGUN**
      path proporcionado por el usuario cuando el programa se ejecuta
      setuid root.

   -  Busca fallos o puntos d?biles en la forma de almacenar los datos.
      Todos los ficheros temporales deber?an tener permisos de la forma
      600 para protegerlos de ojos curiosos.

   -  No te limites a buscar con grep los sospechosos habituales en
      programas que se ejecutan con privilegios elevados. Busca los
      posibles desbordamientos l?nea a l?nea, hay much?simas m?s formas
      de provocar un desbordamiento de memoria adem?s de mediante el
      abuso de strcpy() y sus amigos.

   -  El simple hecho de restringir privilegios en alg?n punto no
      significa que no haya manera de explotar el recurso en cuesti?n.
      El atacante podr?a colocar el c?digo necesario en la pila para
      recuperar los privilegios antes de ejecutar /bin/sh.

-  Administra los uid. Elimina privilegios tan pronto como sea posible,
   y elim?nalos de verdad. Cambiar entre euid y uid NO es suficiente.
   Usa setuid() siempre que puedas.

-  Nunca muestres el contenido de ficheros de configuraci?n cuando
   ocurra un error. Un n?mero de l?nea y quiz?s un contador de posici?n
   es suficiente. Esto mismo es igualmente cierto para todas las
   librer?as y todos los programas suid/gid.

-  Consejos para quienes revisen c?digo existente debido a problemas de
   seguridad:

   -  Si no est?s seguro de tus reparaciones de seguridad, env?alas para
      ser revisadas a alguien con quien as? lo hayas acordado
      previamente. No entregues c?digo del que no est?s seguro, llegar a
      estropear algo en nombre de las reparaciones de seguridad resulta
      bastante embarazoso.

   -  Aquellos con privilegios de entrega ("commit") para CVS deber?an
      asegurarse de que alguien con dichos privilegios est? entre los
      ?ltimos en revisar los cambios. Dicha persona revisar? e
      incorporar? la versi?n final que se desea tener en el ?rbol.

   -  Cuando distribuyas cambios para ser revisados usa siempre diffs
      con formato context o unidiff. De este modo los diffs pueden ser
      f?cilmente proporcionados como entrada a patch(1). No te limites a
      enviar los ficheros enteros. Los diffs son m?s f?ciles de leer y
      aplicar al c?digo fuente local (especialmente a aquel en el que
      podr?an tener lugar m?ltiples cambios simult?neamente). Todos los
      cambios deber?an referirse a la rama de desarrollo -current.

   -  Prueba tu mismo todos los cambios (i.e. compila y ejecuta el
      c?digo fuente afectado) antes de enviarlos a otra persona para que
      los revise. A nadie le gusta que le env?en material averiado para
      revisar, y adem?s produce la impresi?n de que el remitente ni
      siquiera se fij? en lo que estaba haciendo (lo que no contribuye
      precisamente a dar una sensaci?n de confianza). Si necesita una
      cuenta en una m?quina donde hay una versi?n espec?fica que no
      tienes a mano, simplemente pregunta. El proyecto tiene recursos
      asignados para ese prop?sito en concreto.

   -  Nota para los responsables de la entrega de c?digo ("commit"): no
      se debe olvidar incorporar a la rama -stable los patches hechos
      sobre -current, de la forma que sea adecuada.

   -  No reescribas c?digo innecesariamente para acomodarlo a tu estilo/
      gustos. Esto s?lo hace el trabajo de quienes lo revisan m?s
      dif?cil. Hazlo s?lo si hay razones claras para ello.

-  Busca programas que hagan cosas complicadas con los gestores de
   se?ales. Muchas rutinas en varias bibliotecas no son lo
   suficientemente reentrantes como para hacerlo con seguridad.

-  Presta especial atenci?n al uso de realloc(). Lo habitual es no usar
   la funci?n correctamente.

-  Cuando uses ?reas de memoria de longitud fija use sizeof() para
   evitar p?rdidas cuando se cambia el tama?o del ?rea pero no el c?digo
   que la usa. Por ejemplo:

   ::

               char buf[1024];
               struct foo { ... };
               ...
       MAL:
               xxx(buf, 1024)
               xxx(yyy, sizeof(struct foo))
       BIEN:
               xxx(buf, sizeof(buf))
               xxx(yyy, sizeof(yyy))

   Ten cuidado al aplicar sizeof a un puntero cuando lo que quieres es
   el tama?o del objeto referenciado!

-  Siempre que veas "char foo[###]", comprueba cada uso de foo para
   asegurarte de que no se desbordar?. Si no puedes evitar el
   desbordamiento (se han dado casos), usa malloc como mal menor para
   ubicar el ?rea de memoria, de este modo evitar?s sobreescribir la
   pila.

-  Cierra siempre los descriptores de ficheros tan pronto como puedas,
   lo que har? m?s probable que los contenidos del ?rea de memoria de
   entrada de stdio() sean desechados. En rutinas de biblioteca, dispon
   siempre los descriptores de ficheros que abras de modo que se cierren
   tras lanzar con ?xito otro proceso.

Consejos sobre seguridad en FreeBSD
-----------------------------------

Se deben ejecutar varios pasos para hacer seguro un sistema FreeBSD
(para el caso, cualquier sistema UNIX?):

-  | Inhabilitar todo software potencialmente peligroso

   | Gran cantidad de software debe ser ejecutado con un usuario
     privilegiado especial para poder hacer uso de recursos espec?ficos,
     haciendo el ejecutable set-uid. Un ejemplo es el software UUCP o
     PPP, que hacen uso del puerto serie, o sendmail, que tiene que
     escribir en el spool de correo y conectar con un puerto de red
     privilegiado. Si no usas UUCP de poco sirve tener en su sistema el
     software asociado; ser?a prudente inhabilitarlo. Desde luego, esto
     requiere saber a ciencia cierta lo que puede ser eliminado y lo que
     no, as? como tener claro si se va a necesitar o no dicha
     funcionalidad en el futuro.

   | Lo mismo se puede decir de aquellos programas de utilidad que no
     consideres lo bastante ?tiles y que supongan un posible riesgo para
     la seguridad, como swapinfo. Si elminas el bit set-uid del
     ejecutable (por medio del comando "chmod ug-s nombre-de-fichero")
     siempre habr? la posibildad de que el usuario root pueda usar
     swapinfo. Sin embargo no es una buena idea elminar tantos sbits que
     se haga necesario ser root cont?nuamente.

   No s?lo elimines programas que no uses, elimina tambi?n servicios que
   no quieras o necesites suministrar. Esto se puede hacer editando los
   ficheros ``/etc/inetd.conf`` y ``/etc/rc.conf`` e inhabilitando los
   servicios que no quieras usar.

-  | Reparar el software con errores que afecten a la seguridad (o c?mo
     mantenerse un paso por delante de los crackers)

   Aseg?rate de suscribirte a las diferentes `Listas de ditribuci?n
   sobre seguridad en FreeBSD <#ml>`__ para obtener actualizaciones
   relacionadas con los errores que afectan a la seguridad y
   reparaciones. Aplica las reparaciones inmediatamente.

-  | Copias de seguridad. Repare su sistema si una violaci?n de la
     seguridad llegara a ocurrir

   Disponga siempre de copias de seguridad y de una versi?n limpia del
   sistema operativo (por ejemplo en CD-Rom). Aseg?rese de que sus
   copias de seguridad no contienen datos alterados o modificados por el
   atacante.

-  | Instala software pare vigilar el estado del sistema

   Programas como tcp wrappers y tripwire (ambos en packages/ports)
   pueden ayudarte a monitorizar la actividad en tu sistema. Esto hace
   m?s f?cil la detecci?n de irrupciones. Lee tambi?n la salida de los
   scripts de /etc/security, que se ejecutan diariamente y se env?an por
   correo a la cuenta root.

-  | Educa a la gente que trabaja en el sistema

   Los usuarios deber?an ser conscientes de lo que hacen. Deber?as
   indicarles que nunca revelen su password a nadie y que usen passwords
   dif?ciles de adivinar. Hazles entender que la seguridad del
   sistema/de la red est? parcialmente en sus manos.

Tambi?n hay un documento PASO a PASO ("HowTo") sobre seguridad en
FreeBSD disponible que proporciona algunos consejos avanzados acerca de
c?mo mejorar la seguridad de su sistema. Puede ser consultado en
http://www.FreeBSD.org/~jkb/howto.html.

La seguridad es un proceso cont?nuo. Aseg?rate de estar al d?a con los
avances en el campo de la seguridad.

Qu? hacer si detectas que la seguridad ha sido comprometida
-----------------------------------------------------------

-  **Determina el alcance de la violaci?n de seguridad**
    Qu? privilegios consigui? el atacante ? Consigui? acceso de root ?
   Consigui? acceso s?lo en el nivel de usuario ?
-  **Determina si se ha alterado el estado del sistema (?mbito del
   kernel o de usuario)**
    Qu? software ha sido alterado? Se instal? un nuevo kernel ? Ha sido
   modificado alguno de los archivos binarios del sistema (tales como
   telnetd, login, etc.) ? Si sospechas que un atacante puede haber
   causado cualquier alteraci?n en un sistema operativo, podr?as
   considerar conveniente reinstalar el sistema operativo desde un medio
   seguro.
-  **Averigua c?mo se logr? la irrupci?n**
    Ocurri? por medio de un error de seguridad bien conocido ? Si este
   es el caso, aseg?rate de instalar los patches correctos. Tuvo ?xito
   la irrupci?n debido a una mala configuraci?n ? Fue el resultado de un
   error desconocido hasta el momento ? Si sospechas que la irrupci?n
   ocurri? por medio de un error nuevo, deber?as advertir al `FreeBSD
   Security Officer <mailto:security-officer@FreeBSD.org>`__.
-  **Repara el defecto de seguridad**
    Instala nuevo software o aplica patches al antiguo para reparar los
   problemas. Inhabilita las cuentas que ya han sido comprometidas.
-  **Otros recursos**
    `CERT <http://www.cert.org>`__ tambi?n ofrece `informaci?n
   detallada <http://www.cert.org/nav/recovering.html>`__ acerca de qu?
   pasos seguir en caso de que un sistema se vea comprometido.

Otra Informaci?n Relacionada Con La Seguridad
---------------------------------------------

-  `El archivo
   COAST <http://www.cs.purdue.edu/coast/archive/index.html>`__ contiene
   una vasta colecci?n de materiales relacionados con la securidad.
-  `La COAST Security
   Hotlist <http://www.cs.purdue.edu/coast/hotlist/>`__ es el lugar
   donde empezar a buscar materiales relacionados con la seguridad.
   Contiene cientos de enlaces ?tiles. Todo lo que siempre quiso saber
   sobre seguridad ... y m?s.
-  Los diferentes equipos CERT tales como http://www.cert.org y
   http://www.auscert.org.au.
-  Listas de distribuci?n como
   `Bugtraq <http://www.ecurityfocus.com/forums/bugtraq/intro.html>`__ y
   `Firewall
   Wizards <http://www.nfr.net/forum/firewall-wizards.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Mapa del sitio <../search/index-site.html>`__ \| `Noticias del
Copyright <../copyright/>`__ \| ? 1995-2010 El Proyecto FreeBSD. Quedan
reservados todos los derechos.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ..

========
Prefacio
========

.. raw:: html

   <div class="navheader">

Prefacio
`Anterior <index.html>`__?
?
?\ `Siguiente <getting-started.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="preface">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A qui?n va dirigido este texto
------------------------------

La primera secci?n de este libro est? pensada para guiar a los reci?n
llegados a FreeBSD durante el proceso de instalaci?n y presentarles los
conceptos y convenciones que dan entidad a UNIX?. Para sacar provecho de
esta secci?n lo ?nico que el lector necesitar? son ganas de explorar y
habilidad para ir interiorizando nuevos conceptos a medida que le van
planteando.

La siguiente secci?n, la segunda, mucho m?s extensa, es una referencia
completa de todo tipo de temas de inter?s para administradores de
sistemas FreeBSD. Es posible que alguno de esos cap?tulos requiera que
previamente lea otros textos; si es el caso esto se anuncia en la
sinopsis situada al principio de cada cap?tulo.

Hay una lista de fuentes de informaci?n adicionales en el `Cap?tulo?31,
*Bibliograf?a* <bibliography.html>`__.

Cambios desde la segunda edici?n
--------------------------------

Esta tercera edici?n es la culminaci?n de m?s de dos a?os de trabajo de
los miembros del FreeBSD Documentation Project. Estos son los cambios
m?s importantes que encontrar? en esta nueva edici?n:

.. raw:: html

   <div class="itemizedlist">

-  `Cap?tulo?11, *Configuraci?n y Adaptaci?n del
   Sistema* <config-tuning.html>`__, configuraci?n y adaptaci?n del
   sistema, ha sido ampliado con nuevos datos sobre el sistema de
   gesti?n de energ?a y recursos ACPI, la utilidad del sistema ``cron``
   y m?s opciones de personalizaci?n del kernel.

-  `Cap?tulo?14, *Seguridad* <security.html>`__, seguridad, ha sido
   ampliado con informaci?n sobre redes privadas virtuales (VPN), listas
   de control de accesos al sistema de ficheros (m?s conocidas por ACL)
   e informaci?n sobre avisos de seguridad.

-  `Cap?tulo?16, *Mandatory Access Control* <mac.html>`__, Mandatory
   Access Control (MAC), es un cap?tulo nuevo. En ?l se expone qu? es
   MAC y de qu? forma puede utilizarse en FreeBSD como complemento de la
   seguridad del sistema.

-  `Cap?tulo?18, *Almacenamiento* <disks.html>`__, almacenamiento, se ha
   ampliado con informaci?n sobre dispositivos USB de almacenamiento,
   instant?neas (“snapshots”) de sistemas de ficheros, sistemas de
   ficheros basados en ficheros y en red, y particiones de disco
   cifradas.

-  `Cap?tulo?20, *El Gestor de Vol?menes Vinum* <vinum-vinum.html>`__,
   Vinum, es un cap?tulo nuevo. Describe el uso de Vinum, un gestor de
   vol?menes l?gicos que permite disponer de discos l?gicos
   independientes de dispositivo, as? como de RAID-0, RAID-1 y RAID-5
   por software.

-  Se ha a?adido una secci?n de depuraci?n de problemas al `Cap?tulo?25,
   *PPP y SLIP* <ppp-and-slip.html>`__, PPP y SLIP.

-  `Cap?tulo?27, *Correo Electr?nico* <mail.html>`__, correo
   electr?nico, ha sido ampliado con informaci?n sobre el uso de MTA
   alternativos, autentificaci?n SMTP, UUCP, fetchmail, procmail as?
   como otros temas avanzados relacionados con el correo.

-  `Cap?tulo?28, *Servidores de red* <network-servers.html>`__,
   servidores de red, es un cap?tulo nuevo. En ?l se incluye informaci?n
   sobre la configuraci?n de Apache HTTP Server, ftpd y c?mo configurar
   Samba para su uso con clientes Microsoft? Windows?. Ciertas partes de
   `Cap?tulo?29, *Networking avanzado* <advanced-networking.html>`__,
   “networking” avanzado, se han trasladado a este cap?tulo para dar m?s
   solidez al contenido.

-  `Cap?tulo?29, *Networking avanzado* <advanced-networking.html>`__,
   “networking” avanzado, incluye en esta edici?n nuevos datos sobre el
   uso de dispositivos Bluetooth? en FreeBSD, la configuraci?n de redes
   “wireless” y el “networking” ATM (Asynchronous Transfer Mode).

-  Se ha creado un glosario para disponer de una ubicaci?n centralizada
   donde encontrar definiciones de t?rminos t?cnicos que se utilizan a
   lo largo del libro.

-  Las tablas e im?genes que aparecen en el libro han experimentado
   diversas mejoras est?ticas.

.. raw:: html

   </div>

Cambios desde la primera edici?n
--------------------------------

La segunda edici?n fue la culminaci?n de m?s de dos a?os de trabajo de
los miembros del FreeBSD Documentation Project. Estos son los
principales cambios que encontrar? en esta edici?n:

.. raw:: html

   <div class="itemizedlist">

-  Se ha creado un ?ndice completo.

-  Todos los esquemas ASCII han sido reemplazados por diagramas
   gr?ficos.

-  Se ha a?adido una sinopsis est?ndar a cada cap?tulo donde se ofrece
   un breve sumario del contenido del cap?tulo y qu? se espera que sepa
   el lector para poder sacarle provecho.

-  Se ha reorganizado de forma l?gica el contenido en tres partes:
   “primeros pasos”, “administraci?n del sistema ” y “ap?ndices”.

-  El `Cap?tulo?2, *Instalaci?n de FreeBSD* <install.html>`__
   (“instalaci?n de FreeBSD”) ha sido reescrito completamente e incluye
   gran cantidad de capturas de pantalla para facilitar su comprensi?n a
   los nuevos usuarios.

-  El `Cap?tulo?3, *Conceptos b?sicos de Unix* <basics.html>`__
   (“conceptos b?sicos de UNIX?”) se ha ampliado con m?s informaci?n
   sobre procesos, d?mons y se?ales.

-  El `Cap?tulo?4, *Instalaci?n de aplicaciones: ?packages? y
   ports* <ports.html>`__ (“instalaci?n de aplicaciones”) incluye
   informaci?n sobre la gesti?n de paquetes binarios.

-  El `Cap?tulo?5, *El sistema X Window* <x11.html>`__, (“El sistema X
   Window”) ha sido reescrito totalmente, con especial ?nfasis en el uso
   de modernas tecnolog?as de escritorio como KDE y GNOME en XFree86™
   4.X.

-  El `Cap?tulo?12, *El proceso de arranque en FreeBSD* <boot.html>`__
   (“El proceso de arranque de FreeBSD”) ha sido ampliado.

-  El `Cap?tulo?18, *Almacenamiento* <disks.html>`__ (“Almacenamiento”)
   ha sido el fruto de refundir el contenido de lo eran dos cap?tulos
   sobre “discos” y “copias de seguridad”. Pensamos que estos temas eran
   m?s f?ciles de entender si se trataban en un mismo cap?tulo. Se ha
   a?adido tambi?n una secci?n sobre RAID (tanto hardware como
   software).

-  El `Cap?tulo?24, *Comunicaciones serie* <serialcomms.html>`__
   (“communicaciones serie”) ha sido reorganizado y actualizado
   completamente con informaci?n sobre FreeBSD 4.X y 5.X.

-  El `Cap?tulo?25, *PPP y SLIP* <ppp-and-slip.html>`__ (“PPP y SLIP”)
   ha sido actualizado en gran parte.

-  Se han a?adido muchas secciones nuevas al `Cap?tulo?29, *Networking
   avanzado* <advanced-networking.html>`__ (“Networking avanzado”).

-  El `Cap?tulo?27, *Correo Electr?nico* <mail.html>`__ (“correo
   electr?nico” incluye ahora m?s informaci?n sobre la configuraci?n de
   sendmail.

-  El `Cap?tulo?10, *Compatibilidad binaria con
   Linux* <linuxemu.html>`__ (“compatibilidad conLinux?”) se ha ampliado
   con informaci?n sobre la instalaci?n de Oracle? y SAP??R/3?.

-  En esta segunda edici?n se incluyen tambi?n estos nuevos contenidos:

   .. raw:: html

      <div class="itemizedlist">

   -  Configuraci?n y adaptaci?n del sistema (`Cap?tulo?11,
      *Configuraci?n y Adaptaci?n del Sistema* <config-tuning.html>`__).

   -  Multimedia (`Cap?tulo?7, *Multimedia* <multimedia.html>`__)

   .. raw:: html

      </div>

.. raw:: html

   </div>

C?mo se organiza este libro
---------------------------

Este libro se divide en cinco secciones l?gicamente distintas. La
primera, *primeros pasos*, trata sobre la instalaci?n y el uso m?s
b?sico de FreeBSD. Est? pensada para que el lector los recorra en
secuencialmente, aunque puede saltarse algunos si tratan sobre temas que
le resulten familiares. La segunda secci?n, *Tareas comunes*, est?
dedicada a las caracter?sticas de FreeBSD que suelen utilizarse con m?s
frecuencia. Esta secci?n, as? como las siguientes, pueden leerse en
cualquier orden. Cada cap?tulo comienza con una sinopsis sucinta en la
que se describe el contenido del cap?tulo y qu? es lo que se espera que
sepa el lector antes de leerlo. Esto se hace para dar ocasi?n al lector
ocasional a que elija el cap?tulo que m?s pueda interesarle. La tercera
secci?n, *Administraci?n del sistema*, trata sobre diversos aspectos de
la administraci?n del sistema. La cuarta secci?n, *Redes y
comunicaciones*, est? dedicada al “networking” y temas relacionados con
los servidores. La quinta secci?n dispone de ap?ndices con informaci?n
de referencia.

.. raw:: html

   <div class="variablelist">

*`Cap?tulo?1, *Introducci?n* <introduction.html>`__, Presentaci?n*
    Este cap?tulo, como su nombre indica, presenta FreeBSD al usuario.
    En ?l se cuenta la historia del Proyecto FreeBSD, sus objetivos y su
    modelo de desarrollo.

*`Cap?tulo?2, *Instalaci?n de FreeBSD* <install.html>`__, Instalaci?n*
    Gu?a al usuario a trav?s de un proceso completo de instalaci?n. Se
    explican tambi?n algunos aspectos avanzados como la instalaci?n a
    trav?s de una consola serie.

*`Cap?tulo?3, *Conceptos b?sicos de Unix* <basics.html>`__, Conceptos
b?sicos de UNIX?*
    Se explican los comandos m?s b?sicos y el funcionamiento del sistema
    operativo FreeBSD. Si ya se tiene experiencia con Linux? u otro tipo
    de UNIX? posiblemente sea este un cap?tulo que no deba leerse.

*`Cap?tulo?4, *Instalaci?n de aplicaciones: ?packages? y
ports* <ports.html>`__, Instalaci?n de aplicaciones*
    Se explica la instalaci?n de software desarrollado por personas
    ajenas al proyecto, tanto mediante la innovadora “Colecci?n de
    Ports” de FreeBSD como mediante paquetes binarios est?ndar
    (“packages”).

*`Cap?tulo?5, *El sistema X Window* <x11.html>`__, El sistema X Window*
    Describe el sistema X Windows en general y su uso en FreeBSD en
    particular. Describe tambi?n entornos de escritorio de uso com?n
    como KDE y GNOME.

*`Cap?tulo?6, *Aplicaciones de escritorio* <desktop.html>`__,
Aplicaciones de escritorio*
    Se enumeran algunas aplicaciones de escritorio muy comunes, como
    navegadores web y suites ofim?ticas, y c?mo instalar estas
    aplicaciones en FreeBSD.

*`Cap?tulo?7, *Multimedia* <multimedia.html>`__, Multimedia*
    Trata sobre la configuraci?n la reproducci?n de sonido y v?deo en su
    sistema. Describe tambi?n algunas aplicaciones de sonido y v?deo.

*`Cap?tulo?8, *Configuraci?n del kernel de
FreeBSD* <kernelconfig.html>`__, Configuraci?n del kernel de FreeBSD*
    Explica bajo qu? circunstancias tendr? que configurar un nuevo
    kernel y facilita instrucciones detalladas para la configuraci?n,
    compilaci?n e instalaci?n de un kernel personalizado.

*`Cap?tulo?9, *Imprimir* <printing.html>`__, Imprimir*
    Describe la gesti?n de impresoras en FreeBSD, abarcando aspectos
    diversos como las p?ginas “banner”, las cuentas de impresi?n as?
    como la configuraci?n inicial.

*`Cap?tulo?10, *Compatibilidad binaria con Linux* <linuxemu.html>`__,
Compatibilidad binaria con Linux?*
    Describe las caracter?sticas de compatibilidad con Linux? de
    FreeBSD. Incluye tambi?n instrucciones detalladas de instalaci?n de
    varias aplicaciones Linux? muy populares, como Oracle?, SAP??R/3? y
    Mathematica?.

*`Cap?tulo?11, *Configuraci?n y Adaptaci?n del
Sistema* <config-tuning.html>`__, Configuraci?n y adaptaci?n del
sistema*
    Describe los par?metros que los administradores de sistemas tienen a
    su alcance para hacer que FreeBSD rinda al m?ximo. Describe tambi?n
    los diversos ficheros de configuraci?n que se usan en FreeBSD y
    d?nde est?n.

*`Cap?tulo?12, *El proceso de arranque en FreeBSD* <boot.html>`__, El
proceso de arranque en FreeBSD*
    Describe el proceso de arranque de FreeBSD y explica c?mo controlar
    este proceso mediante opciones de configuraci?n.

*`Cap?tulo?13, *Usuarios y administraci?n b?sica de
cuentas* <users.html>`__, Usuarios y administraci?n b?sica de cuentas*
    Describe la creaci?n y gesti?n de cuentas de usuario. Trata tambi?n
    sobre la limitaci?n de recursos que puede aplicarse sobre los
    mismos, as? como otras tareas administrativas.

*`Cap?tulo?14, *Seguridad* <security.html>`__, Seguridad*
    Describe las abudantes herramientas diferentes que pueden ayudar a
    que su sistema FreeBSD est? y permanezca seguro. Entre ellas
    encontrar? a Kerberos, IPsec y OpenSSH.

*`Cap?tulo?15, *Jaulas* <jails.html>`__, Jaulas*
    Describe el uso de jaulas en FreeBSD y el avance que este
    “framework” supone respecto al tradicional uso de chroot que se
    hac?a en FreeBSD.

*`Cap?tulo?16, *Mandatory Access Control* <mac.html>`__, Mandatory
Access Control*
    Explica qu? es Mandatory Access Control (MAC) y c?mo puede usarse
    este mecanismo para hacer m?s seguro FreeBSD

*`Cap?tulo?17, *Auditor?a de eventos de seguridad* <audit.html>`__,
Auditor?a de eventos de seguridad*
    Describe qu? es la auditor?a de eventos en FreeBSD c?mo instalarla y
    configurarla y c?mo pueden inspeccionarse y monitorizarse dichas
    auditor?as.

*`Cap?tulo?18, *Almacenamiento* <disks.html>`__, Almacenamiento*
    Describe c?mo gestionar medios de almacenamiento y sistemas de
    ficheros en FreeBSD, tanto discos f?sicos, arreglos RAID, medios
    ?pticos o en cinta, como discos en memoria y sistemas de ficheros en
    red.

*`Cap?tulo?19, *GEOM: Marco de trabajo modular de transformaci?n de
discos* <GEOM.html>`__, GEOM*
    Trata sobre el “framework” “GEOM” de FreeBSD y c?mo configurar con
    ?l alguno de los diversos niveles de RAID que admite.

*`Cap?tulo?20, *El Gestor de Vol?menes Vinum* <vinum-vinum.html>`__,
Vinum*
    Describe c?mo usar Vinum, un gestor de vol?menes l?gicos que permite
    tanto el uso de discos l?gicos independientes de dispositivo, como
    RAID-0, RAID-1 y RAID-5 por software.

*`Cap?tulo?21, *Virtualizaci?n* <virtualization.html>`__,
Virtualizaci?n*
    Describe los sistemas de virtualizaci?n disponibles en FreeBSD y
    c?mo utilizarlos.

*`Cap?tulo?22, *Localizaci?n - Uso y configuraci?n de
I18N/L10N* <l10n.html>`__, Localizaci?n*
    Describe el uso en FreeBSD de idiomas distintos del ingl?s. Trata
    tanto la localizaci?n del sistema como de las aplicaciones.

*`Cap?tulo?23, *Lo ?ltimo de lo ?ltimo* <cutting-edge.html>`__, Lo
?ltimo de lo ?ltimo*
    Explica las diferencias existentes entre FreeBSD-STABLE,
    FreeBSD-CURRENT y las releases de FreeBSD. Describe tambi?n qu?
    tipos de usuario pueden beneficiarse de seguir el desarrollo
    cont?nuo del sistema en su propia m?quina y muestra el proceso a
    seguir.

*`Cap?tulo?24, *Comunicaciones serie* <serialcomms.html>`__,
Comunicaciones serie*
    Explica c?mo conectar terminales serie y m?dems a su sistema FreeBSD
    tanto para conexiones entrantes como salientes.

*`Cap?tulo?25, *PPP y SLIP* <ppp-and-slip.html>`__, PPP y SLIP*
    Describe c?mo usar en FreeBSD PPP, SLIP o PPP sobre Ethernet para
    conexiones a sistemas remotos.

*`Cap?tulo?27, *Correo Electr?nico* <mail.html>`__, Correo electr?nico*
    Detalla los distintos elementos que componen un servidor de correo
    electr?nico y explica diversos aspectos sencillos de la
    configuraci?n del servidor de correo m?s extendido: sendmail.

*`Cap?tulo?28, *Servidores de red* <network-servers.html>`__, Servidores
de red*
    En este cap?tulo encontrar? instrucciones detalladas y ficheros de
    configuraci?n de ejemplo que le permitir?n configurar su sistema
    FreeBSD como servidor NFS, servidor de nombres, servidor NIS o de
    sincronizaci?n de hora.

*`Cap?tulo?26, *Cortafuegos* <firewalls.html>`__, Cortafuegos*
    Explica la filosof?a que sustenta los cortafuegos por software y
    facilita informaci?n detallada sobre la configuraci?n de los
    distintos cortafuegos disponibles en FreeBSD.

*`Cap?tulo?29, *Networking avanzado* <advanced-networking.html>`__,
“Networking” avanzado*
    Describe diversos temas relacionados con el “networking”, desde
    compartir la conexi?n a Internet con otras m?quinas de su LAN a
    diversos aspectos avanzados del encaminamiento de tr?fico, pasando
    por las redes “wireless”, Bluetooth?, ATM, IPv6 y mucho m?s.

*`Cap?tulo?30, *C?mo obtener FreeBSD* <mirrors.html>`__, C?mo conseguir
FreeBSD*
    Enumera las diferentes fuentes desde la que puede conseguirse
    FreeBSD en CDROM o DVD, as? como los numerosos sitios de Internet
    desde los que puede descargar e instalar FreeBSD.

*`Cap?tulo?31, *Bibliograf?a* <bibliography.html>`__, Bibliograf?a*
    Este libro toca tantos temas que es muy posible que el lector se
    quede a falta de una explicaci?n m?s detallada. En la bibliograf?a
    muchos libros estupendos relacionados con el contenido de este
    texto.

*`Ap?ndice?A, *Recursos en Internet* <eresources.html>`__, Recursos en
Internet*
    Describe los abundantes foros de que disponen los usuarios de
    FreeBSD para enviar preguntas y participar en conversaciones
    t?cnicas sobre FreeBSD.

*`Cap?tulo?32, *PGP keys* <pgpkeys.html>`__, PGP Keys*
    Lista las claves p?blicas PGP de varios desarrolladores de FreeBSD.

.. raw:: html

   </div>

Convenciones usadas en este libro
---------------------------------

Con el ?nimo de mantener la consistencia y facilitar la lectura del
texto se siguen varias convenciones a lo largo del libro.

Convenciones tipogr?ficas
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="variablelist">

*Cursiva*
    Se usa un tipo de letra*cursiva* cuando se citan nombres de fichero,
    URL, texto en el que se quiere hacer ?nfasis y cuando un t?rmino
    t?cnico aparece por primera vez en el texto.

``Tipograf?a de m?quina de         escribir``
    Se usa un tipo de letra ``de m?quina         de escribir`` cuando se
    muestran mensajes de error, comandos, variables de entorno, nombres
    de “ports”, nombres de m?quina, nombres de usuario o de grupo,
    nombres de dispositivo, variables y cuando Se usa un tipo de letra
    ``monospaced`` cuando se muestran mensajes de error, comandos,
    variables de entorno, nombres de “ports”, nombres de m?quina,
    nombres de usuario o de grupo, nombres de dispositivo, variables y
    cuando se muestran fragmentos de c?digo.

Negrita
    Se usa un tipo de letra negrita en el nombre de aplicaciones,
    comandos y cuando se muestran claves.

.. raw:: html

   </div>

Datos que introduce el usuario
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Las claves se muestran en **negrita** para distinguirlas de cualquier
otro texto. Las combinaciones de teclas que implican que sean pulsadas
simult?neamente se muestran con el s?mbolo \`\ ``+``' entre una y otra,
como en:

**Ctrl**+**Alt**+**Supr**

Esto significa que el usuario debe pulsar las teclas **Ctrl**, **Ctrl**,
**Alt** y **Supr** al mismo tiempo.

Las teclas que deben pulsarse secuencialmente se separan con comas, como
en este ejemplo:

**Ctrl**+**X**, **Ctrl**+**S**

Esto significa que el usuario debe pulsar simult?neamente las teclas
**Ctrl** y **X** y despu?s pulsar simult?neamente **Ctrl** y **S**.

Ejemplos
~~~~~~~~

Un comienzo como ``E:\>`` indica un ejemplo de comando de MS-DOS?. A
menos que se especifique otra cosa, estos comandos deben ejecutarse en
una terminal “Command Prompt” de un sistema Microsoft??Windows? moderno.

.. code:: screen

    E:\> tools\fdimage floppies\kern.flp A:

Si hay un ``#`` indica que el comando debe ejecutarse como superusuario
en FreeBSD. Puede acceder al sistema como ``root`` y ejecutar el comando
o bien con su usuario habitual y utilizar
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ para
disponer de privilegios de superusuario.

.. code:: screen

    # dd if=kern.flp of=/dev/fd0

Si el ejemplo comienza con un ``%`` indica que el comando puede
ejecutarse en una cuenta de usuario normal. Salvo que se indique otra
cosa se usa la sintaxis de C-shell para asignar valores a variables de
entorno u otros comandos.

.. code:: screen

    % top

Agradecimientos
---------------

Este libro representa el esfuerzo de muchos cientos de personas del
mundo entero. Tanto si fue en forma de correci?n de errores de contenido
como gramaticales, o bien fue un cap?tulo entero lo que enviaron, toda
contribuci?n ha sido muy valiosa.

Varias compa??as han colaborado en el desarrollo de este documento
pagando a tiempo completo a varios autores, financiando la publicaci?n,
etc. En especial BSDi (posteriormente adquirida por `Wind River
Systems <http://www.windriver.com>`__) pagaron a varios miembros del
FreeBSD Documentation Project por trabajar en la mejora lo que fue la
primera edici?n de este libro, que apareci? en marzo de 2000 (ISBN
1-57176-241-8). Adem?s de esto, Wind River Systems aport? el dinero para
que otros autores pudieran realizar gran cantidad de mejoras en la
estructura de creaci?n de material listo para impresi?n y para pudieran
a?adir nuevos cap?tulos. Este trabajo culmin? con la publicaci?n de la
segunda edici?n impresa en noviembre de 2001 (ISBN 1-57176-303-1). En
2003 y 2004 `FreeBSD Mall, Inc <http://www.freebsdmall.com>`__, pag? a
varios autores para que se dedicaran a lo que ser? la tercera edici?n.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+-------------------------------------------+
| `Anterior <index.html>`__?   | ?                         | ?\ `Siguiente <getting-started.html>`__   |
+------------------------------+---------------------------+-------------------------------------------+
| Manual de FreeBSD?           | `Inicio <index.html>`__   | ?Parte?I.?Primeros pasos                  |
+------------------------------+---------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

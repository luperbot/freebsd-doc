====================================
3.2. Consolas virtuales y terminales
====================================

.. raw:: html

   <div class="navheader">

3.2. Consolas virtuales y terminales
`Anterior <basics.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <permissions.html>`__

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

3.2. Consolas virtuales y terminales
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD puede utilizarse de muchas maneras. Una de ellas es tecleando
?rdenes en una terminal de texto. De este modo, mucha de la flexibilidad
y poder de un sistema operativo UNIX? est? inmediatamente en sus manos
cuando usa FreeBSD. Esta secci?n describe qu? son ?terminales? y
?consolas? y c?mo puede usarlas en FreeBSD.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1. La consola
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si no ha configurado FreeBSD para ejecutar autom?ticamente un entorno
gr?fico en el arranque, el sistema le presentar? un ?prompt? de entrada
despu?s del arranque, inmediatamente despu?s de que los ?scripts? de
inicio terminen de ejecutarse. Ver? algo similar a esto:

.. code:: screen

    Additional ABI support:.
    Local package initialization:.
    Additional TCP options:.

    Fri Sep 20 13:01:06 EEST 2002

    FreeBSD/i386 (pc3.ejemplo.org) (ttyv0)

    login:

Los mensajes pueden ser un poco diferentes en su sistema, pero ver? algo
similar. Las ?ltimas dos l?neas son las que nos interesan por el
momento. La pen?ltima l?nea dice:

.. code:: programlisting

    FreeBSD/i386 (pc3.ejemplo.org) (ttyv0)

Esta l?nea contiene informaci?n acerca del sistema que acaba de
arrancar. Esta usted ante una consola ?FreeBSD? que se ejecuta en un
procesador Intel o compatible de la arquitectura
x86`:sup:`[1]` <#ftn.idp69062992>`__. El nombre de esta m?quina (todas
las m?quinas UNIX? tiene un nombre) es ``pc3.ejemplo.org``, y usted est?
ahora ante su consola de sistema (la terminal ``ttyv0``).

Para acabar, la ?ltima l?nea siempre es:

.. code:: programlisting

    login:

Este es el lugar donde se usted teclear? su ?nombre de usuario? para
entrar en FreeBSD. La siguiente secci?n describe c?mo hacerlo.

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

3.2.2. La entrada a FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD es un sistema multiusuario multiprocesador. Esta es la
descripci?n formal que se suele dar a un sistema que puede ser utilizado
por muchas personas diferentes, que simult?neamente ejecutan muchos
programas en un sola m?quina.

Cada sistema multiusuario necesita alg?n modo de distinguir a un
?usuario? del resto. En FreeBSD (y en todos los sistemas operativos de
tipo UNIX?) esto se logra requiriendo que cada usuario ?acceda? al
sistema antes de poder ejecutar programas. Cada usuario tiene un nombre
?nico (el ?nombre de usuario?) y una clave secreta, personal (la
?contrase?a?). FreeBSD preguntar? por ambos antes de permitirle a un
usuario ejecutar cualquier programa.

Justo despu?s de que FreeBSD arranque y termine de ejecutar sus
?scripts? de inicio `:sup:`[2]` <#ftn.idp69070288>`__, le presentar? un
?prompt? y solicitar? un nombre v?lido de usuario:

.. code:: screen

    login:

En este ejemplo vamos a asumir que su nombre de usuario es ``john``.
Tecl?e ``john`` en el ?prompt? y pulse **Intro**. Deber?a present?rsele
un ?prompt? donde introducir una ?contrase?a?:

.. code:: screen

    login: john
    Password:

Tecl?e ahora la contrase?a de ``john`` y pulse **Enter**. La contrase?a
*no se muestra en pantalla*, pero no debe preocuparse por ello. Esto se
hace as? por motivos de seguridad.

Si ha tecleado su contrase?a correctamente ya est? usted en un sistema
FreeBSD, listo para probar todas las ?rdenes disponibles.

Ver? el MOTD (mensaje del d?a) seguido por un ?prompt? (un caracter
``#``, ``$`` o ``%``). Esto confirma que ha validado con ?xito su
usuario en FreeBSD.

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

3.2.3. Consolas m?ltiples
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ejecutar ?rdenes UNIX? en una consola est? bien, pero FreeBSD puede
ejecutar muchos programas a la vez. Tener una consola donde se pueden
teclear ?rdenes puede ser un desperdicio cuando un sistema operativo
como FreeBSD puede ejecutar docenas de programas al mismo tiempo. Aqu?
es donde las ?consolas virtuales? muestran su potencial.

FreeBSD puede configurarse para presentarle diferentes consolas
virtuales. Puede cambiar de una de ellas a cualquier otra consola
virtual pulsando un par de teclas en su teclado. Cada consola tiene su
propio canal de salida, y FreeBSD se ocupa de redirigir correctamente la
entrada del teclado y la salida al monitor cuando cambia de una consola
virtual a la siguiente.

Se han reservado ciertas combinaciones especiales de teclas para pasar
de unas consolas virtuales a otras en FreeBSD
`:sup:`[3]` <#ftn.idp69084752>`__. Puede utilizar **Alt**+**F1**,
**Alt**+**F2** y as? sucesivamente hasta **Alt**+**F8** para cambiar a
una consola virtual diferente en FreeBSD.

Mientras est? cambiando de una consola a la siguiente, FreeBSD se ocupa
de guardar y restaurar la salida de pantalla. El resultado es la
?ilusi?n? de tener varias pantallas y teclados ?virtuales? que puede
utilizar para teclear ?rdenes para que FreeBSD los ejecute. El programa
que usted lanza en una consola virtual no deja de ejecutarse cuando la
consola no est? visible. Contin?an ejecut?ndose cuando se cambia a una
consola virtual diferente.

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

3.2.4. El fichero ``/etc/ttys``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n por omisi?n de FreeBSD iniciar? con ocho consolas
virtuales. No es una configuraci?n est?tica por hardware, as? que puede
personalizar f?cilmente su sistema para arrancar con m?s o menos
consolas virtuales. El n?mero y propiedades de las consolas virtuales
est?n detallados en ``/etc/ttys``.

En ``/etc/ttys`` es donde se configuran las consolas virtuales de
FreeBSD. Cada l?nea no comentada de este fichero (l?neas que no
comienzan con un caracter ``#``) contiene propiedades para una sola
terminal o consola virtual. La versi?n por omisi?n de este fichero en
FreeBSD configura nueve consolas virtuales y habilita ocho de ellas. Son
las l?neas que comienzan con ``ttyv``:

.. code:: programlisting

    # name  getty                           type    status          comments
    #
    ttyv0   "/usr/libexec/getty Pc"         cons25  on  secure
    # Virtual terminals
    ttyv1   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv2   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv3   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv4   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv5   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv6   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv7   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv8   "/usr/X11R6/bin/xdm -nodaemon"  xterm   off secure

Consulte
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__ si
quiere una descripci?n detallada de cada columna en este fichero y todas
las opciones que puede usar para configurar las consolas virtuales.

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

3.2.5. Consola en modo monousuario
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En la `Secci?n?12.6.2, “Modo
monousuario” <boot-init.html#boot-singleuser>`__ encontrar? una
descripci?n detallada de lo que es ?modo monousuario?. No importa que
s?lo exista una consola cuando ejecuta FreeBSD en modo monousuario. No
hay otra consola virtual disponible. Las configuraciones de la consola
en modo monousuario se pueden encontrar tambi?n en ``/etc/ttys``. Busque
la l?nea que comienza por ``console``:

.. code:: programlisting

    # name  getty                           type    status          comments
    #
    # Si la consola est? marcada como "insecure", entonces init
    # le pedir? la contrase?a de root al entrar a modo monousuario.
    console none                            unknown off secure

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Tal y como indican los comentarios por encima de la l?nea ``console``,
puede editar esta l?nea y cambiar ``secure`` por ``insecure``. Si lo
hace, cuando FreeBSD arranque en modo monousuario el sistema le pedir?
la contrase?a de ``root``.

*Tenga cuidado si cambia esto a ``insecure``*. Si olvida la contrase?a
de ``root`` arrancar en modo monousuario ser? con seguridad m?s
complicado. Sigue siendo posible, pero ser? un poco dif?cil para alguien
que no est? familiarizado con le proceso de arranque de FreeBSD y los
programas involucrados en dicho proceso.

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

3.2.6. Cambio del modo de video de la consola
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La consola FreeBSD por omisi?n tiene un modo de video que puede
ajustarse a 1024x768, 1280x1024 o cualquier otra resoluci?n que admita
su chip gr?fico y su monitor. Si quiere utilizar uno diferente tendr?
que recompilar su kernel con estas dos opciones a?adidas:

.. code:: programlisting

    options VESA
    options SC_PIXEL_MODE

Una vez recompilado el kernel con esas dos opciones en ?l determine qu?
modos de video admite su hardware; para ello use
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__.
Con lo siguiente le mostrar? una lista de modos de video soportados:

.. code:: screen

    # vidcontrol -i mode

La salida de esta orden es una lista de los modos de que admite su
tarjeta. Para elegir uno de ellos tendr? que ejecutar
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__
en una consola como ``root``:

.. code:: screen

    # vidcontrol MODE_279

Si el modo de video que ha elegido le parece adecuado puede configurarlo
de forma permanente haciendo que funcione desde el momento del arranque;
para ello debe editar ``/etc/rc.conf`` file:

.. code:: programlisting

    allscreens_flags="MODE_279"

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp69062992" class="footnote">

`:sup:`[1]` <#idp69062992>`__\ Esto es lo que ``i386`` significa. Tenga
en cuenta que incluso si no est? ejecutando FreeBSD en una CPU Intel
386, ?ste va a ser ``i386``. No es el tipo de su procesador, sino la
?arquitectura? la que se muestra aqu?.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp69070288" class="footnote">

`:sup:`[2]` <#idp69070288>`__\ Los ?scripts? de inicio son programas que
FreeBSD ejecuta autom?ticamente cuando arranca. Su funci?n principal es
preparar todo lo necesario para que todo lo dem?s se ejecute, e iniciar
cualquier servicio que tenga configurado para ejecutarse en segundo
plano algo ?tiles.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp69084752" class="footnote">

`:sup:`[3]` <#idp69084752>`__\ Tiene una descripci?n bastante t?cnica y
correcta de todos los detalles de la consola FreeBSD y los controladores
de teclado pueden encontrarse en las p?ginas de manual de
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4>`__,
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4>`__,
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__
y
`kbdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdcontrol&sektion=1>`__.
No nos extenderemos en los detalles aqu?, pero el lector interesado
siempre puede consultar dichas p?ginas de manual si quiere una
explicaci?n m?s detallada y profunda de c?mo funcionan estas cosas.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------+---------------------------------------+
| `Anterior <basics.html>`__?              | `Subir <basics.html>`__   | ?\ `Siguiente <permissions.html>`__   |
+------------------------------------------+---------------------------+---------------------------------------+
| Cap?tulo 3. Conceptos b?sicos de Unix?   | `Inicio <index.html>`__   | ?3.3. Permisos                        |
+------------------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

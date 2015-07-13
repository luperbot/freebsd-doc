===================
27.7. SMTP con UUCP
===================

.. raw:: html

   <div class="navheader">

27.7. SMTP con UUCP
`Anterior <mail-advanced.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <outgoing-only.html>`__

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

27.7. SMTP con UUCP
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n de sendmail que se proporciona con la distribuci?n de
FreeBSD est? dise?ada para organizaciones que se conectan directamente a
internet. Las organizaciones que dese?n enviar y recibir sus correos
utilizando UUCP deben instalar otro fichero de configuraci?n para
sendmail.

El ajuste de forma manual del archivo ``       /etc/mail/sendmail.cf``
es un tema para expertos. La versi?n 8 de sendmail genera ficheros de
configuraci?n mediante el preprocesador
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__,
gracias al que las opciones de configuraci?n se pueden escribir
utilizando un nivel de abstracci?n mayor. Los archivos de configuraci?n
de `m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__ se
pueden encontrar en ``/usr/src/usr.sbin/sendmail/cf``.

Si no se instal? el sistema base con todas las fuentes el conjunto de
ficheros de configuraci?n de sendmail se puede obtener a partir de un
paquete de fuentes determinado. Suponiendo que tengamos el CDROM con el
c?digo fuente de FreeBSD montado se puede ejecutar:

.. code:: screen

    # cd /cdrom/src
    # cat scontrib.?? | tar xzf - -C /usr/src/contrib/sendmail

Este comando extrae s?lamente unos pocos cientos de kilobytes. El
fichero ``README`` que hay en el directorio ``cf`` puede servirle como
una introducci?n b?sica a la configuraci?n mediante
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__.

La mejor forma de soportar la entrega de correo mediante UUCP es
utilizando la caracter?stica ``mailertable``. Esta caracter?stica crea
una base de datos que sendmail utiliza para tomar decisiones de
encaminamiento.

En primer lugar creamon el fichero ``.mc``. El directorio
``/usr/src/usr.sbin/sendmail/cf/cf`` alberga varios ejemplos del mismo.
Suponiendo que nuestro fichero configuraci?n se llama ``foo.mc`` para
convertir dicho archivo en un fichero ``sendmail.cf`` v?lido basta con
ejecutar lo siguiente:

.. code:: screen

    # cd /usr/src/usr.sbin/sendmail/cf/cf
    # make foo.cf
    # cp foo.cf /etc/mail/sendmail.cf

Un fichero ``.mc`` suele tener este aspecto:

.. code:: programlisting

    VERSIONID(`Su n?mero de versi?n') OSTYPE(bsd4.4)

    FEATURE(accept_unresolvable_domains)
    FEATURE(nocanonify)
    FEATURE(mailertable, `hash -o /etc/mail/mailertable')

    define(`UUCP_RELAY', su.relay.uucp)
    define(`UUCP_MAX_SIZE', 200000)
    define(`confDONT_PROBE_INTERFACES')

    MAILER(local)
    MAILER(smtp)
    MAILER(uucp)

    Cw    alias.de.su.servidor
    Cw    nombredesunodouucp.UUCP

Las l?neas que contienen ``accept_unresolvable_domains``,
``nocanonify``, y ``confDONT_PROBE_INTERFACES`` proh?ben la utilizaci?n
del DNS durante la entrega de correo. La cl?usula ``UUCP_RELAY`` es
necesaria para soportar entrega mediante UUCP. Lo ?nico que hay que
hacer es escribir un nombre de m?quina en ese punto. Dicha m?quina debe
ser capaz de gestionar las direcciones del pseudo-dominio .UUCP; en la
mayor?a de los casos se escribe en este punto el nombre de la m?quina
perteneciente al proveedor de servicios que hace de relay.

Una vez que tenemos esto configurado se necesita un fichero
``/etc/mail/mailertable``. Si solamente tenemos un enlace con el
exterior, que usamos para todos nuestro correos, basta una configuraci?n
como la que se muestra a continuaci?n:

.. code:: programlisting

    #
    # makemap hash /etc/mail/mailertable.db < /etc/mail/mailertable
    .                             uucp-dom:su.relay.uucp

Un ejemplo m?s complejo puede parecerse al siguiente:

.. code:: programlisting

    #
    # makemap hash /etc/mail/mailertable.db < /etc/mail/mailertable
    #
    horus.interface-business.de   uucp-dom:horus
    .interface-business.de        uucp-dom:if-bus
    interface-business.de         uucp-dom:if-bus
    .heep.sax.de                  smtp8:%1
    horus.UUCP                    uucp-dom:horus
    if-bus.UUCP                   uucp-dom:if-bus
    .                             uucp-dom:

Las primeras tres l?neas se encargan de manejar casos especiales en los
que el correo dirigido directamente al dominio no se env?a a la ruta por
defecto sino a alg?n vecino UUCP para acortar el n?mero de saltos
involucrados en la entrega de dichos correos. La siguiente l?nea
gestiona el correo para el dominio ethernet local, el cual puede ser
entregado utilizando SMTP. Finalmente los vecinos UUCP se mencionan en
la notaci?n de pseudo-dominio .UUCP para permitir que un
``vecino UUCP receptor`` de correo pueda sobreescribir las reglas por
defecto. La ?ltima l?nea siempre es un punto; se asocia con cualquier
otra cosa que no ha sido tratada en reglas anteriores y donde se realiza
entrega UUCP a un vecino UUCP que sirve como pasarela de correo
universal para todo el mundo. Todos los nombres de m?quinas bajo la
clave ``uucp-dom:`` deben ser vecinos UUCP v?lidos, lo cual se puede
verificar utilizando el comando ``       uuname``.

Recuerde que este fichero debe convertirse en una base de datos DBM
antes de que usarse. El comando que se utiliza para realizar esta tarea
se suele especificar como un comentario al principio del fichero
``mailertable``. Cada vez que se modifique el fichero ``mailertable`` se
debe ejecutar dicho comando.

Un consejo final: si dudamos sobre una determinada ruta de
encaminamiento de correo se puede ejecutar sendmail con el par?metro
``-bt``. Este par?metro ejecuta sendmail en *modo prueba de
direcciones*; simplemente basta con escribir ``3,0`` seguido por la
direcci?n de correo de la que queremos comprobar su correcto
encaminamiento. La ?ltima l?nea nos dice el agente de correo interno que
se utiliza, la m?quina de destino con que el agente ser? invocado y la
direcci?n (posiblemente traducida) de correo. Se puede abandonar este
modo de funcionamiento escribiendo **Ctrl**+**D**.

.. code:: screen

    % sendmail -bt
    ADDRESS TEST MODE (ruleset 3 NOT automatically invoked)
    Enter <ruleset> <address>
    > 3,0 prueba@ejemplo.com
    canonify           input: foo @ example . com
    ...
    parse            returns: $# uucp-dom $@ su.relay.uucp $: prueba < @ ejemplo . com . >
    > ^D

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------+-----------------------------------------------------+
| `Anterior <mail-advanced.html>`__?   | `Subir <mail.html>`__     | ?\ `Siguiente <outgoing-only.html>`__               |
+--------------------------------------+---------------------------+-----------------------------------------------------+
| 27.6. Conceptos Avanzados?           | `Inicio <index.html>`__   | ?27.8. Configuraci?n para s?lamente enviar correo   |
+--------------------------------------+---------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

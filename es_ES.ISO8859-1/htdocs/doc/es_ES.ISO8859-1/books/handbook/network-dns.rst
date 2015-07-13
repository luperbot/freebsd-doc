==========
29.11. DNS
==========

.. raw:: html

   <div class="navheader">

29.11. DNS
`Anterior <network-dhcp.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-ntp.html>`__

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

29.11. DNS
----------

.. raw:: html

   </div>

.. raw:: html

   <div>

Enviado por Chern Lee.

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

29.11.1. Resumen
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD utiliza por defecto una versi?n de BIND (Berkeley Internet Name
Domain) que proporciona la implementaci?n m?s com?n del protocolo de
DNS. DNS es el protocolo a trav?s del cual los nombres de m?quinas se
asocian con direcciones IP y viceversa. Por ejemplo una consulta
preguntando por ``www.FreeBSD.org`` recibe una respuesta con la
direcci?n IP del servidor web del Proyecto FreeBSD, mientras que una
pregunta sobre ``ftp.FreeBSD.org`` recibe como respuesta la direcci?n IP
correspondiente al servidor de FTP. El proceso inverso sucede de una
forma similar. Una pregunta relativa a una determinada direcci?n IP se
resuelve al nombre de la m?quina que la posee. No se necesita ejecutar
un servidor de DNS para poder realizar consultas y b?squedas de DNS.

El DNS se coordina de forma distribuida a trav?s de Internet utilizando
un sistema en cierta forma complejo de servidores de nombres ra?z
autorizados y mediante otros servidores de nombres de menor escala que
se encargan de replicar la informaci?n de dominios individuales con el
objetivo de mejorar los tiempos de respuesta de b?squedas reiteradas de
la misma informaci?n.

Este documento hace referencia a la versi?n estable BIND 8.X. BIND 9.X
se puede instalar a trav?s del “port”
`net/bind9 <http://www.freebsd.org/cgi/url.cgi?ports/net/bind9/pkg-descr>`__.

El protocolo de DNS se encuentra definido en la RFC1034 y la RFC1035.

El `Internet Software Consortium (www.isc.org) <http://www.isc.org/>`__
se encarga de de mantener el software de BIND.

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

29.11.2. Terminolog?a
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para comprender este documento se deben definir los siguientes t?rminos:

.. raw:: html

   <div class="informaltable">

+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| T?rmino                                          | Definici?n                                                                                                                                                                                                                         |
+==================================================+====================================================================================================================================================================================================================================+
| DNS directo (Forward DNS)                        | Asociaci?n de nombres de m?quinas con direcciones IP                                                                                                                                                                               |
+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Origen                                           | Se refiere al dominio cubierto por un determinado fichero de zona                                                                                                                                                                  |
+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| named, BIND, servidor de nombres (name server)   | Nombres t?picos que hacen referencia al paquete servidor de nombres de BIND de FreeBSD                                                                                                                                             |
+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  Resolver                                        | Un proceso del sistema que utilizan las aplicaciones para hacer preguntas al servidor de nombres.                                                                                                                                  |
+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  DNS inverso (Reverse DNS)                       | Lo contrario de lo que realiza el DNS directo; asocia direcciones IP con nombres de m?quinas                                                                                                                                       |
+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  Zona Ra?z                                       | El comienzo de la jerarqu?a de zonas de Internet. Todas las zonas surgen a partir de una zona ra?z de forma similar a como todos los directorios de un sistema de ficheros se encuentran a partir de un directorio ra?z inicial.   |
+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Zona                                             | Un dominio individual, subdominio o porci?n del DNS que se encuentra administrado por la misma autoridad.                                                                                                                          |
+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Ejemplos de zonas:

.. raw:: html

   <div class="itemizedlist">

-  ``.`` es la zona ra?z

-  ``org.`` es una zona localizada bajo la zona ra?z

-  ``ejemplo.org`` es una zona localizada bajo la zona ``org.``

-  ``foo.ejemplo.org.`` es un subdominio o una zona ubicada bajo la zona
   ``ejemplo.org.``

-  ``1.2.3.in-addr.arpa`` es una zona que referencia a a todas las
   direcciones IP que se encuentran dentro del espacio de direcciones de
   3.2.1.\*.

.. raw:: html

   </div>

Como se puede observar la parte m?s espec?fica de una m?quina aparece
m?s a la izquierda. Por ejemplo ``ejemplo.org`` es m?s espec?fico que
``org.`` y del mismo modo ``org.`` es m?s espec?fico que la zona ra?z.
El formato de cada parte del nombre de la m?quina es muy similar al
formato de un sistema de ficheros: el directorio ``/dev`` se encuentra
dentro del directorio ra?z, y as? sucesivamente.

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

29.11.3. Razones para ejecutar un servidor de nombres
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los servidores de nombres normalmente son de dos tipos: autoritarios y
de cache.

Se necesita un servidor de nombres autoritario cuando:

.. raw:: html

   <div class="itemizedlist">

-  uno quiere proporcionar informaci?n de DNS al resto del mundo
   respondiendo con informaci?n autoritaria a las consultas recibidas.

-  un dominio, por ejemplo ``ejemplo.org``, est? registrado y se
   necesita a?adir nombres de m?quinas bajo dicho dominio.

-  un bloque de direcciones IP necesita entradas de DNS inversas (de IP
   a nombre de m?quina).

-  un servidor de nombres de “backup”, llamado esclavo, debe responder a
   consultas cuando el servidor primario se encuentre ca?do o
   inaccesible.

.. raw:: html

   </div>

Se necesita un servidor cach? cuando:

.. raw:: html

   <div class="itemizedlist">

-  un servidor de DNS local puede responder m?s r?pidamente de lo que se
   har?a si se tuviera que preguntar al servidor de nombres externo.

-  se desea reducir el tr?fico global de red (se ha llegado a comprobar
   que el tr?fico de DNS supone un 5% o m?s del total del tr?fico que
   circula por Internet).

.. raw:: html

   </div>

Cuando se pregunta por ``www.FreeBSD.org`` el “ resolver” normalmente
pregunta al servidor de nombres del ISP de nivel superior y se encarga
de recibir la respuesta. Si se utiliza un servidor de DNS cach? local la
pregunta s?lo se dirige una ?nica vez hacia el exterior. Dicha pregunta
la realiza el servidor cach?. Posteriores consultas sobre el mismo
nombres son respondidas directamente por este servidor.

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

29.11.4. C?mo funciona
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En FreeBSD el d?mon de BIND se denomina named por razones obvias.

.. raw:: html

   <div class="informaltable">

+------------------------------+-----------------------------------------------------------------------+
| Fichero                      | Descripci?n                                                           |
+==============================+=======================================================================+
| named                        | El d?mon de BIND                                                      |
+------------------------------+-----------------------------------------------------------------------+
| ``ndc``                      | El programa de control del d?mon                                      |
+------------------------------+-----------------------------------------------------------------------+
| ``/etc/namedb``              | El directorio donde se almacena la informaci?n de las zonas de BIND   |
+------------------------------+-----------------------------------------------------------------------+
| ``/etc/namedb/named.conf``   | El archivo de configuraci?n del d?mon                                 |
+------------------------------+-----------------------------------------------------------------------+

.. raw:: html

   </div>

Los ficheros de zonas se encuentran normalmente bajo el directorio
``/etc/namedb`` y contienen la informaci?n que proporciona el servidor
de nombres al resto de m?quinas de Internet.

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

29.11.5. Ejecuci?n de BIND
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Debido a que BIND se instala por defecto la configuraci?n resulta ser
bastante sencilla.

Para asegurarnos de que el d?mon se ejecuta al inicio del sistema se
deben a?adir las siguientes modificaciones en ``/etc/rc.conf``:

.. code:: programlisting

    named_enable="YES"

Para arrancar el d?mon de forma manual (una vez configurado)

.. code:: screen

    # ndc start

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

29.11.6. Ficheros de configuraci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

29.11.6.1. Uso de ``make-localhost``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aseg?rese de hacer los siguiente

.. code:: screen

    # cd /etc/namedb
    # sh make-localhost

para que se cree el archivo de zona inversa
``/etc/namedb/localhost.rev`` de forma apropiada.

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

29.11.6.2. ``/etc/namedb/named.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    // $FreeBSD$
    //
    // Consulte la p??gina man de named(8) para m??s detalles.  tiene
    // alguna vez la necesidad de configurar un servidor primario
    // aseg??ree de que entiende a la perfecci??n los detalles peliagudos
    // del funcionamiento del DNS.  Si hay errores, incluso triviales,
    // puede sufrir p??rdidas de conectividad ogenerar cantidades ingentes
    // de tr??fico in??til hacia o desde Interne

    options {
            directory "/etc/namedb";

    // Adem??s de con la l??usula "forwarders" puedeobligar a su servidor
    // de nombres a que nunca lance b??squedas por su cuenta sino que
    // se las pida a sus "forwarders". Esto se hace del siguiente modo:
    //
    //      forward only;

    // Si su proveedor de acceso tiene a su alcance un servidor DNS
    // escriba aqu?? su direcci??n IP y descomente la l??neaPodr?? usar
    // su cach?? y por lo tanto reducir el tr??fico DNS de Internet.
    //

    /*
            forwarders {
                    127.0.0.1;
            };
    */

Tal y como se dice en los comentarios del ejemplo para beneficiarnos de
la cach? se puede activar ``forwarders``. En circunstancias normales un
servidor de nombres busca de forma recursiva a trav?s de Internet
tratando de localizar un servidor de nombres que sea capaz de responder
una determinada pregunta. Si se activa esta opci?n por defecto se pasa a
preguntar primero al servidor de nombres especificado (servidor o
servidores) pudiendo aprovecharse de la informaci?n de cach? que dicho
servidor tuviera disponible. Si el servidor de nivel superior al nuestro
se encuentra congestionado puede merecer la pena la activaci?n de esta
caracter?stica de “redirecci?n” ya que se puede disminuir la carga de
tr?fico que dicho servidor tiene que soportar.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

La direcci?n IP ``127.0.0.1`` *no* funciona a?. Se debe cambiar esta
direcci?n IP por un servidor de nombres v?lido.

.. raw:: html

   </div>

.. code:: programlisting

            /*
         * Si hay un cortafuegos entre usted y los servidores de
         * nombres que quiere consultar tendr?? que descoentar la
         * siguiente directiva, "query-source".  Las versiones
         * anteriores de BIND siempre hac??an sus consultas a trav??s
         * del puerto 53 pero BIND 8.1 utiliza por defecto un puerto no
         * privilegiado.
             */
            // query-source address * port 53;

            /*
         * Si lo va a ejecutar en un "caj??n de arena" (o "sandbox")
         * tendr?? que declarar una uicaci??n diferente para el
         * fichero de volcado de named.
             */
            // dump-file "s/named_dump.db";
    };

    // Nota: lo siguiente ser?? inclu??do en futuras versiones.
    /*
    host { any; } {
            topology {
                    127.0.0.0/8;
            };
    };
    */

    // La configuraci??n de secundarios se explica de modo secillo a
    // partir de aqu??.
    //
    // Si activa un servidor de nombres local no olvide inclu??r
    // 127.0.0.1 en su /etc/resolv.conf para que sea ese servidor el
    // primero al que se consulte.
    // Aseg??rese tambi??n de activarlo en /etc/rc.con

    zone "." {
            type hint;
            file "named.root";
    };

    zone "0.0.127.IN-ADDR.ARPA" {
            type master;
            file "localhost.rev";
    };

    zone
    "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.IP6.INT" {
            type master;
            file "localhost.rev";
    };

    // Nota: No use las direcciones IP que se muestran aqu??, son falsas
    // y s??lo se usancomo demostraci??n y para una mejor comprensi??n.
    //
    // Ejemplo de entradas en la configuraci??n de secundarios.  Puede ser
    // conveniente convertirse en secundario al menos del dominio en cuya
    // zona est?? su dominio.  Cnsulte con su administrador de red para
    // que le facilite la direcci??n IP del servidor primario.
    //
    // No olvide inclu??r la zona del bucle inverso (IN-ADDR.ARPA).  (Son
    // los primeros bytes de la direcci??n IP correspondiente, en orden
    // inverso, con ".IN-ADDR.ARPA" al final.)
    //
    // Antes de configurar una zona primara aseg??resede haber comprendido
    // completamente c??mo funcionan DNS y BIND.  Hay errores que no son
    // visibles f??cilmente.  La configuraci??n de un secundario es, por
    // el contrario, much??simo m??s sencilla.
    //
    // Nota: No se limite a copiar los ejemplos de m??s arriba. :-)
    // Utilice nombres y direcciones reales.
    //
    // ADVERTENCIA: FreeBSD ejecuta bind en un sandbok (observe los
    // par??meros de named (named_flags) en rc.conf).  El directorio que
    // contiene las zonas secundarias debe tener permisos de escritura
    // para bind.  Le sugerimos la siguiente secuencia de ?rdenes:
    //
    //      mkdir /etc/namedb/s
    //      chown bind:bind /etc/namedb/s
    //      chmod 750 /etc/namedb/s

Si quiere m?s informaci?n sobre c?mo ejecutar BIND en un “sandbox”
consulte `Ejecuci?n de named en un
sandbox <network-dns.html#network-named-sandbox>`__.

.. code:: programlisting

    /*
    zone "ejemplo.com" {
            type slave;
            file "s/ejemplo.com.bak";
            masters {
                    192.168.1.1;
            };
    };

    zone "0.168.192.in-addr.arpa" {
            type slave;
            file "s/0.168.192.in-addr.arpa.bak";
            masters {
                    192.168.1.1;
            };
    };
    */

Dentro del fichero ``named.conf`` se muestran ejemplos de entradas de
esclavo tanto para las zonas directas como para las inversas.

Para cada nueva zona administrada se debe crear una entrada de zona
dentro del fichero ``named.conf``

Por ejemplo la entrada de zona m?s simple para el dominio
``ejemplo.org`` puede ser algo como esto:

.. code:: programlisting

    zone "ejemplo.org" {
        type master;
        file "ejemplo.org";
    };

Esta zona es una zona maestra ( observe la l?nea de ``type``, y mantiene
la informaci?n de la zona en ``/etc/namedb/ejemplo.org`` tal como se
indica en la l?nea de ``file``.

.. code:: programlisting

    zone "ejemplo.org" {
        type slave;
        file "ejemplo.org";
    };

En el caso del esclavo la informaci?n de la zona se transmite desde el
servidor de nombres maestro y se almacena en el fichero especificado.
Cuando el servidor maestro “ muere” o no puede ser alcanzado el servidor
de nombres esclavo puede responder a las peticiones debido a que posee
la informaci?n de la zona.

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

29.11.6.3. Ficheros de zona
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A continuaci?n se muestra un fichero de una zona maestra para el dominio
``ejemplo.org``, que se encuentra ubicado en
``/etc/namedb/ejemplo.org``:

.. code:: programlisting

    $TTL 3600

    example.org. IN SOA ns1.ejemplo.org. admin.ejemplo.org. (
                            5               ; Serial
                            10800           ; Refresh
                            3600            ; Retry
                            604800          ; Expire
                            86400 )         ; Minimum TTL

    ; DNS Servers
    @       IN NS           ns1.ejemplo.org.
    @       IN NS           ns2.ejemplo.org.

    ; Machine Names
    localhost       IN A    127.0.0.1
    ns1             IN A    3.2.1.2
    ns2             IN A    3.2.1.3
    mail            IN A    3.2.1.10
    @               IN A    3.2.1.30

    ; Aliases
    www             IN CNAME        @

    ; MX Record
    @               IN MX   10      mail.ejemplo.org.

Tenga muy en cuenta que todo nombre de m?quina que termina en “.” es
tratado como si fuera un nombre de m?quina completo mientras que
cualquier otro nombre sin el “.” final se trata como una referencia
relativa al dominio de origen de la zona. Por ejemplo ``www`` se traduce
a ``www + origen``. En nuestro fichero de zona ficticio nuestro origen
es ``ejemplo.org`` de forma que ``www`` se convierte en
``           www.ejemplo.org``

El formato de un fichero de zona es el siguiente:

.. code:: programlisting

    nombrederegistro IN tipodeentrada valor

Los registros de DNS que m?s se utilizan son:

.. raw:: html

   <div class="variablelist">

SOA
    Comienzo de Zona con Autoridad (Start Of zone Authority)

NS
    Un servidor de nombres con autoridad para una una determinada zona

A
    Una direcci?n IP de una m?quina

CNAME
    El nombre can?nico de una m?quina para definir un alias

MX
    mail exchanger

PTR
    Un puntero a un nombre de dominio (utilizados para definir el DNS
    inverso)

.. raw:: html

   </div>

.. code:: programlisting

    ejemplo.org. IN SOA ns1.ejemplo.org. admin.ejemplo.org. (
                            5               ; Serial
                            10800           ; Refresh after 3 hours
                            3600            ; Retry after 1 hour
                            604800          ; Expire after 1 week
                            86400 )         ; Minimum TTL of 1 day

.. raw:: html

   <div class="variablelist">

``ejemplo.org.``
    el nomre de dominio, tambi?n el origen para el fichero de zona

``ns1.ejemplo.org.``
    el servidor de nombres primario/autoritario para esta zona

``admin.ejemplo.org.``
    la persona responsable de esta zona; observe que la direcci?n de
    correo electr?nico aparece con la @ sustituida por un punto.
    (``<admin@ejemplo.org>`` se escribe ``admin.ejemplo.org``)

``5``
    el n?mero de serie del fichero. Este n?mero se debe incrementar cada
    vez que se modifique el fichero de zona. Muchos administradores
    prefieren un formato expresado del siguiente modo
    ``         aaaammddss``. 2001041002 significa (seg?n dicho formato)
    que el fichero se modific? por ?ltima vez el 04/10/2001 y se indica
    con los dos ?ltimos d?gitos (02) que es la segunda vez en el d?a que
    se ha modificado el fichero. El n?mero de serie es importante ya que
    para avisar a los servidores de nombres esclavos de que se ha
    actualizado la zona.

.. raw:: html

   </div>

.. code:: programlisting

    @       IN NS           ns1.ejemplo.org.

Esta es una entrada de tipo ``NS``. Cada servidor de nombres que
contesta de forma autoritaria a las consultas de un determinado dominio
debe tener una de estas entradas. El caracter ``@`` se sustituye por
``ejemplo.org.``, es decir, se sustituye por el origen.

.. code:: programlisting

    localhost       IN A    127.0.0.1
    ns1             IN A    3.2.1.2
    ns2             IN A    3.2.1.3
    mail            IN A    3.2.1.10
    @               IN A    3.2.1.30

El registro de tipo A hace referencia a nombres de m?quinas . Como puede
verse m?s arriba ``           ns1.ejemplo.org`` se resuelve a
``3.2.1.2``. Vemos que se utiliza otra vez el origen ``@``, que
significa que ``           ejemplo.org`` se resuelve a ``3.2.1.30``.

.. code:: programlisting

    www             IN CNAME        @

Los registros de nombres can?nicos se utilizan normalmente como alias de
m?quinas. En el ejemplo ``www`` es un alias de ``ejemplo.org``
(``3.2.1.30``). ``CNAME``\ s se puede utilizar para proporcionar alias
de nombres de m?quinas, o tambi?n para proporcionar un mecanismo de
vuelta c?clica (“round robin”) de un nombre de m?quina mapeado a un
determinado conjunto de m?quinas intercambiables.

.. code:: programlisting

    @               IN MX   10      mail.ejemplo.org.

El registro ``MX`` indica qu? servidores de correo se encargan de
recibir correos para esta zona. ``mail.example.org`` es el nombre del
servidor de correo y 10 significa la prioridad de dicho servidor.

Se pueden especificar varios servidores de correo con prioridades de,
por ejemplo,3, 2 y 1. Un servidor de correo que intenta entregar correo
para el dominio ``ejemplo.org`` primero intentar? contactar con el
servidor especificado en el registro MX de mayor prioridad, despu?s con
el siguiente y as? sucesivamente hasta que lo logre entregar.

Para los ficheros de zona de in-addr.arpa (DNS inverso) se utiliza el
mismo formato excepto que se especifican registros ``PTR`` en lugar de
registros ``A`` o ``CNAME``.

.. code:: programlisting

    $TTL 3600

    1.2.3.in-addr.arpa. IN SOA ns1.ejemplo.org. admin.ejemplo.org. (
                            5               ; Serial
                            10800           ; Refresh
                            3600            ; Retry
                            604800          ; Expire
                            3600 )          ; Minimum

    @       IN NS   ns1.ejemplo.org.
    @       IN NS   ns2.ejemplo.org.

    2       IN PTR  ns1.ejemplo.org.
    3       IN PTR  ns2.ejemplo.org.
    10      IN PTR  mail.ejemplo.org.
    30      IN PTR  ejemplo.org.

Este fichero proporciona las asociaciones de direcciones IP con nombres
de m?quinas adecuadas para nuestro dominio ficticio.

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

29.11.7. Servidor de nombres de cache
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un servidor de nombres de tipo cach? es un servidor de nombres que no es
autoritario para ninguna zona. Simplemente realiza consultas por s?
mismo y recuerda las respuestas para futuros usos. Para configura uno de
estos servidores se configura el servidor de la forma habitual pero se
omite la inclusi?n de zonas.

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

29.11.8. Ejecuci?n de named en una “ Sandbox”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para obtener una mayor seguridad se puede ejecutar
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
como un usuario sin privilegios y configurarlo mediante
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
dentro del directorio especificado como el directorio del “sandbox”.
Esto hace que cualquier cosa que se encuentre fuera de dicho directorio
resulte inaccesible para el d?mon named. En caso de que se comprometiera
la seguridad de named esta restricci?n puede ayudar a limitar el da?o
sufrido. FreeBSD dispone por defecto de un usuario y un grupo destinado
a este uso: ``bind``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Hay quien recomienda que en lugar de configurar named con ``chroot`` es
mejor configurarlo dentro de
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.
En esta secci?n no se va a explicar esa alternativa.

.. raw:: html

   </div>

Debido a que named no va a poder acceder a nada que se encuentre fuera
del directorio “ sandbox” (y esto incluye cosas tales como bibliotecas
compartidas, “sockets” de “log”, etc) se debe efectuar una serie de
cambios para que named pueda funcionar con normalidad. En la siguiente
lista se supone que la ruta del “sandbox” es ``/etc/namedb`` y que no se
ha modificado anteriormente dicho directorio. Por favor, ejecute los
pasos que se muestran a continuaci?n:

.. raw:: html

   <div class="itemizedlist">

-  Cree todos los directorios que named espera tener a su disposici?n:

   .. code:: screen

       # cd /etc/namedb
       # mkdir -p bin dev etc var/tmp var/run master slave
       # chown bind:bind slave var/*

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#chown-slave>`__               | named s?lamente necesita escribir en |
   |                                      | estos directorios as? que eso es     |
   |                                      | todo lo que debemos crear.           |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

-  Reorganizar y crear los archivos de configuraci?n de zona b?sicos:

   .. code:: screen

       # cp /etc/localtime etc
       # mv named.conf etc && ln -sf etc/named.conf
       # mv named.root master

       # sh make-localhost && mv localhost.rev localhost-v6.rev master
       # cat > master/named.localhost
       $ORIGIN localhost.
       $TTL 6h
       @   IN  SOA localhost. postmaster.localhost. (
                   1   ; serial
                   3600    ; refresh
                   1800    ; retry
                   604800  ; expiration
                   3600 )  ; minimum
           IN  NS  localhost.
           IN  A       127.0.0.1
       ^D

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#localtime>`__                 | Esto permite que named pueda         |
   |                                      | escribir al archivo de log la hora   |
   |                                      | correcta a trav?s del                |
   |                                      | `syslogd(8) <http://www.FreeBSD.org/ |
   |                                      | cgi/man.cgi?query=syslogd&sektion=8> |
   |                                      | `__                                  |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

-  Si est? usando una versi?n de FreeBSD anterior a 4.9-RELEASE se debe
   construir una copia est?ticamente enlazada de named-xfer y copiarla
   dentro del directorio del “sandbox”:

   .. code:: screen

       # cd /usr/src/lib/libisc
       # make cleandir && make cleandir && make depend && make all
       # cd /usr/src/lib/libbind
       # make cleandir && make cleandir && make depend && make all
       # cd /usr/src/libexec/named-xfer
       # make cleandir && make cleandir && make depend && make NOSHARED=yes all
       # cp named-xfer /etc/namedb/bin && chmod 555 /etc/namedb/bin/named-xfer

   Despue?s de instalar la versi?n est?tica de ``named-xfer`` se deben
   realizar algunas tareas de limpieza para evitar dejar copias de
   bibliotecas o de programas en nuestros ficheros de fuentes:

   .. code:: screen

       # cd /usr/src/lib/libisc
       # make cleandir
       # cd /usr/src/lib/libbind
       # make cleandir
       # cd /usr/src/libexec/named-xfer
       # make cleandir

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#clean-cruft>`__               | En algunas ocasiones este paso puede |
   |                                      | fallar. Si es su caso ejecute lo     |
   |                                      | siguiente:                           |
   |                                      |                                      |
   |                                      | .. code:: screen                     |
   |                                      |                                      |
   |                                      |     # cd /usr/src && make cleandir & |
   |                                      | & make cleandir                      |
   |                                      |                                      |
   |                                      | y borre su directorio ``/usr/obj``:  |
   |                                      |                                      |
   |                                      | .. code:: screen                     |
   |                                      |                                      |
   |                                      |     # rm -fr /usr/obj && mkdir /usr/ |
   |                                      | obj                                  |
   |                                      |                                      |
   |                                      | Esto limpia cualquier “impureza” del |
   |                                      | ?rbol de fuentes y si se repiten los |
   |                                      | pasos anteriores todo deber?a        |
   |                                      | funcionar.                           |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

   Si se est? usando FreeBSD version 4.9-RELEASE o posterior el
   ejecutable de ``named-xfer`` del directorio ``/usr/libexec`` ya se
   encuentra enlazado est?ticamente y se puede utilizar
   `cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1>`__
   para copiarlo directamente en nuestro “sandbox”.

-  Cree el fichero ``dev/null`` de tal forma que named pueda verlo y
   pueda escribir sobre ?l:

   .. code:: screen

       # cd /etc/namedb/dev && mknod null c 2 2
       # chmod 666 null

-  Enlace simb?licamente `` /var/run/ndc`` con
   ``/etc/namedb/var/run/ndc``:

   .. code:: screen

       # ln -sf /etc/namedb/var/run/ndc /var/run/ndc

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Esto simplemente evita el tener que especificar la opci?n ``-c`` de
   `ndc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndc&sektion=8>`__
   cada vez que se ejecute. Dado que los contenidos de /var/run se
   borran al inicio del sistema, si se piensa que esto puede resultar
   ?til, se puede a?adir esta orden al “ crontab” del usuario root
   utilizando la opci?n ``@reboot``. Consulte
   `crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5>`__
   para saber m?s informaci?n sobre esto.

   .. raw:: html

      </div>

-  Configure
   `syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
   para que cree un “socket” de ``log`` adicional de tal forma que named
   pueda escribir sobre ?l. A?ada
   ``-l                   /etc/namedb/dev/log`` a la variable
   ``syslogd_flags`` dentro del fichero ``/etc/rc.conf``.

-  Reorganice la ejecuci?n de las aplicaciones named y ``chroot`` para
   que se ejecuten dentro del “sandbox” a?adiendo lo siguiente al
   fichero\ ``/etc/rc.conf``:

   .. code:: programlisting

       named_enable="YES"
       named_flags="-u bind -g bind -t /etc/namedb /etc/named.conf"

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Recuerde que el fichero de configuraci?n *``/etc/named.conf``* tiene
   una ruta completa *que comienza en el directorio del “sandbox”*; por
   ejemplo, en la l?nea superior el fichero que aparece es en realidad
   ``/etc/namedb/etc/named.conf``.

   .. raw:: html

      </div>

.. raw:: html

   </div>

El siguiente paso consiste en editar el fichero
``/etc/namedb/etc/named.conf`` de tal forma que named pueda conocer qu?
zonas cargar y donde encontrarlas en disco. A continuaci?n se muestra un
ejemplo comentado (cualquier cosa que no se comenta en el ejemplo es
porque resulta igual que la configuraci?n del servidor de DNS del caso
normal):

.. code:: programlisting

    options {
            directory "/";
            named-xfer "/bin/named-xfer";
            version "";     // No muestra la versi?n de BIND
            query-source address * port 53;
    };
    // ndc control socket
    controls {
            unix "/var/run/ndc" perm 0600 owner 0 group 0;
    };
    // A partir de aqu??van las zonas:
    zone "localhost" IN {
            type master;
            file "master/named.localhost";
            allow-transfer { localhost; };
            notify no;
    };
    zone "0.0.127.in-addr.arpa" IN {
            type master;
            file "master/localhost.rev";
            allow-transfer { localhost; };
            notify no;
    };
    zone "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.int" {
        type master;
        file "master/localhost-v6.rev";
        allow-transfer { localhost; };
        notify no;
    };
    zone "." IN {
            type hint;
            file "master/named.root";
    };
    zone "private.example.net" in {
            type master;
            file "master/private.example.net.db";
        allow-transfer { 192.168.10.0/24; };
    };
    zone "10.168.192.in-addr.arpa" in {
            type slave;
            masters { 192.168.10.2; };
            file "slave/192.168.10.db";
    };

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#directory>`__                 | La l?nea que contiene ``directory``  |
|                                      | se especifica como ``/``, ya que     |
|                                      | todos los ficheros que named         |
|                                      | necesita se encuentran dentro de     |
|                                      | este directorio (recuerde que esto   |
|                                      | es equivalente al fichero            |
|                                      | ``/etc/namedb`` de un usuario        |
|                                      | “normal”.                            |
+--------------------------------------+--------------------------------------+
| `|2| <#named-xfer>`__                | Especifica la ruta completa para el  |
|                                      | binario ``named-xfer`` binary (desde |
|                                      | el marco de referencia de named).    |
|                                      | Esto resulta necesario ya que por    |
|                                      | defecto named se compila de tal      |
|                                      | forma que trata de localizar         |
|                                      | ``named-xfer`` dentro de             |
|                                      | ``/usr/libexec``.                    |
+--------------------------------------+--------------------------------------+
| `|3| <#master>`__                    | Especifica el nombre del fichero     |
|                                      | (relativo a la l?nea (relativo a la  |
|                                      | l?nea ) ``directory`` anterior)      |
|                                      | donde named puede encontrar el       |
|                                      | fichero de zona para esta zona.      |
+--------------------------------------+--------------------------------------+
| `|4| <#slave>`__                     | Especifica el nombre del fichero     |
|                                      | (relativo a la l?ena ``directory``   |
|                                      | anterior) donde named deber?a        |
|                                      | escribir una copia del archivo de    |
|                                      | zona para esta zona despu?s de       |
|                                      | recuperarla exitosamente desde el    |
|                                      | servidor maestro. Este es el motivo  |
|                                      | por el que en las etapas de          |
|                                      | configuraci?n anteriores             |
|                                      | necesit?bamos cambiar la propiedad   |
|                                      | del directorio ``slave`` al grupo    |
|                                      | ``bind``.                            |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Despu?s de completar los pasos anteriores reinicie el servidor o
reinicie
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
y ejecute
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
asegur?ndose de que se utilicen las nuevas opciones especificadas en
``syslogd_flags`` y ``named_flags``. En estos momentos deber?amos estar
ejecutando una copia de named dentro de un “sandbox”.

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

29.11.9. Seguridad
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aunque BIND es la implementaci?n de DNS m?s utilizada existe siempre el
asunto relacionado con la seguridad. De vez en cuando se encuentran
agujeros de seguridad y vulnerabilidades.

Es una buena idea suscribirse a `CERT <http://www.cert.org/>`__ y a
`freebsd-security-notifications <../handbook/eresources.html#ERESOURCES-MAIL>`__
para estar al d?a de los problemas de seguridad relacionados con named.

.. raw:: html

   <div class="tip" xmlns="">

Sugerencia:
~~~~~~~~~~~

Si surge un problema nunca est? de m?s actualizar los fuentes y
recompilar los ejecutables desde dichas fuentes.

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

29.11.10. Lecturas recomendadas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las p?ginas del manual de BIND/named:
`ndc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndc&sektion=8>`__
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
`named.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=named.conf&sektion=5>`__

.. raw:: html

   <div class="itemizedlist">

-  `P?gina oficial de ISC Bind <http://www.isc.org/products/BIND/>`__

-  `Preguntas m?s frecuentes sobre
   BIND <http://www.nominum.com/getOpenSourceResource.php?id=6>`__

-  `Libro de O'Reilly "DNS and BIND", cuarta
   edici?n <http://www.oreilly.com/catalog/dns4/>`__

-  `RFC1034 - Nombre de Dominio - Conceptos y
   Caracter?sticas <ftp://ftp.isi.edu/in-notes/rfc1034.txt>`__

-  `RFC1035 - Nombres de Domninio - Implementaci?n y
   Especificaci?n <ftp://ftp.isi.edu/in-notes/rfc1035.txt>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------------+---------------------------------------+
| `Anterior <network-dhcp.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-ntp.html>`__   |
+-------------------------------------+----------------------------------------+---------------------------------------+
| 29.10. DHCP?                        | `Inicio <index.html>`__                | ?29.12. NTP                           |
+-------------------------------------+----------------------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png

=======================
24.5. Servicio dial-out
=======================

.. raw:: html

   <div class="navheader">

24.5. Servicio dial-out
`Anterior <dialup.html>`__?
Cap?tulo 24. Comunicaciones serie
?\ `Siguiente <serialconsole-setup.html>`__

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

24.5. Servicio dial-out
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los siguientes son tips para que su equipo pueda conectarse a otra
computadora mediante el modem. Esto es apropiado para establecer una
sesi?n de terminal con un equipo remoto.

Esto es ?til para entrar a una BBS.

Este tipo de conexi?n puede ser extremadamente ?til para obtener un
fichero del Internet si tiene problemas con PPP. Si necesita mandar por
FTP algo y PPP no funciona, utilice la sesi?n de terminal para mandarlo
por FTP. Entonces use zmodem para transferirlo a su m?quina.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.5.1. ?Mi modem Hayes no est? soportado, que puedo hacer?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En realidad, la p?gina de manual para ``tip`` no est? actualizada.
Existe un marcador Hayes gen?rico incluido. Solo utilice ``at=hayes`` en
su fichero ``/etc/remote``.

El controlador Hayes no es lo suficientemente inteligente para reconocer
algunas de las funciones avanzadas de nuevos modems como ``BUSY``,
``NO DIALTONE``, o ``CONNECT 115200`` y solamente se confundir?. Deber?a
apagar esos mensajes cuando utilice ``tip`` (usando ``ATX0&W``).

Tambi?n, la pausa de marcado para ``tip`` es de 60 segundos. Su modem
debe utilizar un poco menos, o de otra manera tip pensar? que existe un
problema de comunicaci?n. Trate con ``ATS7=45&W``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

As? como se env?a, ``tip`` todav?a no soporta modems Hayes
completamente. La soluci?n es editar el fichero ``tipconf.h`` en el
directorio ``/usr/src/usr.bin/tip/tip``. Obviamente necesita las fuentes
de la distribuci?n para hacer esto.

Edite la l?nea ``#define HAYES 0`` a ``#define HAYES 1``. Entonces haga
un ``make`` y ``make install``. Todo funciona bien despues de eso.

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

24.5.2. ?Como se espera que yo entre estos comandos AT?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Haga lo que se llama una entrada “directa” en su fichero
``/etc/remote``. Por ejemplo, si su modem est? conectado al primer
puerto serie, ``/dev/cuaa0``, entonces ponga la siguiente l?nea:

.. code:: programlisting

    cuaa0:dv=/dev/cuaa0:br#19200:pa=none

Utilice la tasa m?s alta de bps que su modem soporte en la capacidad br.
Entonces, escriba ``tip cuaa0`` y estar? conectado a su modem.

Si no existe un fichero ``/dev/cuaa0`` en su sistema, haga esto:

.. code:: screen

    # cd /dev
    # sh MAKEDEV cuaa0

O use ``cu`` como ``root`` con el siguiente comando:

.. code:: screen

    # cu -lline -sspeed

*``line``* es el puerto serie (ejem.``/dev/cuaa0``) y *``speed``* es la
velocidad (ejem.``57600``). Cuando termine de meter los comandos AT
presione **~.** para salir.

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

24.5.3. ?El signo ``@`` para la capacidad pn no funciona!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El signo ``@`` en la capacidad n?mero de tel?fono le dice a tip que
busque en ``/etc/phones`` por un n?mero de tel?fono. Pero el signo ``@``
tambi?n es un caracter especial en ficheros de capacidad como
``/etc/remote``. Esc?pelo con una diagonal invertida:

.. code:: programlisting

    pn=\@

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

24.5.4. Como puede marcar un n?mero de tel?fono. en la l?nea de comando?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ponga lo que se llama una entrada “generica” en su fichero
``/etc/remote``. Por ejemplo:

.. code:: programlisting

    tip115200|Dial any phone number at 115200 bps:\
            :dv=/dev/cuaa0:br#115200:at=hayes:pa=none:du:
    tip57600|Dial any phone number at 57600 bps:\
            :dv=/dev/cuaa0:br#57600:at=hayes:pa=none:du:

Entonces puede hacer cosas como:

.. code:: screen

    # tip -115200 5551234

Si prefiere ``cu`` y no ``tip``, use una entrada ``cu``:

.. code:: programlisting

    cu115200|Use cu to dial any number at 115200bps:\
            :dv=/dev/cuaa1:br#57600:at=hayes:pa=none:du:

y escriba:

.. code:: screen

    # cu 5551234 -s 115200

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

24.5.5. ?Tengo que teclear la tasa de bps cada vez que haga eso?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ponga una entrada para ``tip1200`` o ``cu1200``, pero utilice cualquier
tasa bps que sea apropiada con la capacidad br. ``tip`` piensa que una
buena opci?n por omisi?n es 1200?bps es por eso que busca una entrada
``tip1200``. Aunque no tiene que usar 1200?bps.

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

24.5.6. Acceso a un n?mero de equipos a trav?s de un servidor de terminales
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

en lugar de esperar hasta que est? conectado y teclear
``CONNECT <host>`` cada vez, use la capacidad de tip ``cm``. Por
ejemplo, estas entradas en ``/etc/remote``:

.. code:: programlisting

    pain|pain.deep13.com|Forrester's machine:\
            :cm=CONNECT pain\n:tc=deep13:
    muffin|muffin.deep13.com|Frank's machine:\
            :cm=CONNECT muffin\n:tc=deep13:
    deep13:Gizmonics Institute terminal server:\
            :dv=/dev/cuaa2:br#38400:at=hayes:du:pa=none:pn=5551234:

Le permitir? teclear ``tip pain`` o ``tip muffin`` para conectar a los
equipos pain o muffin, y ``tip deep13`` para accesar al servidor de
terminales.

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

24.5.7. ?Puede Tip tratar m?s de una l?nea para cada sitio?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eso es a menudo un problema donde una universidad tiene varias l?neas de
modems y varios miles de estudiantes tratando de usarlas.

Haga una entrada para su universidad en ``/etc/remote`` y use ``@`` para
la capacidad ``pn`` :

.. code:: programlisting

    big-university:\
            :pn=\@:tc=dialout
    dialout:\
            :dv=/dev/cuaa3:br#9600:at=courier:du:pa=none:

Entonces liste los n?meros de tel?fonos para la universidad en
``/etc/phones``:

.. code:: programlisting

    big-university 5551111
    big-university 5551112
    big-university 5551113
    big-university 5551114

``tip`` tratar? cada uno en el orden listado, entonces se rendir?. Si
quiere seguir tratando, ejecute ``tip`` en un ciclo while.

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

24.5.8. ?Porqu? tengo que presionar **Ctrl**+**P** dos veces para mandar un **Ctrl**+**P** ?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

**Ctrl**+**P** es el caracter de “forzado” por omisi?n, usado para
decirle a ``tip`` que el siguiente caracter es un dato literal. Puede
establecer el caracter de forzado a cualquier otro caracter con el
escape ``~s``, el cual significa “establecer una variable.”

Escriba ``~sforce=single-char`` seguido por una nueva l?nea.
*``single-char``* es cualquier caracter. Si no especifica
*``single-char``*, entonces el caracter de forzado es el caracter nulo,
el cual puede obtener tecleando **Ctrl**+**2** o **Ctrl**+**Espacio**.
Un bu?n valor para *``single-char``* es **Shift**+**Ctrl**+**6**, es
cual solamente es usado en algunos servidores de terminales.

Puede hacer que el caracter de forzado sea cualquiera que usted quiera
especificando lo siguiente en su fichero ``$HOME/.tiprc``:

.. code:: programlisting

    force=<single-char>

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

24.5.9. ??De repente todo lo que escribo est? en may?sculas??
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Debe haber presionado **Ctrl**+**A**, el“caracter de may?sculas” de
``tip`` especialmente dise?ado para personas con teclas caps-lock
da?adas. Use ``~s`` como se ve arriba y establezca la variable
``raisechar`` a algo razonable. De hecho, puede establecerla a la misma
del caracter de forzado, si nunca espera utilizar ninguna de estas
funciones.

Aqu? hay un ejemplo de fichero .tiprc perfecto para usuarios de Emacs
que necesitan teclear **Ctrl**+**2** y **Ctrl**+**A** con frecuencia:

.. code:: programlisting

    force=^^
    raisechar=^^

El ^^ es **Shift**+**Ctrl**+**6**.

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

24.5.10. ?Como puedo realizar transferencias de ficheros con ``tip``?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si esta hablando con otro sistema UNIX?, puede mandar y recibir ficheros
con ``~p`` (put) y ``~t`` (take). Estos comandos ejecutan ``cat`` y
``echo`` en el sistema remoto para aceptar y env?ar ficheros. La
sintaxis es:

.. raw:: html

   <div class="cmdsynopsis">

``~p`` fichero-local [fichero-remoto]

.. raw:: html

   </div>

.. raw:: html

   <div class="cmdsynopsis">

``~t`` fichero-remoto [fichero-local]

.. raw:: html

   </div>

No existe revisi?n de errores, as? que probablemente deber?a usar otro
protocolo, como zmodem.

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

24.5.11. ?Como puedo ejecutar zmodem con ``tip``?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para recibir ficheros, inicie el programa de env?o en el extremo remoto.
Entonces escriba ``~C rz`` para empezar a recibirlos localmente.

Para enviar ficheros, inicie el programa de recepci?n el extremo remoto.
Entonces escriba ``~C sz files`` para enviarlos al sistema remoto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+--------------------------------+-----------------------------------------------+
| `Anterior <dialup.html>`__?   | `Subir <serialcomms.html>`__   | ?\ `Siguiente <serialconsole-setup.html>`__   |
+-------------------------------+--------------------------------+-----------------------------------------------+
| 24.4. Servicio dial-in?       | `Inicio <index.html>`__        | ?24.6. Configurando la consola serie          |
+-------------------------------+--------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

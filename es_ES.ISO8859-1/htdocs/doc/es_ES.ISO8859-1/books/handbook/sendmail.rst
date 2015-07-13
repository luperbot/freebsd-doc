===============================
27.3. Configuraci?n de sendmail
===============================

.. raw:: html

   <div class="navheader">

27.3. Configuraci?n de sendmail
`Anterior <mail-using.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <mail-changingmta.html>`__

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

27.3. Configuraci?n de sendmail
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuido por Christopher Shumway.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__
es el agente de transporte de correo (MTA) por defecto de FreeBSD. La
responsabilidad de sendmail consiste en aceptar correo de agentes de
correo de usuario (MUA) y en entregar dichos correos al agente de
transporte de correo apropiado, seg?n se especifique en su archivo de
configuraci?n. Sendmail tambi?n acepta conexiones de red provinientes de
otros agentes de transporte y puede depositar el correo recibido en
carpetas locales o o entregarlo a otros programas.

sendmail utiliza los siguientes ficheros de configuraci?n:

.. raw:: html

   <div class="informaltable">

+----------------------------------+-----------------------------------------------------------+
| Filename                         | Function                                                  |
+==================================+===========================================================+
| ``/etc/mail/access``             | Base de datos de accesos de sendmail                      |
+----------------------------------+-----------------------------------------------------------+
| ``/etc/mail/aliases``            | Carpeta de alias                                          |
+----------------------------------+-----------------------------------------------------------+
| ``/etc/mail/local-host-names``   | Listados de m?quinas para las que sendmailacepta correo   |
+----------------------------------+-----------------------------------------------------------+
| ``/etc/mail/mailer.conf``        | Configuraci?n del programa de correo                      |
+----------------------------------+-----------------------------------------------------------+
| ``/etc/mail/mailertable``        | Tabla de entregas de correo                               |
+----------------------------------+-----------------------------------------------------------+
| ``/etc/mail/sendmail.cf``        | Archivo de configuraci?n principal de sendmail            |
+----------------------------------+-----------------------------------------------------------+
| ``/etc/mail/virtusertable``      | Usuarios virtuales y tablas de dominio                    |
+----------------------------------+-----------------------------------------------------------+

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

27.3.1. ``/etc/mail/access``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La base de datos de accesos define qu? m?quinas o direcciones IP pueden
acceder al servidor de correo y qu?e clase de acceso tienen permitido.
Las m?quinas se listan junto con las opciones ``OK``, ``REJECT``,
``RELAY`` o simplemente junto con un mensaje de error que se entrega a
la rutina de gesti?n de excepciones de sendmail. Las m?quinas que se
listan junto con la opci?n ``OK``, que es el valor por defecto, tienen
permiso para enviar correo a la m?quina servidora siempre y cuando la
direcci?n de correo de destino sea la m?quina servidora de correo. Las
m?quinas listadas junto con la opci?n ``REJECT`` tienen el acceso
prohibido a conexiones de correo electr?nico con el servidor. Por ?ltimo
las m?quinas que poseen la etiqueta ``RELAY`` para sus nombres tienen
permitido enviar correo para cualquier destino a trav?s de la m?quina
servidora de correo.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 27.1. Configuraci?n de la base de datos de acceso de sendmail

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    cyberspammer.com                550 We don't accept mail from spammers
    FUENTE.DE.CORREO.INDISCRIMINADO@ 550 We don't accept mail from spammers
    otra.fuente.de.spam             REJECT
    okay.cyberspammer.com           OK
    128.32                          RELAY

.. raw:: html

   </div>

.. raw:: html

   </div>

En el ejemplo se pueden observar cinco entradas. Los generadores de
correo que coinciden con la parte izquierda de la tabla se ven afectados
por la parte acci?n especificada en la parte derecha. Los primeros dos
ejemplos emiten un c?digo de error para la rutina de excepciones de
sendmail. El mensaje de error se transmite a la m?quina remota cuando se
recibe un correo que coincide con la parte izquierda de la tabla. La
siguiente entrada rechaza correo de una determinada m?quina de internet,
``otra.fuente.de.spam``. La siguiente entrada acepta conexiones de
correo de la m?quina ``okay.cyberspammer.com``, lo cual es m?s exacto
que la l?nea de arriba de ``cyberspammer.com``. Las coincidencias m?s
completas tienen precedencia sobre las menos espec?ficas. La ?ltima
entrada permite actuar como “relay” o pasarela de correo electr?nico
para aquellas m?quinas que posean una direcci?n IP que comience por
``128.32``. ?stas m?quinas podr?an enviar correo destinado a otros
servidores de correo utilizando el nuestro.

Cuando se actualiza este fichero se debe ejecutar ``make`` dentro de
``/etc/mail/`` para que se actualice la base de datos.

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

27.3.2. ``/etc/mail/aliases``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La base de datos de alias contiene una lista de directorios virtuales
que son traducidas a otros usuarios, ficheros, programas o incluso otros
alias. A continuaci?n se muestran unos pocos ejemplos de la sint?xis que
se puede utilizar dentro del fichero ``/etc/mail/aliases``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 27.2. Mail Aliases

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    root: usuariolocal
    ftp-bugs: joe,eric,paul
    bit.bucket:  /dev/null
    procmail: "|/usr/local/bin/procmail"

.. raw:: html

   </div>

.. raw:: html

   </div>

El formato del fichero es sencillo; el nombre de la carpeta de correo
que aparece a la izquierda de los dos puntos se traduce al/los destinos
de la derecha. El primer ejemplo simplemente traduce la carpeta ``root``
a la carpeta ``usuariolocal``, la cual se examina de nuevo utilizando la
misma base de datos de alias, y si no existe ninguna otra coincidencia
el mensaje se entrega al usuario local ``usuariolocal``. En el ejemplo
siguiente se muestra una lista de correo. Todo correo que se env?a a la
carpeta ``ftp-bugs`` se traduce en un env?o para tres carpetas locales
diferentes: ``joe``, ``eric`` y ``paul``. Es importante se?alar que
tambi?n se pueden especificar carpetas remotas mediante la forma
``usuario@ejemplo.com``. El siguiente ejemplo muestra la escritura del
correo a un fichero, en este caso en ``         /dev/null``. El ?ltimo
ejemplo muestra el envi? de correo a un programa; en este caso el
mensaje de correo se escribe en la entrada est?ndar del programa
``/usr/local/bin/procmail`` utilizando una tuber?a (o “ pipe”) de UNIX?.

Cuando se actualiza este fichero se debe ejecutar ``make`` dentro de
``/etc/mail/`` para actualizar la base de datos.

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

27.3.3. ``/etc/mail/local-host-names``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este archivo es una lista de nombres de m?quinas que
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__
acepta como nombres locales. Se suele utilizar para escribir aquellos
dominios o m?quinas de los cuales sendmail va a recibir correo. Por
ejemplo, si nuestro servidor de correo va a aceptar correo proveniente
del dominio ``ejemplo.com`` y tambi?n de la m?quina ``mail.ejemplo.com``
nuestro ``local-host-names`` deber?a ser algo as?:

.. code:: programlisting

    ejemplo.com
    mail.ejemplo.com

Cuando se actualiza este fichero
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__
necesita ser reiniciado para que tenga en cuenta los cambios.

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

27.3.4. ``/etc/mail/sendmail.cf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Archivo de configuraci?n principal de sendmail, controla el
comportamiento global de sendmail, incluyendo cualquier tarea desde la
reescritura de direcciones de correo electr?nico hasta la devoluci?n de
mensajes de error a los servidores de correo remotos. Es evidente que
con un abanico tan diverso el fichero de configuraci?n acaba por ser
bastante complejo y sus detalles quedan fuera de los objetivos de esta
secci?n. Afortunadamente este fichero raras veces necesita ser
modificado, al menos en lo que respecta a servidores de correo est?ndar.

El fichero de configuraci?n principal de sendmail se puede construir a
partir de
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__, es
decir, macros que se utilizan para definir caracter?sticas y
comportamientos espec?ficos de sendmail. Se ruega al lector consultar
``/usr/src/contrib/sendmail/cf/README`` para obtener m?s detalles acerca
de las distintas macros que se pueden utilizar.

Cuando se realizan cambios a este fichero sendmail debe ser reiniciado
para que los cambios surtan efecto.

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

27.3.5. ``/etc/mail/virtusertable``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El fichero ``virtusertable`` asocia direcciones de correo pertenecientes
a dominios y carpetas virtuales con carpetas reales. Estas carpetas
pueden ser locales, remotas, alias definidos en ``/etc/mail/aliases`` o
incluso ficheros.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 27.3. Ejemplo de asociaci?n de correo de dominio virtual

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    root@ejemplo.com                root
    postmaster@ejemplo.com          postmaster@noc.ejemplo.net
    @ejemplo.com                    joe

.. raw:: html

   </div>

.. raw:: html

   </div>

En el ejemplo superior se observa una asociaci?n para el dominio
``ejemplo.com``. Este fichero se procesa de arriba a abajo buscando la
primera coincidencia. La primera entrada asocia
``       root@ejemplo.com`` con la carpeta de correo local denominada
``root``. La siguiente entrada asocia ``postmaster@ejemplo.com`` con la
carpeta ``postmaster`` situada en la m?quina ``noc.ejemplo.net``. Por
?ltimo, si no se ha encontrado ninguna coincidencia para ``ejemplo.com``
se le asigna la ?ltima asociaci?n, la cual asocia cualquier mensaje de
correo proveniente de ``       ejemplo.com`` con la carpeta de correo
local denominada ``joe``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+---------------------------+------------------------------------------------------------+
| `Anterior <mail-using.html>`__?             | `Subir <mail.html>`__     | ?\ `Siguiente <mail-changingmta.html>`__                   |
+---------------------------------------------+---------------------------+------------------------------------------------------------+
| 27.2. Utilizaci?n del correo electr?nico?   | `Inicio <index.html>`__   | ?27.4. Sustituci?n del Agente de Transferencia de Correo   |
+---------------------------------------------+---------------------------+------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

==================================
27.11. Agente de Correo de Usuario
==================================

.. raw:: html

   <div class="navheader">

27.11. Agente de Correo de Usuario
`Anterior <SMTP-Auth.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <mail-fetchmail.html>`__

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

27.11. Agente de Correo de Usuario
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Marc Silver.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un agente de correo de usuario (MUA en ingl?s Mail User Agent) es una
aplicaci?n que se utiliza para enviar y recibir correo. Coomo el correo
electr?nico est? en constante evoluci?n y cada vez se vuelve m?s
complejo y con m?s opciones, los MUAs son cada vez m?s complejos y
potentes. Esto permite a los usuarios disponer de mayor flexibilidad y
funcionalidad. FreeBSD admite para much?simos agentes de correo de
usuario, todos los cuales pueden instalarse desde los
`Ports <ports.html>`__. Los usuarios pueden elegir entre lientes de
correo con interfaz gr?fica como evolution o balsa o entre clientes
basados en consola como mutt, pine o ``mail``, e incluso utilizar
interfaces web.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.11.1. mail
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__ es
el agente de correo de usuario (MUA) que viene por defecto con FreeBSD.
Es un MUA de consola que ofrece toda la funcionalidad b?sica necesaria
para enviar y recibir correos, aunque resulta limitado limitado en su
capacidad para manejar adjuntos y s?lamente soporta carpetas de correo
locales.

Aunque ``mail`` no soporta de forma nativa la interacci?n con servidores
de correo mediante POP o IMAP estas carpetas de correo remotas pueden
descargarse a un fichero ``mbox`` local utilizando una aplicaci?n de
descarga como fetchmail, que se describe en este mismo cap?tulo en
(`Secci?n?27.12, “Manejo de fetchmail” <mail-fetchmail.html>`__).

Para enviar y recibir correo eletr?nico basta con ejecutar el comando
``mail``. Veamos un ejemplo:

.. code:: screen

    % mail

El contenido de la carpeta de usuario en el directorio ``/var/mail`` se
leen autom?ticamente. Si la carpeta se encuentra vac?a la aplicaci?n
termina su ejecuci?n con un mensaje que indica que no ha podido
encontrar correo. Una vez que la carpeta ha sido le?da la interfaz de la
aplicaci?n entra en funcionamiento y se muestra por pantalla un listado
de los mensajes recuperados. Los mensajes se numeran autom?ticamente y
pueden leerse como se observa en el siguiente ejemplo:

.. code:: screen

    Mail version 8.1 6/6/93.  Type ? for help.
    "/var/mail/marcs": 3 messages 3 new
    >N  1 root@localhost        Mon Mar  8 14:05  14/510   "test"
     N  2 root@localhost        Mon Mar  8 14:05  14/509   "user account"
     N  3 root@localhost        Mon Mar  8 14:05  14/509   "sample"

Los mensajes se pueden leer utilizando el comando **t** de ``mail``
escribiendo a continuaci?n el n?mero del mensaje que queremos leer. En
este ejemplo vamos a leer el primer correo:

.. code:: screen

    % t 1
    Message 1:
    From root@localhost  Mon Mar  8 14:05:52 2004
    X-Original-To: marcs@localhost
    Delivered-To: marcs@localhost
    To: marcs@localhost
    Subject: test
    Date: Mon,  8 Mar 2004 14:05:52 +0200 (SAST)
    From: root@localhost (Charlie Root)

    This is a test message, please reply if you receive it.

Como podemos observar en el ejemplo anterior el comando **t** muestra el
contenido del correo eletr?nico con todas sus cabeceras. Para mostrar el
listado con todos los correos de nuevo, se debe utilizar la tecla **h**.

Si el correo eletr?nico requiere una contestaci?n se puede utilizar la
aplicaci?n ``mail`` para responder utilizando la tecla **R** o **r**. La
tecla **R** indica a ``mail`` que conteste s?lo al origen (remitente)
del correo, mientras que la tecla **r** tanto al remitente a los otros
usuarios receptores del mensaje original. Adem?s ambos comandos se
pueden ejecutar escribiendo a continuaci?n el n?mero que identifica al
mensaje que se quiere responder. Tras esto la respuesta puede redactarse
, y se debe indicar el final del mensaje mediante un punto (**.**) a
continuaci?n de un salto de l?nea. Veamos un ejemplo:

.. code:: screen

    % R 1
    To: root@localhost
    Subject: Re: test

    Thank you, I did get your email.
    .
    EOT

Para enviar nuevos correos eletr?nicos se debe utilizar la tecla **m**
seguida de la direcci?n de de correo del destinatario. Se pueden
especificar varios destinatarios de correo separando cada direcci?n de
correo con una coma ( **,** ). El asunto del mensaje de correo se puede
escribir a continuaci?n seguido por el cuerpo del mensaje. El final del
mensaje se especifica como en el caso anterior, utilizando un **.** tras
un saldo de l?nea y pulsando la tecla “enter”.

.. code:: screen

    % mail root@localhost
    Subject: I mastered mail

    Now I can send and receive email using mail ... :)
    .
    EOT

Mientras nos encontremos dentro de la ``mail`` el comando **?** puede
utilizarse para mostrar la ayuda en l?nea aunque la principal fuente de
informaci?n detallda sobre esta aplicaci?n es la p?gina man
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Tal y como se ha dicho ya la aplicaci?n
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__ no
fue dise?ada originalmente para gestionar adjuntos, por lo que su forma
de gestionarlos resulta ser extremadamente mala. MUA m?s modernos como
mutt gestionan los adjuntos de correo de una forma mucho m?s
inteligente. Si se desea utilizar el comando ``mail`` el port
`converters/mpack <http://www.freebsd.org/cgi/url.cgi?ports/converters/mpack/pkg-descr>`__
le puede resultar bastante ?til.

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

27.11.2. mutt
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

mutt es un agente de correo de usuario peque?o pero muy potente,
funcional y con excelentes caracter?sticas; veamos algunas:

.. raw:: html

   <div class="itemizedlist">

-  La habilidad de agrupar mensajes en hilos.

-  Soporte de PGP para cifradon y firma digital de correos eletr?nicos.

-  Soporte de tipos MIME.

-  Soporte de gesti?n de correo en formato Maildir.

-  Altamente configurable por el usuario.

.. raw:: html

   </div>

Toda estas caracter?sticas hacen de mutt uno de los agentes de correo
m?s avanzados del momento. Consulte ``http://www.mutt.org`` para m?s
informaci?n sobre mutt.

La versi?n estable de mutt se puede instalar usando el port
`mail/mutt <http://www.freebsd.org/cgi/url.cgi?ports/mail/mutt/pkg-descr>`__
mientras que la versi?n de desarrollo est? en
`mail/mutt-devel <http://www.freebsd.org/cgi/url.cgi?ports/mail/mutt-devel/pkg-descr>`__.
Una vez que se ha instalado el port, mutt puede ejecutarse mediante el
siguiente comando:

.. code:: screen

    % mutt

mutt lee autom?ticamente el contenido de la carpeta de correo del
usuario dentro del directorio ``/var/mail`` y muestra por pantalla su
contenido. Si el directorio est? vac?o mutt quedar? a la espera de los
comandos que pueda pasarle el usuario. En el ejemplo que se muestra a
continuaci?n puede verse c?mo mutt facilita la lista de mensajes al
usuario:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

Para leer un correo basta con seleccionarlo usando las teclas de cursor,
y presionando la tecla **Enter**. Veamos c?mo muestra mutt un correo
electr?nico:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

Al igual que ocurre con
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__
mutt permite que los usuarios contesten al remitente de cualquier
mensaje as? como a los dem?s receptores. Para responder s?lo al
remitente se puede utilizar la tecla **r**. Para responder a un grupo,
es decir a todos los receptores y al remitente del correo eletr?nico
pulse **g**.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

mutt tiene
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__ como
editor por defecto para crear y responder a los mensajes de correo
eletr?nico. Si prefiere emplear otro editor modifique el valor de la
variable ``editor`` en ``.muttrc``.

.. raw:: html

   </div>

Para escribir un mensaje de correo presione la tecla **m**. Despu?s de
escribir el asunto mutt ejecuta
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__ y el
cuerpo del mensaje puede escribirse. Una vez escrito el correo salga de
``vi`` y mutt se ejecutar? de nuevo mostrando por pantalla un resumen
del correo que est? a punto de ser enviado. Para enviar ese correo hay
que pulsar **y**. Este es un ejemplo de uno de esos res?menes:

.. raw:: html

   <div class="mediaobject">

|image2|

.. raw:: html

   </div>

mutt tambi?n contiene una amplia ayuda a la que se accede desde la
mayor?a de los men?s pulsando la tecla **?**. La primera l?na de la
pantalla tambi?n muestra las teclas de m?todo abreviado cuando es
posible utilizarlas.

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

27.11.3. pine
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

pine es una aplicaci?n de correo enfocada a los usuarios principiantes o
inexpertos pero tambi?n incluye algunas caracter?sticas avanzadas.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Se han descubierto en pine varias vulnerabilidades que pueden explotarse
de forma remota. Esas vulnerabilidades permiten que atacantes remotos
puedan ejecutar c?digo como si fueran usuarios locales del sistema
mediante el env?o de correos con un formato determinado. Todos los
problemas *conocidos* se han resuelto pero el c?digo de pine est?
escrito de una forma insegura y el “Security Officer” de FreeBSD opina
que es probable que existan todav?a vulnerabilidades sin descubrir. Si
decide instalar pine debe asumir los riesgos que ello puede implicar.

.. raw:: html

   </div>

La versi?n actual de pine se puede instalar utilizando el port
`mail/pine4 <http://www.freebsd.org/cgi/url.cgi?ports/mail/pine4/pkg-descr>`__.
Una vez que se ha instalado pine se puede ejecutar mediante el siguiente
comando:

.. code:: screen

    % pine

La primera vez que se ejecuta pine se muestra un mensaje de bienvenida
con una peque?a introducci?n a la herramienta junto con una petici?n del
equipo de desarrollo de pine en la que se solicita que se env?e un
correo de forma an?nima un correo de forma an?nima para que puedan
hacerse una idea s de cu?ntos usuarios est?n utilizando la herramienta.
Para enviar dicho correo hay que presionar la tecla **Enter**, o bien
puede pulsar la tecla **E** para salir de la ventana de bienvenida sin
enviar dicho correo. A continuaci?n se muestra un ejemplo de la p?gina
de bienvenida:

.. raw:: html

   <div class="mediaobject">

|image3|

.. raw:: html

   </div>

Los usuarios disponen de un men? principal, que puede navegarse
utilizando las flechas. Este men? proporciona atajos para la composici?n
de nuevos correos, para navegar a trav?s de las carpetas de correo, e
incluso para la administraci?n de la libreta de direcciones. Justo
debajo del men? principal, se muestran las teclas de m?todo abreviado
(atajos) que pueden utilizarse en cada momento.

El directorio por defecto que pine intenta abrir es ``inbox``. Para ver
el ?ndice de todos los mensajes recibidos pulse la tecla **I** o
seleccione la opci?n de men? denominada MESSAGE INDEX como se muestra a
continuaci?n:

.. raw:: html

   <div class="mediaobject">

|image4|

.. raw:: html

   </div>

El ?ndice muestra los mensajes en el directorio actual y puede navegarse
en ?l utilizando las teclas del cursor. El mensaje seleccionado se puede
leer presionando la tecla **Enter**.

.. raw:: html

   <div class="mediaobject">

|image5|

.. raw:: html

   </div>

En la captura de pantalla que se muestra a continuaci?n se muestra un
mensaje de ejemplo. Las teclas de atajo se muestran como referencia en
la parte baja de la pantalla. Un ejemplo de dichas teclas de m?todo
abreviado es la tecla **r** que permite responder al mensaje que se
muestra en dicho momento.

.. raw:: html

   <div class="mediaobject">

|image6|

.. raw:: html

   </div>

La contestaci?n a un mensaje de correo eletr?nico en pine se realiza
mediante el editor pico, que se instala por defecto junto con pine. pico
permite navegar de forma sencilla por los distintos mensajes de correo y
es ligeramente m?s sencilla de manejar que
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__, sobre
todo para los usuarios noveles. Una vez que se ha escrito la r?plica al
correo se env?a pulsando la tecla **Ctrl**+**X**. pine pedir?
confirmaci?n antes de enviarlo.

.. raw:: html

   <div class="mediaobject">

|image7|

.. raw:: html

   </div>

pine puede configurarse utilizando la entrada SETUP del men? principal.
Se ruega consultar ``http://www.washington.edu/pine/`` para obtener m?s
informaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------+------------------------------------------+
| `Anterior <SMTP-Auth.html>`__?            | `Subir <mail.html>`__     | ?\ `Siguiente <mail-fetchmail.html>`__   |
+-------------------------------------------+---------------------------+------------------------------------------+
| 27.10. Autentificaci?n utilizando SMTP?   | `Inicio <index.html>`__   | ?27.12. Manejo de fetchmail              |
+-------------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |image0| image:: mail/mutt1.png
.. |image1| image:: mail/mutt2.png
.. |image2| image:: mail/mutt3.png
.. |image3| image:: mail/pine1.png
.. |image4| image:: mail/pine2.png
.. |image5| image:: mail/pine3.png
.. |image6| image:: mail/pine4.png
.. |image7| image:: mail/pine5.png

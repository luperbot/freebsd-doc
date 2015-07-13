=============
14.9. OpenSSL
=============

.. raw:: html

   <div class="navheader">

14.9. OpenSSL
`Anterior <kerberos5.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <ipsec.html>`__

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

14.9. OpenSSL
-------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por: Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El conjunto de herramientas OpenSSL es una caracter?stica de FreeBSD que
muchos usuarios pasan por alto. OpenSSL ofrece una capa de cifrada de
transporte sobre la capa normal de comunicaci?n, permitiendo la
combinaci?n con con muchas aplicaciones y servicios de red.

Algunos usos de OpenSSL son la validaci?n cifrada de clientes de correo,
las transacciones basadas en web como pagos con tarjetas de cr?dito,
etc. Muchos ports, como
`www/apache13-ssl <http://www.freebsd.org/cgi/url.cgi?ports/www/apache13-ssl/pkg-descr>`__
y
`mail/sylpheed-claws <http://www.freebsd.org/cgi/url.cgi?ports/mail/sylpheed-claws/pkg-descr>`__
ofrecen soporte de compilaci?n para OpenSSL.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En la mayor?a de los casos la colecci?n de ports tratar? de compilar el
port
`security/openssl <http://www.freebsd.org/cgi/url.cgi?ports/security/openssl/pkg-descr>`__
a menos que la variable de make ``WITH_OPENSSL_BASE`` sea puesta
expl?citamente a “yes”.

.. raw:: html

   </div>

La versi?n de OpenSSL incluida en FreeBSD soporta los protocolos de
seguridad de red Secure Sockets Layer v2/v3 (SSLv2/SSLv3) y Transport
Layer Security v1 (TLSv1) y puede utilizarse como biblioteca
criptogr?fica general.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

OpenSSL soporta el algoritmo IDEA pero est?a deshabilitado por defecto
debido a patentes en vigor en los Estados Unidos. Si quiere usarlo debe
revisar la licencia, y si las restricciones le parecen aceptables active
la variable ``MAKE_IDEA`` en ``make.conf``.

.. raw:: html

   </div>

Uno de los usos m?s comunes de OpenSSL es ofrecer certificados para usar
con aplicaciones de software. Estos certificados aseguran que las
credenciales de la compa?ia o individuo son v?lidos y no son
fraudulentos. Si el certificado en cuesti?n no ha sido verificado por
uno de las diversas “autoridades certificadoras” o CA, suele generarse
una advertencia al respecto. Una autoridad de certificados es una
compa?ia, como `VeriSign <http://www.verisign.com>`__, que firma
certificados para validar credenciales de individuos o compa?ias. Este
proceso tiene un costo asociado y no es un requisito imprescindible para
usar certificados, aunque puede darle un poco de tranquilidad a los
usuarios m?s paran?icos.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.9.1. Generaci?n de certificados
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para generar un certificado ejecute lo siguiente:

.. code:: screen

    # openssl req -new -nodes -out req.pem -keyout cert.pem
    Generating a 1024 bit RSA private key
    ................++++++
    .......................................++++++
    writing new private key to 'cert.pem'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:US
    State or Province Name (full name) [Some-State]:PA
    Locality Name (eg, city) []:Pittsburgh
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Mi compa??a
    Organizational Unit Name (eg, section) []:Administrador de sistemas
    Common Name (eg, YOUR name) []:localhost.ejemplo.org
    Email Address []:trhodes@FreeBSD.org

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:UNA CONTRASE?A
    An optional company name []:Otro nombre

Tenga en cuenta que la respuesta directamente despu?s de “prompt”
“Common Name” muestra un nombre de dominio. Este “prompt” requiere que
se introduzca un nombre de servidor para usarlo en la verificaci?n; si
escribe cualquier otra cosa producir? un certificado inv?lido. Otras
opciones, por ejemplo el tiempo de expiraci?n, alternan algoritmos de
cifrado, etc. Puede ver una lista completa en la p?gina de manual de
`openssl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=openssl&sektion=1>`__.

Deber?a tener dos ficheros en el directorio donde ha ejecutado la orden
anterior. La petici?n de certificado, ``req.pem``, es lo que debe enviar
a una autoridad certificadora para que valide las credenciales que
introdujo; firmar? la petici?n y le devolver? el certificado. El segundo
fichero es ``cert.pem`` y es la llave privada para el certificado, que
debe proteger a toda costa; si cae en malas manos podr? usarse para
suplantarle a usted o a sus servidores.

Si no necesita la firma de una CA puede crear y firmar usted mismo su
certificado. Primero, genere la llave RSA:

.. code:: screen

    # openssl dsaparam -rand -genkey -out myRSA.key 1024

A continuaci?n genere la llave CA:

.. code:: screen

    # openssl gendsa -des3 -out myca.key myRSA.key

Utilice esta llave para crear el certificado:

.. code:: screen

    # openssl req -new -x509 -days 365 -key myca.key -out new.crt

Deber?n aparecer dos nuevos ficheros en su directorio: un fichero de
firma de autoridad de certificados (``myca.key``) y el certificado en
s?, ``new.crt``. Deben ubicarse en un directorio, que se recomienda que
sea ``/etc``, que es legible solo para ``root``. Para terminar, es
recomendable asignar permisos 0700 para el fichero con ``chmod``.

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

14.9.2. Uso de certificados; un ejemplo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?Qu? pueden hacer estos ficheros? Cifrar conexiones al MTA Sendmail es
un buen sitio para usarlos. De este modo eliminar? el uso de validaci?n
mediante texto en claro para los usuarios que env?an correo a trav?s del
MTA local.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

No es el mejor uso en el mundo, ya que algunos MUAs enviar?n al usuario
un mensaje de error si no tiene instalados localmente los certificados.
Consulte la documentaci?n para m?s datos sobre la instalaci?n de
certificados.

.. raw:: html

   </div>

Debe a?adir las siguientes l?neas en su fichero local ``.mc``:

.. code:: programlisting

    dnl SSL Options
    define(`confCACERT_PATH',`/etc/certs')dnl
    define(`confCACERT',`/etc/certs/new.crt')dnl
    define(`confSERVER_CERT',`/etc/certs/new.crt')dnl
    define(`confSERVER_KEY',`/etc/certs/myca.key')dnl
    define(`confTLS_SRV_OPTIONS', `V')dnl

``/etc/certs/`` es el directorio destinado a almacenamiento de los
ficheros de certificado y llave en local. El ?ltimo requisito es una
reconstrucci?n del fichero ``.cf`` local. Solo tiene que teclear
``make`` *``install``* en el directorio ``/etc/mail``. A continuaci?n
ejecute un ``make`` *``restart``*, que deber?a reiniciar el d?mon
Sendmail.

Si todo fu? bien no habr? mensajes de error en el fichero
``/var/log/maillog`` y Sendmail aparecer? en la lista de procesos.

Puede probarlo todo de una forma muy sencilla; con?ctese al servidor de
correo mediante
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__:

.. code:: screen

    # telnet ejemplo.com 25
    Trying 192.0.34.166...
    Connected to ejemplo.com.
    Escape character is '^]'.
    220 ejemplo.com ESMTP Sendmail 8.12.10/8.12.10; Tue, 31 Aug 2004 03:41:22 -0400 (EDT)
    ehlo ejemplo.com
    250-ejemplo.com Hello ejemplo.com [192.0.34.166], pleased to meet you
    250-ENHANCEDSTATUSCODES
    250-PIPELINING
    250-8BITMIME
    250-SIZE
    250-DSN
    250-ETRN
    250-AUTH LOGIN PLAIN
    250-STARTTLS
    250-DELIVERBY
    250 HELP
    quit
    221 2.0.0 ejemplo.com closing connection
    Connection closed by foreign host.

Si la l?nea “STARTTLS” aparece en la salida, todo est? funcionando
correctamente.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-----------------------------+---------------------------------+
| `Anterior <kerberos5.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <ipsec.html>`__   |
+----------------------------------+-----------------------------+---------------------------------+
| 14.8. Kerberos5?                 | `Inicio <index.html>`__     | ?14.10. VPN sobre IPsec         |
+----------------------------------+-----------------------------+---------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

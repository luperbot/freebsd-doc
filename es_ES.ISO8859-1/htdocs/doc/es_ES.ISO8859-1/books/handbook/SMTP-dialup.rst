================================================================================
27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico (dial-up)
================================================================================

.. raw:: html

   <div class="navheader">

27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico
(dial-up)
`Anterior <outgoing-only.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <SMTP-Auth.html>`__

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

27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico (dial-up)
--------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si se dispone de una direcci?n IP privada no es necesario realizar
ning?n ajuste a partir de la configuraci?n por defecto. Basta con
asignar como nombre de nuestra m?quina el nombre que tenemos registrado
en el DNS y sendmail se encargar? del resto.

Por otra parte si utilizamos una conexi?n temporal a internet mediante
PPP y se nos asigna una direcci?n IP de forma din?mica, lo m?s normal es
tener nuestras carpetas de correo alojadas en el servidor de correo de
nuestro proveedor de servicios. Supongamos que el dominio de nuestro ISP
es ``ejemplo.net`` y que nuestro nombre de usuario es ``usuario``;
adem?s hemos llamado a nuestra ``user``, adem?s, hemos llamado a nuestra
m?quina ``bsd.home``, y nuestro ISP nos ha comunicado que debemos
utilizar como pasarela la m?quina ``relay.ejemplo.net``.

Para recuperar correo de nuestra carpeta de correo se debe instalar un
agente de recuperaci?n autom?tica de correo. fetchmail es una buena
elecci?n puesto que permite utilizar varios protocolos. Este programa
est? disponible como un paquete y tambi?n desde la colecci?n de ports
(`mail/fetchmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/fetchmail/pkg-descr>`__).
Normalmente nuestro ISP proporciona POP POP. Si utilizamos ppp a nivel
de usuario se puede recuperar autom?ticamente el correo cuando se
establece la conexi?n ppp utilizando el fichero ``/etc/ppp/ppp.linkup``:

.. code:: programlisting

    MYADDR:
    !bg su user -c fetchmail

Si utilizamos sendmail (como se muestra m?s adelante) para entregar
correo a cuentas remotas probablemente queramos que sendmail procese
nuestras colas de correo tan pronto como nuestra conexi?n de internet se
establezca. Para ello escriba el siguiente comando tras el comando de
``fetchmail`` que hemos escrito antes en el fichero
``/etc/ppp/ppp.linkup``:

.. code:: programlisting

      !bg su user -c "sendmail -q"

Asumiendo que tenemos una cuenta para el usuario ``usuario`` en
``bsd.home``. En el directorio “home” del usuario ``usuario`` en la
m?quina ``bsd.home`` debemos crear un fichero ``.fetchmailrc`` con el
siguiente contenido:

.. code:: programlisting

    poll ejemplo.net protocol pop3 fetchall pass Secr3To

Este fichero debe tener permisos de lectura s?lo para el propio due?o ya
que contiene la contrase?a de acceso a nuestra cuenta de POP en nuestro
ISP (``       Secr3To``).

Para poder enviar correo con la cabecera ``from:`` correcta, debemos
decir a sendmail que utilice ``usuario@ejemplo.net`` en vez de
``usuario@bsd.home``. Siguiendo con nuestro ejemplo es necesario decirle
a sendmail que env?e todo el correo a trav?s de la pasarela
``relay.ejemplo.net``.

El siguiente fichero de configuraci?n ``.mc`` debe ser suficiente para
cumplir con las anteriores tareas:

.. code:: programlisting

    VERSIONID(`bsd.home.mc version 1.0')
    OSTYPE(bsd4.4)dnl
    FEATURE(nouucp)dnl
    MAILER(local)dnl
    MAILER(smtp)dnl
    Cwlocalhost
    Cwbsd.home
    MASQUERADE_AS(`ejemplo.net')dnl
    FEATURE(allmasquerade)dnl
    FEATURE(masquerade_envelope)dnl
    FEATURE(nocanonify)dnl
    FEATURE(nodns)dnl
    define(`SMART_HOST', `relay.ejemplo.net')
    Dmbsd.home
    define(`confDOMAIN_NAME',`bsd.home')dnl
    define(`confDELIVERY_MODE',`deferred')dnl

En la secci?n anterior se explica c?mo convertir este fichero ``.mc`` en
un fichero de configuraci?n para sendmail, ``sendmail.cf``. No debemos
olvidar reiniciar sendmail despu?s de mofidificar el fichero
``       sendmail.cf``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+---------------------------+-------------------------------------------+
| `Anterior <outgoing-only.html>`__?                  | `Subir <mail.html>`__     | ?\ `Siguiente <SMTP-Auth.html>`__         |
+-----------------------------------------------------+---------------------------+-------------------------------------------+
| 27.8. Configuraci?n para s?lamente enviar correo?   | `Inicio <index.html>`__   | ?27.10. Autentificaci?n utilizando SMTP   |
+-----------------------------------------------------+---------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

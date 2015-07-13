======================================
27.10. Autentificaci?n utilizando SMTP
======================================

.. raw:: html

   <div class="navheader">

27.10. Autentificaci?n utilizando SMTP
`Anterior <SMTP-dialup.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <mail-agents.html>`__

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

27.10. Autentificaci?n utilizando SMTP
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por James Gorham.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La autentificaci?n mediante SMTP puede proporcionarnos diversas
ventajas. A?ade una capa adicional de seguridad a a sendmail y adem?s
proporciona a los usuarios m?viles (usuarios que cambian de m?quina) la
posibilidad de mantener el mismo servidor de correo sin necesidad de
reconfigurar sus agentes de usuario de correo cada vez que se trasladan.

.. raw:: html

   <div class="procedure">

#. Instalar
   `security/cyrus-sasl <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl/pkg-descr>`__
   desde los ports. Se puede encontrar dicho port en
   `security/cyrus-sasl <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl/pkg-descr>`__.
   `security/cyrus-sasl <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl/pkg-descr>`__
   pos?e varias opciones en tiempo de compilaci?n pero para el m?todo en
   particular que se va a explicar en esta secci?n basta con asegurarse
   de seleccionar la opci?n ``pwcheck``.

#. Despu?s de instalar
   `security/cyrus-sasl <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl/pkg-descr>`__,
   edite ``/usr/local/lib/sasl/Sendmail.conf`` (o cr?elo si no existe) y
   a?ada la siguiente l?nea:

   .. code:: programlisting

       pwcheck_method: passwd

   Este m?todo activa la autentificaci?n de sendmail contra nuestra base
   de datos de FreeBSD, ``passwd``. Esto nos evita el problema de tener
   que crear un nuevo conjunto de usuarios y contrase?as para cada
   usuario que necesite validarse mediante SMTP y adem?s nos permite
   mantener el mismo “login” y contrase?a que los usuarios utilizan para
   acceder a sus cuentas para el acceso al correo electr?nico.

#. Editar\ ``/etc/make.conf`` y a?adir las siguientes l?neas:

   .. code:: programlisting

       SENDMAIL_CFLAGS=-I/usr/local/include/sasl1 -DSASL
       SENDMAIL_LDFLAGS=-L/usr/local/lib
       SENDMAIL_LDADD=-lsasl

   Estas l?neas proporcionan a sendmail las opciones de configuraci?n
   necesarias para enlazar con
   `cyrus-sasl <http://www.freebsd.org/cgi/url.cgi?ports/cyrus-sasl/pkg-descr>`__
   en tiempo de compilaci?n. Debemos asegurarnos de que
   `cyrus-sasl <http://www.freebsd.org/cgi/url.cgi?ports/cyrus-sasl/pkg-descr>`__
   ha sido instalado correctamente recompilar sendmail.

#. Recompile sendmail utilizando el siguiente comando:

   .. code:: screen

       # cd /usr/src/usr.sbin/sendmail
       # make cleandir
       # make obj
       # make
       # make install

   La compilaci?n de sendmail no deber?a dar problemas siempre y cuando
   ``/usr/src`` no haya cambiado sustancialmente y siempre y cuando las
   bibliotecas compartidas necesarias se encuentren disponibles.

#. Una vez que sendmail se ha compilado y reinstalado con correctamente
   debemos editar el fichero ``/etc/mail/freebsd.mc`` (o el fichero que
   se utilice como ``.mc`` de referencia. Hay administradores que
   escogen utilizar la salida de
   `hostname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=hostname&sektion=1>`__
   como el nombre del fichero ``.mc`` que se utiliza para la
   configuraci?n de sendmail por motivos de uniformidad ). A?ada las
   siguientes l?neas a dicho fichero:

   .. code:: programlisting

       dnl set SASL options
       TRUST_AUTH_MECH(`GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN')dnl
       define(`confAUTH_MECHANISMS', `GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN')dnl
       define(`confDEF_AUTH_INFO', `/etc/mail/auth-info')dnl

   Estas opciones configuran los distintos m?todos de que dispone
   sendmail para validar a los usuarios de correo. Si se desea utilizar
   otro m?todo distinto a pwcheck por favor consulte la documentaci?n.

#. Para terminar ejecutamos
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
   mientras nos encontramos dentro de ``/etc/mail``. Este comando trata
   el fichero ``.mc`` y crea el fichero ``.cf`` correspondiente (con el
   mismo nombre que el anterior pero terminado en .cf). A continuaci?n
   se utiliza el comando ``           make install restart``, el cual
   copia el fichero .cf reci?n generado al fichero
   ``           sendmail.cf`` y a continuaci?n reinicia sendmail. Para
   m?s informaci?n sobre este proceso puede consultarse el contenido de
   ``/etc/mail/Makefile``.

.. raw:: html

   </div>

Si todo lo anteriormente comentado ha funcionado correctamente
deber?amos ser capaces de introducir la informaci?n de nuestro “login”
en nuestro cliente de correo y enviar un mensaje de prueba. Para
investigar m?s a fondo estos temas se puede habilitar la opci?n
``LogLevel`` de sendmail al valor 13 y observar detenidamente el archivo
``/var/log/maillog`` en busca de posibles mensajes de error.

Puede ser necesario a?adir las siguientes l?neas al fichero
``/etc/rc.conf`` de modo que el servicio explicado en esta secci?n se
encuentre disponible autom?ticamente desde el arranque:

.. code:: programlisting

    sasl_pwcheck_enable="YES"
    sasl_pwcheck_program="/usr/local/sbin/pwcheck"

Esto permite que la inicializaci?n de SMTP\_AUTH se produzca durante el
arranque del sistema.

Para m?s informaci?n por favor visite la p?gina `autentificaci?n
SMTP <http://www.sendmail.org/~ca/email/auth.html>`__ de sendmail?

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------------------------------+---------------------------+---------------------------------------+
| `Anterior <SMTP-dialup.html>`__?                                                    | `Subir <mail.html>`__     | ?\ `Siguiente <mail-agents.html>`__   |
+-------------------------------------------------------------------------------------+---------------------------+---------------------------------------+
| 27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico (dial-up)?   | `Inicio <index.html>`__   | ?27.11. Agente de Correo de Usuario   |
+-------------------------------------------------------------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

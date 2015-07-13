==========================
27.12. Manejo de fetchmail
==========================

.. raw:: html

   <div class="navheader">

27.12. Manejo de fetchmail
`Anterior <mail-agents.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <mail-procmail.html>`__

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

27.12. Manejo de fetchmail
--------------------------

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

fetchmail es un cliente de IMAP y POP que permite a los usuarios
descargar autom?ticamente el correo de cuentas remotas en servidores
IMAP y POP y almacenarlos en carpetas de correo locales; una vez en
local, se puede acceder a los correos de una forma m?s sencilla y
utilizando multitud de programas cliente. fetchmail se puede instalar a
partir del port
`mail/fetchmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/fetchmail/pkg-descr>`__.
Veamos algunas de sus caracter?sticas m?s ?tiles:

.. raw:: html

   <div class="itemizedlist">

-  Suporte de POP3, APOP, KPOP, IMAP, ETRN y ODMR.

-  Puede reenviar correo utilizando SMTP lo que permite que las reglas
   de filtrado, reenv?o y “aliasing” funcionen correctamente.

-  Se puede ejecutar en modo d?mon comprobar peri?dicamente el correo
   entrante.

-  Puede recuperar correo de m?ltiples carpetas y reenviarlos, en
   funci?n de la configuraci?n establecida, a varios usuarios locales.

.. raw:: html

   </div>

Queda fuera del objetivo de este documento explicar todas las
caracter?sticas de fetchmail pero algunas de ellas se exponen a
ontinuaci?n. fetchmail usa un fichero de configuraci?n denominado
``.fetchmailrc``. Este fichero incluye informaci?n sobre el servidor de
correo remoto y los datos necesarios para poder hacer login en ?l.
Debido a la naturaleza sensible de la informaci?n que se almacena en
dicho fichero se recomienda modificar los permisos para que sea de s?lo
sea legible por su propietario. Lo conseguir? mediante el siguiente
comando:

.. code:: screen

    % chmod 600 .fetchmailrc

El siguiente ejemplo muestra un fichero de configuraci?n
``.fetchmailrc``. Este ejemplo sirve para automatizar la descarga del
correo de un determinado usuario mediante POP. El fichero de
configuraci?n hace que fetchmail se conecte a ``ejemplo.com`` utilizando
como nombre de usuario ``joesoap`` y como contrase?a ``XXX``. En el
ejemplo se asume que el usuario ``joesoap`` tambi?n es un usuario v?lido
en el sistema local.

.. code:: programlisting

    poll ejemplo.com protocol pop3 username "joesoap" password "XXX"

El siguiente ejemplo permite a fetchmail conectarse a m?ltiples
servidores POP e IMAP y redirige los correos a diferentes usuarios
locales en funci?n de la configuraci?n establecida:

.. code:: programlisting

    poll ejemplo.com proto pop3:
    user "joesoap", with password "XXX", is "jsoap" here;
    user "andrea", with password "XXXX";
    poll ejemplo.net proto imap:
    user "john", with password "XXXXX", is "myth" here;

fetchmail se puede ejecutar en modo d?mon mediante el par?metro ``-d``
seguido seguido por un intervalo de tiempo (expresado en segundos) que
indica cada cu?nto tiempo debe fetchmail interrogar a los distintos
servidores listados en ``.fetchmailrc``. El siguiente ejemplo hace que
fetchmail interroge cada 60 segundos:

.. code:: screen

    % fetchmail -d 60

Se puede encontrar m?s informaci?n sobre fetchmail en
``http://www.catb.org/~esr/fetchmail/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+-----------------------------------------+
| `Anterior <mail-agents.html>`__?      | `Subir <mail.html>`__     | ?\ `Siguiente <mail-procmail.html>`__   |
+---------------------------------------+---------------------------+-----------------------------------------+
| 27.11. Agente de Correo de Usuario?   | `Inicio <index.html>`__   | ?27.13. Uso de procmail                 |
+---------------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

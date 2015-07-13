================================================
27.8. Configuraci?n para s?lamente enviar correo
================================================

.. raw:: html

   <div class="navheader">

27.8. Configuraci?n para s?lamente enviar correo
`Anterior <SMTP-UUCP.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <SMTP-dialup.html>`__

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

27.8. Configuraci?n para s?lamente enviar correo
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Bill Moran.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen multitud de casos en los que puede bastarnos con enviar nuestro
correo a trav?s de una pasarela o relay. He aqu? algunos de ellos:

.. raw:: html

   <div class="itemizedlist">

-  Nuestra computadora es una m?quina de escritorio, pero queremos ser
   capaces de utilizar programas como
   `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__.
   Para ello se deber?a utilizar el relay de nuestro ISP.

-  Nuestra computadora es un servidor que no gestiona correo de forma
   local, si no que necesita pasar todos los correos recibidos una
   pasarela que se encarga de su procesamiento y entrega final.

.. raw:: html

   </div>

Casi cualquier MTA es capaz de actuar como pasarela o relay. Por
desgracia configurar un MTA para que s?lo gestione correo saliente puede
ser muy complicado. Programas del estilo de sendmail y postfix son
demasiado pesados para realizar s?lamente esta tarea.

Si adem?s estamos utilizando un servicio de acceso a internet t?pico
nuestro contrato puede prohibir expl?citamente la ejecuci?n de un
servidor de correo (o los puertos pueden estar filtrados).

La forma m?s sencilla de utilizar un servicio de pasarela es mediante la
instalaci?n del port
`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__.
Basta con ejecutar el siguiente comando como ``root``:

.. code:: screen

    # cd /usr/ports/mail/ssmtp
    # make install replace clean

Una vez que ha sido instalado
`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
podemos configurarlo mediante un fichero de s?lo cuatro l?neas ubicado
en ``/usr/local/etc/ssmtp/ssmtp.conf``:

.. code:: programlisting

    root=sudireccionrealdecorreo@ejemplo.com
    mailhub=mail.ejemplo.com
    rewriteDomain=ejemplo.com
    hostname=_HOSTNAME_

Debemos asegurarnos de que se utiliza una direcci?n de correo real para
``root``. Se debe introducir nuestra pasarela de correo en lugar de
``       mail.ejemplo.com`` (algunos ISP llaman a la pasarela “servidor
de correo saliente” o simplemente “servidor SMTP”).

Debemos asegurarnos de que se desactiva sendmail mediante
``sendmail_enable="NONE"`` en ``/etc/rc.conf``.

`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
acepta algunas otras opciones. Consulte el fichero de ejemplo que
encontrar? en ``/usr/local/etc/ssmtp``; consulte tambi?n la p?gina de
manual de ssmtp, en la que hay m?s ejemplos e informaci?n al respecto.

Ejecutar ssmtp de esta forma permite que cualquier software de nuestra
computadora que necesite enviar correo funcione sin problemas y a la vez
poder cumplir con las normas estipuladas en el contrato con nuestro ISP.
Al mismo tiempo evitamos el uso de nuestro servidor de correo por parte
de “ spammers”.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------+-------------------------------------------------------------------------------------+
| `Anterior <SMTP-UUCP.html>`__?   | `Subir <mail.html>`__     | ?\ `Siguiente <SMTP-dialup.html>`__                                                 |
+----------------------------------+---------------------------+-------------------------------------------------------------------------------------+
| 27.7. SMTP con UUCP?             | `Inicio <index.html>`__   | ?27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico (dial-up)   |
+----------------------------------+---------------------------+-------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

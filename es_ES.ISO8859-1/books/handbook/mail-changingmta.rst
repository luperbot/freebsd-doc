=======================================================
27.4. Sustituci?n del Agente de Transferencia de Correo
=======================================================

.. raw:: html

   <div class="navheader">

27.4. Sustituci?n del Agente de Transferencia de Correo
`Anterior <sendmail.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <mail-trouble.html>`__

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

27.4. Sustituci?n del Agente de Transferencia de Correo
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Andrew Boothman.

.. raw:: html

   </div>

.. raw:: html

   <div>

Informaci?n obtenida de correos escritos por Gregory Neil Shapiro.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Como ya se ha comentado FreeBSD viene con sendmail ya instalado como
agente de transferencia de correo por defecto. De esta forma sendmail se
encarga de gestionar el correo entrante y saliente.

No obstante, debido a distintas razones algunos administradores de
sistemas prefieren utilizar otro MTA. Estas razones var?an desde
simplemente querer probar otros programas de transferencia de correo,
hasta la necesidad de utilizar un determinado programa que hace uso de
una funci?n espec?fica de un agente determinado. Por suerte cualesquiera
que sean estas razones FreeBSD posee un sencillo procedimiento para
sustituir a sendmail.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.4.1. Instalaci?n de un nuevo MTA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen una amplia gama de MTA alternativos a sendmail. Un buen punto de
partida es el `Sistema de Ports de FreeBSD <ports.html>`__, donde se
pueden localizar varios. Por supuesto el usuario tiene libertad para
utilizar cualquier MTA, siempre y cuando se pueda ejecutar en FreeBSD
sin problemas.

Lo primero es instalar el nuevo MTA. Una vez que est? instalado
normalmente se tiene la oportunidad para decidir si realmente cubre las
necesidades y tambi?n se tiene la oportunidad de configurar el nuevo
software antes de sustituir a sendmail. El usuario debe tener en cuenta
que el nuevo MTA puede sobreescribir algunos binarios del sistema como
por ejemplo ``/usr/bin/sendmail``. En cualquier caso el nuevo software
de correo suele entrar en funcionamiento con una configuraci?n por
defecto.

Por favor, recuerde que se recomienda leer la documentaci?n del MTA
seleccionado para obtener m?s informaci?n.

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

27.4.2. Desactivaci?n de la aplicaci?n  sendmail
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El procedimiento utilizado para ejecutar sendmail cambi?
significativamente entre las releases 4.5-RELEASE y 4.6-RELEASE. De esta
forma el procedimiento utilizado para la desactivaci?n hoy en d?a es
sut?lmente distinto al utilizado en dichas distribuciones.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.4.2.1. FreeBSD 4.5-STABLE antes de 2002/4/4 y anteriores (Incluyendo 4.5-RELEASE y anteriores)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Introducir:

.. code:: programlisting

    sendmail_enable="NO"

dentro de ``/etc/rc.conf``. Esta variable desactiva el servicio de
recepci?n de correo de sendmail, pero salvo que se modifique (ver m?s
adelante) el fichero ``/etc/mail/mailer.conf`` sendmail todav?a ser? la
aplicaci?n elegida para enviar correo electr?nico.

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

27.4.2.2. FreeBSD 4.5-STABLE desde de 2002/4/4 (Incluyendo 4.6-RELEASE y posteriores)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para poder desactivar completamente sendmail haga lo siguiente:

.. code:: programlisting

    sendmail_enable="NONE"

dentro del fichero ``/etc/rc.conf.``

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Se desactiva el servicio de correo de salida de sendmail. Es importanque
que se reemplace con un sistema de entrega de correo alternativo que sea
totalmente funcional. En caso contrario funciones del sistema FreeBSD
tales como
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
no podr?n entregar sus resultados por correo eletr?nico tal y como
normalmente hacen. Varias partes del sistema FreeBSD esperan disponer de
un sistema de correo funcional compatible con sendmail. Si las
aplicaciones contin?an utilizando los binarios de sendmail para realizar
env?os de correo despu?s de su desactivaci?n el correo podr?a ser
almacenado en una cola inactiva de sendmail, en cuyo caso nunca se
entregar?a.

.. raw:: html

   </div>

Si s?lo se quiere desactivar el servicio de correo de entrada de
sendmail, basta con establecer la variable:

.. code:: programlisting

    sendmail_enable="NO"

dentro de ``/etc/rc.conf``. En
`rc.sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.sendmail&sektion=8>`__
tiene m?s informaci?n sobre las opciones de arranque de sendmail.

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

27.4.3. Ejecuci?n del nuevo MTA en el arranque
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen dos m?todos alternativos para ejecutar el nuevo MTA en el
arranque, dependiendo de la versi?n de FreeBSD que se est? ejecutando.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.4.3.1. FreeBSD 4.5-STABLE antes de 2002/4/11 (Incluyendo 4.5-RELEASE y anteriores)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Se debe a?adir un script en ``/usr/local/etc/rc.d/`` cuyo nombre termine
en ``.sh`` y que sea ejecutable por ``root``. El script debe aceptar los
par?metros ``start`` y ``stop``. Cuando el sistema FreeBSD se est?
inicializando, los scripts de arranque ejecutar?n el siguiente comando:

.. code:: programlisting

    /usr/local/etc/rc.d/supermailer.sh start

La misma orden se puede utilizar tambi?n para ejecutar el servidor de
forma manual. Cuando el sistema se est? reiniciando los scripts del
sistema ejecutan los ficheros ubicados en ``/usr/local/etc/rc.d/``
utilizando la opci?n ``stop``, en nuestro caso:

.. code:: programlisting

    /usr/local/etc/rc.d/supermailer.sh stop

Dicho comando tamb?en se puede utilizar para detener el servidor de
correo de forma manual cuando el sistema FreeBSD se ejecuta con
normalidad.

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

27.4.3.2. FreeBSD 4.5-STABLE despu?s de 2002/4/11 (Incluyendo 4.6-RELEASE y posteriores)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Con las ?ltimas versiones de FreeBSD se puede utilizar el m?todo
anterior pero tambi?n se puede especificar

.. code:: programlisting

    mta_start_script="nombre_de_fichero"

dentro de ``/etc/rc.conf``, donde *``nombre_de_fichero``* es el nombre
de alg?n script que se ejecuta en tiempo de arranque para inicializar el
nuevo MTA.

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

27.4.4. Sustituci?n de sendmail como el agente de transporte de correo predeterminado.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El programa sendmail es tan imprescindible y es utilizado por tal
multitud de programas en los sistemas UNIX? que algunos programas
simplemente asumen que sendmail se encuentra instalado y configurado
dentro del sistema. Por esta raz?n varios MTAs alternativos proporcionan
su propia implementaci?n de la interfaz de l?nea de comandos que pos?e
sendmail; esto facilita que se puedan utilizar como sustitutos de
sendmail sin mayores dificultades.

Por lo tanto si desea utilizar un agente de transporte de correo
alternativo debe asegurarse de que todo software que intente ejecutar
binario de sendmail est?ndar, ``/usr/bin/sendmail``, realmente ejecute
el nuevo MTA en su lugar. Por fortuna FreeBSD proporciona un sistema
llamado
`mailwrapper(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mailwrapper&sektion=8>`__
que realiza precisamente esta tarea.

Cuando sendmail est? funcionando se debe localizar algo como lo
siguiente dentro del fichero ``/etc/mail/mailer.conf``:

.. code:: programlisting

    sendmail     /usr/libexec/sendmail/sendmail
    send-mail   /usr/libexec/sendmail/sendmail
    mailq       /usr/libexec/sendmail/sendmail
    newaliases  /usr/libexec/sendmail/sendmail
    hoststat    /usr/libexec/sendmail/sendmail
    purgestat   /usr/libexec/sendmail/sendmail

Esto significa que cuando cualquiera de estos comandos (por ejemplo
``sendmail`` m?smamente) se ejecutan el sistema ejecutar? en su lugar
una copia del el sistema ejecuta en su lugar una copia del “
mailwrapper” denominada ``sendmail`` que chequea el fichero
``mailer.conf`` y ejecuta ``/usr/libexec/sendmail/sendmail``. Este
sistema permite cambiar de una forma sencilla los binarios que se
ejecutan realmente cuando se invocan las funciones de ``sendmail``.

Si se quiere que ejecutar ``/usr/local/supermailer/bin/sendmail-compat``
en lugar de sendmail se puede cambiar el fichero
``/etc/mail/mailer.conf`` para que contenga lo siguiente:

.. code:: programlisting

    sendmail    /usr/local/supermailer/bin/sendmail-compat
    send-mail   /usr/local/supermailer/bin/sendmail-compat
    mailq       /usr/local/supermailer/bin/mailq-compat
    newaliases  /usr/local/supermailer/bin/newaliases-compat
    hoststat    /usr/local/supermailer/bin/hoststat-compat
    purgestat   /usr/local/supermailer/bin/purgestat-compat

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

27.4.5. ?ltimos Pasos
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que todo est?configurado a su gusto hay que matar los procesos
de sendmail que ya no se necesitan y ejecutar los procesos
pertenecientes al nuevo software de MTA, o utilizar la opci?n m?s
sencilla: reiniciar la m?quina. Reinicar la m?quina nos brinda la
oportunidad de comprobar que se ha configurado correctamente el arranque
del sistema para que ejecute de forma autom?tica el nuevo MTA.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------+----------------------------------------+
| `Anterior <sendmail.html>`__?      | `Subir <mail.html>`__     | ?\ `Siguiente <mail-trouble.html>`__   |
+------------------------------------+---------------------------+----------------------------------------+
| 27.3. Configuraci?n de sendmail?   | `Inicio <index.html>`__   | ?27.5. Depuraci?n de Problemas         |
+------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

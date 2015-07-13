========================================
27.2. Utilizaci?n del correo electr?nico
========================================

.. raw:: html

   <div class="navheader">

27.2. Utilizaci?n del correo electr?nico
`Anterior <mail.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <sendmail.html>`__

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

27.2. Utilizaci?n del correo electr?nico
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen varios elementos relacionados con el intercambio de correo
electr?nico. A saber: `El agente de usuario (Mail User Agent o
MUA) <mail-using.html#mail-mua>`__, `El agente de transporte de correo
(Mail Transport Agent o MTA) <mail-using.html#mail-mta>`__, `El
DNS <mail-using.html#mail-dns>`__, `Las carpetas de correo
(Mailboxes) <mail-using.html#mail-receive>`__, y por supuesto, `la
m?quina servidora de correo (mail host) <mail-using.html#mail-host>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.2.1. El Agente de Usuario
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Entre las opciones m?s conocidas tenemos: mutt, pine, elm, y ``mail``,
junto con programas con interfaz gr?fica del estilo de balsa o xfmail
por nombrar unos pocos. Tambi?n existen lectores de correo basados en
navegadores web. Los programas de correo basados en navegadores web
act?an de pasarela para las transacciones de correo electr?nico,
entregando dichas transacciones al `“servidor de
correo” <mail-using.html#mail-host>`__ local, llamando a uno de los
`agentes de transporte de correo <mail-using.html#mail-mta>`__
disponibles en la m?quina local, o entregando dichas transacciones a un
agente de transporte remoto utilizando el protocolo TCP.

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

27.2.2. Agente de Transporte de Correo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD viene con sendmail por defecto, pero tambi?n se soportan otros
d?mones, entre los cuales se encuentran:

.. raw:: html

   <div class="itemizedlist">

-  exim;

-  postfix;

-  qmail.

.. raw:: html

   </div>

El agente de transporte de correo normalmente posee dos funcionalidades,
por un lado se responsabiliza de la recepci?n y por otro se encarga de
entregar el correo de salida. *No* es responsable de la recolecci?n
autom?tica de correo mediante la utilizaci?n de protocolos como POP o
IMAP, ni se utiliza para que el usuario pueda acceder a las carpetas de
correo locales. Para realizar estas otras tareas, se necesitan
`d?mons <mail-using.html#mail-receive>`__ adicionales.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Versiones antiguas de sendmail poseen varios problemas de seguridad que
pueden facilitar a un atacante el acceso local o remoto a la m?quina que
ejecuta sendmail. Para evitar dichos problemas de seguridad se
recomienda utilizar una versi?n actualizada de sendmail. Tiene m?s
opciones a la hora de elegir MTA en los `Ports de
FreeBSD <ports.html>`__.

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

27.2.3. Correo electr?nico y DNS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El Sistema de Nombres de Dominio (en ingl?s DNS) y su correspondiente
d?mon (llamado ``named``) constituyen una parte fundamental del
procedimiento de entrega de correo electr?nico. Para entregar el correo
electr?nico al destinatario adecuado el d?mon servidor de correo busca
el sitio remoto dentro del sistema de DNS.

El DNS es la entidad responsable de asociar nombres con direcciones IP,
pero adem?s se encarga de almacenar informaci?n espec?fica relacionada
con la entrega de correo mediante registros de tipo MX. Los registros MX
(Mail eXchanger) especifican qu? m?quina o m?quinas est?n encargadas de
recibir correo electr?nico para un determinado nombre de dominio. En
caso de no existir ning?n registro MX para el dominio del destinatario,
se busca informaci?n almacenada en registros de tipo A para enviar el
correo al destino final.

Se pueden consultar los registros MX para cualquier dominio utilizando
el comando
`host(1) <http://www.FreeBSD.org/cgi/man.cgi?query=host&sektion=1>`__,
como se puede observar en el siguiente ejemplo:

.. code:: screen

    % host -t mx FreeBSD.org
            FreeBSD.org mail is handled (pri=10) by mx1.FreeBSD.org

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

27.2.4. Recepci?n de correo
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La recepci?n de correo electr?nico para su dominio se realiza mediante
lo que se conoce como la m?quina de correo (mail host). ?sta m?quina
recoge todo el correo dirigido a su dominio y lo almacena en ``mbox``
(el m?todo por defecto para el almacenamiento de correo) o en formato
Maildir, dependiendo de la configuraci?n de la m?quina. Una vez que el
correo ha sido almacenado con ?xito se puede leer en local utilizando
aplicaciones como
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__ o
como mutt, o de forma remota mediante un conjunto de protocolos tales
como POP o IMAP. Esto significa que si usted va a leer el correo de
forma local no necesita instalar ning?n servidor de POP o IMAP.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.2.4.1. Acceso a carpetas de correo remotas mediante POP e IMAP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para poder acceder a carpetas de correo de forma remota se necesita
tener acceso a un servidor de POP o IMAP. ?stos protocolos permiten a
los usuarios conectarse a sus carpetas de correo desde ubicaciones
remotas de una forma sencilla. Aunque ambos, POP y IMAP, permiten este
acceso remoto IMAP ofrece algunas ventajas a?adidas, algunas de las
cuales son:

.. raw:: html

   <div class="itemizedlist">

-  El acceso mediante IMAP permite almacenar los correos en el servidor
   remoto sin necesidad de extraerlos y tener que almacenarlos en local.

-  IMAP soporta actualizaciones concurrentes.

-  IMAP resulta ser extremadamente ?til bajo enlaces de baja velocidad
   puesto que permite a los usuarios recuperar la estructura de los
   mensajes sin necesidad de bajarse todo el contenido. Adem?s puede
   realizar tareas tales como b?squedas directas en el servidor con el
   fin de minimizar la utilizaci?n de la red.

.. raw:: html

   </div>

Para instalar un servidor de POP o de IMAP se deben dar los siguientes
pasos:

.. raw:: html

   <div class="procedure">

#. Seleccionar el servidor IMAP o POP que mejor cumpla a sus
   necesidades. Los siguientes servidores POP e IMAP son bien conocidos
   y son firmes candidatos para ello:

   .. raw:: html

      <div class="itemizedlist">

   -  qpopper;

   -  teapop;

   -  imap-uw;

   -  courier-imap;

   .. raw:: html

      </div>

#. Instalar el d?mon POP o IMAP de su elecci?n desde el ?rbol de
   “ports”.

#. Modifique donde sea necesario ``               /etc/inetd.conf`` para
   que el servidor POP o IMAP se ejecute autom?ticamente.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Tenga en cuenta que tanto POP como IMAP transmiten informaci?n, en
especial el usuario y la contrase?a, en texto plano. Eso significa que
si se desea seguridad en la transmisi?n de la informaci?n a trav?s de la
red se deben considerar mecanismos adicionales como por ejemplo el
encapsulado de la sesi?n mediante
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__. El
encapsulado de sesiones se explica en `Secci?n?14.11.8, “T?neles
SSH” <openssh.html#security-ssh-tunneling>`__.

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

27.2.4.2. Acceso a carpetas de correo locales
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las carpetas de correo pueden abrirse de forma local utilizando un
agente de correo de usuario (MUA) en el servidor donde reside la
carpeta. Se suelen usar los programas mutt or
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__.

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

27.2.5. El Servidor de Correo (Mail Host)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El servidor de correo es el nombre que se usa para identificar a la
m?quina responsable de la entrega y recepci?n de correo electr?nico
dentro de una organizaci?n. ?sta m?quina puede recibir correo de varios
usuarios dentro de su dominio.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------+------------------------------------+
| `Anterior <mail.html>`__?          | `Subir <mail.html>`__     | ?\ `Siguiente <sendmail.html>`__   |
+------------------------------------+---------------------------+------------------------------------+
| Cap?tulo 27. Correo Electr?nico?   | `Inicio <index.html>`__   | ?27.3. Configuraci?n de sendmail   |
+------------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

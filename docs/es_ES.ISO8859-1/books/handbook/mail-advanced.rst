=========================
27.6. Conceptos Avanzados
=========================

.. raw:: html

   <div class="navheader">

27.6. Conceptos Avanzados
`Anterior <mail-trouble.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <SMTP-UUCP.html>`__

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

27.6. Conceptos Avanzados
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La siguiente secci?n trata conceptos m?s espec?ficos relacionados con la
configuraci?n del correo y la implantaci?n del servicio de correo en una
organizaci?n.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.6.1. Configuraci?n B?sica
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por defecto debemos ser capaces de enviar correo a m?quinas externas,
siempre y cuando tengamos nuestro ``     /etc/resolv.conf`` bien
configurado o ejecutemos nuestro propio servidor de nombres. Si queremos
que el correo para nuestra m?quina se nos entregue en nuestra propia
m?quina, es decir, a nuestro propio sendmail, en lugar de tener que ir a
recogerlo al servidor de correo de nuestra organizaci?n, podemos usar
dos m?todos:

.. raw:: html

   <div class="itemizedlist">

-  Ejecutar nuestro propio servidor de nombres y comprar nuestro propio
   dominio. Por ejemplo ``FreeBSD.org``

-  Conseguir la entrega de correo directa hacia nuestra m?quina. Esto se
   logra entregando el correo a la direcci?n IP que se asocia al nombre
   de DNS de nuestra m?quina. Por ejemplo ``ejemplo.FreeBSD.org``.

.. raw:: html

   </div>

Independientemente de la opci?n elegida para tener entrega directa en
nuestra m?quina debemos poseer una direcci?n IP est?tica (a diferencia
de las direcciones din?micas, que son utilizadas en configuraciones
donde se utiliza el protocolo PPP). Si nos encontramos detr?s de un
cortafuegos se debe permitir el tr?fico SMTP (puerto 25) hacia nuestra
m?quina. Si adem?s queremos recibir correo directamente en nuestra
m?quina se deben cumplir los siguientes requisitos:

.. raw:: html

   <div class="itemizedlist">

-  Asegurar que el registro MX de menor numeraci?n de nuestro DNS apunta
   a la direcci?n IP de nuestra m?quina.

-  Asegurar que no existe ninguna entrada MX en nuestro DNS para nuestra
   m?quina. Es decir, mientras que el registro MX del punto anterior
   hace referencia al dominio administrativo que gestionamos con nuestro
   servidor de nombres, en este apartado se quiere destacar que no debe
   existir ning?n registro MX espec?fico para el nombre concreto de
   nuestra m?quina.

.. raw:: html

   </div>

Cumpliendo las dos puntualizaciones anteriores podemos recibir correo
electr?nico mediante entrega directa en nuestra m?quina.

Por ejemplo:

.. code:: screen

    # hostname
    ejemplo.FreeBSD.org
    # host ejemplo.FreeBSD.org
    ejemplo.FreeBSD.org has address 204.216.27.XX

Si se observa esta configuraci?n la entrega directa de correo para
``<su_login@ejemplo.FreeBSD.org>`` deber?a funcionar sin problemas
(suponiendo que sendmail se est? ejecutando correctamente en
``ejemplo.FreeBSD.org``).

Si en lugar de lo anterior ve algo como esto:

.. code:: screen

    # host ejemplo.FreeBSD.org
    ejemplo.FreeBSD.org has address 204.216.27.XX
    ejemplo.FreeBSD.org mail is handled (pri=10) by hub.FreeBSD.org

Todos los correos enviados a nuestro host (``ejemplo.FreeBSD.org``)
ser?n recogidos por ``hub`` bajo el mismo nombre de usuario en lugar de
ser enviados directamente a nuestra m?quina.

La informaci?n anterior se gestiona utilizando el servidor de DNS. El
registro de DNS que transporta la informaci?n de encaminamiento de
correo eletr?nico es el registro *M*ail e*X*change. Si no existe ning?n
registro MX el correo se entregar? a la direcci?n IP que se obtenga de
resolver el nombre de dominio que se encuentre a continuaci?n del nombre
de usuario en la direcci?n de correo de destino (esto es, (despu?s de la
@).

En un cierto momento la entrada MX para ``freefall.FreeBSD.org`` ten?a
este aspecto:

.. code:: programlisting

    freefall        MX  30  mail.crl.net
    freefall        MX  40  agora.rdrop.com
    freefall        MX  10  freefall.FreeBSD.org
    freefall        MX  20  who.cdrom.com

Como se puede observar, ``freefall`` ten?a varias entradas MX. El n?mero
de MX m?s bajo es la m?quina que recibe correo directamente si se
encuentra disponible; si dicha m?quina no est? accesible por alg?n
motivo las otras m?quinas (llamadas tambi?n “MXs de backup”) aceptar?n
los mensajes temporalmente, y los transmitir?n de nuevo cuando alguna
m?quina perteneciente a alguna entrada MX de numeraci?n m?s baja se
encuentre disponible y el proceso se repetir? hasta que se alcance la
m?quina que tenga el registro MX m?s bajo.

Las organizaciones donde residen los servidores (MX) de backup deber?an
poseer acceso a internet de una forma independiente para minimizar el
riesgo de p?rdida de conectividad. Nuestro ISP o cualquier otra
organizaci?n independiente deber?a poder proporcionarnos este servicio
sin problemas.

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

27.6.2. Correo para Nuestro Dominio
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para establecer un “mailhost” (servidor de correo) en nuestra
organizaci?n debemos ser capaces de redirigir el correo destinado a
cualquier m?quina de nuestra organizaci?n hacia nuestro servidor de
correo. B?sicamente queremos “reclamar” como nuestro cualquier correo
destinado a cualquier m?quina de nuestro dominio (en este caso
``*.FreeBSD.org``) y desviarlo a nuestro servidor de tal forma que los
usuario lean su correo utilizando nuestra m?quina servidora.

Para hacer las cosas lo m?s sencillas posible se debe crear una cuenta
de usuario (con el mismo *nombre de usuario*) tanto en el servidor de
correo como en la m?quina del usuario o destinatario final del correo.
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
puede usarse para ello.

El servidor de correo debe funcionar como el agente de transporte
predeterminado para todas las m?quinas de nuestra organizaci?n. Esto se
realiza mediante la siguiente configuraci?n del DNS:

.. code:: programlisting

    ejemplo.FreeBSD.org   A   204.216.27.XX       ; Workstation
                MX  10 hub.FreeBSD.org  ; Mailhost

Esta configuraci?n redirigir? el correo para cualquier estaci?n de
trabajo hacia nuestro servidor de correo sin que tengan importancia las
direcciones IP asignadas mediante el registro de tipo A. Recordemos que
el correo siempre se encamina utilizando primero los registros de tipo
MX.

Normalmente no podremos realizar esta configuraci?n salvo que estemos
ejecutando nuestro propio servidor de DNS para nuestro dominio. Si no es
el caso y no es posible ejecutar nuestro propio servidor de DNS debemos
comunicarnos con nuestro proveedor de servicios o con quien pueda
proporcionarnos servicio de DNS y solicitarle una modificaci?n como la
anterior.

Si adem?s ofrecemos servicios de alojamiento virtual de correo la
siguiente informaci?n puede resultar ?til. Asumiremos que tenemos un
cliente con su propio dominio, por ejemplo ``cliente1.org`` y queremos
que todo el correo enviado a ``cliente1.org`` sea redirigido hasta
nuestro servidor de correo, ``mail.nuestroservidor.com``. La entrada
necesaria en el DNS deber?a ser la siguiente:

.. code:: programlisting

    cliente1.org     MX  10  mail.nuestroservidor.com

No necesitamos *ning?n* registro de tipo A para ``cliente1.org`` si
s?lamente queremos gestionar el correo para ese dominio.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Tenga en cuenta que un ping a ``cliente1.org`` no funcionar? a menos que
exista un registro de tipo A para dicha m?quina.

.. raw:: html

   </div>

La ?ltima cosa que debemos realizar en nuestro servidor de correo es
comunicar a sendmail para qu? dominios y/o m?quinas debe aceptar correo.
Existen varias formas en las que se puede realizar esta tarea.
Cualquiera de las siguiente funcionar?:

.. raw:: html

   <div class="itemizedlist">

-  A?adir las m?quinas deseadas al fichero
   ``/etc/mail/local-host-names`` si se est? utlizando la macro
   ``FEATURE(use_cw_file)``. Si se est? utilizando una versi?n de
   sendmail anterior a la 8.10 el fichero que se debe utilizar es
   ``/etc/sendmail.cw``.

-  A?adir la l?nea ``             Cwsu.servidor.com`` al fichero
   ``/etc/sendmail.cf`` o ``/etc/mail/sendmail.cf`` si se est?
   utilizando una versi?n de sendmail posterior a la versi?n 8.10.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+-------------------------------------+
| `Anterior <mail-trouble.html>`__?   | `Subir <mail.html>`__     | ?\ `Siguiente <SMTP-UUCP.html>`__   |
+-------------------------------------+---------------------------+-------------------------------------+
| 27.5. Depuraci?n de Problemas?      | `Inicio <index.html>`__   | ?27.7. SMTP con UUCP                |
+-------------------------------------+---------------------------+-------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

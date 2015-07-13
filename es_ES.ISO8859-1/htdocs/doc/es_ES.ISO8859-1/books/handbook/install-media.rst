======================================
2.8. Elecci?n del medio de instalaci?n
======================================

.. raw:: html

   <div class="navheader">

2.8. Elecci?n del medio de instalaci?n
`Anterior <install-choosing.html>`__?
Cap?tulo 2. Instalaci?n de FreeBSD
?\ `Siguiente <install-final-warning.html>`__

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

2.8. Elecci?n del medio de instalaci?n
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si va a instalar FreeBSD desde CDROM o DVD seleccione Install from a
FreeBSD CD/DVD con las flechas. Una vez [?OK?] est? seleccionado pulse
**Intro** y siga adelante con la instalaci?n.

Si quiere usar otro m?todo de instalaci?n seleccione la opci?n
correspondiente y siga las instrucciones.

Pulse **F1** si necesita acceder a la ayuda del medio de instalaci?n
elegido. Pulse **Intro** para regresar al men? de selecci?n de medios.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figura 2.26. Choose Installation Media

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choose Installation Media|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Tipos de instalaci?n desde FTP:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Hay tres tipos de instalaci?n por FTP entre las que puede elegir: FTP
activo, FTP pasivo o a trav?s de un proxy HTTP.

.. raw:: html

   <div class="variablelist" xmlns="http://www.w3.org/1999/xhtml">

FTP Activo: Install from an FTP server, es decir: ?Instalar desde un
servidor FTP?
    Esta opci?n har? que todas las transferencias FTP usen el modo
    ?Activo?. No funcionar? a trav?s de cortafuegos pero seguramente
    funcionar? con viejos servidores FTP que no soportan el modo pasivo.
    Si su conexi?n se cuelga cuando usa el modo pasivo (el modo por
    omisi?n) pruebe el modo activo.

FTP Pasivo: Install from an FTP server through a firewall, es decir
?Instalar desde un servidor FTP tras un cortafuegos?.
    Esta opci?n configura sysinstall para que use el modo ?Pasivo? para
    todas las operaciones FTP. Esto permite al usuario pasar a trav?s de
    cortafuegos que no permiten conexiones entrantes a puertos TCP
    aleatorios.

FTP via un proxy HTTP: Install from an FTP server through a http proxy,
es decir ?Instalar desde un un servidor FTP via un proxy HTTP?.
    Esta opci?n configura sysinstall para que use el protocolo HTTP
    (como si fuera un navegador web) para conectarse a un proxy en todas
    las operaciones FTP. El proxy traducir? las peticiones del usuario
    de forma que pasar?n a trav?s de un cortafuegos que no permita
    ning?n tipo de conexiones FTP pero ofrezca un proxy HTTP. Tendr? que
    configurar los datos del proxy adem?s de los del servidor FTP.

.. raw:: html

   </div>

Si quiere usar un servidor proxy FTP tendr? que usar el nombre del
servidor con el que realmente quiere conectar como nombre de usuario
seguido de un signo ?@?. Veamos un ejemplo. Quiere usted instalar desde
``ftp.FreeBSD.org`` a trav?s del servidor proxy FTP
``talycual.ejemplo.com``, que escucha en el puerto 1024.

Vaya al men? opciones, ponga ``ftp@ftp.FreeBSD.org`` como nombre de
usuario FTP, y su direcci?n de correo electr?nico como contrase?a. El
medio de instalaci?n ser? FTP (o FTP pasivo si el proxy lo permite) y la
URL ``ftp://talycual.ejemplo.com:1234/pub/FreeBSD``.

Dado accede al directorio ``/pub/FreeBSD`` de ``ftp.FreeBSD.org`` a
trav?s del proxy ``talycual.ejemplo.com`` puede usted instalar desde
*?sta* m?quina, que ir? descargando los ficheros que necesite desde
``ftp.FreeBSD.org`` a medida que el proceso de instalaci?n los vaya
requiriendo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------+-------------------------------------------------+
| `Anterior <install-choosing.html>`__?   | `Subir <install.html>`__   | ?\ `Siguiente <install-final-warning.html>`__   |
+-----------------------------------------+----------------------------+-------------------------------------------------+
| 2.7. Elecci?n de qu? instalar?          | `Inicio <index.html>`__    | ?2.9. El punto sin retorno                      |
+-----------------------------------------+----------------------------+-------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |Choose Installation Media| image:: install/media.png

=========================
2.9. El punto sin retorno
=========================

.. raw:: html

   <div class="navheader">

2.9. El punto sin retorno
`Anterior <install-media.html>`__?
Cap?tulo 2. Instalaci?n de FreeBSD
?\ `Siguiente <install-post.html>`__

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

2.9. El punto sin retorno
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A partir de aqu? entramos en la instalaci?n propiamente dicha. Esta es
la ?ltima oportunidad antes de empezar a escribir datos en el disco
duro.

.. code:: screen

                           User Confirmation Requested
     Last Chance! Are you SURE you want to continue the installation?

     If you're running this on a disk with data you wish to save then WE
     STRONGLY ENCOURAGE YOU TO MAKE PROPER BACKUPS before proceeding!

     We can take no responsibility for lost disk contents!

                                 [ Yes ]    No

Es decir:

.. code:: screen

       Petici?n de confirmaci?n del usuario
     ??ltima oportunidad!.  ?SEGURO que quiere seguir con la instalaci?n?

     Si est? ejecutando este proceso en un disco que contenga datos que
     quiera coservar LE RECOMENDAMOS ENCARECIDAMENTE QUE HAGA COPIAS DE
     SEGURIDAD FIABLES antes de instalar.

     No podemos asumir nig?n tipo de responsabilidad por datos que pierda.

                                 [ Yes ]    No

Seleccione [?Yes?] y pulse **Intro**.

La instalaci?n tardar? m?s o menos tiempo seg?n la distribuci?n que haya
elegido, el medio de instalaci?n y la velocidad del sistema. Se le ir?n
mostrando mensajes durante el proceso para irle informando de c?mo van
las cosas.

Cuando acabe la instalaci?n ver? un mensaje como este:

.. code:: screen

                                   Message

    Congratulations! You now have FreeBSD installed on your system.

    We will now move on to the final configuration questions.
    For any option you do not wish to configure, simply select No.

    If you wish to re-enter this utility after the system is up, you may
    do so by typing: sysinstall .

                                     [ OK ]

                          [  Press enter to continue  ]

Es decir:

.. code:: screen

                                   Mensaje

             ?Enhorabuena! Ha instalado FreeBSD en su sistema.

    Ahora terminaremos la configuraci?n del sistema.  Si hay alguna
    opci?n que no quiere configurar bastar? con que elija No.

    Si en alg?n momento quiere regresar a este programa escriba
    sysinstall .

                                     [ OK ]

                          [  Pulse Intro  ]

Pulse **Intro**; pasaremos a acometer ciertas tareas posteriores a la
instalaci?n.

Si selecciona [?No?] y pulsa **Intro** la instalaci?n se detendr? para
evitar hacer m?s modificaciones en su sistema. Ver? el el siguiente
mensaje.

.. code:: screen

                                    Message
    Installation complete with some errors.  You may wish to scroll
    through the debugging messages on VTY1 with the scroll-lock feature.
    You can also choose "No" at the next prompt and go back into the
    installation menus to retry whichever operations have failed.

                                     [ OK ]

Es decir:

.. code:: screen

                                    Mensaje
    La instalaci?n ha finalizado con errores.  Puede moverse por la
    pantalla de mensajes de depuraci?n de VTY1 tras pulsar la tecla
    de Bloqueo de Pantalla.  Tambi?n puede elegir "No" en el pr?ximo
    men? y volver a los men?s de instalaci?n y repetir cualquier
    operaci?n que haya fallado.

                                     [ OK ]

Este mensaje se ha generado porque no se ha instalado nada. Pulse
**Intro** para volver al men?n principal y salir de la instalaci?n.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+----------------------------+----------------------------------------+
| `Anterior <install-media.html>`__?        | `Subir <install.html>`__   | ?\ `Siguiente <install-post.html>`__   |
+-------------------------------------------+----------------------------+----------------------------------------+
| 2.8. Elecci?n del medio de instalaci?n?   | `Inicio <index.html>`__    | ?2.10. Despu?s de la instalaci?n       |
+-------------------------------------------+----------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

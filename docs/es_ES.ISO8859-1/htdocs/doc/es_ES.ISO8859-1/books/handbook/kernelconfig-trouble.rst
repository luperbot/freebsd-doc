=============================
8.7. Qu? hacer si algo va mal
=============================

.. raw:: html

   <div class="navheader">

8.7. Qu? hacer si algo va mal
`Anterior <kernelconfig-config.html>`__?
Cap?tulo 8. Configuraci?n del kernel de FreeBSD
?\ `Siguiente <printing.html>`__

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

8.7. Qu? hacer si algo va mal
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay cuatro categor?as de problemas que podemos encontrarnos en el
proceso de compilaci?n de un kernel personalizado:

.. raw:: html

   <div class="variablelist">

Fallo de ``config``:
    Si
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
    falla cuando le pasa la descripci?n de su kernel seguramente ha
    cometido alg?n peque?o error. Por suerte
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
    les mostrar? el n?mero de la l?nea que le est? dando problemas, as?
    que no tendr? mayor problema para localizarla. Veamos un ejemplo:

    .. code:: screen

        config: line 17: syntax error

    Si ve algo as? aseg?rese de que ha tecleado la palabra clave que hay
    en esa l?na. Compare la de su fichero de configuraci?n del kernel
    con la de ``GENERIC``.

Fallo de ``make``:
    If the ``make`` command fails, it usually signals an error in your
    kernel description which is not severe enough for
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
    to catch. Again, look over your configuration, and if you still
    cannot resolve the problem, send mail to the `lista de correo para
    preguntas generales sobre
    FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
    with your kernel configuration, and it should be diagnosed quickly.

El kernel no arranca:
    Si su nuevo kernel no arranca o no reconoce sus dispositivos de
    hardware no desespere. FreeBSD dispone de excelentes mecanismos de
    recuperaci?n ante kernels defectuosos. Elija el kernel con el que
    quiere arrancar en el gestor de arranque de FreeBSD. Puede acceder
    al gestor de arranque en el momento en el que aparece el men? de
    arranque. Elija la opci?n n?mero seis, “Escape to a loader prompt”
    option, Escriba en el prompt ``unload kernel`` y despu?s escriba
    ``boot /boot/kernel.old/kernel``, o el nombre de cualquier otro
    kernel que tenga en el sistema y del que sepa que puede fiarse. Si
    va a reconfigurar un kernel es una buen?sima idea guardar un kernel
    que sepa que funciona.

    Tras arrancar con un kernel de fiar verifique el fichero de
    configuraci?n e intente de nuevo una compilaci?n. El fichero
    ``/var/log/messages`` es una fuente de informaci?n muy valiosa
    puesto que registra, entre otras cosas, todos los mensajes que deja
    el kernel cada vez que hay un arranque satisfactorio.
    `dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
    le mostrar? los mensajes que el kernel ha generado durante el ?ltimo
    arranque.

    .. raw:: html

       <div class="note" xmlns="">

    Nota:
    ~~~~~

    Si tiene problemas compilando un kernel recuerde que es de vital
    importancia que guarde una copia de un kernel ``GENERIC`` u otro del
    que pueda fiarse y que (esto es muy importante) tenga un nombre
    distinto de ``kernel.old`` para evitar que el sistema lo borre una
    vez que termine una nueva compilaci?n. No puede confiar en su kernel
    ``kernel.old`` porque al instalar un nuevo kernel (que a?n no sabe
    si ser? el que funcione tal y como espera de ?l) el kernel
    ``kernel.old`` se sobreescribe con el kernel que instale. Otra cosa
    importante es que copie ese kernel de fiar a ``/boot/kernel``, o
    ciertas herramientas como
    `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ no
    funcionar?n. Basta con que haga lo siguiente:

    .. code:: screen

        # mv /boot/kernel /boot/kernel.malo
        # mv /boot/kernel.bueno /boot/kernel

    .. raw:: html

       </div>

El kernel funciona, pero
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ no:
    Si el kernel que tiene instalado es de una versi?n de FreeBSD y las
    utilidades del sistema son de otra, por ejemplo un kernel -CURRENT
    en una -RELEASE, hay muchas herramientas de monitorizaci?n del
    sistema como
    `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ y
    `vmstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vmstat&sektion=8>`__
    no funcionar?n. Ejecute un `make buildworld y un make install
    world <makeworld.html>`__ con la misma versi?n de c?digo fuente con
    la que ha compilado su kernel. Esta es una de las razones por las
    que no es una idea demasiado buena utilizar versiones diferentes de
    kernel y de sistema operativo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------------+------------------------------------+
| `Anterior <kernelconfig-config.html>`__?   | `Subir <kernelconfig.html>`__   | ?\ `Siguiente <printing.html>`__   |
+--------------------------------------------+---------------------------------+------------------------------------+
| 8.6. El fichero de configuraci?n?          | `Inicio <index.html>`__         | ?Cap?tulo 9. Imprimir              |
+--------------------------------------------+---------------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

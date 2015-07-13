===================================
8. procfs: perdido pero no olvidado
===================================

.. raw:: html

   <div class="navheader">

8. procfs: perdido pero no olvidado
`Anterior <updates.html>`__?
?
?\ `Siguiente <commands.html>`__

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

8. procfs: perdido pero no olvidado
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible que usando Linux? haya consultado
``/proc/sys/net/ipv4/ip_forward`` para determinar si “IP forwarding”
estaba activado. En FreeBSD tendr? que usar
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
para comprobar ?ste y otros par?metros puesto que
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5>`__
est? obsoleto en las versiones m?s recientes de FreeBSD. Tenga en cuenta
que ``sysctl`` tambi?n existe en Linux?.

Siguiendo con el ejemplo de “IP forwarding” podr?a usar lo siguiente
para determinar si tiene activado “IP forwarding” en su sistema FreeBSD:

.. code:: screen

    % sysctl net.inet.ip.forwarding
    net.inet.ip.forwarding: 0

La opci?n ``-a`` se usa para ver la configuraci?n del sistema:

.. code:: screen

    % sysctl -a
    kern.ostype: FreeBSD
    kern.osrelease: 6.2-RELEASE-p9
    kern.osrevision: 199506
    kern.version: FreeBSD 6.2-RELEASE-p9 #0: Thu Nov 29 04:07:33 UTC 2007
        root@i386-builder.daemonology.net:/usr/obj/usr/src/sys/GENERIC

    kern.maxvnodes: 17517
    kern.maxproc: 1988
    kern.maxfiles: 3976
    kern.argmax: 262144
    kern.securelevel: -1
    kern.hostname: server1
    kern.hostid: 0
    kern.clockrate: { hz = 1000, tick = 1000, profhz = 666, stathz = 133 }
    kern.posix1version: 200112
    ...

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Algunos de estos valores de ``sysctl`` son de s?lo lectura.

.. raw:: html

   </div>

Hay ocasiones en las que es disponer de procfs es imprescindible, por
ejemplo para ejecutar software antiguo, usar
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1>`__
para seguir llamadas al sistema y para la `compatibilidad binaria con
Linux? <../../../../doc/en_US.ISO8859-1/books/handbook/linuxemu.html>`__.
(aunque la compatibilidad binaria con Linux? use su propio procfs,
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5>`__.)
Si necesita montar procfs a?ada las siguientes l?neas a ``/etc/fstab``:

.. code:: screen

    proc                /proc           procfs  rw,noauto       0       0

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La opci?n ``noauto`` evitar? que ``/proc`` sea montado autom?ticamente
cuando el sistema arranque.

.. raw:: html

   </div>

Hecho esto monte procfs as?:

.. code:: screen

    # mount /proc

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+------------------------------------+
| `Anterior <updates.html>`__?   | ?                         | ?\ `Siguiente <commands.html>`__   |
+--------------------------------+---------------------------+------------------------------------+
| 7. Actualizaci?n de FreeBSD?   | `Inicio <index.html>`__   | ?9. Comandos m?s comunes           |
+--------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

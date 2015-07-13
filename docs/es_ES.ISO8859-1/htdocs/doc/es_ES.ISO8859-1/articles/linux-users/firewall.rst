==============
6. Cortafuegos
==============

.. raw:: html

   <div class="navheader">

6. Cortafuegos
`Anterior <network.html>`__?
?
?\ `Siguiente <updates.html>`__

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

6. Cortafuegos
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Igual que Linux? dispone de IPTABLES, FreeBSD tambi?n disponde de
cortafuegos integrado en el kernel, solo que FreeBSD en lugar de uno
dispone de tres:

.. raw:: html

   <div class="itemizedlist">

-  `IPFIREWALL <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipfw.html>`__
-  `IPFILTER <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipf.html>`__
-  `PF <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-pf.html>`__

.. raw:: html

   </div>

IPFIREWALL o IPFW (el programa para manejar las reglas de IPFW es
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__)
es el cortafuegos que desarrollan y mantienen los desarrolladores de
FreeBSD. IPFW se puede combinar con
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
para conseguir servicios de “traffic shaping” y simular diferentes tipos
de conexiones.

Veamos un ejemplo de regla que permite la entrada de tr?fico SSH:

.. code:: programlisting

    ipfw add allow tcp from any to me 22 in via $ext_if

IPFILTER es el cortafuegos que desarrolla Darren?Reed. No es espec?fico
de FreeBSD y se ha portado ya a diversos sistemas operativos como
NetBSD, OpenBSD, SunOS, HP/UX y Solaris.

El siguiente ejemplo permite la entrada de tr?fico SSH:

.. code:: programlisting

    pass in on $ext_if proto tcp from any to any port = 22

El ?ltimo cortafuegos, PF, ha sido desarrollado por el proyecto OpenBSD.
PF fue creado como sustituto de IPFILTER, de ah? que la sintaxis de PF
sea muy similar a la de IPFILTER. PF se puede combinar con
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__
para disponer de QoS.

En el siguiente ejemplo vemos una regla que permite la entrada de
tr?fico SSH:

.. code:: programlisting

    pass in on $ext_if inet proto tcp from any to ($ext_if) port 22

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+-----------------------------------+
| `Anterior <network.html>`__?   | ?                         | ?\ `Siguiente <updates.html>`__   |
+--------------------------------+---------------------------+-----------------------------------+
| 5. Configuraci?n de la red?    | `Inicio <index.html>`__   | ?7. Actualizaci?n de FreeBSD      |
+--------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

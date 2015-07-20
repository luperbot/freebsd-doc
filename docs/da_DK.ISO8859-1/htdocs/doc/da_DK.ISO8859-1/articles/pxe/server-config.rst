=======================
2. Server Konfiguration
=======================

.. raw:: html

   <div class="navheader">

2. Server Konfiguration
`forrige <index.html>`__?
?
?\ `n?ste <bootstrap-config.html>`__

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

2. Server Konfiguration
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Install?r DHCP: Install?r
   `net/isc-dhcp3 <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3/pkg-descr>`__
   du kan bruge denne config fil ```dhcpd.conf`` <dhcpd.conf>`__, put
   den ind i ``/usr/local/etc/``.

#. Sl? tftp til:

   .. raw:: html

      <div class="procedure">

   #. Lav mappen ``/usr/tftpboot``

   #. Tilf?j denne linie til din ``/etc/inetd.conf``:

      .. code:: programlisting

          tftp    dgram   udp     wait    nobody  /usr/libexec/tftpd    tftpd /usr/tftpboot

   .. raw:: html

      </div>

#. Sl? NFS til:

   .. raw:: html

      <div class="procedure">

   #. Tilf?j dette til ``/etc/rc.conf``:

      .. code:: programlisting

          nfs_server_enable="YES"

   #. Tilf?j dette til ``/etc/exports``:

      .. code:: programlisting

          /usr -alldirs -ro

   .. raw:: html

      </div>

#. Genstart for at sl? de nye services til eller start dem manuelt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+----------------------------------------+
| `forrige <index.html>`__?   | ?                       | ?\ `n?ste <bootstrap-config.html>`__   |
+-----------------------------+-------------------------+----------------------------------------+
| FreeBSD kvikstart Guide?    | `hjem <index.html>`__   | ?3. Bootstrap ops?tning                |
+-----------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.

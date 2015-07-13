=======
7.?Tips
=======

.. raw:: html

   <div class="navheader">

7.?Tips
`Prev <patch.html>`__?
?
?

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

7.?Tips
-------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  If a custom release is built using the native ``make release``
   `procedure <../../../../doc/en_US.ISO8859-1/articles/releng/release-build.html>`__,
   freebsd-update-server code will work from your release. As an
   example, a release without ports or documentation can be built by
   clearing functionality pertaining to documentation subroutines
   `` findextradocs ()``, ``addextradocs ()`` and altering the download
   location in ``fetchiso ()``, respectively, in ``scripts/build.subr``.
   As a last step, change the
   `sha256(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha256&sektion=1>`__
   hash in ``build.conf`` under your respective release and architecture
   and you are ready to build off your custom release.

   .. code:: screen

       # Compare ${WORKDIR}/release and ${WORKDIR}/$1, identify which parts
           # of the world|doc subcomponent are missing from the latter, and
           # build a tarball out of them.
           findextradocs () {
           }

           # Add extra docs to ${WORKDIR}/$1
           addextradocs () {
           }

-  Adding ``-j         NUMBER`` flags to ``buildworld`` and ``obj``
   targets in the ``scripts/build.subr`` script may speed up processing
   depending on the hardware used, however it is not necessary. Using
   these flags in other targets is not recommended, as it may cause the
   build to become unreliable.

   .. code:: screen

                      # Build the world
                  log "Building world"
                  cd /usr/src &&
                  make -j 2 ${COMPATFLAGS} buildworld 2>&1

               # Distribute the world
                  log "Distributing world"
                  cd /usr/src/release &&
                  make -j 2 obj &&
                  make ${COMPATFLAGS} release.1 release.2 2>&1

-  Create an appropriate
   `DNS <../../../../doc/en_US.ISO8859-1/books/handbook/network-dns.html>`__
   SRV record for the update server, and put others behind it with
   variable weights. Using this facility will provide update mirrors,
   however this tip is not necessary unless you wish to provide a
   redundant service.

   .. code:: screen

        _http._tcp.update.myserver.com.                  IN SRV   0 2 80   host1.myserver.com.
                                        SRV   0 1 80   host2.myserver.com.
                                        SRV   0 0 80   host3.myserver.com.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+-----+
| `Prev <patch.html>`__?   | ?                       | ?   |
+--------------------------+-------------------------+-----+
| 6.?Building a Patch?     | `Home <index.html>`__   | ?   |
+--------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

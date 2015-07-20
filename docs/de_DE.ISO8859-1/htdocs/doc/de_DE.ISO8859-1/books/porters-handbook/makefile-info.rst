==================
5.10. Info-Dateien
==================

.. raw:: html

   <div class="navheader">

5.10. Info-Dateien
`Zur?ck <makefile-manpages.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-options.html>`__

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

5.10. Info-Dateien
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Ihr Paket GNU-Info-Dateien installiert, sollten diese in der
``INFO``-Variablen augelistet sein (ohne das angeh?ngte ``.info``) mit
einem Eintrag f?r jedes Dokument. Von diesen Dateien wird angenommen,
dass sie nach ``PREFIX/INFO_PATH`` installiert werden. Sie k?nnen
``INFO_PATH`` ?ndern, falls Ihr Paket einen anderen Ort vorsieht. Jedoch
wird dies nicht empfohlen. Die Eintr?ge enthalten nur den relativen Pfad
zu ``PREFIX/INFO_PATH``. Zum Beispiel installiert
`lang/gcc34 <http://www.freebsd.org/cgi/url.cgi?ports/lang/gcc34/pkg-descr>`__
Info-Dateien nach ``PREFIX/INFO_PATH/gcc34``, wobei ``INFO`` etwa so
aussieht:

.. code:: programlisting

    INFO= gcc34/cpp gcc34/cppinternals gcc34/g77 ...

Entsprechende Installations-/Deinstalltions-Codes werden vor der
Paket-Registrierung automatisch der vorl?ufigen ``pkg-plist``
hinzugef?gt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------------+-----------------------------------------+
| `Zur?ck <makefile-manpages.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-options.html>`__   |
+----------------------------------------+---------------------------------+-----------------------------------------+
| 5.9. Manualpages?                      | `Zum Anfang <index.html>`__     | ?5.11. Makefile-Optionen                |
+----------------------------------------+---------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

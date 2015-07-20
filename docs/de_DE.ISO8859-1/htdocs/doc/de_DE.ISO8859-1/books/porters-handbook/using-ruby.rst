===================
6.16. Ruby benutzen
===================

.. raw:: html

   <div class="navheader">

6.16. Ruby benutzen
`Zur?ck <using-emacs.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-sdl.html>`__

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

6.16. Ruby benutzen
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.22. N?tzliche Variablen f?r Ports, die Ruby verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+------------------------------------------------------------------------------------------+
| Variable               | Description                                                                              |
+========================+==========================================================================================+
| ``USE_RUBY``           | Der Port ben?tigt Ruby.                                                                  |
+------------------------+------------------------------------------------------------------------------------------+
| ``USE_RUBY_EXTCONF``   | Der Port verwendet ``extconf.rb`` f?r die Konfiguration.                                 |
+------------------------+------------------------------------------------------------------------------------------+
| ``USE_RUBY_SETUP``     | Der Port verwendet ``setup.rb`` f?r die Konfiguration.                                   |
+------------------------+------------------------------------------------------------------------------------------+
| ``RUBY_SETUP``         | Legt den alternativen Namen von ``setup.rb`` fest. ?blich ist der Wert ``install.rb``.   |
+------------------------+------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgende Tabelle listet ausgew?hlte Variablen auf, die Portautoren
?ber die Port-Infrastruktur zur Verf?gung stehen. Diese Variablen
sollten f?r die Installation von Dateien in die entsprechenden
Verzeichnisse verwendet werden. Sie sollten in ``pkg-plist`` so h?ufig
wie m?glich verwendet und in einem Port nicht neu definiert werden.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.23. Ausgew?hlte read-only-Variablen f?r Ports, die Ruby
verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------------+---------------------------------------------------------------------------------------------------------+--------------------------------------------------------+
| Variable                  | Beschreibung                                                                                            | Beispiel                                               |
+===========================+=========================================================================================================+========================================================+
| ``RUBY_PKGNAMEPREFIX``    | Wird als ``PKGNAMEPREFIX`` verwendet, um Pakete f?r verschiedene Versionen von Ruby zu unterscheiden.   | ``ruby18-``                                            |
+---------------------------+---------------------------------------------------------------------------------------------------------+--------------------------------------------------------+
| ``RUBY_VERSION``          | Vollst?ndige Version von Ruby in der Form ``x.y.z``.                                                    | ``1.8.2``                                              |
+---------------------------+---------------------------------------------------------------------------------------------------------+--------------------------------------------------------+
| ``RUBY_SITELIBDIR``       | Installationsverzeichnis der von der Rechnerarchitektur unabh?ngigen Bibliotheken.                      | ``/usr/local/lib/ruby/site_ruby/1.8``                  |
+---------------------------+---------------------------------------------------------------------------------------------------------+--------------------------------------------------------+
| ``RUBY_SITEARCHLIBDIR``   | Installationsverzeichnis der von der Rechnerarchitektur abh?ngigen Bibliotheken.                        | ``/usr/local/lib/ruby/site_ruby/1.8/amd64-freebsd6``   |
+---------------------------+---------------------------------------------------------------------------------------------------------+--------------------------------------------------------+
| ``RUBY_MODDOCDIR``        | Installationsverzeichnis f?r die Dokumentation der Module.                                              | ``/usr/local/share/doc/ruby18/patsy``                  |
+---------------------------+---------------------------------------------------------------------------------------------------------+--------------------------------------------------------+
| ``RUBY_MODEXAMPLESDIR``   | Installationsverzeichnis f?r die Beispiele der Module.                                                  | ``/usr/local/share/examples/ruby18/patsy``             |
+---------------------------+---------------------------------------------------------------------------------------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine vollst?ndige Liste der verf?gbarenVariablen kann in
``/usr/ports/Mk/bsd.ruby.mk`` eingesehen werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+--------------------------------+----------------------------------+
| `Zur?ck <using-emacs.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-sdl.html>`__   |
+----------------------------------+--------------------------------+----------------------------------+
| 6.15. Emacs benutzen?            | `Zum Anfang <index.html>`__    | ?6.17. SDL verwenden             |
+----------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

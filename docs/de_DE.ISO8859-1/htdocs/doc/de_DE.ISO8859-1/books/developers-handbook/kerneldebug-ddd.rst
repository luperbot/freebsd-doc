====================================================================
10.3. Fehlersuche in einem Speicherauszug nach einem Absturz mit DDD
====================================================================

.. raw:: html

   <div class="navheader">

10.3. Fehlersuche in einem Speicherauszug nach einem Absturz mit DDD
`Zur?ck <kerneldebug-gdb.html>`__?
Kapitel 10. Kernel-Fehlersuche
?\ `Weiter <kerneldebug-online-ddb.html>`__

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

10.3. Fehlersuche in einem Speicherauszug nach einem Absturz mit DDD
--------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Untersuchung eines Speicherauszugs nach einem Kernel-Absturz mit
einem grafischen Debugger wie ``ddd`` ist auch m?glich (Sie m?ssen den
`devel/ddd <http://www.freebsd.org/cgi/url.cgi?ports/devel/ddd/pkg-descr>`__-Port
installieren, um den ``ddd``-Debugger benutzen zu k?nnen). Nehmen Sie
die ``-k`` mit in die ``ddd``-Kommandozeile auf, die Sie normalerweise
benutzen w?rden. Zum Beispiel:

.. code:: screen

    # ddd --debugger kgdb kernel.debug /var/crash/vmcore.0

Sie sollten nun in der Lage sein, die Untersuchung des Speicherauszugs
nach dem Absturz unter Benutzung der grafischen Schnittstelle von
``ddd`` anzugehen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------------------------------+------------------------------------+-----------------------------------------------+
| `Zur?ck <kerneldebug-gdb.html>`__?                                                  | `Nach oben <kerneldebug.html>`__   | ?\ `Weiter <kerneldebug-online-ddb.html>`__   |
+-------------------------------------------------------------------------------------+------------------------------------+-----------------------------------------------+
| 10.2. Fehlersuche in einem Speicherauszug nach einem Kernel-Absturz mit ``kgdb``?   | `Zum Anfang <index.html>`__        | ?10.4. Online-Kernel-Fehlersuche mit DDB      |
+-------------------------------------------------------------------------------------+------------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

======================
27.4. DTrace verwenden
======================

.. raw:: html

   <div class="navheader">

27.4. DTrace verwenden
`Zur?ck <dtrace-enable.html>`__?
Kapitel 27. DTrace
?\ `Weiter <network-communication.html>`__

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

27.4. DTrace verwenden
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DTrace-Skripte bestehen aus einer Liste von einer oder mehreren *Sonden*
oder Instrumentationspunkten, an denen jede Sonde mit einer Aktion
verkn?pft ist. Jedesmal, wenn die Bedingung f?r eine Sonde zutrifft,
wird die verkn?pfte Aktion ausgef?hrt. Beispielsweise k?nnte eine Aktion
ausgef?hrt werden, wenn eine Datei ge?ffnet, ein Prozess gestartet oder
eine Codezeile ausgef?hrt wird. Die Aktion k?nnte die Protokollierung
von Informationen sein oder die ?nderung von Kontextvariablen. Das Lesen
und Schreiben von Kontextvariablen erlaubt es den Sonden, Informationen
auszutauschen und kooperativ die Korrelation bestimmter Ereignisse zu
analysieren.

Um alle Sonden anzuzeigen, kann der Administrator nun den folgenden
Befehl eingeben:

.. code:: screen

    # dtrace -l | more

Jede Sonde besitzt eine ``ID``, einen ``PROVIDER`` (dtrace oder fbt),
ein ``MODULE`` und einen ``FUNCTION       NAME``. Lesen Sie f?r weitere
Informationen zu diesem Kommando
`dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1>`__.

Die Beispiele in diesem Abschnitt geben einen ?berblick, wie man zwei
dieser voll funktionsf?higen Skripte aus der DTrace-Werkzeugsammlung
verwendet: die Skripte ``hotkernel`` und ``procsystime``.

Das ``hotkernel`` Skript wurde entworfen, um zu identifizieren, welche
Funktion die meiste Kernelzeit beansprucht. Es wird es Ausgaben ?hnlich
der Folgenden produzieren:

.. code:: screen

    # cd /usr/share/dtrace/toolkit
    # ./hotkernel
    Sampling... Hit Ctrl-C to end.

Verwenden Sie wie angegeben die Tastenkombination **Ctrl**+**C**
dr?cken, um den Prozess zu stoppen. Nach dem Abbruch wird das Skript
eine Liste von Kernelfunktionen und Zeitmessungen ausgeben, aufsteigend
sortiert nach den Zeiten:

.. code:: screen

    kernel`_thread_lock_flags                                   2   0.0%
    0xc1097063                                                  2   0.0%
    kernel`sched_userret                                        2   0.0%
    kernel`kern_select                                          2   0.0%
    kernel`generic_copyin                                       3   0.0%
    kernel`_mtx_assert                                          3   0.0%
    kernel`vm_fault                                             3   0.0%
    kernel`sopoll_generic                                       3   0.0%
    kernel`fixup_filename                                       4   0.0%
    kernel`_isitmyx                                             4   0.0%
    kernel`find_instance                                        4   0.0%
    kernel`_mtx_unlock_flags                                    5   0.0%
    kernel`syscall                                              5   0.0%
    kernel`DELAY                                                5   0.0%
    0xc108a253                                                  6   0.0%
    kernel`witness_lock                                         7   0.0%
    kernel`read_aux_data_no_wait                                7   0.0%
    kernel`Xint0x80_syscall                                     7   0.0%
    kernel`witness_checkorder                                   7   0.0%
    kernel`sse2_pagezero                                        8   0.0%
    kernel`strncmp                                              9   0.0%
    kernel`spinlock_exit                                       10   0.0%
    kernel`_mtx_lock_flags                                     11   0.0%
    kernel`witness_unlock                                      15   0.0%
    kernel`sched_idletd                                       137   0.3%
    0xc10981a5                                              42139  99.3%

Dieses Skript funktioniert auch mit Kernelmodulen. Um diese Eigenschaft
zu verwenden, starten Sie das Skript mit ``-m``:

.. code:: screen

    # ./hotkernel -m
    Sampling... Hit Ctrl-C to end.
    ^C
    MODULE                                                  COUNT   PCNT
    0xc107882e                                                  1   0.0%
    0xc10e6aa4                                                  1   0.0%
    0xc1076983                                                  1   0.0%
    0xc109708a                                                  1   0.0%
    0xc1075a5d                                                  1   0.0%
    0xc1077325                                                  1   0.0%
    0xc108a245                                                  1   0.0%
    0xc107730d                                                  1   0.0%
    0xc1097063                                                  2   0.0%
    0xc108a253                                                 73   0.0%
    kernel                                                    874   0.4%
    0xc10981a5                                             213781  99.6%

Das ``procsystime`` Skript f?ngt die Systemaufruf-Zeiten f?r eine
gegebene Prozess-ID (PID) oder einen Prozessnamen ab und gibt diese aus.
Im folgenden Beispiel wurde eine neue Instanz von ``/bin/csh`` erzeugt.
Dann wurde ``procsystime`` ausgef?hrt und verbleibt so, w?hrend ein paar
Befehle in die andere Instanz von ``csh`` eingegeben werden. Dies sind
die Ergebnisse dieses Versuchs:

.. code:: screen

    # ./procsystime -n csh
    Tracing... Hit Ctrl-C to end...
    ^C

    Elapsed Times for processes csh,

             SYSCALL          TIME (ns)
              getpid               6131
           sigreturn               8121
               close              19127
               fcntl              19959
                 dup              26955
             setpgid              28070
                stat              31899
           setitimer              40938
               wait4              62717
           sigaction              67372
         sigprocmask             119091
        gettimeofday             183710
               write             263242
              execve             492547
               ioctl             770073
               vfork            3258923
          sigsuspend            6985124
                read         3988049784

Wie aus der Ausgabe ersichtlich ist, verbraucht der
``read()``-Systemaufruf die meiste Zeit in Nanosekunden, w?hrend der
Systemaufruf ``getpid()`` hingegen am schnellsten l?uft.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <dtrace-enable.html>`__?             | `Nach oben <dtrace.html>`__   | ?\ `Weiter <network-communication.html>`__   |
+----------------------------------------------+-------------------------------+----------------------------------------------+
| 27.3. Die DTrace Unterst?tzung aktivieren?   | `Zum Anfang <index.html>`__   | ?Teil?IV.?Netzwerke                          |
+----------------------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

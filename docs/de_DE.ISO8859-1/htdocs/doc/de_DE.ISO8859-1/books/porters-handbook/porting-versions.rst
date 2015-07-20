==================================================================
12.4. Unterschiedliche Betriebssysteme und Betriebssystemversionen
==================================================================

.. raw:: html

   <div class="navheader">

12.4. Unterschiedliche Betriebssysteme und Betriebssystemversionen
`Zur?ck <porting-wrkdirprefix.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <freebsd-versions.html>`__

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

12.4. Unterschiedliche Betriebssysteme und Betriebssystemversionen
------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen auf Quelltext treffen, welcher Modifizierungen oder bedingtes
Kompilieren, abh?ngig davon, unter welcher Unix-Version er l?uft,
ben?tigt. Falls Sie ?nderungen an solch einem Quelltext vornehmen
m?ssen, stellen Sie bitte sicher, dass Sie Ihre ?nderungen so allgemein
wie m?glich halten, damit wir den Quelltext auf ?ltere FreeBSD-Systeme
portieren und zur Quer-Portierung auf andere BSD-Systeme, wie etwa
4.4BSD von CSRG, BSD/386, 386BSD, NetBSD und OpenBSD verwenden k?nnen.

Der bevorzugte Weg, um 4.3BSD/Reno (1990) und neuere Versionen des
BSD-Quelltextes zu unterscheiden, ist das ``BSD``-Makro zu nutzen,
welches in
`sys/param.h <http://cvsweb.freebsd.org/src/sys/sys/param.h>`__
definiert ist. Hoffentlich ist diese Datei schon enthalten?–?falls
nicht, so f?gen Sie folgenden Quelltext:

.. code:: programlisting

    #if (defined(__unix__) || defined(unix)) && !defined(USG)
    #include <sys/param.h>
    #endif

an der richtigen Stelle in der ``.c`` Datei hinzu. Wir glauben, dass
jedes System, welches diese beiden Symbole definiert, die Datei
``sys/param.h`` besitzt. Wenn Sie auf Systeme sto?en, wo dies nicht so
ist, w?rden wir gerne davon erfahren. Bitte senden Sie eine E-Mail an
`FreeBSD
ports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__.

Eine andere M?glichkeit zur Unterscheidung ist der GNU Autoconf-Stil:

.. code:: programlisting

    #ifdef HAVE_SYS_PARAM_H
    #include <sys/param.h>
    #endif

Vergessen Sie nicht ``-DHAVE_SYS_PARAM_H`` zu den ``CFLAGS`` im
``Makefile`` hinzuzuf?gen, falls Sie diese Methode benutzen sollten.

Sobald Sie ``sys/param.h`` hinzugef?gt haben, k?nnen Sie mit Hilfe von

.. code:: programlisting

    #if (defined(BSD) && (BSD >= 199103))

unterscheiden, ob der Quelltext auf einer 4.3 Net2 Code-Basis oder neuer
(z.B. FreeBSD 1.x, 4.3/Reno, NetBSD 0.9, 386BSD, BSD/386 1.1 und
niedriger) kompiliert werden wird.

Benutzen Sie:

.. code:: programlisting

    #if (defined(BSD) && (BSD >= 199306))

um zu differenzieren, ob der Quelltext auf der Basis von 4.4 Code oder
neuer (z.B. FreeBSD 2.x, 4.4, NetBSD 1.0, BSD/386 2.0 oder h?her)
kompiliert werden wird.

Der Wert des ``BSD``-Makros ist ``199506`` f?r die 4.4BSD-Lite2
Codebasis. Beachten Sie bitte, dass dies hier nur der Information wegen
angegeben ist. Das Makro sollte nicht dazu benutzt werden, um zwischen
Versionen von FreeBSD, welche auf 4.4-Lite basieren, und Versionen,
welche ?nderungen von 4.4-Lite2 ?bernommen haben, zu unterscheiden. Das
``__FreeBSD__`` Makro sollte stattdessen verwandt werden.

Sparsam sollte eingesetzt werden:

.. raw:: html

   <div class="itemizedlist">

-  ``__FreeBSD__`` ist in allen Versionen von FreeBSD definiert.
   Benutzen Sie dieses Makro, falls die ?nderung(en), die Sie machen,
   *nur* FreeBSD betrifft. Portierungsfallen, wie der Gebrauch von
   ``sys_errlist[]`` gegen?ber ``strerror()`` sind Berkeley-Eigenheiten,
   keine FreeBSD ?nderungen.

-  In FreeBSD 2.x, ist ``__FreeBSD__`` auf ``2`` definiert. In ?lteren
   Versionen, ist es ``1``. Alle sp?teren Versionen erh?hen es, damit es
   mit der Haupt-Versionsnummer ?bereinstimmt.

-  Falls Sie zwischen einem FreeBSD 1.x und einem FreeBSD 2.x (oder
   h?her) System unterscheiden m?ssen, ist es normalerweise richtig, die
   ``BSD``-Makros (wie oben beschrieben) zu benutzen. Gibt es
   tats?chlich eine FreeBSD-spezifische ?nderung (wie z.B. spezielle
   Optionen von Shared-Libraries f?r ``ld``), ist es nicht zu
   beanstanden ``__FreeBSD__`` und ``#if         __FreeBSD__ > 1`` zu
   nutzen, um FreeBSD 2.x und sp?tere Systeme zu erkennen. Falls Sie
   eine h?here Genauigkeit ben?tigen, um FreeBSD Systeme seit
   2.0-RELEASE zu erkennen, k?nnen Sie folgendes nutzen:

   .. code:: programlisting

       #if __FreeBSD__ >= 2
       #include <osreldate.h>
       #    if __FreeBSD_version >= 199504
            /* 2.0.5+ release specific code here */
       #    endif
       #endif

.. raw:: html

   </div>

In den Tausenden von Ports, die bis jetzt erstellt wurden, gab es nur
ein oder zwei F?lle, in denen ``__FreeBSD__`` h?tte benutzt werden
sollen. Nur weil ein fr?herer Port es an der falschen Stelle benutzt
hatte, bedeutet das nicht, dass Sie dies auch machen sollten.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------------+-----------------------------------------+
| `Zur?ck <porting-wrkdirprefix.html>`__?   | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <freebsd-versions.html>`__   |
+-------------------------------------------+-------------------------------------+-----------------------------------------+
| 12.3. ``WRKDIRPREFIX``?                   | `Zum Anfang <index.html>`__         | ?12.5. \_\_FreeBSD\_version Werte       |
+-------------------------------------------+-------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

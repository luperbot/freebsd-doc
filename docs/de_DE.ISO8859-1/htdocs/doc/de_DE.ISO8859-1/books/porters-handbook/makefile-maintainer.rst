===============
5.5. MAINTAINER
===============

.. raw:: html

   <div class="navheader">

5.5. ``MAINTAINER``
`Zur?ck <makefile-distfiles.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-comment.html>`__

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

5.5. ``MAINTAINER``
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?gen Sie hier Ihre E-Mailadresse ein. Bitte. *:-)*

Beachten Sie bitte, dass nur eine einzelne E-Mailadresse ohne Kommentar
in der Variable ``MAINTAINER`` zul?ssig ist. Das Format sollte
``user@hostname.domain`` sein. Bitte f?gen Sie keinen beschreibenden
Text wie z.B. Ihren wirklichen Namen ein, dies verwirrt lediglich
``bsd.port.mk``.

Der Maintainer ist daf?r verantwortlich, dass der Port aktuell gehalten
wird und er sorgt daf?r, dass der Port korrekt arbeitet. F?r eine
detaillierte Beschreibung der Verantwortlichkeiten eines Maintainers
beachten Sie bitte den Abschnitt `Die Herausforderung f?r einen
Port-Maintainer <../../../../doc/de_DE.ISO8859-1/articles/contributing-ports/maintain-port.html>`__.

?nderungen am Port werden dem Maintainer zur Begutachtung und Zustimmung
vorgelegt, bevor sie committed werden. Falls der Maintainer einem
Aktualisierungs-Wunsch nicht binnen 2 Wochen (ausgenommen wichtige
?ffentliche Feiertage) zustimmt, dann wird dies als Maintainer-Timeout
betrachtet und eine Aktualisierung kann ohne ausdr?ckliche Zustimmung
des Maintainers erfolgen. Falls der Maintainer nicht binnen 3 Monaten
zustimmt, wird er als abwesend ohne Grund betrachtet und kann als
Maintainer des fraglichen Ports durch eine andere Person ersetzt werden.
Ausgenommen davon ist alles, was durch das Ports Management Team
``<portmgr@FreeBSD.org>`` oder das Security Officer Team
``<security-officer@FreeBSD.org>`` betreut wird. Es d?rfen niemals
committs ohne vorherige Zustimmung an solchen Ports vorgenommen werden!

Wir behalten uns das Recht vor, die Einreichungen eines Maintainers ohne
ausdr?ckliche Zustimmung zu ?ndern, falls wir der Auffassung sind, dass
dadurch die Einhaltung von Richtlinien und stilistischen Vorgaben f?r
die Ports-Sammlung besser erf?llt wird. Zudem k?nnen gr??ere ?nderungen
an der Infrastruktur der Ports zu ?nderungen an einem bestimmten Port
ohne Zustimmung des Maintainers f?hren. Diese ?nderungen beeinflussen
niemals die Funktionalit?t eines Ports.

Das Ports Management Team ``<portmgr@FreeBSD.org>`` beh?lt sich das
Recht vor, die Maintainerschaft jedem aus irgendeinem Grund zu entziehen
oder ausser Kraft zu setzen, und das Security Officer Team Security
Officer Team ``<security-officer@FreeBSD.org>`` beh?lt sich das Recht
vor, jede Maintainerschaft aus Sicherheitsgr?nden aufzuheben oder ausser
Kraft zu setzen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------------+-----------------------------------------+
| `Zur?ck <makefile-distfiles.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-comment.html>`__   |
+-----------------------------------------+---------------------------------+-----------------------------------------+
| 5.4. Die Distributionsdateien?          | `Zum Anfang <index.html>`__     | ?5.6. ``COMMENT``                       |
+-----------------------------------------+---------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

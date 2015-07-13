==================================
14.14. FreeBSD Security Advisories
==================================

.. raw:: html

   <div class="navheader">

14.14. FreeBSD Security Advisories
`Anterior <security-portaudit.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <security-accounting.html>`__

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

14.14. FreeBSD Security Advisories
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Como muchos sistemas operativos con calidad de producci?n, FreeBSD
publica “Security Advisories” (advertencias de seguridad. Estas
advertencias suelen enviarse por correo a las listas de seguridad e
incluidas en la Errata solamente despu?s de que la versi?n apropiada
haya sido corregida. Esta secci?n tiene como fin explicar en qu?
consiste una advertencia de seguridad, c?mo entenderla y qu? medidas hay
que tomar para parchear el sistema.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.14.1. ?Qu? aspecto tiene una advertencia de seguridad?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las advertencias de seguridad de FreeBSD tienen un aspecto similar a la
que se muestra aqu?. Fu? enviada a la lista de correo
`freebsd-security-notifications <http://lists.FreeBSD.org/mailman/listinfo/freebsd-security-notifications>`__.

.. code:: programlisting

    =============================================================================
    FreeBSD-SA-XX:XX.UTIL                                     Security Advisory
                                                              The FreeBSD Project

    Topic:          denial of service due to some problem

    Category:       core
    Module:         sys
    Announced:      2003-09-23
    Credits:        Person@EMAIL-ADDRESS
    Affects:        All releases of FreeBSD
                    FreeBSD 4-STABLE prior to the correction date
    Corrected:      2003-09-23 16:42:59 UTC (RELENG_4, 4.9-PRERELEASE)
                    2003-09-23 20:08:42 UTC (RELENG_5_1, 5.1-RELEASE-p6)
                    2003-09-23 20:07:06 UTC (RELENG_5_0, 5.0-RELEASE-p15)
                    2003-09-23 16:44:58 UTC (RELENG_4_8, 4.8-RELEASE-p8)
                    2003-09-23 16:47:34 UTC (RELENG_4_7, 4.7-RELEASE-p18)
                    2003-09-23 16:49:46 UTC (RELENG_4_6, 4.6-RELEASE-p21)
                    2003-09-23 16:51:24 UTC (RELENG_4_5, 4.5-RELEASE-p33)
                    2003-09-23 16:52:45 UTC (RELENG_4_4, 4.4-RELEASE-p43)
                    2003-09-23 16:54:39 UTC (RELENG_4_3, 4.3-RELEASE-p39)
    FreeBSD only:   NO

    For general information regarding FreeBSD Security Advisories,
    including descriptions of the fields above, security branches, and the
    following sections, please visit
    http://www.FreeBSD.org/security/.

    I.   Background


    II.  Problem Description


    III. Impact


    IV.  Workaround


    V.   Solution


    VI.  Correction details


    VII. References

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-topic>`__                  | El campo ``Topic`` indica cu?l es    |
|                                      | exactamente el problema. B?sicamente |
|                                      | es la introducci?n de la advertencia |
|                                      | de seguridad actual e indica el uso  |
|                                      | malintencionado que puede darse a la |
|                                      | vulnerabilidad.                      |
+--------------------------------------+--------------------------------------+
| `|2| <#co-category>`__               | ``Category`` se refiere a la parte   |
|                                      | afectada del sistema, que puede ser  |
|                                      | ``core``, ``contrib`` o ``ports``.   |
|                                      | La categor?a ``core`` significa que  |
|                                      | la vulnerabilidad afecta a un        |
|                                      | componente central del sistema       |
|                                      | operativo FreeBSD. La categor?a      |
|                                      | ``contrib`` significa que la         |
|                                      | vulnerabilidad afecta a software que |
|                                      | no ha sido desarrollado por el       |
|                                      | proyecto FreeBSD, como sendmail. La  |
|                                      | categor?a ``ports`` indica que la    |
|                                      | vulnerabilidad afecta a software     |
|                                      | incluido en la colecci?n de ports.   |
+--------------------------------------+--------------------------------------+
| `|3| <#co-module>`__                 | El campo ``Module`` se refiere a la  |
|                                      | ubicaci?n del componente, por        |
|                                      | ejemplo ``sys``. En este ejemplo     |
|                                      | vemos que est? afectado el m?dulo    |
|                                      | ``sys``; por lo tanto esta           |
|                                      | vulnerabilidad afecta a componentes  |
|                                      | utilizados dentro del kernel.        |
+--------------------------------------+--------------------------------------+
| `|4| <#co-announce>`__               | El campo ``Announced`` refleja la    |
|                                      | fecha de publicaci?n de la           |
|                                      | advertencia de seguridad fu?         |
|                                      | publicada o anunciada al mundo. Esto |
|                                      | significa que el equipo de seguridad |
|                                      | ha verificado que el que el problema |
|                                      | existe y que se ha incluido un       |
|                                      | parche que soluciona el problema en  |
|                                      | el repositorio de c?digo fuente de   |
|                                      | FreeBSD.                             |
+--------------------------------------+--------------------------------------+
| `|5| <#co-credit>`__                 | El campo ``Credits`` le da el        |
|                                      | cr?dito al individuo u organizaci?n  |
|                                      | que descubri? y report? la           |
|                                      | vulnerabilidad.                      |
+--------------------------------------+--------------------------------------+
| `|6| <#co-affects>`__                | El campo ``Affects`` explica a qu?   |
|                                      | versiones de FreeBSD afecta esta     |
|                                      | vulnerabilidad. En el caso del       |
|                                      | kernel una r?pida revisi?n de la     |
|                                      | salida de ``ident`` en los ficheros  |
|                                      | afectados ayudar? a determinar la    |
|                                      | versi?n. En el caso de de los ports  |
|                                      | el n?mero de versi?n aparece despu?s |
|                                      | del nombre del port en               |
|                                      | ``/var/db/pkg``. Si el sistema no se |
|                                      | sincroniza con el repositorio CVS de |
|                                      | FreeBSD y se reconstruye             |
|                                      | diariamente, existe la posibilidad   |
|                                      | de que est? afectado por el problema |
|                                      | de seguridad.                        |
+--------------------------------------+--------------------------------------+
| `|7| <#co-corrected>`__              | El campo ``Corrected`` indica la     |
|                                      | fecha, hora, zona horaria y versi?n  |
|                                      | de FreeBSD en que fu? corregido.     |
+--------------------------------------+--------------------------------------+
| `|8| <#co-only>`__                   | El campo ``FreeBSD only`` indica si  |
|                                      | la vulnerabilidad afecta solamente a |
|                                      | FreeBSD o si afecta tambi?n a otros  |
|                                      | sistemas operativos.                 |
+--------------------------------------+--------------------------------------+
| `|9| <#co-backround>`__              | El campo ``Background`` informa      |
|                                      | acerca de qu? es exactamente la      |
|                                      | aplicaci?n afectada. La mayor parte  |
|                                      | de las veces se refiere a por qu? la |
|                                      | aplicaci?n existe en FreeBSD, para   |
|                                      | qu? se usa y un poco de informaci?n  |
|                                      | de c?mo lleg? lleg? a ocupar el      |
|                                      | lugar que ocupa en el sistema o el   |
|                                      | ?rbol de ports.                      |
+--------------------------------------+--------------------------------------+
| `|10| <#co-descript>`__              | El campo ``Problem Description``     |
|                                      | explica el problema de seguridad en  |
|                                      | profundidad. Puede incluir           |
|                                      | informaci?n del c?digo err?neo, o    |
|                                      | incluso c?mo puede usarse            |
|                                      | maliciosamente el error para abrir   |
|                                      | un agujero de seguridad.             |
+--------------------------------------+--------------------------------------+
| `|11| <#co-impact>`__                | El campo ``Impact`` describe el tipo |
|                                      | de impacto que el problema pueda     |
|                                      | tener en un sistema. Por ejemplo,    |
|                                      | esto puede ser desde un ataque de    |
|                                      | denegaci?n de servicio, hasta una    |
|                                      | escalada de privilegios de usuario,  |
|                                      | o incluso ofrecer al atacante acceso |
|                                      | de superusuario.                     |
+--------------------------------------+--------------------------------------+
| `|12| <#co-workaround>`__            | El campo ``Workaround`` ofrece una   |
|                                      | soluci?n temoral posible para los    |
|                                      | administradores de sistemas que tal  |
|                                      | vez no puedan actualizar el sistema. |
|                                      | Esto puede deberse a la falta de     |
|                                      | tiempo, disponibilidad de de red, o  |
|                                      | a muchas otras razones. A pesar de   |
|                                      | todo la la seguridad no se debe      |
|                                      | tomar a la ligera y un sistema       |
|                                      | afectado debe parchearse al menos    |
|                                      | aplicar una soluci?n temporal para   |
|                                      | el agujero de seguridad.             |
+--------------------------------------+--------------------------------------+
| `|13| <#co-solution>`__              | El campo ``Solution`` ofrece         |
|                                      | instrucciones para parchear el       |
|                                      | sistema afectado. Este es un m?todo  |
|                                      | paso a paso, probado y verificado    |
|                                      | para parchear un sistema y que       |
|                                      | trabaje seguro.                      |
+--------------------------------------+--------------------------------------+
| `|14| <#co-details>`__               | El campo ``Correction Details``      |
|                                      | despliega la rama del CVS o el       |
|                                      | nombre de la versi?n con los puntos  |
|                                      | cambiados a guiones bajos. Tambi?n   |
|                                      | muestra el n?mero de revisi?n de los |
|                                      | ficheros afectados dentro de cada    |
|                                      | rama.                                |
+--------------------------------------+--------------------------------------+
| `|15| <#co-ref>`__                   | El campo ``References`` suele        |
|                                      | ofrecer fuentes adicionales de       |
|                                      | informaci?n: URL, libros, listas de  |
|                                      | correo y grupos de noticias.         |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------+-----------------------------+-----------------------------------------------+
| `Anterior <security-portaudit.html>`__?                         | `Subir <security.html>`__   | ?\ `Siguiente <security-accounting.html>`__   |
+-----------------------------------------------------------------+-----------------------------+-----------------------------------------------+
| 14.13. Monitorizaci?n de fallos de seguridad de aplicaciones?   | `Inicio <index.html>`__     | ?14.15. Contabilidad de procesos              |
+-----------------------------------------------------------------+-----------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
.. |11| image:: ./imagelib/callouts/11.png
.. |12| image:: ./imagelib/callouts/12.png
.. |13| image:: ./imagelib/callouts/13.png
.. |14| image:: ./imagelib/callouts/14.png
.. |15| image:: ./imagelib/callouts/15.png

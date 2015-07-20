===========================
17.13. The MAC LOMAC Module
===========================

.. raw:: html

   <div class="navheader">

17.13. The MAC LOMAC Module
`????? <mac-biba.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-implementing.html>`__

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

17.13. The MAC LOMAC Module
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_lomac.ko``

Kernel configuration line: ``options MAC_LOMAC``

Boot option: ``mac_lomac_load="YES"``

Unlike the MAC Biba policy, the
`mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__
policy permits access to lower integrity objects only after decreasing
the integrity level to not disrupt any integrity rules.

The MAC version of the Low-watermark integrity policy, not to be
confused with the older
`lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lomac&sektion=4>`__
implementation, works almost identically to Biba, but with the exception
of using floating labels to support subject demotion via an auxiliary
grade compartment. This secondary compartment takes the form of
``[auxgrade]``. When assigning a lomac policy with an auxiliary grade,
it should look a little bit like: ``lomac/10[2]`` where the number two
(2) is the auxiliary grade.

The MAC LOMAC policy relies on the ubiquitous labeling of all system
objects with integrity labels, permitting subjects to read from low
integrity objects and then downgrading the label on the subject to
prevent future writes to high integrity objects. This is the
``[auxgrade]`` option discussed above, thus the policy may provide for
greater compatibility and require less initial configuration than Biba.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.13.1. Examples
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like the Biba and MLS policies; the ``setfmac`` and ``setpmac``
utilities may be used to place labels on system objects:

.. code:: screen

    # setfmac /usr/home/trhodes lomac/high[low]
    # getfmac /usr/home/trhodes lomac/high[low]

Notice the auxiliary grade here is ``low``, this is a feature provided
only by the MAC LOMAC policy.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+------------------------------------------+
| `????? <mac-biba.html>`__?    | `???? <mac.html>`__     | ?\ `??????? <mac-implementing.html>`__   |
+-------------------------------+-------------------------+------------------------------------------+
| 17.12. The MAC Biba Module?   | `???? <index.html>`__   | ?17.14. Nagios in a MAC Jail             |
+-------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

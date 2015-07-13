==================
2.?Getting Started
==================

.. raw:: html

   <div class="navheader">

2.?Getting Started
`Prev <index.html>`__?
?
?\ `Next <clients.html>`__

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

2.?Getting Started
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first step to using Perforce is to obtain an account on the server.
If you already have a ``FreeBSD.org`` account, log into ``freefall``,
run the following command, and enter a password that is not the same as
your FreeBSD login or any other SSH passphrase:

.. code:: screen

    % /usr/local/bin/p4newuser

Of course if you do not have a ``FreeBSD.org`` account, you will need to
coordinate with your sponsor.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

An email will be sent to your FreeBSD address that contains the password
you specified above in cleartext. Be sure to change the password once
your Perforce account has been created!

.. raw:: html

   </div>

The next step is to set the environment variables that ``p4`` needs, and
verify that it can connect to the server. The ``P4PORT`` variable is
required to be set for all operations, and specifies the appropriate
Perforce server to talk to. For the FreeBSD project, set it like so:

.. code:: screen

    % export P4PORT=perforce.freebsd.org:1666

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Users with shell access on the ``FreeBSD.org`` cluster may wish to
tunnel the Perforce client-server protocol via an SSH tunnel, in which
case the above string should be set to ``localhost``.

.. raw:: html

   </div>

The FreeBSD server also requires that the ``P4USER`` and ``P4PASSWD``
variables be set. Use the username and password from above, like so:

.. code:: screen

    % export P4USER=username
    % export P4PASSWD=password

Test that this works by running the following command:

.. code:: screen

    % p4 info

This should return a list of information about the server. If it does
not, check that you have the ``P4PORT`` variable set correctly.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+------------------------------+
| `Prev <index.html>`__?             | ?                       | ?\ `Next <clients.html>`__   |
+------------------------------------+-------------------------+------------------------------+
| Perforce in FreeBSD Development?   | `Home <index.html>`__   | ?3.?Clients                  |
+------------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

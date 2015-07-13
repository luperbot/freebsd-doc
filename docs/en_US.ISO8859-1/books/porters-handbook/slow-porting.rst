=======================
Chapter?4.?Slow Porting
=======================

.. raw:: html

   <div class="navheader">

Chapter?4.?Slow Porting
`Prev <porting-submitting.html>`__?
?
?\ `Next <slow-sources.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`4.1. How Things Work <slow-porting.html#slow-work>`__
`4.2. Getting the Original Sources <slow-sources.html>`__
`4.3. Modifying the Port <slow-modifying.html>`__
`4.4. Patching <slow-patch.html>`__
`4.5. Configuring <slow-configure.html>`__
`4.6. Handling User Input <slow-user-input.html>`__

.. raw:: html

   </div>

Okay, so it was not that simple, and the port required some
modifications to get it to work. In this section, we will explain, step
by step, how to modify it to get it to work with the ports paradigm.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?How Things Work
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, this is the sequence of events which occurs when the user first
types ``make`` in the port's directory. Having ``bsd.port.mk`` in
another window while reading this really helps to understand it.

But do not worry not many people understand exactly how ``bsd.port.mk``
is working... *:-)*

.. raw:: html

   <div class="procedure">

#. The ``fetch`` target is run. The ``fetch`` target is responsible for
   making sure that the tarball exists locally in ``DISTDIR``. If
   ``fetch`` cannot find the required files in ``DISTDIR`` it will look
   up the URL ``MASTER_SITES``, which is set in the Makefile, as well as
   our FTP mirrors where we put distfiles as backup. It will then
   attempt to fetch the named distribution file with ``FETCH``, assuming
   that the requesting site has direct access to the Internet. If that
   succeeds, it will save the file in ``DISTDIR`` for future use and
   proceed.

#. The ``extract`` target is run. It looks for the port's distribution
   file (typically a ``gzip``\ ped tarball) in ``DISTDIR`` and unpacks
   it into a temporary subdirectory specified by ``WRKDIR`` (defaults to
   ``work``).

#. The ``patch`` target is run. First, any patches defined in
   ``PATCHFILES`` are applied. Second, if any patch files named
   ``patch-*`` are found in ``PATCHDIR`` (defaults to the ``files``
   subdirectory), they are applied at this time in alphabetical order.

#. The ``configure`` target is run. This can do any one of many
   different things.

   .. raw:: html

      <div class="orderedlist">

   #. If it exists, ``scripts/configure`` is run.

   #. If ``HAS_CONFIGURE`` or ``GNU_CONFIGURE`` is set,
      ``WRKSRC/configure`` is run.

   .. raw:: html

      </div>

#. The ``build`` target is run. This is responsible for descending into
   the port's private working directory (``WRKSRC``) and building it.

#. The ``stage`` target is run. This puts the final set of built files
   into a temporary directory (``STAGEDIR``, see `Section?6.1,
   “Staging” <special.html#staging>`__). The hierarchy of this directory
   mirrors that of the system on which the package will be installed.

#. The ``package`` target is run. This creates a package using the files
   from the temporary directory created during the ``stage`` target and
   the port's ``pkg-plist``.

#. The ``install`` target is run. This installs the package created
   during the ``package`` target into the host system.

.. raw:: html

   </div>

The above are the default actions. In addition, define targets
``pre-something`` or ``post-something``, or put scripts with those
names, in the ``scripts`` subdirectory, and they will be run before or
after the default actions are done.

For example, if there is a ``post-extract`` target defined in the
``Makefile``, and a file ``pre-build`` in the ``scripts`` subdirectory,
the ``post-extract`` target will be called after the regular extraction
actions, and ``pre-build`` will be executed before the default build
rules are done. It is recommended to use ``Makefile`` targets if the
actions are simple enough, because it will be easier for someone to
figure out what kind of non-default action the port requires.

The default actions are done by the ``do-something`` targets from
``bsd.port.mk``. For example, the commands to extract a port are in the
target ``do-extract``. If the default target does not do the job right,
redefine the ``do-something`` target in the ``Makefile``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The “main” targets (for example, ``extract``, ``configure``, etc.) do
nothing more than make sure all the stages up to that one are completed
and call the real targets or scripts, and they are not intended to be
changed. To fix the extraction, fix ``do-extract``, but never ever
change the way ``extract`` operates! Additionally, the target
``post-deinstall`` is invalid and is not run by the ports
infrastructure.

.. raw:: html

   </div>

Now that what goes on when the user types ``make     install`` is better
understood, let us go through the recommended steps to create the
perfect port.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+--------------------------------------+
| `Prev <porting-submitting.html>`__?   | ?                       | ?\ `Next <slow-sources.html>`__      |
+---------------------------------------+-------------------------+--------------------------------------+
| 3.6.?Submitting the New Port?         | `Home <index.html>`__   | ?4.2.?Getting the Original Sources   |
+---------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

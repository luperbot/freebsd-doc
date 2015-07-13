=====================
5.4.?Encumbered Files
=====================

.. raw:: html

   <div class="navheader">

5.4.?Encumbered Files
`Prev <policies-contributed.html>`__?
Chapter?5.?Source Tree Guidelines and Policies
?\ `Next <policies-shlib.html>`__

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

5.4.?Encumbered Files
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It might occasionally be necessary to include an encumbered file in the
FreeBSD source tree. For example, if a device requires a small piece of
binary code to be loaded to it before the device will operate, and we do
not have the source to that code, then the binary file is said to be
encumbered. The following policies apply to including encumbered files
in the FreeBSD source tree.

.. raw:: html

   <div class="orderedlist">

#. Any file which is interpreted or executed by the system CPU(s) and
   not in source format is encumbered.

#. Any file with a license more restrictive than BSD or GNU is
   encumbered.

#. A file which contains downloadable binary data for use by the
   hardware is not encumbered, unless (1) or (2) apply to it. It must be
   stored in an architecture neutral ASCII format (file2c or uuencoding
   is recommended).

#. Any encumbered file requires specific approval from the `Core
   Team <../../../../administration.html#t-core>`__ before it is added
   to the repository.

#. Encumbered files go in ``src/contrib`` or ``src/sys/contrib``.

#. The entire module should be kept together. There is no point in
   splitting it, unless there is code-sharing with non-encumbered code.

#. Object files are named ``arch``/*``filename``*.o.uu>.

#. Kernel files:

   .. raw:: html

      <div class="orderedlist">

   #. Should always be referenced in ``conf/files.*`` (for build
      simplicity).

   #. Should always be in ``LINT``, but the `Core
      Team <../../../../administration.html#t-core>`__ decides per case
      if it should be commented out or not. The `Core
      Team <../../../../administration.html#t-core>`__ can, of course,
      change their minds later on.

   #. The *Release Engineer* decides whether or not it goes into the
      release.

   .. raw:: html

      </div>

#. User-land files:

   .. raw:: html

      <div class="orderedlist">

   #. The `Core team <../../../../administration.html#t-core>`__\ 
      decides if the code should be part of ``make world``.

   #. The `Release
      Engineering <../../../../administration.html#t-re>`__\  decides if
      it goes into the release.

   .. raw:: html

      </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+--------------------------+-------------------------------------+
| `Prev <policies-contributed.html>`__?   | `Up <policies.html>`__   | ?\ `Next <policies-shlib.html>`__   |
+-----------------------------------------+--------------------------+-------------------------------------+
| 5.3.?Contributed Software?              | `Home <index.html>`__    | ?5.5.?Shared Libraries              |
+-----------------------------------------+--------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

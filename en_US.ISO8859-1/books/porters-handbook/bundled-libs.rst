======================
6.2.?Bundled Libraries
======================

.. raw:: html

   <div class="navheader">

6.2.?Bundled Libraries
`Prev <special.html>`__?
Chapter?6.?Special Considerations
?\ `Next <porting-shlibs.html>`__

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

6.2.?Bundled Libraries
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section explains why bundled dependencies are considered bad and
what to do about them.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.1.?Why Bundled Libraries Are Bad
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some software requires the porter to locate third-party libraries and
add the required dependencies to the port. Other software bundles all
necessary libraries into the distribution file. The second approach
seems easier at first, but there are some serious drawbacks:

This list is loosely based on the
`Fedora <https://fedoraproject.org/wiki/Packaging:No_Bundled_Libraries>`__
and `Gentoo <http://wiki.gentoo.org/wiki/Why_not_bundle_dependencies>`__
wikis, both licensed under the `CC-BY-SA
3.0 <http://creativecommons.org/licenses/by-sa/3.0/>`__ license.

.. raw:: html

   <div class="variablelist">

Security
    If vulnerabilities are found in the upstream library and fixed
    there, they might not be fixed in the library bundled with the port.
    One reason could be that the author is not aware of the problem.
    This means that the porter must fix them, or upgrade to a
    non-vulnerable version, and send a patch to the author. This all
    takes time, which results in software being vulnerable longer than
    necessary. This in turn makes it harder to coordinate a fix without
    unnecessarily leaking information about the vulnerability.

Bugs
    This problem is similar to the problem with security in the last
    paragraph, but generally less severe.

Forking
    It is easier for the author to fork the upstream library once it is
    bundled. While convenient on first sight, it means that the code
    diverges from upstream making it harder to address security or other
    problems with the software. A reason for this is that patching
    becomes harder.

    Another problem of forking is that because code diverges from
    upstream, bugs get solved over and over again instead of just once
    at a central location. This defeats the idea of open source software
    in the first place.

Symbol collision
    When a library is installed on the system, it might collide with the
    bundled version. This can cause immediate errors at compile or link
    time. It can also cause errors when running the program which might
    be harder to track down. The latter problem could be caused because
    the versions of the two libraries are incompatible.

Licensing
    When bundling projects from different sources, license issues can
    arise more easily, especially when licenses are incompatible.

Waste of resources
    Bundled libraries waste resources on several levels. It takes longer
    to build the actual application, especially if these libraries are
    already present on the system. At run-time, they can take up
    unnecessary memory when the system-wide library is already loaded by
    one program and the bundled library is loaded by another program.

Waste of effort
    When a library needs patches for FreeBSD, these patches have to be
    duplicated again in the bundled library. This wastes developer time
    because the patches might not apply cleanly. It can also be hard to
    notice that these patches are required in the first place.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.2.?What to do About Bundled Libraries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Whenever possible, use the unbundled version of the library by adding a
``LIB_DEPENDS`` to the port. If such a port does not exist yet, consider
creating it.

Only use bundled libraries if the upstream has a good track record on
security and using unbundled versions leads to overly complex patches.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In some very special cases, for example emulators, like Wine, a port has
to bundle libraries, because they are in a different architecture, or
they have been modified to fit the software's use. In that case, those
libraries should not be exposed to other ports for linking. Add
``BUNDLE_LIBS=yes`` to the port's ``Makefile``. This will tell
`pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__ to
not compute provided libraries. Always ask the Ports Management Team
``<portmgr@FreeBSD.org>`` before adding this to a port.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-------------------------------------+
| `Prev <special.html>`__?             | `Up <special.html>`__   | ?\ `Next <porting-shlibs.html>`__   |
+--------------------------------------+-------------------------+-------------------------------------+
| Chapter?6.?Special Considerations?   | `Home <index.html>`__   | ?6.3.?Shared Libraries              |
+--------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

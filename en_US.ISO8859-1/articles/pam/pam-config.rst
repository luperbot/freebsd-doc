====================
4.?PAM Configuration
====================

.. raw:: html

   <div class="navheader">

4.?PAM Configuration
`Prev <pam-essentials.html>`__?
?
?\ `Next <pam-freebsd-modules.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.?PAM Configuration
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?PAM policy files
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.1.?The ``/etc/pam.conf`` file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The traditional PAM policy file is ``/etc/pam.conf``. This file contains
all the PAM policies for your system. Each line of the file describes
one step in a chain, as shown below:

.. code:: programlisting

    login   auth    required        pam_nologin.so  no_warn

The fields are, in order: service name, facility name, control flag,
module name, and module arguments. Any additional fields are interpreted
as additional module arguments.

A separate chain is constructed for each service / facility pair, so
while the order in which lines for the same service and facility appear
is significant, the order in which the individual services and
facilities are listed is not. The examples in the original PAM paper
grouped configuration lines by facility, and the Solaris™ stock
``pam.conf`` still does that, but FreeBSD's stock configuration groups
configuration lines by service. Either way is fine; either way makes
equal sense.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.2.?The ``/etc/pam.d`` directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenPAM and Linux-PAM support an alternate configuration mechanism,
which is the preferred mechanism in FreeBSD. In this scheme, each policy
is contained in a separate file bearing the name of the service it
applies to. These files are stored in ``/etc/pam.d/``.

These per-service policy files have only four fields instead of
``pam.conf``'s five: the service name field is omitted. Thus, instead of
the sample ``pam.conf`` line from the previous section, one would have
the following line in ``/etc/pam.d/login``:

.. code:: programlisting

    auth    required        pam_nologin.so  no_warn

As a consequence of this simplified syntax, it is possible to use the
same policy for multiple services by linking each service name to a same
policy file. For instance, to use the same policy for the ``su`` and
``sudo`` services, one could do as follows:

.. code:: screen

    # cd /etc/pam.d
    # ln -s su sudo

This works because the service name is determined from the file name
rather than specified in the policy file, so the same file can be used
for multiple differently-named services.

Since each service's policy is stored in a separate file, the ``pam.d``
mechanism also makes it very easy to install additional policies for
third-party software packages.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.3.?The policy search order
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As we have seen above, PAM policies can be found in a number of places.
What happens if policies for the same service exist in multiple places?

It is essential to understand that PAM's configuration system is
centered on chains.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.?Breakdown of a configuration line
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As explained in `Section?4.1, “PAM policy
files” <pam-config.html#pam-config-file>`__, each line in
``/etc/pam.conf`` consists of four or more fields: the service name, the
facility name, the control flag, the module name, and zero or more
module arguments.

The service name is generally (though not always) the name of the
application the statement applies to. If you are unsure, refer to the
individual application's documentation to determine what service name it
uses.

Note that if you use ``/etc/pam.d/`` instead of ``/etc/pam.conf``, the
service name is specified by the name of the policy file, and omitted
from the actual configuration lines, which then start with the facility
name.

The facility is one of the four facility keywords described in
`Section?3.1, “Facilities and
primitives” <pam-essentials.html#pam-facilities-primitives>`__.

Likewise, the control flag is one of the four keywords described in
`Section?3.3, “Chains and
policies” <pam-essentials.html#pam-chains-policies>`__, describing how
to interpret the return code from the module. Linux-PAM supports an
alternate syntax that lets you specify the action to associate with each
possible return code, but this should be avoided as it is non-standard
and closely tied in with the way Linux-PAM dispatches service calls
(which differs greatly from the way Solaris™ and OpenPAM do it.)
Unsurprisingly, OpenPAM does not support this syntax.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.?Policies
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To configure PAM correctly, it is essential to understand how policies
are interpreted.

When an application calls
`pam\_start(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_start&sektion=3>`__,
the PAM library loads the policy for the specified service and
constructs four module chains (one for each facility.) If one or more of
these chains are empty, the corresponding chains from the policy for the
``other`` service are substituted.

When the application later calls one of the six PAM primitives, the PAM
library retrieves the chain for the corresponding facility and calls the
appropriate service function in each module listed in the chain, in the
order in which they were listed in the configuration. After each call to
a service function, the module type and the error code returned by the
service function are used to determine what happens next. With a few
exceptions, which we discuss below, the following table applies:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?1.?PAM chain execution summary

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------+---------------------+------------------+-----------------------+
| ?            | ``PAM_SUCCESS``     | ``PAM_IGNORE``   | ``other``             |
+==============+=====================+==================+=======================+
| binding      | if (!fail) break;   | -                | fail = true;          |
+--------------+---------------------+------------------+-----------------------+
| required     | -                   | -                | fail = true;          |
+--------------+---------------------+------------------+-----------------------+
| requisite    | -                   | -                | fail = true; break;   |
+--------------+---------------------+------------------+-----------------------+
| sufficient   | if (!fail) break;   | -                | -                     |
+--------------+---------------------+------------------+-----------------------+
| optional     | -                   | -                | -                     |
+--------------+---------------------+------------------+-----------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

If ``fail`` is true at the end of a chain, or when a “break” is reached,
the dispatcher returns the error code returned by the first module that
failed. Otherwise, it returns ``PAM_SUCCESS``.

The first exception of note is that the error code
``PAM_NEW_AUTHTOK_REQD`` is treated like a success, except that if no
module failed, and at least one module returned
``PAM_NEW_AUTHTOK_REQD``, the dispatcher will return
``PAM_NEW_AUTHTOK_REQD``.

The second exception is that
`pam\_setcred(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_setcred&sektion=3>`__
treats ``binding`` and ``sufficient`` modules as if they were
``required``.

The third and final exception is that
`pam\_chauthtok(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_chauthtok&sektion=3>`__
runs the entire chain twice (once for preliminary checks and once to
actually set the password), and in the preliminary phase it treats
``binding`` and ``sufficient`` modules as if they were ``required``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+------------------------------------------+
| `Prev <pam-essentials.html>`__?   | ?                       | ?\ `Next <pam-freebsd-modules.html>`__   |
+-----------------------------------+-------------------------+------------------------------------------+
| 3.?PAM Essentials?                | `Home <index.html>`__   | ?5.?FreeBSD PAM Modules                  |
+-----------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

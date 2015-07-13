=======================================
16.8.?Troubleshooting the MAC Framework
=======================================

.. raw:: html

   <div class="navheader">

16.8.?Troubleshooting the MAC Framework
`Prev <mac-implementing.html>`__?
Chapter?16.?Mandatory Access Control
?\ `Next <audit.html>`__

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

16.8.?Troubleshooting the MAC Framework
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section discusses common configuration errors and how to resolve
them.

.. raw:: html

   <div class="variablelist">

The ``multilabel`` flag does not stay enabled on the root (``/``)
partition:
    The following steps may resolve this transient error:

    .. raw:: html

       <div class="procedure">

    #. Edit ``/etc/fstab`` and set the root partition to ``ro`` for
       read-only.

    #. Reboot into single user mode.

    #. Run ``tunefs`` ``-l           enable`` on ``/``.

    #. Reboot the system.

    #. Run ``mount`` ``-urw`` ``/`` and change the ``ro`` back to ``rw``
       in ``/etc/fstab`` and reboot the system again.

    #. Double-check the output from ``mount`` to ensure that
       ``multilabel`` has been properly set on the root file system.

    .. raw:: html

       </div>

After establishing a secure environment with MAC, Xorg no longer starts:
    This could be caused by the MAC ``partition`` policy or by a
    mislabeling in one of the MAC labeling policies. To debug, try the
    following:

    .. raw:: html

       <div class="procedure">

    #. Check the error message. If the user is in the ``insecure``
       class, the ``partition`` policy may be the culprit. Try setting
       the user's class back to the ``default`` class and rebuild the
       database with ``cap_mkdb``. If this does not alleviate the
       problem, go to step two.

    #. Double-check that the label policies are set correctly for the
       user, Xorg, and the ``/dev`` entries.

    #. If neither of these resolve the problem, send the error message
       and a description of the environment to the `FreeBSD general
       questions mailing
       list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.

    .. raw:: html

       </div>

The \_secure\_path: unable to stat .login\_conf error appears:
    This error can appear when a user attempts to switch from the
    ``root`` user to another user in the system. This message usually
    occurs when the user has a higher label setting than that of the
    user they are attempting to become. For instance, if ``joe`` has a
    default label of ``biba/low`` and ``root`` has a label of
    ``biba/high``, ``root`` cannot view ``joe``'s home directory. This
    will happen whether or not ``root`` has used ``su`` to become
    ``joe`` as the Biba integrity model will not permit ``root`` to view
    objects set at a lower integrity level.

The system no longer recognizes ``root``:
    When this occurs, ``whoami`` returns ``0`` and ``su`` returns who
    are you?.

    This can happen if a labeling policy has been disabled by
    `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
    or the policy module was unloaded. If the policy is disabled, the
    login capabilities database needs to be reconfigured. Double check
    ``/etc/login.conf`` to ensure that all ``label`` options have been
    removed and rebuild the database with ``cap_mkdb``.

    This may also happen if a policy restricts access to
    ``master.passwd``. This is usually caused by an administrator
    altering the file under a label which conflicts with the general
    policy being used by the system. In these cases, the user
    information would be read by the system and access would be blocked
    as the file has inherited the new label. Disable the policy using
    `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
    and everything should return to normal.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+----------------------------------------+
| `Prev <mac-implementing.html>`__?   | `Up <mac.html>`__       | ?\ `Next <audit.html>`__               |
+-------------------------------------+-------------------------+----------------------------------------+
| 16.7.?Nagios in a MAC Jail?         | `Home <index.html>`__   | ?Chapter?17.?Security Event Auditing   |
+-------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

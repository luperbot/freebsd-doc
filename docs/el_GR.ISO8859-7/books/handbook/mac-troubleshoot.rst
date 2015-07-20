========================================
17.16. Troubleshooting the MAC Framework
========================================

.. raw:: html

   <div class="navheader">

17.16. Troubleshooting the MAC Framework
`????? <mac-userlocked.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <audit.html>`__

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

17.16. Troubleshooting the MAC Framework
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

During the development stage, a few users reported problems with normal
configuration. Some of these problems are listed below:

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.16.1. The ``multilabel`` option cannot be enabled on ``/``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``multilabel`` flag does not stay enabled on my root (``/``)
partition!

It seems that one out of every fifty users has this problem, indeed, we
had this problem during our initial configuration. Further observation
of this so called ?bug? has lead me to believe that it is a result of
either incorrect documentation or misinterpretation of the
documentation. Regardless of why it happened, the following steps may be
taken to resolve it:

.. raw:: html

   <div class="procedure">

#. Edit ``/etc/fstab`` and set the root partition at ``ro`` for
   read-only.

#. Reboot into single user mode.

#. Run ``tunefs`` ``-l enable`` on ``/``.

#. Reboot the system into normal mode.

#. Run ``mount`` ``-urw`` ``/`` and change the ``ro`` back to ``rw`` in
   ``/etc/fstab`` and reboot the system again.

#. Double-check the output from the ``mount`` to ensure that
   ``multilabel`` has been properly set on the root file system.

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

17.16.2. Cannot start a X11 server after MAC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After establishing a secure environment with MAC, I am no longer able to
start X!

This could be caused by the MAC ``partition`` policy or by a mislabeling
in one of the MAC labeling policies. To debug, try the following:

.. raw:: html

   <div class="procedure">

#. Check the error message; if the user is in the ``insecure`` class,
   the ``partition`` policy may be the culprit. Try setting the user's
   class back to the ``default`` class and rebuild the database with the
   ``cap_mkdb`` command. If this does not alleviate the problem, go to
   step two.

#. Double-check the label policies. Ensure that the policies are set
   correctly for the user in question, the X11 application, and the
   ``/dev`` entries.

#. If neither of these resolve the problem, send the error message and a
   description of your environment to the TrustedBSD discussion lists
   located at the `TrustedBSD <http://www.TrustedBSD.org>`__ website or
   to the `??????????? ????? ??????? ????????? ???
   FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
   mailing list.

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

17.16.3. Error: `\_secure\_path(3) <http://www.FreeBSD.org/cgi/man.cgi?query=_secure_path&sektion=3>`__ cannot stat ``.login_conf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When I attempt to switch from the ``root`` to another user in the
system, the error message \_secure\_path: unable to state .login\_conf.

This message is usually shown when the user has a higher label setting
then that of the user whom they are attempting to become. For instance a
user on the system, ``joe``, has a default label of ``biba/low``. The
``root`` user, who has a label of ``biba/high``, cannot view ``joe``'s
home directory. This will happen regardless if ``root`` has used the
``su`` command to become ``joe``, or not. In this scenario, the Biba
integrity model will not permit ``root`` to view objects set at a lower
integrity level.

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

17.16.4. The ``root`` username is broken!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In normal or even single user mode, the ``root`` is not recognized. The
``whoami`` command returns 0 (zero) and ``su`` returns who are you?.
What could be going on?

This can happen if a labeling policy has been disabled, either by a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
or the policy module was unloaded. If the policy is being disabled or
has been temporarily disabled, then the login capabilities database
needs to be reconfigured with the ``label`` option being removed. Double
check the ``login.conf`` file to ensure that all ``label`` options have
been removed and rebuild the database with the ``cap_mkdb`` command.

This may also happen if a policy restricts access to the
``master.passwd`` file or database. Usually caused by an administrator
altering the file under a label which conflicts with the general policy
being used by the system. In these cases, the user information would be
read by the system and access would be blocked as the file has inherited
the new label. Disable the policy via a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
and everything should return to normal.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+---------------------------------------------+
| `????? <mac-userlocked.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <audit.html>`__                 |
+------------------------------------+-------------------------+---------------------------------------------+
| 17.15. User Lock Down?             | `???? <index.html>`__   | ????????? 18. ??????? ????????? ?????????   |
+------------------------------------+-------------------------+---------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

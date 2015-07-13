===============
16.2.?Key Terms
===============

.. raw:: html

   <div class="navheader">

16.2.?Key Terms
`Prev <mac.html>`__?
Chapter?16.?Mandatory Access Control
?\ `Next <mac-understandlabel.html>`__

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

16.2.?Key Terms
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following key terms are used when referring to the MAC framework:

.. raw:: html

   <div class="itemizedlist">

-  *compartment*: a set of programs and data to be partitioned or
   separated, where users are given explicit access to specific
   component of a system. A compartment represents a grouping, such as a
   work group, department, project, or topic. Compartments make it
   possible to implement a need-to-know-basis security policy.

-  *integrity*: the level of trust which can be placed on data. As the
   integrity of the data is elevated, so does the ability to trust that
   data.

-  *level*: the increased or decreased setting of a security attribute.
   As the level increases, its security is considered to elevate as
   well.

-  *label*: a security attribute which can be applied to files,
   directories, or other items in the system. It could be considered a
   confidentiality stamp. When a label is placed on a file, it describes
   the security properties of that file and will only permit access by
   files, users, and resources with a similar security setting. The
   meaning and interpretation of label values depends on the policy
   configuration. Some policies treat a label as representing the
   integrity or secrecy of an object while other policies might use
   labels to hold rules for access.

-  *multilabel*: this property is a file system option which can be set
   in single-user mode using
   `tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__,
   during boot using
   `fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__,
   or during the creation of a new file system. This option permits an
   administrator to apply different MAC labels on different objects.
   This option only applies to security policy modules which support
   labeling.

-  *single label*: a policy where the entire file system uses one label
   to enforce access control over the flow of data. Whenever
   ``multilabel`` is not set, all files will conform to the same label
   setting.

-  *object*: an entity through which information flows under the
   direction of a *subject*. This includes directories, files, fields,
   screens, keyboards, memory, magnetic storage, printers or any other
   data storage or moving device. An object is a data container or a
   system resource. Access to an object effectively means access to its
   data.

-  *subject*: any active entity that causes information to flow between
   *objects* such as a user, user process, or system process. On
   FreeBSD, this is almost always a thread acting in a process on behalf
   of a user.

-  *policy*: a collection of rules which defines how objectives are to
   be achieved. A policy usually documents how certain items are to be
   handled. This chapter considers a policy to be a collection of rules
   which controls the flow of data and information and defines who has
   access to that data and information.

-  *high-watermark*: this type of policy permits the raising of security
   levels for the purpose of accessing higher level information. In most
   cases, the original level is restored after the process is complete.
   Currently, the FreeBSD MAC framework does not include this type of
   policy.

-  *low-watermark*: this type of policy permits lowering security levels
   for the purpose of accessing information which is less secure. In
   most cases, the original security level of the user is restored after
   the process is complete. The only security policy module in FreeBSD
   to use this is
   `mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__.

-  *sensitivity*: usually used when discussing Multilevel Security
   (MLS). A sensitivity level describes how important or secret the data
   should be. As the sensitivity level increases, so does the importance
   of the secrecy, or confidentiality, of the data.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+------------------------------------------+
| `Prev <mac.html>`__?                    | `Up <mac.html>`__       | ?\ `Next <mac-understandlabel.html>`__   |
+-----------------------------------------+-------------------------+------------------------------------------+
| Chapter?16.?Mandatory Access Control?   | `Home <index.html>`__   | ?16.3.?Understanding MAC Labels          |
+-----------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

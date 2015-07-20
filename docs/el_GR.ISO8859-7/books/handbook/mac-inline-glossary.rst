===============================
17.2. Key Terms in this Chapter
===============================

.. raw:: html

   <div class="navheader">

17.2. Key Terms in this Chapter
`????? <mac.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-initial.html>`__

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

17.2. Key Terms in this Chapter
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before reading this chapter, a few key terms must be explained. This
will hopefully clear up any confusion that may occur and avoid the
abrupt introduction of new terms and information.

.. raw:: html

   <div class="itemizedlist">

-  *compartment*: A compartment is a set of programs and data to be
   partitioned or separated, where users are given explicit access to
   specific components of a system. Also, a compartment represents a
   grouping, such as a work group, department, project, or topic. Using
   compartments, it is possible to implement a need-to-know security
   policy.

-  *high water mark*: A high water mark policy is one which permits the
   raising of security levels for the purpose of accessing higher level
   information. In most cases, the original level is restored after the
   process is complete. Currently, the FreeBSD MAC framework does not
   have a policy for this, but the definition is included for
   completeness.

-  *integrity*: Integrity, as a key concept, is the level of trust which
   can be placed on data. As the integrity of the data is elevated, so
   does the ability to trust that data.

-  *label*: A label is a security attribute which can be applied to
   files, directories, or other items in the system. It could be
   considered a confidentiality stamp; when a label is placed on a file
   it describes the security properties for that specific file and will
   only permit access by files, users, resources, etc. with a similar
   security setting. The meaning and interpretation of label values
   depends on the policy configuration: while some policies might treat
   a label as representing the integrity or secrecy of an object, other
   policies might use labels to hold rules for access.

-  *level*: The increased or decreased setting of a security attribute.
   As the level increases, its security is considered to elevate as
   well.

-  *low water mark*: A low water mark policy is one which permits
   lowering of the security levels for the purpose of accessing
   information which is less secure. In most cases, the original
   security level of the user is restored after the process is complete.
   The only security policy module in FreeBSD to use this is
   `mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__.

-  *multilabel*: The ``multilabel`` property is a file system option
   which can be set in single user mode using the
   `tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
   utility, during the boot operation using the
   `fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
   file, or during the creation of a new file system. This option will
   permit an administrator to apply different MAC labels on different
   objects. This option only applies to security policy modules which
   support labeling.

-  *object*: An object or system object is an entity through which
   information flows under the direction of a *subject*. This includes
   directories, files, fields, screens, keyboards, memory, magnetic
   storage, printers or any other data storage/moving device. Basically,
   an object is a data container or a system resource; access to an
   *object* effectively means access to the data.

-  *policy*: A collection of rules which defines how objectives are to
   be achieved. A *policy* usually documents how certain items are to be
   handled. This chapter will consider the term *policy* in this context
   as a *security policy*; i.e. a collection of rules which will control
   the flow of data and information and define whom will have access to
   that data and information.

-  *sensitivity*: Usually used when discussing MLS. A sensitivity level
   is a term used to describe how important or secret the data should
   be. As the sensitivity level increases, so does the importance of the
   secrecy, or confidentiality of the data.

-  *single label*: A single label is when the entire file system uses
   one label to enforce access control over the flow of data. When a
   file system has this set, which is any time when the ``multilabel``
   option is not set, all files will conform to the same label setting.

-  *subject*: a subject is any active entity that causes information to
   flow between *objects*; e.g. a user, user processor, system process,
   etc. On FreeBSD, this is almost always a thread acting in a process
   on behalf of a user.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------+-------------------------------------+
| `????? <mac.html>`__?                          | `???? <mac.html>`__     | ?\ `??????? <mac-initial.html>`__   |
+------------------------------------------------+-------------------------+-------------------------------------+
| ???????? 17. ???????????? ??????? ??????????   | `???? <index.html>`__   | ?17.3. Explanation of MAC           |
+------------------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

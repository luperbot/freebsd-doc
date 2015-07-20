===============================
18.2. Key Terms in this Chapter
===============================

.. raw:: html

   <div class="navheader">

18.2. Key Terms in this Chapter
`????? <audit.html>`__?
???????? 18. ??????? ????????? ?????????
?\ `??????? <audit-install.html>`__

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

18.2. Key Terms in this Chapter
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before reading this chapter, a few key audit-related terms must be
explained:

.. raw:: html

   <div class="itemizedlist">

-  *event*: An auditable event is any event that can be logged using the
   audit subsystem. Examples of security-relevant events include the
   creation of a file, the building of a network connection, or a user
   logging in. Events are either ?attributable?, meaning that they can
   be traced to an authenticated user, or ?non-attributable? if they
   cannot be. Examples of non-attributable events are any events that
   occur before authentication in the login process, such as bad
   password attempts.

-  *class*: Event classes are named sets of related events, and are used
   in selection expressions. Commonly used classes of events include
   ?file creation? (fc), ?exec? (ex) and ?login\_logout? (lo).

-  *record*: A record is an audit log entry describing a security event.
   Records contain a record event type, information on the subject
   (user) performing the action, date and time information, information
   on any objects or arguments, and a success or failure condition.

-  *trail*: An audit trail, or log file, consists of a series of audit
   records describing security events. Typically, trails are in roughly
   chronological order with respect to the time events completed. Only
   authorized processes are allowed to commit records to the audit
   trail.

-  *selection expression*: A selection expression is a string containing
   a list of prefixes and audit event class names used to match events.

-  *preselection*: The process by which the system identifies which
   events are of interest to the administrator in order to avoid
   generating audit records describing events that are not of interest.
   The preselection configuration uses a series of selection expressions
   to identify which classes of events to audit for which users, as well
   as global settings that apply to both authenticated and
   unauthenticated processes.

-  *reduction*: The process by which records from existing audit trails
   are selected for preservation, printing, or analysis. Likewise, the
   process by which undesired audit records are removed from the audit
   trail. Using reduction, administrators can implement policies for the
   preservation of audit data. For example, detailed audit trails might
   be kept for one month, but after that, trails might be reduced in
   order to preserve only login information for archival purposes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------+---------------------------------------+
| `????? <audit.html>`__?                     | `???? <audit.html>`__   | ?\ `??????? <audit-install.html>`__   |
+---------------------------------------------+-------------------------+---------------------------------------+
| ???????? 18. ??????? ????????? ??????????   | `???? <index.html>`__   | ?18.3. Installing Audit Support       |
+---------------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

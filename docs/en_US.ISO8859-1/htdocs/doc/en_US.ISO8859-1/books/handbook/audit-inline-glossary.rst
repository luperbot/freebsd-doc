===============
17.2.?Key Terms
===============

.. raw:: html

   <div class="navheader">

17.2.?Key Terms
`Prev <audit.html>`__?
Chapter?17.?Security Event Auditing
?\ `Next <audit-config.html>`__

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

17.2.?Key Terms
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following terms are related to security event auditing:

.. raw:: html

   <div class="itemizedlist">

-  *event*: an auditable event is any event that can be logged using the
   audit subsystem. Examples of security-relevant events include the
   creation of a file, the building of a network connection, or a user
   logging in. Events are either “attributable”, meaning that they can
   be traced to an authenticated user, or “non-attributable”. Examples
   of non-attributable events are any events that occur before
   authentication in the login process, such as bad password attempts.

-  *class*: a named set of related events which are used in selection
   expressions. Commonly used classes of events include “file creation”
   (fc), “exec” (ex), and “login\_logout” (lo).

-  *record*: an audit log entry describing a security event. Records
   contain a record event type, information on the subject (user)
   performing the action, date and time information, information on any
   objects or arguments, and a success or failure condition.

-  *trail*: a log file consisting of a series of audit records
   describing security events. Trails are in roughly chronological order
   with respect to the time events completed. Only authorized processes
   are allowed to commit records to the audit trail.

-  *selection expression*: a string containing a list of prefixes and
   audit event class names used to match events.

-  *preselection*: the process by which the system identifies which
   events are of interest to the administrator. The preselection
   configuration uses a series of selection expressions to identify
   which classes of events to audit for which users, as well as global
   settings that apply to both authenticated and unauthenticated
   processes.

-  *reduction*: the process by which records from existing audit trails
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

+----------------------------------------+-------------------------+-----------------------------------+
| `Prev <audit.html>`__?                 | `Up <audit.html>`__     | ?\ `Next <audit-config.html>`__   |
+----------------------------------------+-------------------------+-----------------------------------+
| Chapter?17.?Security Event Auditing?   | `Home <index.html>`__   | ?17.3.?Audit Configuration        |
+----------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

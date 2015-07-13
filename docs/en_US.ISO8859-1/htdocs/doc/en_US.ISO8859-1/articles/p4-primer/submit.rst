=========
7.?Submit
=========

.. raw:: html

   <div class="navheader">

7.?Submit
`Prev <Integrations.html>`__?
?
?\ `Next <editing.html>`__

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

7.?Submit
---------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Changes that are made locally should be committed back to the Perforce
server for safe keeping and so that others can access them. This is done
via ``p4 submit``. When you run this command, it will open up a submit
template in an editor. FreeBSD has a custom template, and the important
fields are described below:

.. code:: programlisting

    Description:
            <enter description here>
            PR:
            Submitted by:
            Reviewed by:
            Approved by:
            Obtained from:
            MFP4 after:

It is good practice to provide at least 2-3 sentences that describe what
the changes are that you are submitting. You should say what the change
does, why it was done that way or what problem is solves, and what APIs
it might change or other side effects it might have. This text should
replace the ``<enter description here>`` line in the template. You
should wrap your lines and start each line with a TAB. The tags below it
are FreeBSD-specific and can be removed if not needed.

.. code:: programlisting

    Files:

This is automatically populated with all of the files in your client
that were marked in the add, delete, integrate, or edit states on the
server. It is always a very good idea to review this list and remove
files that might not be ready yet.

Once you save the editor session, the submit will happen to the server.
This also means that the local copies of the submitted files will be
copied back to the server. If anything goes wrong during this process,
the submit will be aborted, and you will be notified that the submit has
been turned into a changelist that must be corrected and re-submitted.
Submits are atomic, so if one file fails, the entire submit is aborted.

Submits cannot be reverted, but they can be aborted while in the editor
by exiting the editor without changing the ``Description`` text.
Perforce will complain about this the first time you do it and will put
you back in the editor. Exiting the editor the second time will abort
the operation. Reverting a submitted change is very difficult and is
best handled on a case-by-case basis.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+------------------------------+
| `Prev <Integrations.html>`__?   | ?                       | ?\ `Next <editing.html>`__   |
+---------------------------------+-------------------------+------------------------------+
| 6.?Integrations?                | `Home <index.html>`__   | ?8.?Editing                  |
+---------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

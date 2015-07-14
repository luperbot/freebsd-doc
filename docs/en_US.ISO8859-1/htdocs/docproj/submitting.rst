=======================================================
FreeBSD Documentation Project: Submitting documentation
=======================================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Documentation <../docs.html>`__
-  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
-  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
-  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
-  `Books and Articles Online <../docs/books.html>`__
-  `Publications <../publish.html>`__
-  `Web Resources <../docs/webresources.html>`__
-  `For Newbies <../projects/newbies.html>`__
-  `Documentation Project <../docproj/>`__
-  `Archive <https://docs.freebsd.org/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Documentation Project: Submitting documentation
=======================================================

I have written some documentation. How do I submit it?
------------------------------------------------------

First, thank you for taking the time to do this.

You should make your documentation available for review. If you can,
upload it to a website somewhere.

Then post a message to the ``FreeBSD-doc`` mailing list, with a brief
outline of the documentation and the pointer to its location, and
solicit feedback.

If, for some reason, you cannot put the documentation on a website
somewhere you can send it directly to the ``FreeBSD-doc`` mailing list.
If you do this, please only send plain-text documents.

You may wish to cc: this request for comments to another appropriate
mailing list. For example, something that relates to how to use SVN to
keep your source tree up to date would be of interest to the subscribers
of the ``FreeBSD-stable`` mailing list. Please only cc: at most one
other mailing list.

After people have looked over your documentation, and you have had the
chance to incorporate any of their suggestions, you are ready to submit
it.

The correct way to do this is to open a Problem Report. Instructions for
doing this can be found at
https://www.FreeBSD.org/support/bugreports.html.

You do this so that your submission can be tracked. When you submit a PR
(Problem Report) it is assigned a unique number. One of the committers
can then assign the PR to themselves, and liaise with you on committing
the new documentation. For more information, see `Writing FreeBSD
Problem Reports <../doc/en_US.ISO8859-1/articles/problem-reports/>`__.

Make sure the "Product" is set to "Documentation" and that the
"Component" is set to either "Documentation" or "Website" as
appropriate. You should attach your files from earlier to the PR. Please
also provide links to the mailing list posts where your changes were
discussed, if appropriate.

I have made some changes to existing documentation, how do I submit them?
-------------------------------------------------------------------------

Again, thank you for taking the time to do this.

First off, you need to produce a special file called a *diff*. This diff
shows just the changes that you have made. This makes it easier for the
person doing the committing to see what you have changed, and means you
do not need to spend lots of time explaining what you have changed
(although you should still explain why you think the change should be
made).

To make a 'diff', you should;

#. Make a copy of the file you are going to change. If you are changing
   ``foo.xml``, do

   ::

           % cp foo.xml foo.xml.old
           

#. Then, make your changes to foo.xml

   ::

           % vi foo.xml
           ... tap tap tap ...

           ... test the changes, read them for typos and so on ...
           

#. Make the diff. The command to do this is

   ::

           % diff -u foo.xml.old foo.xml > foo.diff
           

   This looks at the difference between the two files, and writes them
   to the file ``foo.diff``.

You can then send ``foo.diff`` back to the project. Send a PR as
described earlier, and attach the ``foo.diff`` file to the PR.

`FreeBSD Documentation Project Home <docproj.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

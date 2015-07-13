================
6.5.?Maintenance
================

.. raw:: html

   <div class="navheader">

6.5.?Maintenance
`Prev <new-features.html>`__?
Chapter?6.?Processes
?\ `Next <model-pr.html>`__

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

6.5.?Maintenance
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is an advantage to the project to for each area of the source have at
least one person that knows this area well. Some parts of the code have
designated maintainers. Others have de-facto maintainers, and some parts
of the system do not have maintainers. The maintainer is usually a
person from the sub-project that wrote and integrated the code, or
someone who has ported it from the platform it was written for.
`:sup:`[10]` <#ftn.idp64354384>`__ The maintainer's job is to make sure
the code is in sync with the project the code comes from if it is
contributed code, and apply patches submitted by the community or write
fixes to issues that are discovered.

The main bulk of work that is put into the FreeBSD project is
maintenance. [`J?rgensen, 2001 <bibliography.html#jorgensen2001>`__] has
made a figure showing the life cycle of changes.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?6.6.?J?rgenssen's model for change integration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|J?rgenssen's model for change integration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Here “development release” refers to the -CURRENT branch while
“production release” refers to the -STABLE branch. The “pre-commit test”
is the functional testing by peer developers when asked to do so or
trying out the code to determine the status of the sub-project.
“Parallel debugging” is the functional testing that can trigger more
review, and debugging when the code is included in the -CURRENT branch.

As of this writing, there were 269 committers in the project. When they
commit a change to a branch, that constitutes a new release. It is very
common for users in the community to track a particular branch. The
immediate existence of a new release makes the changes widely available
right away and allows for rapid feedback from the community. This also
gives the community the response time they expect on issues that are of
importance to them. This makes the community more engaged, and thus
allows for more and better feedback that again spurs more maintenance
and ultimately should create a better product.

Before making changes to code in parts of the tree that has a history
unknown to the committer, the committer is required to read the commit
logs to see why certain features are implemented the way they are in
order not to make mistakes that have previously either been thought
through or resolved.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64354384" class="footnote">

`:sup:`[10]` <#idp64354384>`__ sendmail and named are examples of code
that has been merged from other platforms.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------+-------------------------------+
| `Prev <new-features.html>`__?       | `Up <model-processes.html>`__   | ?\ `Next <model-pr.html>`__   |
+-------------------------------------+---------------------------------+-------------------------------+
| 6.4.?Development of new features?   | `Home <index.html>`__           | ?6.6.?Problem reporting       |
+-------------------------------------+---------------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |J?rgenssen's model for change integration| image:: maintenance.png

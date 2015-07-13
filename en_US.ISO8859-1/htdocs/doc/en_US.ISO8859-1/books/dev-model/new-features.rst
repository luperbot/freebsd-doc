================================
6.4.?Development of new features
================================

.. raw:: html

   <div class="navheader">

6.4.?Development of new features
`Prev <process-core-election.html>`__?
Chapter?6.?Processes
?\ `Next <model-maintenance.html>`__

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

6.4.?Development of new features
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Within the project there are sub-projects that are working on new
features. These projects are generally done by one person [`J?rgensen,
2001 <bibliography.html#jorgensen2001>`__]. Every project is free to
organise development as it sees fit. However, when the project is merged
to the -CURRENT branch it must follow the project guidelines. When the
code has been well tested in the -CURRENT branch and deemed stable
enough and relevant to the -STABLE branch, it is merged to the -STABLE
branch.

The requirements of the project are given by developer wishes, requests
from the community in terms of direct requests by mail, Problem Reports,
commercial funding for the development of features, or contributions by
the scientific community. The wishes that come within the responsibility
of a developer are given to that developer who prioritises his time
between the request and his wishes. A common way to do this is maintain
a TODO-list maintained by the project. Items that do not come within
someone's responsibility are collected on TODO-lists unless someone
volunteers to take the responsibility. All requests, their distribution
and follow-up are handled by the `Bugzilla <tool-bugzilla.html>`__ tool.

Requirements analysis happens in two ways. The requests that come in are
discussed on mailing lists, both within the main project and in the
sub-project that the request belongs to or is spawned by the request.
Furthermore, individual developers on the sub-project will evaluate the
feasibility of the requests and determine the prioritisation between
them. Other than archives of the discussions that have taken place, no
outcome is created by this phase that is merged into the main project.

As the requests are prioritised by the individual developers on the
basis of doing what they find interesting, necessary or are funded to
do, there is no overall strategy or prioritisation of what requests to
regard as requirements and following up their correct implementation.
However, most developers have some shared vision of what issues are more
important, and they can ask for guidelines from the release engineering
team.

The verification phase of the project is two-fold. Before committing
code to the current-branch, developers request their code to be reviewed
by their peers. This review is for the most part done by functional
testing, but also code review is important. When the code is committed
to the branch, a broader functional testing will happen, that may
trigger further code review and debugging should the code not behave as
expected. This second verification form may be regarded as structural
verification. Although the sub-projects themselves may write formal
tests such as unit tests, these are usually not collected by the main
project and are usually removed before the code is committed to the
current branch. `:sup:`[9]` <#ftn.idp64343376>`__

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64343376" class="footnote">

`:sup:`[9]` <#idp64343376>`__ More and more tests are however performed
when building the system (“make world”). These tests are however a very
new addition and no systematic framework for these tests have yet been
created.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+----------------------------------------+
| `Prev <process-core-election.html>`__?   | `Up <model-processes.html>`__   | ?\ `Next <model-maintenance.html>`__   |
+------------------------------------------+---------------------------------+----------------------------------------+
| 6.3.?Core election?                      | `Home <index.html>`__           | ?6.5.?Maintenance                      |
+------------------------------------------+---------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

========================
4.9.?The Way Things Work
========================

.. raw:: html

   <div class="navheader">

4.9.?The Way Things Work
`Prev <defcon1.html>`__?
Chapter?4.?PMake for Gods
?\ `Next <answers.html>`__

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

4.9.?The Way Things Work
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When PMake reads the makefile, it parses sources and targets into nodes
in a graph. The graph is directed only in the sense that PMake knows
which way is up. Each node contains not only links to all its parents
and children (the nodes that depend on it and those on which it depends,
respectively), but also a count of the number of its children that have
already been processed.

The most important thing to know about how PMake uses this graph is that
the traversal is breadth-first and occurs in two passes.

After PMake has parsed the makefile, it begins with the nodes the user
has told it to make (either on the command line, or via a ``.MAIN``
target, or by the target being the first in the file not labeled with
the ``.NOTMAIN`` attribute) placed in a queue. It continues to take the
node off the front of the queue, mark it as something that needs to be
made, pass the node to ``Suff_FindDeps`` (mentioned earlier) to find any
implicit sources for the node, and place all the node's children that
have yet to be marked at the end of the queue. If any of the children is
a ``.USE`` rule, its attributes are applied to the parent, then its
commands are appended to the parent's list of commands and its children
are linked to its parent. The parent's unmade children counter is then
decremented (since the ``.USE`` node has been processed). You will note
that this allows a ``.USE`` node to have children that are ``.USE``
nodes and the rules will be applied in sequence. If the node has no
children, it is placed at the end of another queue to be examined in the
second pass. This process continues until the first queue is empty.

At this point, all the leaves of the graph are in the examination queue.
PMake removes the node at the head of the queue and sees if it is
out-of-date. If it is, it is passed to a function that will execute the
commands for the node asynchronously. When the commands have completed,
all the node's parents have their unmade children counter decremented
and, if the counter is then 0, they are placed on the examination queue.
Likewise, if the node is up-to-date. Only those parents that were marked
on the downward pass are processed in this way. Thus PMake traverses the
graph back up to the nodes the user instructed it to create. When the
examination queue is empty and no shells are running to create a target,
PMake is finished.

Once all targets have been processed, PMake executes the commands
attached to the ``.END`` target, either explicitly or through the use of
an ellipsis in a shell script. If there were no errors during the entire
process but there are still some targets unmade (PMake keeps a running
count of how many targets are left to be made), there is a cycle in the
graph. PMake does a depth-first traversal of the graph to find all the
targets that were not made and prints them out one by one.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------------------+-------------------------+------------------------------------+
| `Prev <defcon1.html>`__?                                             | `Up <gods.html>`__      | ?\ `Next <answers.html>`__         |
+----------------------------------------------------------------------+-------------------------+------------------------------------+
| 4.8.?DEFCON 1 – Imitation is the Not the Highest Form of Flattery?   | `Home <index.html>`__   | ?Chapter?5.?Answers to Exercises   |
+----------------------------------------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

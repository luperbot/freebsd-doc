========================================
Usenix 2002 FreeBSD Developer Summit III
========================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header And Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

.. raw:: html

   <div class="frontdonateroundbox">

.. raw:: html

   <div class="frontdonatetop">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatecontent">

`Donate to FreeBSD <https://www.FreeBSDFoundation.org/donate/>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatebot">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Peripheral Links
----------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

Search
------

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Site Navigation
---------------

.. raw:: html

   <div id="menu">

-  `Home <../../>`__

-  `About <../../about.html>`__

   -  `Introduction <../../projects/newbies.html>`__
   -  `Features <../../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Get FreeBSD <../../where.html>`__

   -  `Release Information <../../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Documentation <../../docs.html>`__

   -  `FAQ <../../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../../docs/books.html>`__

-  `Community <../../community.html>`__

   -  `Mailing Lists <../../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../../support.html>`__

   -  `Vendors <../../commercial/commercial.html>`__
   -  `Security Information <../../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `About <../../about.html>`__
-  `Features <../../features.html>`__
-  `Applications <../../applications.html>`__
-  `Advocacy <../../advocacy/>`__
-  `Marketing <../../marketing/>`__
-  `Administration <../../administration.html>`__
-  `News <../../news/newsflash.html>`__
-  `Events <../../events/events.html>`__
-  `Press <../../news/press.html>`__
-  `Multimedia <../../multimedia/multimedia.html>`__
-  `Artwork <../../art.html>`__
-  `Logo <../../logo.html>`__
-  `Donations <../../donations/>`__
-  `Legal Notices <../../copyright/>`__
-  `Privacy Policy <../../privacy.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Usenix 2002 FreeBSD Developer Summit III
========================================

The third FreeBSD Developer Summit was held on June 11-12, 2002, at the
Monterey Marriott in Monterey, CA, immediately prior to the USENIX
Annual Technical Conference at the same location. The FreeBSD Developer
Summit was sponsored by DARPA, the `FreeBSD
Foundation <http://www.freebsdfoundation.org>`__, `FreeBSD
Mall <http://www.freebsdmall.com/>`__, Network Associates Laboratories,
and AT&T. Notes were taken by George Neville-Neil, `Bruce
Mah <http://people.FreeBSD.org/~bmah>`__, and `Robert
Watson <http://www.FreeBSD.org/~rwatson>`__. Markup by `Murray
Stokely <http://www.FreeBSD.org/~murray>`__.

These notes cover day 2, which began at 9:30am, and ended at 5:00pm.

Agenda
------

-  Opening Comments
-  `KSE <#kse>`__
-  Break
-  `SMPng <#smp>`__
-  PGP key signing
-  `New Hardware Architectures <#hw>`__
-  Lunch
-  `TrustedBSD <#trust>`__
-  `Release Engineering <#releng>`__
-  Break
-  `RCng <#rc>`__
-  `Open Discussion <#open>`__

NOTE: As usual I missed some names, please add those I missed.

Attending:
----------

Committers in person:

-  Robert Watson (rwatson)
-  Julian Elischer (julian)
-  John Baldwin (jhb)
-  Matt Dillon (dillon)
-  David O'Brien (obrien)
-  Jeffrey Hsu (hsu)
-  Jennifer Yang (jennifer)
-  Bosko Milekic (bmilekic)
-  Alfred Perlstein (alfred)
-  Doug Rabson (dfr)
-  Paul Saab (ps)
-  Brooks Davis (brooks)
-  Murray Stokely (murray)
-  Jonathan Mini (mini)
-  Takanori Watanabe (takawata)
-  Gordon Tetlow (gordon)
-  Gregory Shapiro (gshapiro)
-  Sam Leffler (sam)
-  Bruce Mah (bmah)
-  David Malone (dwmalone)
-  Ian Dowse (iedowse)

Also in person:

-  George Neville-Neil (gnn)

On The Phone:

-  Alan Cox (alc)
-  Warner Losh (warner)

Via webcast:

Many people listened into the webcast and discussed the topics on IRC.

The meeting followed a format where each section was led by an
individual and then a discussion ensued. Not all of the discussion was
caught but we have tried to make those sections understandable.

.. raw:: html

   <div class="topic">

--------------

09:30 Opening Remarks
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

KSE - Julian Elischer
---------------------

KSE has not changed much since the last summit (Feb). The major change
is that upcalls works more like signals instead of like fork(). That is
to say that you give the system a function pointer to call instead of
having the "return twice" semantics so that it supports all
architectures.

The names in the system are deliberately different from other threading
packages. This was to reduce confusion during development.

The process structure has been broken into 4 parts. This is in -CURRENT
at the moment. It's still "really" one structure but is being accessed
as 4 different ones.

Looking for more people to run the code.

Right now we're rewriting to clean up how the functions work.

Other architectures can be stubbed out as well.

Right now there is no support for Sparc or IA64 but he would like to
commit now. Not committing now means that it has to come out of perforce
and people have to patch it.

Discussion
~~~~~~~~~~

.. raw:: html

   <div class="discussion">

**rwatson** : What about userland?

**julian** : It can run different threads in userland. The primitives
are all there it just needs a bit more help. I would like to put an idea
out. Is it a good idea to be able to have non-threaded programs linking
with threaded libraries?

**rwatson** : Putting async I/O into such a thing would make sense.

**julian** : The library would not care who was accessing it.

**rwatson** : For instance libc could be threaded or not.

**julian** : That would be interesting. I don't know if the two
interfaces are incompatible.

**jhb** : X does this.

**dillon** : It is very doable but you have to make it non-preemptive.
If you're switching non-preemptively you can use library routines which
are non threaded.

**julian** : If I do what I'm thinking of doing then each lib will have
its own KSE group.

**dillon** : stdio does not have to be thread aware if you don't
schedule preemptively. It all matters where it blocks.

**julian** : Since you're a non-threaded program you don't know that.

**rwatson** : If you're going to support that, libc has to support
threads.

**rwatson** : It sounds like some complexity goes away. Can we use 1
libc with has threading?

**julian** : Do we want to go down this path?

**rwatson** : Now or later?

**julian** : What do I design now to do this?

**jhb** : For example libc\_r does not work with rfork.

**julian** : The answer is that yes we should move forward. Tricky
issues, signals...

**warner** : Have people talked about pthread programs and cancellation
points?

**julian** : The pthreads library does not assume that you're only going
to change threads at yield() points. We are going to have cancellation
points. There is an unimplemented call which will be able to send a
thread targeted signal even into the kernel.

**julian** : When a thread is scheduled onto a KSE there is a mailbox
that the userland thread scheduler updates.

**julian** : Is there anyone else who has some time or test it? How many
people should test this before I check it in? There is a patch that's
continuously updated on my web site to be able to patch it to -CURRENT.
There is a CVSUP target from cvsup 10 which will bring down the sources.
If you go to my web page on freefal there is a pointer there to a web
page that explains how to CVSUP from source.

**rwatson** : What about SMP locking for this?

**julian** : Handled by the proc locking. Has not been tried on SMP
machines yet.

**obrien** : What about on Sparc?

**julian** : You may need to stub things out.

**jhb** : Is the paper on the web site?

**julian** : The updated copy has disappeared.

**unknown** : What's the different between NetBSD and FreeBSD on this?

**julian** : Logically not a tremendous difference but Net follows the
paper closely and Free takes the idea and makes it into a production
system. There were some tough battles on -arch about this. The tricky
point is that the proc structure has to be broken into 4 instead of 2.
If you want to be able to do POSIX you need to be able to treated as
different processes but in other systems you need to group the threads.
You wind up with two classes of threads. You need another structure to
do the aggregation. In the end we ended up breaking up the proc
structure into 4 pieces to not overwhelm the CPU when scheduling
threads. This is the major difference.

**julian** : I greatly admire the NetBSD way which is to take an idea
and not dilute it.

**julian** : Net is also putting a Solaris compatible threads package on
top of their scheduler activations in the Solaris ABI.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

SMPng - John Baldwin
--------------------

.. raw:: html

   <div class="discussion">

**jhb** : Yesterday we talked about SMP related things so I'll give a
summary and then give a list of things for 5.0.

**jhb** : The big thing for 5.0 is to get the network stack out from
under Giant.

**jhb** : Jeffrey Hsu and Jennifer Yang were here to talk about this.
They have the PCBs checked in now.

**jennifer** : Interface Queues and SynCache might be done.

.. raw:: html

   </div>

The remaining chunks of the network code are:

-  Routing Table Locking
-  Socket Buffers
-  ifa structures
-  struct ifnet
-  locking ipfw and dummynet
-  other (non IPv4) protocols
-  Netgraph

.. raw:: html

   <div class="discussion">

**jhb** : Aside from network the newbus locking needs to be done (Warner
Losh) and also CAM stuff. No known status on CAM. Perhaps CAM is not
needed for 5.0

**jhb** : Disk drive interrupts? Would help performance. Going to talk
to Poul Henning-Kamp

**jhb** : Alan Cox is working on the VM system. Working based on the old
Mach stuff. Objective for 5.0 is to get zero fill and execute on write
to work without Giant. In future he wants to look at locking down pmap()
functions.

**jhb** : Still some stability issues. UMA breaks some assumptions. For
instance sockets assume that once memory is a socket its a socket
forever, this is no longer true.

**jhb** : Talked to Mike Smith about 5.0 and have decided to stop adding
features so that we can start clean up 5.0 and make it a real release.
This might require hacks.

**rwatson** : For example in the UMA case there could be a flag to just
say "don't reclaim this zone" -- this would help with issues such as the
socket code assuming memory is type stable.

Over to Alan Cox on the VM system.

**alc** : Nothing to say.

**bmilekic** : As much as I might get hated for this. Will preemption
stuff go in by 5.0?

**jhb** :No, that's a 6.0 thing. There are things to do first.

**unknown** : Could this come in in the life time of 5.? 5.1?

**rwatson** : This is a release issue really.

**jhb** : Yes, the kernel is pre-emptive.

**rwatson** : Perhaps we should talk about is performance goals? What
are the comparisons to make? Perhaps head of 4 with head of 5. We'll see
a mix.

**jhb** : I need to run benchmarks.

**rwatson** : In terms of SMP features when will VM be ready to be
measured? I can't put a date on it.

**alc** : I think I told John was in time for release. I'm already doing
performance testing so we've already started.

**rwatson** : We'll pick a date to start doing measurements. Perhaps 2
or 3 weeks from now.

**alc** : My guess is the the locking pmap is going to take some time to
shake out. On the other hand the next major module we should be working
on is machine dependent level. Last we should try approaching the
vmobject level. I'll start worrying about performance in the near term.

**rwatson** : Will threading improve latency or throughput for
networking?

**bmilekic** : I would like if we could actually start before.

**rwatson** : Do you have a timeline for the interrupt threading stuff?

**bmilekic** : I finished some things last night but there are still
issues. In a couple of weeks it should be ready for first commit.

**rwatson** : Informally beginning to measure performance now. What are
the right sets of tests? Need to discuss on -arch.

**alc** : It would be nice to have that committed to the tools
directory.

**jhb** : The statistics analysis package are we using.

**bmilekic** : I have some good success with netpipe for overall
measurement.

**rwatson** : Need to be using consistent compilers because of the
compiler change. Also all our debugging stuff will slow down the
benchmarking.

.. raw:: html

   </div>

Benchmark Ideas

-  chroot of 4.6 area for testing
-  buildworld
-  build X11R4 w/gcc 2.95
-  netpipe on loopback
-  end to end testing on on gigE cards (throughput,connections/sec)
-  thread stuff like mySQL
-  Kirk's FS benchmarks
-  NFS Tests (nfsstone)
-  Sleepycat DB tests?

Tests to be run on:

-  4.6-RELEASE
-  5.0-DP1
-  5.0-DP2
-  5-CURRENT
-  4-STABLE

Targets:

-  alpha, i386
-  UP, 2/4-way SMP, SMP with one processor
-  low/high memory
-  slow/fast CPU

.. raw:: html

   <div class="discussion">

**dillon** : Debug stuff on 5.0. I think it might be reasonable then to
take the space hit and always have the debugging in but turn it on and
off with sysctl.

**rwatson** : We should commit an optimized kernel configuration and
benchmarking guidelines to the tree as well.

.. raw:: html

   </div>

.. raw:: html

   <div>

--------------

BREAK

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="discussion">

**rwatson** : I think we should continue the performance discussion. We
want to accomplish a couple of things. One is stability measurement.
What are the things we need to be measuring? What is our definition of
useful?

**hsu** : End to end measurement with gigabit cards. For latency test
connections per second. Can use ttcp or netbench in ports.

**gnn** : need to make sure we run against all of 4.6

**julian** : Need to really have 3 tests. 4.6 (forever) 4.x (following
updates) and -CURRENT.

**rwatson** : There are other dimensions. Degree of parallelism for
instance. We might see degradation in uni but get good stuff in multi
case.

**julian** : Test for impact of KSE complications as well.

**alfred** : I think as the results come through people should not be
too worried about it. Perhaps we should benchmark database type stuff as
well. Need to do something comprehensive.

**obrien** : What does the test matrix look like? Different
architectures and different numbers of processors.

**rwatson** : Can we make a multi-processor run uni-processor.

**alfred** : Run queue and scheduler stuff?

**julian** : Will talk to Alfred.

**rwatson** : Is scalability testing important?

**obrienM** : NFS testing.

**rwatson** : What about UI testing?

**hsu** : x11perf is the way to do that.

**dillon** : Currently we have a directory for regression tests, should
we do one for performance tests?

**gnn** : talk to sleepycat for DB tests, see if they have some

**alfred** : Really nice to tests DB applications that are heavily
thread dependent.

**hsu** :Apache 2 has threads.

**rwatson** : What about commercial folks? What do you do.

**ps** : Normally what we end up doing is using the snapshot on some
machines and see if the bugs are out. There is no performance testing
really.

**rwatson** : Again, what about performance?

**ps** : We've really never had one. It's more just bugs. We've just
never found the performance to be a problem.

**rwatson** : We need to create a forum for talking about performance.
We need reproducible test cases.

**ps** : There's also other things. We've been doing lots of looking at
this. FreeBSD gets kicked down by attacks for instance. We have a lot of
tools to get to the project though.

**rwatson** : I will set up the mailing list.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

New Hardware Architectures
--------------------------

Alpha
~~~~~

.. raw:: html

   <div class="discussion">

**jhb** : Questions about alpha?

**rwatson** : KSE on alpha?

**julian** : We have patches so it compiles and runs non-KSE programs.
You can have the patched version of the alpha kernel up and running
though.

**rwatson** : Is the task owned of making this work on Alpha?

.. raw:: html

   </div>

IA64
~~~~

.. raw:: html

   <div class="discussion">

**dfr** : It works as far as I get to use it. It's not used in
production right now.

**ps** : Intel shipped me a quad processor IA64 board. (McKinley is the
name of the board).

**rwatson** : What does it need for 5.0?

**dfr** : It works, it works for SMP. Self hosts, build worlds.
sysinstall compiles but needs more kicking to work.

**ps** : Intel wants us to ship a CD.

**dfr** : There is no thread support right now (threading library needs
to move to get/setcontext rather than longjmp).

**dfr** : Need to move every driver to use BUS DMA for large memory
machines to get bounce buffers.

**jhb** : PHK is working on using a new libwhisk so that sysinstall et
al work on all systems.

.. raw:: html

   </div>

Sparc64
~~~~~~~

.. raw:: html

   <div class="discussion">

**jake** : Take control of KSE stuff on Sparc 64.

**rwatson** : Do we have a Sparc 64 in the cluster?

**jake** : It's not in the cluster yet. It's a serial cluster issue.

**rwatson** : Package building on S64?

**jake** : Perhaps a bunch of Ultra 60s for a package build.

**obrien** : 1500 build right now?

**jake** : Yes, but a lot of the same bug in packages are broken.

**jhb** : Timeline for X?

**jake** : Not really.

**rwatson** : In terms of 5.0 how comfortable are you?

**jake** : sysinstall is the only problem.

.. raw:: html

   </div>

PowerPC
~~~~~~~

.. raw:: html

   <div class="discussion">

**benno** : I got it up to execing a fake init in the simulator and
printing "hello world". Trying to work with real hardware. I now have
some semblance of busdma and am working on other stuff. GEM on iMac is
in an embryonic state. Should get to NFS mount in a few weeks.

**rwatson** : How do you feel about your timeline?

**benno** : I'm not sure we'll have something fully workable for 5.0.

**rwatson** : You're not at the point yet on working on KSE are you?

**benno** : No, need a useful system first.

.. raw:: html

   </div>

AMD64
~~~~~

.. raw:: html

   <div class="discussion">

**rwatson** : I know that we're having simulator problems.

**obrien** : The issues are about legal and NDA. AMD decided on `FreeBSD
Mall <http://www.freebsdmall.com>`__ as the NDA person. I have not had a
working simulator since September.

**ps** : I can make that happen, as well as real hardware.

**obrien** :I've got a cross tool chain in the tree. I have some
untested pmap stuff. Hardware has been available for a month or so. We
could boot FreeBSD 4.6 today if only we had hardware.

**rwatson** : What do you think about 5.0? Should we discuss that at
another date?

.. raw:: html

   </div>

MIPs
~~~~

.. raw:: html

   <div class="discussion">

**unknown** :Juniper offered.

**obrien** : But we have no hardware.

**unknown** :Juniper thinks it's OK but doesn't want to have it rot in
the tree.

**brooks** : I have a line on a company that does compact PCI with R6Ks.

**rwatson** : We're waiting for someone to turn up.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

LUNCH

--------------

.. raw:: html

   <div class="topic">

--------------

Trusted BSD
-----------

**rwatson** : Malc framework is what is of interest today.

*See Slides from Robert*

.. raw:: html

   <div class="discussion">

**julian** : Are the labels the same on all structures?

**rwatson** : You can modify this but there are issues with memory: is
the space needed for a label too large to add to an mbuf header, for
example? The label is small, but there area lot of them?

**bmilekic** : When you're freeing the mbuf do you write the label data?

**rwatson** : We blank it when we free it.

**bmilekic** : I do not think the 36 bytes in the mbuf header is a
problem.

**julian** : I'm more interested in the "why" than the how.

**rwatson** : A lot of people are interested in this. Some of the things
that do interest a lot of people are things like doing on the fly
security for a web server.

**julian** : Is there a black hatted TLA interested?

**rwatson** : Yes and several gov'ts. As well as plenty of financial
folks.

**rwatson** : There's a lot of userland stuff that's not done yet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Release Engineering
-------------------

**murray** : Shows a slide of releases. 4.6 is ready to go but having
issues with ISO images. DP1, a lot of goals were met. 1000 packages were
building on -CURRENT to get DP1 out. Polished 4.2. We need to start
making decisions on 5.0. November is still the date we're shooting for.
We're going to do a 4.7 and a 4.8. DP3?

\*\*\*GET SLIDE FROM MURRAY\*\*\*

.. raw:: html

   <div class="discussion">

**murray** : Release engineering area of the web site
www.FreeBSD.org/releng. For DP2 question about p4 or CVS? Will probably
use p4 for DP2 as well. USB subsystem? Perl removal? KSE?

**julian** : KSE should be able to run simple tests.

**obrien** : Is whatever you have committed by DP2 be the same as the
release.

**julian** : It will be a subset.

**murray** : What will the status be of KSE in userland for 5.0?

**julian** : Can't answer that right now. We're not removing the old
libraries. The userland work will happen between DP2 and release. The
next step is MP as well as UP.

**obrien** : Are we heading for a release?

**murray** : yes.

**obrien** : Then we have to stop having major commits.

**murray** : Yes, the discussion today is what are the major must have
features.

**rwatson** : We need to decide if there are major upcoming problems and
reduce risk on things like KSE.

**julian** : That's why I want to get milestone 3 in now.

**rwatson** : Do you think that KSE related changes from later
milestones are going to be isolated to KSE or pervasive?

**julian** : Hard to say. My guess is that milestone 4 stuff should be
less pervasive.

**rwatson** : What happens if KSE just doesn't work?

**julian** : Well it does work, the patches work, it's a question of
risk. We need to check on new things, like locking two threads in the
same process.

**dillon** : KSEs only become fragile when pthread uses them. That's the
turning point.

**obrien** : I'd like the rules for the rest of the summer, I hope we'll
talk about that.

**murray** : Earlier is better.

**mini** : I think the cutoff point for KSE might be milestone 3.

**rwatson** : It's the kind of thing where if we need to back out we
can.

**julian** : If you're not going to run KSEs then you're OK.

**rwatson** : I think it's low risk. Let's avoid the risk is the
message.

**julian** : The next DP2 (where we'd like milestone 4).

**alfred** : We really need KSE so all this concern about stuff that no
one really uses is not a big deal. People just need to play catch up. We
have performance problems and we need to solve those.

**obrien** : We quickly need to figure out our policy on multiple archs.

**rwatson** : I briefly want to respond to Alfred. We have asserted that
KSE will be experimental. It will be in and 5.0 will go out but there
might be issues.

**jhb** : Realistically for the network stack is that IPv4 sockets will
not be giant. But this is only in the network stack world. Several
people are working on it.

**rwatson** : The GEOM stuff will be enabled by default in 5.0. Sparc
depends on it. I do not know what the impediments are to that though.

**julian** : The kernel stuff is there but the user space is not. It
can't become the default until everything is there.

**warner** : What level of control are you going to exercise over the
tree in the coming months?

**murray** : You're going to see more level of control but we expect the
requests to be reasonable. It's a very open process.

**jhb** : How are we going to address the 5/6 split?

**murray** : Carefully is all I can say.

**rwatson** : For 5. 0 we need to have a more informed decision. The
release engineers will be trying to reduce the number of large code
changes more as time goes by. We don't have to wait for 5.x to be
perfectly stable before we branch.

**murray** : Let's move it to more general discussion of DP2? Specific
technologies.

**bmilekic** : Is there a strategy to lock other protocols that are not
locked down onw?

**obrien** : How much more do we need to do before 5.0?

**jhb** : Bug fixing is what we're doing.

**rwatson** : The answer on the network stack. We need to choose a
strategy on how to handle the other protocols.

**obrien** : The crux is that socket locking must be in 5.0.

**rwatson** : There are 2 or 3 problems. Routing code is a problem. See
earlier discussions.

**dfr** : RCng is essentially done. What it needs is testers.

**alfred** : What about libh (I think libh is wrong but this is what I
heard)?

**jhb** : It's very far along but not a 5.0 thing.

**warner** : Problems with interrupt routing in ACPI?

**takawata** : Cannot handle PCI<->PCI interrupt routing. Many 802.11x
have this problem.

**julian** : Is it a problem from Intel?

**takawata** : This is not an Intel problem but a problem on our side.
PCI<->PCI routing code should be added. New code is necessary.

::

    Whiteboard

    UFS2        rcNG        KSE M3          CAM SMPng

    GEOM        TrustedBSD Malc BusDMA          Newbus SMPng

    C++     Cardbus     libwhisk/sysinstall KOBJ? (no!)
                    sparc64

    Perl Removal    ACPI        Alpha SMP Stability Pkgs for
                                sparc64, IA64

    devd        PCI intr route  document hints      release docs
                                for new
                                platform

**unknown** : Firewire?

**rwatson** : What hardware shipping on IA64?

**dfr** : Intel stuff

**rwatson** : What about on Sparc64?

**obrien** : Very limited (hme...)

**rwatson** : KOBJ extensions discussed at BSDCon?

**warner** : Not sure, probably not for 5.0. Pervasive, so no.

**rwatson** : How broken is C++?

**obrien** : Only on sparc64. Don't really know yet, but it's probably a
library issue. The compiler is a pre-release snapshot. The diffs are now
getting large from May 5 to now. We should attempt to be as far along
this gcc branch as possible come release.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

--------------

BREAK

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

rc.d
----

.. raw:: html

   </div>

.. raw:: html

   <div class="discussion">

**gordon** : Talking about rc.d stuff. Import from NetBSD. Right now we
have patches out there that are translated from the current boot order.
It's in perforce. After the conference it will go into the mainline.
Single toggle for booting.

**rwatson** : How in sync are the bits in the new stuff with the old
stuff.

**gordon** : Last patch is from June 3rd, but it's tracking closely.

**rwatson** : What is the schedule for committing to the main tree.

**gordon** : We have large patches so we're going to re-import from
NetBSD.

**rwatson** : How about you have it done by July 1?

**gordon** : We could probably do that. Definitely want to be in DP2.

**gshapiro** : How long will we keep the old stuff for?

**gordon** : We'll keep them both in for a while. Not more than 1.5
months though.

**julian** : Have you had a look at all at the Mac OS/X startup code?

**gordon** : No.

**julian** : Do you deal with dependencies?

**gordon** : There is meta data in each script that says what needs
what. There is a program that orders everything correctly.

**unknown** : How does this effect the rc script for ports install?

**gordon** : We could make this available to ports but won't on the
first version.

**alfred** : Can I recommend that you recommend this to ports?

**gordon** : Yes, the problem is that we have so many ports.

**rwatson** : The reason for this is for rebundlers of FreeBSD in their
environments. We don't have to have it for DP2 but it should be an
ultimate goal. We might need to have a policy statement on this. That at
date X all ports must use the new system.

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Other Issues
------------

.. raw:: html

   </div>

.. raw:: html

   <div class="discussion">

**sam** : I've been working on hardware crypto. I'm looking for
consensus on getting hardware crypto in the kernel. This will not happen
in 5.0.

Syscall vector change for 64bits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**dillon** : Two ways to go. Need to create a new syscall vector. The
other is to do a 1 off replacement. Prefer the former.

**rwatson** : Perhaps we need to create a FreeBSD 5 syscall vector.
Could be a new ABI.

**julian** : Aren't there enough other numbers?

**rwatson** : That's one way to look at it and other platforms have done
that? Is that too heavy weight?

**julian** : It sounds that way to me. You end up having to replicate
the old ones into the new one.

**dillon** : The issue is about pollution.

**dfr** : Seems like too much work for 5.x

**julian** : It's more work. There are now two places. Why not talk to
OpenBSD?

**rwatson** : Should there be a BSD alfredI? Tough to do across
projects.

**obrien** : Who here is going to see that through? We have not talked
to NetBSD about even SMP.

**alfred** : Does changing the syscall table allow us to do clean up?

**rwatson** : We could do that without doing 64bit syscall table.

5.x ABI stability
~~~~~~~~~~~~~~~~~

**rwatson** : There are new functions in 5.x. At what point do we stop
changing?

**dfr** : When people start really using it.

**rwatson** : How do we tell? How did Solaris do it?

**Everyone** : No one knows.

**dfr** : It's too hard to add a syscall vector. Library issues are a
problem.

**obrien** : We can use ELF to handle that.

**dfr** : Let's just add 20 new syscalls instead of adding new work that
we don't really really need.

**rwatson** : Punt on lack of time to do this.

**dillon** : I see obrien's point with the libraries but I have done
this with time\_t at 64 bits.

devd
~~~~

**rwatson** : The devd stuff was to integrate cardbus, newbus, etc.

**julian** : To monitor requests to mount or create new devices.

**rwatson** : Is this a 5.0 requirement? Is there anyone to do this?

**gordon (from IRC)** : PHK has patches that make having devd
unnecessary.

**brooks** : Need something that does what pccardd did.

**julian** : Need to be able to do this through a file.

**warner** : (from IRC): That's a 6.0 feature.

**julian** : It would not be a large step to put something in the middle
to handle this.

**julian** : Sometime in the 5 lifetime we need this.

**warner** : There is no way to monitor events in newbus but it would be
easy to add.

**julian** : I'm not sure I understood you correctly.

**warner** : What happens now in a PCI is that it makes a call to
pci\_get\_devid() and the driver would say "yes I am " or "no I'm not"
so you'd have to change each of the busses to do this but that's not too
tough because we have a small # of busses.

**jhb** : Mike Smith gave us an informal tour of OS/X. OS/X uses XML to
do this. They have the DEVID in XML.

**brooks** : I looked at some PCI drivers and some work that way but
some don't.

**julian** : It seems to me we need to not have to modify every single
driver. If you've got a device that's not supported you ask all drivers.
At the point when you run out you make an outcall. The outcall returns
does a substitution.

**rwatson** : Time up, time to wrap up.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ../..

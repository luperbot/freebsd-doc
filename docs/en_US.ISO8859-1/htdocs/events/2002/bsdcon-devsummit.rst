====================================
BSDCon 2002 FreeBSD Developer Summit
====================================

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

BSDCon 2002 FreeBSD Developer Summit
====================================

The second FreeBSD Developer Summit was held on February 15, 2002, at
the Cathedral Hills Hotel in San Francisco, CA, immediately following
the USENIX 2002 BSD Conference at the same location. The FreeBSD
Developer Summit was sponsored by DARPA and NAI Labs, and hosted by NAI
Labs. Notes were taken by George Neville-Neil and edited by Robert
Watson. Markup by Murray Stokely.

Meeting began at 09:30am, ended at 5:00pm.

Agenda
------

-  `Inheritance added to Kobj <#kobj>`__
-  `Architectures <#arch>`__
-  `Toolchain <#toolchain>`__
-  `GEOM framework <#geom>`__
-  `Networking <#network>`__
-  `TrustedBSD <#trustedbsd>`__
-  Lunch
-  `KSE <#kse>`__
-  `SMPng <#smpng>`__
-  Devd/Devfsd
-  `Release Engineering <#releng>`__
-  `Conclusion <#conclusion>`__

Attending:
----------

In person:

-  John Baldwin
-  Doug Barton
-  Jake Burkholder
-  David O'Brien
-  Chad David
-  Jason DiCioccio
-  Matthew Dillon
-  Julian Elischer
-  Brian Feldman
-  Justin Gibbs
-  Jeffrey Hsu
-  Poul-Henning Kamp
-  Greg Lehey
-  Jonathan Lemon
-  Terry Lambert
-  Scott Long
-  Warner Losh
-  Michael Lucas
-  Eric Melville
-  Kenneth Merry
-  Jonathon Mini
-  Mark Murray
-  Alfred Perlstein
-  Andrew Reiter
-  Ken Merry
-  Jeff Rhyason
-  Paul Richards
-  Benno Rice
-  Luigi Rizzo
-  Jeff Roberson
-  Nick Sayer
-  Gregory Shapiro
-  Brian Somers
-  Murray Stokely
-  George Neville-Neil
-  Chris Vance
-  Jacques Vidrine
-  Robert Watson
-  Kelly Yancey
-  Jennifer Yang

On The Phone:

-  Chris Costello
-  Brooks Davis
-  Josef Karthauser
-  Bosko Milekic
-  Thomas Moestl

Via webcast:

Joe Karthauser is recording the call and is web casting.

The meeting followed a format where each section was led by an
individual and then a discussion ensued. Not all of the discussion was
caught but I have tried to make those sections understandable.

.. raw:: html

   <div class="topic">

--------------

Opening Remarks - Robert Watson
-------------------------------

Welcome to the second FreeBSD Developer Summit at BSDCon 2002. This
event is sponsored by:

-  Defense Advanced Research Projects Agency (DARPA)
-  NAI Labs, the Security Research Division of Network Associates

The sponsors covered the cost of the room, food, telephone access, etc.
In addition, Joe Karthauser is providing webcast access, and Yahoo! is
providing bandwidth for that using the FreeBSD.org cluster.

This is actually the second FreeBSD Developer Summit -- the first was at
the USENIX Annual Technical Conference in Boston last summer.

The goals are to provide the opportunity for insight into on-going work,
and to solicit comments, design input, and help on parts of the work.

There are rules of engagement. Presenters should attempt to remember to
check for questions on the phone, respect people asking questions, keep
moving, and if told to stop, stop, as well as provide notes on the
presentations later. Others should do the same, especially with regards
to stopping when asked to stop.

*(Tentative schedule reviewed)*

People will be on their own for lunch.

Let's go around the room, please give your name, and say something about
what you do or why you're here.

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Inheritance Added to KOBJ - Justin Gibbs
----------------------------------------

Inheritance models have been put into newbus to reduce code duplication.
This was done because he was trying to get cardbus to work. Code did not
adhere with the spec. There were conflicts with copying from PCI.
Cardbus is just an extension to PCI.

If you look at the current cardbus under BSD it's just all of PCI with
symbols renamed. Newbus is an OO type framework was and was half way
there. KOBJ and Newbus work today with a table of methods. To invoke a
method an indirection is done to a lookup. This makes it so that the
invoker doest not need to know where the invoked method is.

The extension that was added is that instead of a single table it's a
list of interfaces. Every interface can inherit from a parent. In
cardbus there is a list. One method is the device interface for
probe/attach. Then there is an interface for the bus. The third is a sys
parsing interface that can be shared with pccardd.

Inside this the interfaces inherit from PCI and then he overrides a few
methods.

The amount of code to support cardbus drops from 1000s of lines to a few
hundred.

The system is implemented through the indirection already in newbus.
When a class is registered the way you declare it is a list of
interfaces. Each interface can declare a parent. The compiler walks the
list to find the correct function. This allows you to call your
superclass.

The only thing that gets a little ugly is that some of the ways you
specify your class or invoke a superclass. You can generate a macro
wrapper but you have to know which interface is yours.

Another upshot is that the way most drivers are implemented today if
they need a generic method they have to explicitly put that into their
method table. If they don't need it then they don't. With the
inheritance model you just create a null interface.

Diffs on his web site.

Whole method tables collapse to one or two entries.

Open issues:

-  **Interface versioning.** - What he's been looking at is to munge the
   interface name to deal with versions. It's hard to hide this and work
   with it.

   Linux does this by modifying the .o

-  **Multipathing** - The reason for an interest in multi-pathing is
   that systems today already have to do this, i.e. SCSI systems. Many
   NUMA systems have CPUs with private I/O to a SAN. When you do I/O you
   use the local device. This introduces locking issues for access.

   Another case is that there can be more than one way to enumerate a
   device in the system. I.e. PCI vs. ACPI

   The basic idea that he has requires a different invocation method in
   newbus. If you have to go up your bus chain there is a problem. What
   he proposes is to pass a path object and a cursor that points to
   where you are in the path. Then anyone along the path can see above
   or below etc. A path is an array of deviceD pointers and a cursor is
   a deviceC.

   To implement this you have to modify all of these interfaces. This is
   very mechanical. He's got ACPI, SIO, ATA, WaveLAN working now. Each
   of these drivers takes about 5 minutes. If you care to take more
   thought then you can collapse the drivers. The simplification he has
   now only covers certain parts of cardbus or pccard.

His question is what release should this go into and how do we manage
the transition if we decide to do this?

How do we design the versioning? Run time? Link time? In the
multipathing case is an array of dev\_t sufficient?

Discussion
~~~~~~~~~~

.. raw:: html

   <div class="discussion">

**Anon** : I hesitate to throw this out. The way you do version
verification in Solaris is that an init gets called which passes a
version to the api to check it. Another thing you get from init.

In the Solaris case there is a single number. How do I automate that
versioning check with more interfaces?

**Paul** : I don't think we should over engineer the problem. We only
bump per release in libraries.

**Justin** : When you bump the version is one part of it.

**Julian** : Do you want more than one version at once?

**Justin** : Assuming we use name munging you could have.

**Gnn** : Have you looked at COM?

**Warner** : I have a few comments. There are several problems in one
here. I like the multiple inheritance. The versioning seems orthogonal.
The multipath is orthogonal. We should break this apart.

**Justin** : I have 14K lines of diffs just to make multiple-inheritance
work on my laptop.

**Julian** : The other drivers will still work.

**Justin** : No they will not, they'll die early in init. I could turn
those into fatal errors.

**PoulHK** : If the change is so significant then the first thing we
want to do is versioning.

**Justin** : Its almost as if you want a version of newbus.

**PoulHK** : A change of this scale is not very easy to get all right.
Particular because we can't change all drivers.

**Justin** : The only saving grace is that the transition can be
mechanical.

**PoulHK** : Why not a compatibility layer while doing conversion?

**Justin** : Sure and then you could use Perl to change the whole tree.
I hesitate because in 90% of my own changes led to code reduction and we
should do that.

**PoulHK** : I think we'll have the human eyes.

**David O** : How long to get your basic framework working?

**Justin** : Right now my stuff is done, the rest of the tree is a
man/week. I'd like to get versioning done now.

**Mark M** : Does that include the script?

**Justin** : No manually.

**Julian** : The problem is the requirement where you can't break
things. Perhaps we should have official breakage. For instance for a
week.

**Nick** : If you're going to do that then lay down a tag before the
breakage.

**PoulHK** : Development model discussion. Lets limit this discussion.

**Robert** : Lets assume the discussion of how it gets into the tree is
not relevant. Do you want the versioning before then?

**PoulHK** : Two questions we should figure out first. 1) Any
objections?

**Warner** : One last point. It seems like we're spending a lot of
effort re-inventing the object wheel. We should just shoot KOBJ and
consider using a subset of C++ to do this. Then we can leverage the
language.

**Justin** : One problem is that C++ does not allow this easily. If you
do eC++ then there is multiple-inheritance.

**Warner** : I mean C++ with no exceptions but not eC++.

**Justin** : Then people say they want exceptions.

**Julian** : I wouldn't mind having our own pre-processors.

**Robert** : Let's move on.

**Nectar** : COM does work its in Mozilla we can use this kind of
technology. We don't need C++ to do those things.

**Justin** : One last thing is the problem in this inheritance model is
how you deal with IVARS. The problem is that those name spaces are not
unique. What I'm thinking of doing is passing the interface object
along. This gives you a further

**Brian** : C++ won't help us solve versioning. Although COM would solve
some of these problems it should not be in the fast path.

**Robert** : Lets not go there.

**Warner** : The other issue is the softc issue. Only one can own it.

**Justin** : You can use ivars for that.

**Warner** : There are issues with bridges.

**Justin** : You use a method to get to your ivars which hang off of the
softc.

**PoulHK** : Half of us have no idea because we have no docs.

**Robert** : Lets go to the phone.

**Robert** : No technical questions on the phone.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

New Architectures
-----------------

PowerPC - Benno Rice
~~~~~~~~~~~~~~~~~~~~

Has now committed the page map code with something more sane. Has also
got the system to the point where it tries to mount root. Turning on
invariants blows it up. Hoping to get to single user in a month or so on
the simulator. With some luck we may get to multi-user by 5.0. Needs
some more help. Possibly on real hardware. That's about it.

Discussion:
^^^^^^^^^^^

.. raw:: html

   <div class="discussion">

**Robert** : This relates to release engineering later.

**David** : Is everything in CVS?

**Benno** : Not everything yet, but things have to be cleaned up. Some
time in the next week after the invariants problem is fixed.

**PoulHK** : What hardware?

**Benno** : Right now on pSim which is in ports. Once that's working the
first hardware will be new world apple hardware. Some old world apple
hardware and then a Motorola board.

**Justin** : What are the prospects for using this in embedded?

**Benno** : Depends on whether you've got open firmware or not.

**David** : Targeting embedded is very difficult. Pick a reference
platform then move on. Wind River has 20+ boards etc.

**Benno** : What I'm hoping to do is to make this as easy as possible.

**David** : Given a reference platform its easier to build from there.

**Benno** : The other note that I will make is that I'm only targeting
PowerPC similar to 700.

**Warner** : I was going to comment that NetBSD has done well with
little tiny ports to different boards.

**Justin** : How different are these?

**Gnn** : Very different.

**Anon** : Have you had any help from Apple or hardware vendors?

**Benno** : I have a bit of help from them. In terms of hardware support
I've had none except for the Motorola board.

.. raw:: html

   </div>

IA64 - David O'Brien
~~~~~~~~~~~~~~~~~~~~

Kind of hosed now due to toolchain issues. It will take significant
effort to bootstrap this. It may take a month to get to multi-user.

When Peter arrives later, he may have more to add.

x86-64 - David O'Brien
~~~~~~~~~~~~~~~~~~~~~~

We have a toolchain that works and is mostly in the tree. There is a
simulator issue. I need a new simulator from AMD but they're not
responsive. Hardware not available yet but we're not in a rush.

Questions
^^^^^^^^^

.. raw:: html

   <div class="discussion">

**Justin** : During the NetBSD there was some talk about PAE coming for
free. Is that true and will it affect us?

**David** : Peter is already adding this stuff.

**Justin** : Peter is looking at the stuff that was presented here.

**Warner** : Isn't part of this meaning that ethernet drivers have to
use DMA.

**Justin** : It's not as bad as it looks because all the devices don't
need bounce buffers.

.. raw:: html

   </div>

Sparc64 - Jake Burk Burkholder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Basic status is we boot multi-user on real hardware. Looking at
targeting Ultra 2, 5, 10 and Blade 100. Something for 5.0 but it may be
a very manual install procedure. Toolchain is native but we haven't
tested it much. It is a hosted tool chain. Runs on Sparc64, generates
Sparc64 binaries, but it's not the full usual thing. gcc3.1 and binutils
2.12

Discussion
^^^^^^^^^^

.. raw:: html

   <div class="discussion">

**Anon** : What is the bootstrapping?

**Jake** : TFTP.

**Robert** : Bootloader?

**Jake** : We can mount Solaris disks.

**Robert** : How likely that all of world will be self hosting by 5.0?

**Jake** : Right now we're having problems with Perl.

**David** : There is polishing to be done but even if you're not a
hacker it's fine.

**Jake** : Still finding endianness problems.

**Terry** : If someone wanted to use that for 32 bit how tough would it
be?

**Jake** : You'd need to rewrite the kernel.

**Terry** : Do you document that?

**Jake** : It's mostly pmap.

**Anon** : SBUS support?

**Jake** : Ultra 2 has sbus support.

**Benno** : Have you got the gem ethernet driver working?

**Jake** : Yes.

**Robert** : Any questions on the phone?

.. raw:: html

   </div>

StrongArm
~~~~~~~~~

.. raw:: html

   <div class="discussion">

**Robert** : We did have a slot for ARM related ports.

**David** : On StrongARM we can get to copyright messages etc. This is a
bunch of code off to the side. What path do we want to take on this?
Wait until it works? Check it in now?

**Justin** : Who has been working on this?

**David** : Someone in Canada.

**Robert** : Is the person who's doing this work willing to go all the
way to maintain it etc.

**David** : The basic idea is the iPAQ. The idea is more of a reference
port.

**Warner** : MIPS port is unchanged. Some people have this and are just
deciding whether to contribute it. Chicken and an egg problem.

**Justin** : Interesting embedded platform.

**David** : If it's on a DECStation then it's not embedded.

**Warner** : This is on current MIPS technology for a router company.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Toolchain - David O'Brien
-------------------------

Questions:
~~~~~~~~~~

.. raw:: html

   <div class="discussion">

**John** : What are the plans 5.0?

**David** : Interest is in new ports. For instance C++ will lag. Like
you say we need gcc3.1 and binutils. Will commit to get kernel and
interesting parts of user land working. Very soon there will be
something that those who want to play with it can download. It's
debatable who will clean this up for new hardware.

**Robert** : We'll discuss the release engineering later. There is a
notion of supported vs. non-supported and toolchains will have to
follow.

**Julian** : There are some thread fixes that went in. Patches to gdb?

**David** : I'm trying to get them out of someone. If I get a patch I'll
put it in. I need paperwork from the FSF to commit it.

**Julian** : I'm going to need help to beat up gdb for KSE.

**David** : Talk to John, DFR and yourself on this.

**Nick** : How much change goes in to gcc for a FreeBSD release?

**David** : The issue is the dual a.out/elf stuff, that's the problem.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Architectural Issues (General Discussions)
------------------------------------------

.. raw:: html

   <div class="discussion">

**PoulHK** : I have 3 issues. One is endianess in the on disk
filesystem. Do we want to be able to move a disk from Sparc64 to x86. I
also need to collect the various disk label formats. What do we do about
"you broke world on foobar architecture" issue?

**Warner** : I'll address the last question first. We need to build up a
set of machines or build up cross building.

**David** : I don't know if anyone set up an environment.

**Warner** : NetBSD has done some things to deal with this.

**Robert** : Supported release? The same thing can be done in the cross
platform build. If a particular arch is going to be supported then we
must have a build cluster.

**Benno** : On the subject of PPC I'd be willing to offer them.

**Nik C** : The NetBSD folks are talking about having a tinderbox
environment. We might talk to them about sharing.

**PoulHK** : On the subject of tinderbox. About 2 years ago I set up a
machine to test this kind of thing but got a lot of negative feedback.
If we want to do a tinderbox like system it will require buy in by the
committers.

**Nik C** : I think the Mozilla team do it more with a web page status.

**David** : The gcc group does a tinderbox and it knows who did the
commit.

**Action item** : This could be farmed out to sysadmins who want to
contribute.

**Justin** : From my standpoint, if I could cross build the Sparc64 that
would help.

**Robert** : If we're going to commit to having multiple platforms we
need to solve this.

**Nik C** : There are also issues of regression testing.

**David** : I don't know what could be done with it.

**PoulHK** : This is a purely organizational question. What does it take
to do this. Do we discuss this on developer?

**Greg** : I really do think we should try to find a way to be endian
clean.

**PoulHK** : We're not going to take suggestions. There will be a UFS2
and it will be 64bit. As part of that we're still not sure if we will
have to fork the UFS tree. One of the things I was considering doing was
at a slight performance hit doing big or little endianness on any disk.
Is that the way to do it?

**Alfred** : NetBSD has this and it's fast.

**Justin** : I would think of it terms of having two modules, one for
each endian.

**Benno** : It would be nice to be able to do this when bringing up new
big endian systems.

**PoulHK** : The performance is an issue but not as big as the code
intrusion. Should we do it as two separate filesystems or should we put
this functionality directly into UFS2?

**Matt** : Two comments on the FS stuff. One just from the point of view
of fixing bugs, I would prefer a single copy. You could also do this via
a conversion program.

**PoulHK** : It's not just a question about sticking in macros. Soft
updates makes this much more complex.

**Jake** : On big endian machines I just use NFS.

**Greg** : Conversion does not make any sense.

**Justin** : The other thing I want to say is that you can just have two
modules.

**Robert** : Before we go too much further we should look at NetBSD.

**PoulHK** : Is there interest?

**Gnn** : Removable media is reason enough to do it.

**Warner** : When I've talked to NetBSD about this they consider it a
feature they don't want to give up.

**Robert** : Any questions on the phone for architectures.

*None.*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

GEOM - Poul-Henning Kamp
------------------------

This changes the semantics of how we handle disks. There also may be a
slight performance hit.

The way it works is that there are methods that do transformation on the
data on the disk. Simple translations move data, complex transformations
include encryption.

A method exposes one or more logical providers. It exposes an interface
where you can read/write a given size.

Other methods connect to the providers (consumers). All providers have a
dev method which allows it to show up in devfs. There is a locking
mechanism so you don't get parallel write problems.

The system is autoconfiguring.

The locking method. When you open a device somewhere there are three
counters associated with it, read, write, and exclusive. Exclusive bit
prevents anyone else from opening it for write.

The intent is that the modules that recognize the on disk format will be
endianness aware. We hope that types will be explicit. I need support
from people to collect information on disk label formats.

Some current drivers do RAID etc. but I'd like to get that out of the
drivers, again this requires information about the on disk format. This
would allow us to come up single user with a mirrored root.

I'd like input on :

I/O Statistics (What to collect?)

.. raw:: html

   <div class="discussion">

**Greg** : Read/Writes/Data transfered etc. A way of finding the % busy
time of each device.

**PoulHK** : With tagged queuing that is kind of useless.

**Anon** : The dev stack does keep track of how long a device has been
busy (transaction outstanding).

**PoulHK** : One of the things there is an explicit cloning of the
struct bio. So you have one for each edge in the graph. One of the
things I want to be able to do is put in a transparent node. This allows
the moving of filesystems.

**Anon** : You have to have per transaction storage for this to work.

**Justin** : You want to have something to make it so that softupdates
does not need to do the sleep/nice trick.

**Matt** : The real problem with fsck is that when you're skipping
around the disk the 3ms seek can hurt other things.

**Justin** : You were saying that if I open ad0s1 read only then ad0
inherits that.

**PoulHK** : It depends on where you are in the tree etc.

**Nick C** : From the work you've done so far, do you have performance
numbers?

**PoulHK** : No, because I'm in the simulator. It does cost copying two
struct bios.

**Alfred** : To modify the on disk disk label when its mounted read only
can you modify it?

**PoulHK** : The BSD module decides that. You cannot go down to the raw
disk and do that.

**Alfred** : What if I want to expand the root filesystem?

**PoulHK** : Making a partition larger while its open is fine, making it
smaller will be problematic.

**Alfred** : I think this locking is a bad idea.

**PoulHK** : The only thing that's going to be magic is having the root
partition in single user. I'm not going make an escape hatch for this.

**Robert** : Are there any other issues?

**Justin** : What is the name space?

**PoulHK** : The control will be sysctl. I want to remove the ioctls
from these. I haven't really decided on the name space. I want to make
sure that /dev does not change.

**Julian** : Have you considered using the earlier discussed methods and
inheritance so that this all works together?

**PoulHK** : I discounted them for performance reasons. I discounted
newbus because it has a one way tree. The one thing we're having a lot
of problems now is something going away. That does not work today.

**Julian** : How do you handle the case when the device rips out at the
bottom when you've got a downwards going command?

**PoulHK** : There's two things to it. A struct bio traveling down will
either be in the consumer or the provider and that's where the lock is.
Modules can also be shut off safely.

**Alfred** : Couldn't you just provide a generic callback?

**PoulHK** : I can do that because they're all sitting in the module. I
need to negotiate with the device driver writers about that.

**Nik C** : Is this an implementation based on new research work or
wholly new?

**PoulHK** : I've read what I could find but most current systems have a
fixed hierarchy.

**Robert** : Will this give us a chance to retrofit the system with 64
bits?

**PoulHK** : struct bio will have 64 bit numbers.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Network Stack - Luigi Rizzo
---------------------------

Recent work has been on performance. Removal of unnecessary copies.
Using clusters etc. There is the polling code but it's only on a few
devices. Need to add support for more devices.

Do people like polling?

.. raw:: html

   <div class="discussion">

**PoulHK** : I worry about interactions with the rest of the system. We
should probably spend some time looking at that.

**Luigi** : The next thing to do is add mixed mode operation.

.. raw:: html

   </div>

Jonathan has something to say about how network interrupts are
dispatched.

Some minor fixes to the stack. FIFO buffers on UDP

I have a version of PGM (reliable multicast). I plan to commit to
current and stable if people ask.

The ICSI folks have changes to multicast API which will help with
IGMPv3.

Some of this code I do for myself. How do we do kernel patches?

Questions
~~~~~~~~~

.. raw:: html

   <div class="discussion">

**Alfred** : There's two things. With 256byte MBUFS and clusters for DMA
people are seeing really bad utilization of memory for networking
packets. Certain application servers with small packets have problems.

**Luigi** : I've talked to Peter Wemm about this stuff.

**Julian** : First, I have some times worried about the flexibility of
polling regarding different networking types. For instance the number of
packets on Gigabit vs. PPP. I'm worried about the extremes.

**Luigi** : This will become completely irrelevant when I implement
mixed mode.

**Julian** : Second is to do with the TCP stack trying to remove copies.
Have you got any intention of evaluating the recent SACK implementation?

**Luigi** : That broke standard TCP.

**Alfred** : Actually SACK is out of style now. One other thing on
performance is that the drivers do a mget/mclget at once.

**Julian** : Third question is the ability to add meta data to packets
using m\_aux?

**Luigi** : My major concern is that a generic system is very slow
because of scanning for data.

**Robert** : I think that that's worth doing. Julian will you own that?

**Julian** : Yes.

**Anon** : Impact of polling scheme on SMP?

**Luigi** : They don't compile together. Right now I only have one
polling loop. With a giant lock around the stack what's the point?

**PoulHK** : To what extent do we want to use the netgraph code? How do
we deal with the multiple ATM stacks.

**Warner** : Lets lose the ones that don't work.

**PoulHK** : None of them work now.

**Greg** : Just losing them could get us into a bounce. Maybe we should
try to encourage using it.

**PoulHK** : Is ATM interesting to FreeBSD at all?

**Gnn** : ATM is necessary for DSL

**Justin** : What about DAFS? That uses ATM.

**Julian** : Since our end user community does not use 5.0 that's part
of the problem.

**PoulHK** : It's a perfectly valid point. Who's going to fix it?

**Anon** : The ATM list is somewhat active.

**PoulHK** : There are two stacks one that is used by the Japanese and
one that does a bunch of weird stuff that no one uses.

**Robert** : Action item is to query the atm list to see what's up with
this.

**Action Item** : Query the ATM list about which stack they want/use.

**Julian** : We want to be careful about ripping it out if people are
using it with DSL cards.

**Warner** : One of the weaknesses in the current network stack is
dealing with removable devices.

**Peter** : You have to eject a button on M$. Laughter.

**Robert** : Part of the problem is the ifnet pointers from mbufs etc.
We do need a long term solution. If you ifconfig down that doesn't fix
it.

**Luigi** : You could try to keep the ifnet structure alive. Dummynet
can scan all the mbufs whenever you delete a pipe. It's expensive but
you could do it on eject.

**Alfred** : The drivers have to be more robust.

**Julian** : I actually did some work on adding reference counts to all
consumers of ifnet structures. It reference counted everything but it
didn't cause a performance issue.

**Luigi** : This becomes an issue only at higher speeds.

**Robert** : We may want to defer this to SMPng.

**Gnn** : You could have a two level hierarchy of device drivers.

**Terry** : Virtual interfaces.

**PoulHK** : This ties into another issue about how we look at our
interfaces. No one notices when I unplug my device.

**Peter Wemm** : The problem isn't deleting the routes its adding more
routing messages.

**Nick S** : Also includes dhclient.

**Gnn** : Need new routing messages.

**Paul Richards** : Wants activities brought up to userland for devd.

**Anon** : At BEOS we had the user list all the potential interfaces.

**Robert** : I think we still need a routing socket event.

**All** : Discuss on mailing list.

**Jonathan L** : If we're talking about doing this with cables this
works with MII but it's only in kevent and not in routing sockets.

**Matt** : Having a carrier loss flag an existing route is the right
answer.

**PoulHK** : Re raise netgraph issue. What is the future of netgraph in
the tree right now. We have very few users now.

**Julian** : What parts are not done?

**PoulHK** : Configuration etc.

**Alfred** : Netgraph is extremely useful. It needs to be documented and
a bit more bolted down.

**Julian** : It is bolted down. For 5.0 only one API changed. There's
plenty of documentation.

**Peter W** : Originally when it first came up it was not meant for high
speed.

**Julian** : I was being cautious. We could switch over all of PPP to
use it etc.

**Nick S** : I'd like to see the mpd netgraph configuration files become
more /usr/sbin/ppp.

**Julian** : Brian has been toying with having ppp take over mpd.

**Gnn** : Can we use netgraph for SMP?

**Peter W** : I'm a refugee from a streams based system. It's scary. Be
a little bit careful.

**Terry** : I think it would be very hard to for example take the Rice
work and make it work in the context of netgraph where you're processing
interrupts to completion. The advantage of going to completion.

**Luigi** : I think I'm doing the same thing .

**Jonathan L** : I have code that does that. I've replaced all the
queuing calls with a single call.

**Robert** : Bring this to an end.

.. raw:: html

   </div>

.. raw:: html

   </div>

LUNCH
-----

.. raw:: html

   <div class="topic">

--------------

TrustedBSD - Robert Watson
--------------------------

DARPA funding has accelerated work.

Goal is to introduce security features for new consumers.

Most basic component is ACL work (fine grained ACLs). We needed extended
attributes, so those are in too. Currently low performance and low
reliability. Userland still needs new utilities.

The more interesting work is in the Mandatory Access Control. Goal is to
enforce new restrictions in the kernel. Multi-level security uses this.

Part of the work is to port SE Linux stuff to BSD.

This stuff interacts with other subsystems including the network.

Mandatory policies. Discretionary rights are you protecting your own
data. This is very hard to manage. MAC addresses this by defining
policies for users in the system. Where you have many users on the same
machine. There are a couple of traditional systems that are in military
systems and trusted systems.

MLS is a confidentiality policy. Who can read/write things based on
clearance. Doing things based on the "need to know."

BIBA integrity system is the other. Secure levels are somewhat like this
but are not comprehensive.

Type Enforcement. Flexible MAC based on administrator rules.

You can plug different models into the framework.

MAC requires pervasive enforcement. Current system can restrict access
to interfaces. Can mark packets for security. Can control sockets.

What the framework does is provide a single framework to plug these
into.

The framework provides APIs. You put these throughout the code. They are
ifdef'd. If you don't compile with "options mac" you don't get this.

What happens with the framework a module can declare at boot time or you
can do an LKM on it.

Right now these API calls are in a perforce branch. They are pervasive.
They don't touch every part of the system, only the parts that NAI use.

There isn't a generic label structure. To add new labels you must
recompile the kernel. Real key is to keep the costs low.

We don't allow for garbage collection on labels. Binary block that gets
carried around.

This is not really integrated into userland.

Reduced the number of total security checks in the kernel by unifying on
this i/f.

.. raw:: html

   <div class="discussion">

**PoulHK** : Does this flexibility include removing the existing checks?

**Robert** : No. You can only extend checks.

Directions are flexibility , add more hooks in to the MAC for the
kernel, integrate other work like LOMAC. Need to teach userland
something.

**Alfred** : Are you moving to per operation?

**Robert** : Right now we only do at open() time. We want to do
read/write and send/recv.

**Robert** : Once we have read and write we'll be able to revoke access.

We'd like to commit this before 5.0. It's available in PerForce.
PerForce now exports through cvsup.

We have not done any micro-benchmarks. Once we know then we can make a
decision to leave it on or not.

**Alfred** : What about active mode tripwire like system?

**Robert** : You can do a number of things like that with the current
framework.

**PoulHK** : One of the other things I would like to do is a best effort
MD5 on files. This would make tripwire and mtree checks faster.

**Robert** : The problem with that is you don't get the data during
these operations.

Right now the struct mbuf is extended but it would be nice to have a
better system.

**Alfred** : m\_aux

**Robert** : sounds expensive because of the list stuff

**Terry** : You said something about the NSA linux code. Independent?
Licensing?

**Robert** : Interesting issue. All TrustedBSD work is under BSD
license. The NSA stuff will not be under a BSD license but will be a
module.

**Terry** : By compiled do you mean a loaded module? Binaries?

**Robert** : Not binary, you could imagine a package.

**Anon** : My understanding was that any project done by the gov't was
PD. But that doesn't seem to be OK.

**Robert** : I can't say. Part of our contract was to release as open
source.

**Alfred** : About compatibility. How compatible are we with others?

**Robert** : We've tried to follow the specs.

**Alfred** : Perhaps support NFS extended attribute stuff?

**Robert** : Right now everyone does RPCs for ACLs and they're
incompatible. Not in Posix 1e. We tried to work with others but some are
not tracking (Linux).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Capabilities - Brian Feldman
----------------------------

Largely complete and stable. Unknown performance hit.

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

KSE - Julian Elischer
---------------------

Very quick status report. It's an attempt to produce support for high
quality threading within the kernel. Threading is outside the kernel,
the support is inside. Taking advantage of work by Anderson (Scheduler
Activations). NetBSD is sticking closer to the paper. We're doing a
variant based on discussions with a lot of people. The basic concept is
the same.

The threading comes with the ability to make async syscalls. Any syscall
you do from the point of the view of the thread looks like its stopped
but this does not stop the whole process. A new thread is produced on
the fly. We've extended this to produce multiple upcall points, 1 per
CPU. This is so you can run multiple upcalls on different CPUs. The
upcalls occur to different stack contexts.

Status Report
~~~~~~~~~~~~~

There are a set of patches available on Julian's website. Gets us as far
as pthread. Kernel supported, single CPU, threads. All syscalls are
async, but only on one CPU at a time.

This was shown in the WIP.

Up next is to do multi-processor.

Next stage is to make it complete or even safe. What I've got works but
I've broken ptrace so we can't debug processes. What I have checked in
are a number of changes that were part of this change. This reduces the
amount of diffs vs. the patch. It's not a terribly huge diff at the
moment.

Next is to get gdb working again.

The next change would be to make the changes for multiple CPUs.

Need a more complete version of the API. Just have thread creation and
thread kill right now.

I'm expecting that I'll have the current stuff checked in within the
month. Depends on issues with gdb. I'm hoping June or July for the full
multi-processor version.

I hope to check in soon so that user land folks can work with it.

Questions
~~~~~~~~~

.. raw:: html

   <div class="discussion">

**Julian** : Does anyone think this is a bad idea?

**Greg** : We never finished our discussion on Tuesday. 3 layers is too
many.

**Julian** : There are 4 layers but 2 are basically null.

**John** : We talked about this, it is the right thing.

**PoulHK** : Sounds like a blue print paper.

**Alfred** : What do you plan on implementing in the upcall?

**Julian** : It's not an explicit call to allocate and deallocate
threads. You do a call which says "I'm going to go into this mode" and
when something blocks come back to me as an Nth or an N+1.

**Alfred** : OK.

**Peter W** : It works just like fork except instead of retuning just
once in the parent/child it returns over and over again.

**Matt** : What I would like you to do is to provide us how much this
simplifies the user land thread library.

**Julian** : Just to get basic threads on normal code (reads, writes,
anything that could block) there is a set of code (~5000 lines of C)
that has to keep track of this. The entire user land thread scheduler is
10 lines.

**Peter W** : The user level thread scheduler only works for networking
but dies on disk stuff.

**Robert** : You get disk I/O parallelism.

**Alfred** : I'd like to still be able to use user land threading for
networking.

**Julian** : There is no point in not using. All we're allocating for
you is a stack.

**Matt** : There is a partitioning here. In I/O reading there is a
problem, but in writing there is not. Only 1% of writes now block. If
you're reading 1000s of sockets there is an issue.

**Robert** : KSEs are very general. Doing the basic stuff is the right
answer.

**Julian** : My theory is in fact that we'll keep the current code and
provide a new library. I don't want to be responsible for the entire
threading system.

**Matt** : We can always change the default.

**Julian** : Just as an aside. As part of this work I had to rearrange
the way in which threads are done. We now have a pool of free threads.
It turns out that I now have a cache of threads. Thread reapers go in
wait() (called by exit()).

**Nick S** : Corner case. Simple app that you register KSE callback
thing and then it makes a call into a blocking syscall and blocks.

**Julian** : That thread is blocked.

**Nick S** : What happens when there is nothing to do?

**Julian** : It calls yield() and gets discarded. There is a mailbox
between that could be used to tell the kernel "never call me" when the
process knows that its blocked.

**Greg** : What are the performance implications?

**Julian** : None.

**Peter W** : For disk performance it will be great.

**Julian** : For a non-threaded process on a non-KSE kernel I can't see
any difference.

**Robert** : Questions on the phone?

**Phone** : At what level does user land thread scheduler operate?

**Julian** : It's a library that you link with.

**Phone** : What about other languages?

**Julian** : You need to write the library. It's all very short.

**Warner** : Does this mean it breaks the one application that we have
that's not written in C?

**Peter W**: cvsup will work.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

SMPng - John Baldwin
--------------------

I actually attempted to set up a BOF on this at the conference. The
biggest topic of discussion was "how much do we expect of have done by
5.0?" A very conservative viewpoint is:

Overhaul process cred stuff.

Finish ktrace to work in an async kthread

Networking stack because its part of the target market and is a big net
gain.

Much of the discussion centered around sockets.

Another suggestion was to trace down VOP read and write path and push
down giant into that.

The last thing would be to make the kernel fully preemptable.

.. raw:: html

   <div class="discussion">

**Greg** : Where is the architectural overview?

**John** : I'm working on that.

**Greg** : What about light weight interrupts?

**John** : No real need.

**Greg** : I think we're going to fail unless we have a good theoretical
base.

**David** : You've told us 3 things you've wanted for 5.0. These are
micro-goals. What is the big picture?

**John** : The direction is a "fine grained locked kernel".

**PoulHK** : I'm sure we can come up with an architectural paper. Very
little of 4BSD ever made it in either. I don't believe that can we make
a full map.

**Greg** : I think we can.

**PoulHK** : We're talking about redoing sections of code.

**John** : What key milestones?

**Greg** : Light weight threads.

**Peter/John** : Already done.

**Justin** : Having been at the SMPng meeting the general consensus was
to come up with a framework. LWT is an optimization. Maybe only to 2
CPUs at 5.0

**David** : What is it that you've accomplished from a high level?

**John** : Almost all the work is infrastructure. When BSD/OS did SMP
they added mutexes and are using lock manager locks.

**Bosko** : LWI for x86 we just switch contexts it has a very minimal
impact. The code is available

We don't generate code on the fly.

**John** : Current Status cont. We've taken more time to get it right.
We've added common things like semaphores, reader writer locks. I've
been making the kernel fully pre-emptible. I've committed half of this
to current now. The ktrace is another infrastructural issue so its
feasible.

**David** : Then general framework will be done by 5.0. Second to test
the infrastructure you've been locking the proc structure. For 5.0 we're
still not talking about super strong, fine grained SMP.

**John** : That's why we want to do the network stuff.

**PoulHK** : Geom and devfs can do this now. We don't need to wait. We
have various pieces of code in the tree that can be taken out from under
giant.

**Matt** : Just an example of what we'll probably be able to do fairly
soon are the fsops in the file. For things like pipes, /dev/null/,
/dev/zero. The i/o paths we have to concentrate on the most are
read/write for vfsops. If we can't fine grain the others in 5.0 oh well.

**Anon** : What specifically are you planning in terms of performance
gains before the release? Do we have any more firm of a schedule?

**John** : 2nd question (schedule) is for later discussion. 1st is "no
more than 5% loss." I want to run some real benchmarks.

**Warner** : What benchmark are you going to use?

**Luigi** : What if we totally miss the numbers?

**John** : We'll have to revisit the whole release.

**Peter** : Turning spls into mutexs doesn't help us.

**John** : spls as mutexes still don't get us out from giant.

**PoulHK** : I need documentation.

**Anon** : I will be happy to help you with words.

**Warner** : I signed up to do locking for newbus.

**Paul Richards** : I'll help on documentation. We still need a roadmap.

**Robert** : The one thing on the must lock list is the network.

**PoulHK** : We can just put one lock around the network.

**Nick S** : On a uniprocessor the locks are just null right?

**John** : Yes on spin locks.

**Nick S** : Nevermind.

**Luigi** : Do we care about performance on uniprocessors on 5.0?

**John** : One thing that SMPng may help buy is that if you have two
network interfaces then you can handle more stuff.

**Luigi** : Do we care or not about uniprocessor on 5.0.

**John** : Yes

**Julian** : In the uniprocessor case KSE degrades down to forkeed
processors.

**Peter W** : Need a graph of the locking the subsystems.

.. raw:: html

   </div>

.. raw:: html

   </div>

Break
^^^^^

.. raw:: html

   <div class="topic">

5.0 Release Engineering - Murray Stokely
----------------------------------------

There are a number changes to the team. Murray, Robert, John, Bruce Mah.
Change review committee. Documented the process.

We think its pretty important to take a more active role. Want to do
developer previews (polished snapshot). April 1 will be preview 1. Goals
are:

-  2 week feature freeze to current and then branch
-  Going to do 4.6 in June, 4.7 in October, and 4.8 in Feb 2003.
-  Developer preview 2 in June around Usenix.
-  For architectures we hope to do Sparc64 on April 1.

Got a bit of a feature list for 5.0 final. SMPng is broken down into
several sections. UFS2. KSE. PAM overhaul. TrustedBSD etc.

I'd like some feedback on this.

Discussion
~~~~~~~~~~

.. raw:: html

   <div class="discussion">

**Warner** : Are we doing to try to have the developer release 2 done so
we can hand out CDs at Usenix?

**John** : That might be pushing it.

**Anon** : Can we push Usenix back a bit? (Laughter)

**David** : Feature freeze is a code slush. Will I as a committer see a
freeze?

**Murray** : You will not have to worry about bug fixes but you must act
rationally.

**Paul R** : Do we really need multiple release branches?

**Robert** : Good to have around.

**Alfred** : Could we reach a consensus on what sort of debugging will
be in 5.0?

**Robert** : We want to get this to early access people.

**Murray** : This is an opt in thing anyway.

**Alfred** : We need a list of the debug options etc.

**Warner** : The cardbus will ship with debugging turned on but its
tunable.

**PoulHK** : We need to know if we're going to turn off the a/j options
on malloc3().

**Doug** : I don't know how tied you are to the release schedule. If you
want to spend all of October polishing. If we go backwards from October
we can do Release 1 on May 15. April 1st is too soon and puts you in
weird categories relative to Usenix.

**Murray** : The way we have it set up now... (Graphic)

::

      April 1 (DP 1)

        June 9-14 (Usenix)

        June 25 (DP2)

        October 1st is Feature Freeze

        October 20th is Code Freeze

        Nov 20th 5.0 Release

    ALTERNATE

        May 15 DP 1

        July DP 2

**Murray** : The number of people running current is too small.

**Paul Richards** : Not much point in doing DP 1 if DP2 is totally
different.

**Murray** : But that means that other non SMP stuff is still not in.

**David** : People are talking about what they're planning for 5.0
Perhaps you might to poll the people who have balls in the air. Is there
anything that April 1 is going to give us?

**Murray** : Wide spread testing.

**Alfred** : I think the sooner the better.

**Justin** : Why do we think that just because we put together a shrink
wrap that people will use it?

**Murray** : Because its a discipline on all of us to get this stuff in
there. If we're moving towards a goal we need to do that.

**Justin** : This is not about the final release but about what is in
the tree today. Therefore the first preview is not an interesting
release.

**Murray** : Its concrete steps towards 5.0 release.

**Justin** : I don't know that it's necessary.

**Doug** : We're going to have people generating bug reports against
things that are spurious problem reports.

**Warner** : Cardbus vs. PCI interrupt routing is an example of this.

**Justin** : I guess the way I look at this is that we force
productization is to force the date. Why is it that on a daily basis
that things suck so bad?

**David** : Why does it suck so bad?

**Justin** : Because people don't get shat on for breaking things.

**Robert** : Why does it suck?

**Justin** : I put it on my server and its slow. Instead of fixing PCI
interrupts.

**PoulHK** : I'd like to point out that we have substantial historical
experience with all .0 releases. It is indisputable that a snapshot
CDROM makes people run it. Getting something out there is crucial to the
testing of CURRENT. If we simply call this current snapshot that will be
best. Set your date and roll your CD.

**Gnn** : These are different issues.

**Justin** : The people that used to complain about it but don't
anymore.

**Alfred** : We have 4 more platforms, it's more difficult now.

**Murray** : We have build machines etc.

**Justin** : When I first joined people were in it because they had to
do stuff incorrectly because they had to do things on time. If we're
going to engineer a real product then yeah, it's difficult but that's
the reason why this is a cool project. So just giving up and saying it
is hard is BS.

**Gnn** : Process, process, process...

**Julian** : Breaking the build is not as bad as breaking the kernel.
What's harder is committing a subsystem that affects another subsystem.
In terms of the process I'd like to see a best practices document. On
how people develop patches etc. A list of things you should do etc.

**David** : You can do that from freefall.

**Julian** : As soon as I find out its broken I'll fix it.

**David** : I have posted them many times.

**Justin** : One other thing I would suggest is that instead of becoming
active only during release you should be doing this full time. If people
start putting stuff in the tree today that's not going in to 5.0 then
slap their hands. Make a window so that people...

**Peter** : The Mozilla tackled the build problems with tinderbox. This
will solve a lot of problems.

::

      while (1)
        {
              build
              if (break)
             send mail to those who committed most recently
              else
                 clear list of recent committers
        }

**Nick S** : The suggestion that tangential features should be barred
until after 5.0 bugs me.

**Justin** : It should not be your arbitrary decision. It should be
whatever body is empowered to make that decision.

**Robert** : We're using the Usenix to November window.

**Paul Richards** : This is a volunteer project. In our volunteer time
we wanted to what we couldn't do in our normal jobs. Volunteers will do
things by rules.

**PoulHK** : This project was started by people for fun. Every time you
use the word enforce you get fun--. It is much better to inspire than to
enforce. You should not let people get away with things. I hate to say
this but some times you need to slap fingers. Many times people will
thank you for it. We see it again that people go off and need to be
brought back.

**Robert** : We have 10 minutes left. Let's wrap up.

**Paul Richards** : Can we take Justin's proposal?

**Peter** : Going from chaos to clamp down. This can push a code fork.

**Doug** : One is that in regards to PoulHK said in addition to the
potential cost of disciplining a committer you have to measure the cost
against the others who want that person gone. How many more people could
we attract if that stress wasn't present.

**Justin** : You either have a good manager or a bad manager. Good
managers trust you. Are the people in the release engineering team going
to be good managers?

**Peter** : The MFC process seems to work nicely but going further may
not be the best idea.

**Robert** : Do you think the schedule is going too far?

**Julian** : Usenix may not be such a large audience to worry about.
People there are technical enough. On how many snapshots we have. I've
been wondering whether we should have 5.0 on the disc but 5.0 and the
cvs tree and cvsup so people can easily upgrade. Bootstrap CDs.

**Murray** : Any issues with the name?

**PoulHK** : Why not snapshot?

**Warner** : I think the dates look good but I would pick a different.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="topic">

--------------

Concluding Remarks - Robert Watson
----------------------------------

.. raw:: html

   <div class="discussion">

**Robert** : Should we do another of these at Usenix?

**All** : Yes.

**John** : 2 days?

**Robert** : What could we do better?

**Sundry** : parking validation, connectivity, projector, catered lunch,
...

**PoulHK** : I would like to propose we make a formal hour every month
to talk about on irc?

.. raw:: html

   </div>

.. raw:: html

   </div>

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

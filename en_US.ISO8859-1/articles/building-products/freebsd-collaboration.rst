=============================
3.?Collaborating with FreeBSD
=============================

.. raw:: html

   <div class="navheader">

3.?Collaborating with FreeBSD
`Prev <freebsd-intro.html>`__?
?
?\ `Next <conclusion.html>`__

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

3.?Collaborating with FreeBSD
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Open-source projects like FreeBSD offer finished code of a very high
quality [`Cov2005 <bi01.html#idp64232656>`__\ ]. Previous studies have
examined the effect of source code availability on software development
[`Com2004 <bi01.html#idp64203344>`__\ ].

While access to quality source code can reduce the cost of initial
development, in the long-term the costs of managing change begin to
dominate. As computing environments change over the years and new
security vulnerabilities are discovered, your product too needs to
change and adapt. Using open-source code is best viewed not as a one-off
activity, but as an *ongoing process*. The best projects to collaborate
with are the ones that are *live*; i.e., with an active community, clear
goals and a transparent working style.

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD has an active developer community around it. At the time of
   writing there are many thousands of contributors from every populated
   continent in the world and over 300 individuals with write access to
   the project's source repositories.
-  The goals of the FreeBSD project are
   [`Hub1994 <bi01.html#idp64262864>`__\ ]:

   .. raw:: html

      <div class="itemizedlist">

   -  To develop a high-quality operating system for popular computer
      hardware, and,
   -  To make our work available to all under a liberal license.

   .. raw:: html

      </div>

-  FreeBSD enjoys an open and transparent working culture. Nearly all
   discussion in the project happens by email, on `public mailing
   lists <http://lists.FreeBSD.org/mailman/listinfo>`__ that are also
   archived for posterity. The project's policies are
   `documented <../../../../internal/policies.html>`__ and maintained
   under revision control. Participation in the project is open to all.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Understanding FreeBSD culture
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To be able to work effectively with the FreeBSD project, you need to
understand the project's culture.

Volunteer driven projects operate under different rules than for-profit
corporates. A common mistake that companies make when venturing into the
open-source world is that of underplaying these differences.

Motivation.?Most contributions to FreeBSD are done voluntarily without
monetary rewards entering the picture. The factors that motivate
individuals are complex, ranging from altruism, to an interest in
solving the kinds of problems that FreeBSD attempts to solve. In this
environment, “elegance is never optional”
[`Nor1993 <bi01.html#idp64344400>`__\ ].

The Long Term View.?FreeBSD traces its roots back nearly twenty years to
the work of the Computer Science Research Group at the University of
California Berkeley.`:sup:`[1]` <#ftn.idp64077008>`__ A number of the
original CSRG developers remain associated with the project.

The project values long-term perspectives
[`Nor2001 <bi01.html#idp64356560>`__\ ]. A frequent acronym encountered
in the project is DTRT, which stands for “Do The Right Thing”.

Development Processes.?Computer programs are tools for communication: at
one level programmers communicate their intentions using a precise
notation to a tool (a compiler) that translates their instructions to
executable code. At another level, the same notation is used for
communication of intent between two programmers.

Formal specifications and design documents are seldom used in the
project. Clear and well-written code and well-written change logs
(`Figure?3, “A sample change log
entry” <freebsd-collaboration.html#fig-change-log>`__) are used in their
place. FreeBSD development happens by “rough consensus and running code”
[`Carp1996 <bi01.html#idp64189776>`__\ ].

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?3.?A sample change log entry

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    r151864 | bde | 2005-10-29 09:34:50 -0700 (Sat, 29 Oct 2005) | 13 lines
    Changed paths:
       M /head/lib/msun/src/e_rem_pio2f.c

    Use double precision to simplify and optimize arg reduction for small
    and medium size args too: instead of conditionally subtracting a float
    17+24, 17+17+24 or 17+17+17+24 bit approximation to pi/2, always
    subtract a double 33+53 bit one.  The float version is now closer to
    the double version than to old versions of itself -- it uses the same
    33+53 bit approximation as the simplest cases in the double version,
    and where the float version had to switch to the slow general case at
    |x| == 2^7*pi/2, it now switches at |x| == 2^19*pi/2 the same as the
    double version.

    This speeds up arg reduction by a factor of 2 for |x| between 3*pi/4 and
    2^7*pi/4, and by a factor of 7 for |x| between 2^7*pi/4 and 2^19*pi/4.
            

.. raw:: html

   </div>

.. raw:: html

   </div>

Communication between programmers is enhanced by the use of a common
coding standard
`style(9) <http://www.FreeBSD.org/cgi/man.cgi?query=style&sektion=9>`__.

Communication Channels.?FreeBSD's contributors are spread across the
world. Email (and to a lesser extent, IRC) is the preferred means of
communication in the project.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.?Best Practices for collaborating with the FreeBSD project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We now look at a few best practices for making the best use of FreeBSD
in product development.

.. raw:: html

   <div class="variablelist">

Plan for the long term
    Setup processes that help in tracking the development of FreeBSD.
    For example:

    Track FreeBSD source code.?The project makes it easy to mirror its
    SVN repository using
    `svnsync <../../../../doc/en_US.ISO8859-1/articles/committers-guide/article.html#svn-advanced-use-setting-up-svnsync>`__.
    Having the complete history of the source is useful when debugging
    complex problems and offers valuable insight into the intentions of
    the original developers. Use a capable source control system that
    allows you to easily merge changes between the upstream FreeBSD code
    base and your own in-house code.

    `Figure?4, “An annotated source listing generated using
    ``svn blame``\ ” <freebsd-collaboration.html#fig-svn-blame>`__ shows
    a portion of an annotated listing of the file referenced by the
    change log in `Figure?3, “A sample change log
    entry” <freebsd-collaboration.html#fig-change-log>`__. The ancestry
    of each line of the source is clearly visible. Annotated listings
    showing the history of every file that is part of FreeBSD are
    `available on the web <http://svnweb.freebsd.org/>`__.

    .. raw:: html

       <div class="figure">

    .. raw:: html

       <div class="figure-title">

    Figure?4.?An annotated source listing generated using ``svn blame``

    .. raw:: html

       </div>

    .. raw:: html

       <div class="figure-contents">

    .. code:: programlisting


        #REV         #WHO #DATE                                        #TEXT

        176410        bde 2008-02-19 07:42:46 -0800 (Tue, 19 Feb 2008) #include <sys/cdefs.h>
        176410        bde 2008-02-19 07:42:46 -0800 (Tue, 19 Feb 2008) __FBSDID("$FreeBSD$");
          2116        jkh 1994-08-19 02:40:01 -0700 (Fri, 19 Aug 1994) 
          2116        jkh 1994-08-19 02:40:01 -0700 (Fri, 19 Aug 1994) /* __ieee754_rem_pio2f(x,y)
          8870    rgrimes 1995-05-29 22:51:47 -0700 (Mon, 29 May 1995)  *
        176552        bde 2008-02-25 05:33:20 -0800 (Mon, 25 Feb 2008)  * return the remainder of x rem pi/2 in *y
        176552        bde 2008-02-25 05:33:20 -0800 (Mon, 25 Feb 2008)  * use double precision for everything except passing x
        152535        bde 2005-11-16 18:20:04 -0800 (Wed, 16 Nov 2005)  * use __kernel_rem_pio2() for large x
          2116        jkh 1994-08-19 02:40:01 -0700 (Fri, 19 Aug 1994)  */
          2116        jkh 1994-08-19 02:40:01 -0700 (Fri, 19 Aug 1994) 
        176465        bde 2008-02-22 07:55:14 -0800 (Fri, 22 Feb 2008) #include <float.h>
        176465        bde 2008-02-22 07:55:14 -0800 (Fri, 22 Feb 2008) 
          2116        jkh 1994-08-19 02:40:01 -0700 (Fri, 19 Aug 1994) #include "math.h"

                      

    .. raw:: html

       </div>

    .. raw:: html

       </div>

    | 

    Use a gatekeeper.?Appoint a *gatekeeper* to monitor FreeBSD
    development, to keep an eye out for changes that could potentially
    impact your products.

    Report bugs upstream.?If you notice bug in the FreeBSD code that you
    are using, file a `bug
    report <https://www.FreeBSD.org/support/bugreports.html>`__. This
    step helps ensure that you do not have to fix the bug the next time
    you take a code drop from upstream.

Leverage FreeBSD's release engineering efforts
    Use code from a -STABLE development branch of FreeBSD. These
    development branches are formally supported by FreeBSD's release
    engineering and security teams and comprise of tested code.
Donate code to reduce costs
    A major proportion of the costs associated with developing products
    is that of doing maintenance. By donating non-critical code to the
    project, you benefit by having your code see much wider exposure
    than it would otherwise get. This in turn leads to more bugs and
    security vulnerabilities being flushed out and performance anomalies
    being identified and fixed.
Get support effectively
    For products with tight deadlines, it is recommended that you hire
    or enter into a consulting agreement with a developer or firm with
    FreeBSD experience. The `FreeBSD related employment mailing
    list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-jobs>`__ is
    a useful communication channel to find talent. The FreeBSD project
    maintains a `gallery of consultants and consulting
    firms <../../../../commercial/consult_bycat.html>`__ undertaking
    FreeBSD work. The `BSD Certification
    Group <http://www.bsdcertification.org/>`__ offers certification for
    all the major BSD derived OSes.

    For less critical needs, you can ask for help on the `project
    mailing lists <http://lists.FreeBSD.org/mailman/listinfo>`__. A
    useful guide to follow when asking for help is given in
    [`Ray2004 <bi01.html#idp64381392>`__\ ].

Publicize your involvement
    You are not required to publicize your use of FreeBSD, but doing so
    helps both your effort as well as that of the project.

    Letting the FreeBSD community know that your company uses FreeBSD
    helps improve your chances of attracting high quality talent. A
    large roster of support for FreeBSD also means more mind share for
    it among developers. This in turn yields a healthier foundation for
    your future.

Support FreeBSD developers
    Sometimes the most direct way to get a desired feature into FreeBSD
    is to support a developer who is already looking at a related
    problem. Help can range from hardware donations to direct financial
    assistance. In some countries, donations to the FreeBSD project
    enjoy tax benefits. The project has a dedicated `donations
    liaison <../../../../donations/>`__ to assist donors. The project
    also maintains a web page where developers `list their
    needs <../../../../donations/wantlist.html>`__.

    As a policy the FreeBSD project
    `acknowledges <../../../../doc/en_US.ISO8859-1/articles/contributors>`__
    all contributions received on its web site.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64077008" class="footnote">

`:sup:`[1]` <#idp64077008>`__\ FreeBSD's `source
repository <http://svnweb.freebsd.org/>`__ contains a history of the
project since its inception, and there are `CDROMs
available <http://www.mckusick.com/csrg/>`__ that contain earlier code
from the CSRG.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------+---------------------------------+
| `Prev <freebsd-intro.html>`__?            | ?                       | ?\ `Next <conclusion.html>`__   |
+-------------------------------------------+-------------------------+---------------------------------+
| 2.?FreeBSD as a set of building blocks?   | `Home <index.html>`__   | ?4.?Conclusion                  |
+-------------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

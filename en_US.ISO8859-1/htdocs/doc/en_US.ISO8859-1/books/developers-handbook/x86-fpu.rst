====================
11.13.?Using the FPU
====================

.. raw:: html

   <div class="navheader">

11.13.?Using the FPU
`Prev <x86-one-pointed-mind.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-caveats.html>`__

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

11.13.?Using the FPU
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Strangely enough, most of assembly language literature does not even
mention the existence of the FPU, or *floating point unit*, let alone
discuss programming it.

Yet, never does assembly language shine more than when we create highly
optimized FPU code by doing things that can be done *only* in assembly
language.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.1.?Organization of the FPU
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FPU consists of 8 80–bit floating–point registers. These are
organized in a stack fashion—you can ``push`` a value on TOS (*top of
stack*) and you can ``pop`` it.

That said, the assembly language op codes are not ``push`` and ``pop``
because those are already taken.

You can ``push`` a value on TOS by using ``fld``, ``fild``, and
``fbld``. Several other op codes let you ``push`` many common
*constants*—such as *pi*—on the TOS.

Similarly, you can ``pop`` a value by using ``fst``, ``fstp``, ``fist``,
``fistp``, and ``fbstp``. Actually, only the op codes that end with a
*p* will literally ``pop`` the value, the rest will ``store`` it
somewhere else without removing it from the TOS.

We can transfer the data between the TOS and the computer memory either
as a 32–bit, 64–bit, or 80–bit *real*, a 16–bit, 32–bit, or 64–bit
*integer*, or an 80–bit *packed decimal*.

The 80–bit *packed decimal* is a special case of *binary coded decimal*
which is very convenient when converting between the ASCII
representation of data and the internal data of the FPU. It allows us to
use 18 significant digits.

No matter how we represent data in the memory, the FPU always stores it
in the 80–bit *real* format in its registers.

Its internal precision is at least 19 decimal digits, so even if we
choose to display results as ASCII in the full 18–digit precision, we
are still showing correct results.

We can perform mathematical operations on the TOS: We can calculate its
*sine*, we can *scale* it (i.e., we can multiply or divide it by a power
of 2), we can calculate its base–2 *logarithm*, and many other things.

We can also *multiply* or *divide* it by, *add* it to, or *subtract* it
from, any of the FPU registers (including itself).

The official Intel op code for the TOS is ``st``, and for the
*registers* ``st(0)``–``st(7)``. ``st`` and ``st(0)``, then, refer to
the same register.

For whatever reasons, the original author of nasm has decided to use
different op codes, namely ``st0``–``st7``. In other words, there are no
parentheses, and the TOS is always ``st0``, never just ``st``.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.1.1.?The Packed Decimal Format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The *packed decimal* format uses 10 bytes (80 bits) of memory to
represent 18 digits. The number represented there is always an
*integer*.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

You can use it to get decimal places by multiplying the TOS by a power
of 10 first.

.. raw:: html

   </div>

The highest bit of the highest byte (byte 9) is the *sign bit*: If it is
set, the number is *negative*, otherwise, it is *positive*. The rest of
the bits of this byte are unused/ignored.

The remaining 9 bytes store the 18 digits of the number: 2 digits per
byte.

The *more significant digit* is stored in the high *nibble* (4 bits),
the *less significant digit* in the low *nibble*.

That said, you might think that ``-1234567`` would be stored in the
memory like this (using hexadecimal notation):

.. code:: programlisting

    80 00 00 00 00 00 01 23 45 67

Alas it is not! As with everything else of Intel make, even the *packed
decimal* is *little–endian*.

That means our ``-1234567`` is stored like this:

.. code:: programlisting

    67 45 23 01 00 00 00 00 00 80

Remember that, or you will be pulling your hair out in desperation!

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The book to read—if you can find it—is Richard Startz' `8087/80287/80387
for the IBM PC &
Compatibles <http://www.int80h.org/cgi-bin/isbn?isbn=013246604X>`__.
Though it does seem to take the fact about the little–endian storage of
the *packed decimal* for granted. I kid you not about the desperation of
trying to figure out what was wrong with the filter I show below
*before* it occurred to me I should try the little–endian order even for
this type of data.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

11.13.2.?Excursion to Pinhole Photography
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To write meaningful software, we must not only understand our
programming tools, but also the field we are creating software for.

Our next filter will help us whenever we want to build a *pinhole
camera*, so, we need some background in *pinhole photography* before we
can continue.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.2.1.?The Camera
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The easiest way to describe any camera ever built is as some empty space
enclosed in some lightproof material, with a small hole in the
enclosure.

The enclosure is usually sturdy (e.g., a box), though sometimes it is
flexible (the bellows). It is quite dark inside the camera. However, the
hole lets light rays in through a single point (though in some cases
there may be several). These light rays form an image, a representation
of whatever is outside the camera, in front of the hole.

If some light sensitive material (such as film) is placed inside the
camera, it can capture the image.

The hole often contains a *lens*, or a lens assembly, often called the
*objective*.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.2.2.?The Pinhole
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

But, strictly speaking, the lens is not necessary: The original cameras
did not use a lens but a *pinhole*. Even today, *pinholes* are used,
both as a tool to study how cameras work, and to achieve a special kind
of image.

The image produced by the *pinhole* is all equally sharp. Or *blurred*.
There is an ideal size for a pinhole: If it is either larger or smaller,
the image loses its sharpness.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.2.3.?Focal Length
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This ideal pinhole diameter is a function of the square root of *focal
length*, which is the distance of the pinhole from the film.

.. code:: programlisting

        D = PC * sqrt(FL)

In here, ``D`` is the ideal diameter of the pinhole, ``FL`` is the focal
length, and ``PC`` is a pinhole constant. According to Jay Bender, its
value is ``0.04``, while Kenneth Connors has determined it to be
``0.037``. Others have proposed other values. Plus, this value is for
the daylight only: Other types of light will require a different
constant, whose value can only be determined by experimentation.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.2.4.?The F–Number
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The f–number is a very useful measure of how much light reaches the
film. A light meter can determine that, for example, to expose a film of
specific sensitivity with f5.6 may require the exposure to last 1/1000
sec.

It does not matter whether it is a 35–mm camera, or a 6x9cm camera, etc.
As long as we know the f–number, we can determine the proper exposure.

The f–number is easy to calculate:

.. code:: programlisting

        F = FL / D

In other words, the f–number equals the focal length divided by the
diameter of the pinhole. It also means a higher f–number either implies
a smaller pinhole or a larger focal distance, or both. That, in turn,
implies, the higher the f–number, the longer the exposure has to be.

Furthermore, while pinhole diameter and focal distance are
one–dimensional measurements, both, the film and the pinhole, are
two–dimensional. That means that if you have measured the exposure at
f–number ``A`` as ``t``, then the exposure at f–number ``B`` is:

.. code:: programlisting

        t * (B / A)?

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.2.5.?Normalized F–Number
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While many modern cameras can change the diameter of their pinhole, and
thus their f–number, quite smoothly and gradually, such was not always
the case.

To allow for different f–numbers, cameras typically contained a metal
plate with several holes of different sizes drilled to them.

Their sizes were chosen according to the above formula in such a way
that the resultant f–number was one of standard f–numbers used on all
cameras everywhere. For example, a very old Kodak Duaflex IV camera in
my possession has three such holes for f–numbers 8, 11, and 16.

A more recently made camera may offer f–numbers of 2.8, 4, 5.6, 8, 11,
16, 22, and 32 (as well as others). These numbers were not chosen
arbitrarily: They all are powers of the square root of 2, though they
may be rounded somewhat.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.2.6.?The F–Stop
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A typical camera is designed in such a way that setting any of the
normalized f–numbers changes the feel of the dial. It will naturally
*stop* in that position. Because of that, these positions of the dial
are called f–stops.

Since the f–numbers at each stop are powers of the square root of 2,
moving the dial by 1 stop will double the amount of light required for
proper exposure. Moving it by 2 stops will quadruple the required
exposure. Moving the dial by 3 stops will require the increase in
exposure 8 times, etc.

.. raw:: html

   </div>

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

11.13.3.?Designing the Pinhole Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We are now ready to decide what exactly we want our pinhole software to
do.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.3.1.?Processing Program Input
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since its main purpose is to help us design a working pinhole camera, we
will use the *focal length* as the input to the program. This is
something we can determine without software: Proper focal length is
determined by the size of the film and by the need to shoot "regular"
pictures, wide angle pictures, or telephoto pictures.

Most of the programs we have written so far worked with individual
characters, or bytes, as their input: The hex program converted
individual bytes into a hexadecimal number, the csv program either let a
character through, or deleted it, or changed it to a different
character, etc.

One program, ftuc used the state machine to consider at most two input
bytes at a time.

But our pinhole program cannot just work with individual characters, it
has to deal with larger syntactic units.

For example, if we want the program to calculate the pinhole diameter
(and other values we will discuss later) at the focal lengths of
``100 mm``, ``150 mm``, and ``210 mm``, we may want to enter something
like this:

.. code:: screen

    100, 150, 210

Our program needs to consider more than a single byte of input at a
time. When it sees the first ``1``, it must understand it is seeing the
first digit of a decimal number. When it sees the ``0`` and the other
``0``, it must know it is seeing more digits of the same number.

When it encounters the first comma, it must know it is no longer
receiving the digits of the first number. It must be able to convert the
digits of the first number into the value of ``100``. And the digits of
the second number into the value of ``150``. And, of course, the digits
of the third number into the numeric value of ``210``.

We need to decide what delimiters to accept: Do the input numbers have
to be separated by a comma? If so, how do we treat two numbers separated
by something else?

Personally, I like to keep it simple. Something either is a number, so I
process it. Or it is not a number, so I discard it. I do not like the
computer complaining about me typing in an extra character when it is
*obvious* that it is an extra character. Duh!

Plus, it allows me to break up the monotony of computing and type in a
query instead of just a number:

.. code:: screen

    What is the best pinhole diameter for the focal length of 150?

There is no reason for the computer to spit out a number of complaints:

.. code:: screen

    Syntax error: What
    Syntax error: is
    Syntax error: the
    Syntax error: best

Et cetera, et cetera, et cetera.

Secondly, I like the ``#`` character to denote the start of a comment
which extends to the end of the line. This does not take too much effort
to code, and lets me treat input files for my software as executable
scripts.

In our case, we also need to decide what units the input should come in:
We choose *millimeters* because that is how most photographers measure
the focus length.

Finally, we need to decide whether to allow the use of the decimal point
(in which case we must also consider the fact that much of the world
uses a decimal *comma*).

In our case allowing for the decimal point/comma would offer a false
sense of precision: There is little if any noticeable difference between
the focus lengths of ``50`` and ``51``, so allowing the user to input
something like ``50.5`` is not a good idea. This is my opinion, mind
you, but I am the one writing this program. You can make other choices
in yours, of course.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.3.2.?Offering Options
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The most important thing we need to know when building a pinhole camera
is the diameter of the pinhole. Since we want to shoot sharp images, we
will use the above formula to calculate the pinhole diameter from focal
length. As experts are offering several different values for the ``PC``
constant, we will need to have the choice.

It is traditional in UNIX? programming to have two main ways of choosing
program parameters, plus to have a default for the time the user does
not make a choice.

Why have two ways of choosing?

One is to allow a (relatively) *permanent* choice that applies
automatically each time the software is run without us having to tell it
over and over what we want it to do.

The permanent choices may be stored in a configuration file, typically
found in the user's home directory. The file usually has the same name
as the application but is started with a dot. Often *"rc"* is added to
the file name. So, ours could be ``~/.pinhole`` or ``~/.pinholerc``.
(The ``~/`` means current user's home directory.)

The configuration file is used mostly by programs that have many
configurable parameters. Those that have only one (or a few) often use a
different method: They expect to find the parameter in an *environment
variable*. In our case, we might look at an environment variable named
``PINHOLE``.

Usually, a program uses one or the other of the above methods.
Otherwise, if a configuration file said one thing, but an environment
variable another, the program might get confused (or just too
complicated).

Because we only need to choose *one* such parameter, we will go with the
second method and search the environment for a variable named
``PINHOLE``.

The other way allows us to make *ad hoc* decisions: *"Though I usually
want you to use 0.039, this time I want 0.03872."* In other words, it
allows us to *override* the permanent choice.

This type of choice is usually done with command line parameters.

Finally, a program *always* needs a *default*. The user may not make any
choices. Perhaps he does not know what to choose. Perhaps he is "just
browsing." Preferably, the default will be the value most users would
choose anyway. That way they do not need to choose. Or, rather, they can
choose the default without an additional effort.

Given this system, the program may find conflicting options, and handle
them this way:

.. raw:: html

   <div class="procedure">

#. If it finds an *ad hoc* choice (e.g., command line parameter), it
   should accept that choice. It must ignore any permanent choice and
   any default.

#. *Otherwise*, if it finds a permanent option (e.g., an environment
   variable), it should accept it, and ignore the default.

#. *Otherwise*, it should use the default.

.. raw:: html

   </div>

We also need to decide what *format* our ``PC`` option should have.

At first site, it seems obvious to use the ``PINHOLE=0.04`` format for
the environment variable, and *``-p0.04``* for the command line.

Allowing that is actually a security risk. The ``PC`` constant is a very
small number. Naturally, we will test our software using various small
values of ``PC``. But what will happen if someone runs the program
choosing a huge value?

It may crash the program because we have not designed it to handle huge
numbers.

Or, we may spend more time on the program so it can handle huge numbers.
We might do that if we were writing commercial software for computer
illiterate audience.

Or, we might say, *"Tough! The user should know better.""*

Or, we just may make it impossible for the user to enter a huge number.
This is the approach we will take: We will use an *implied 0.* prefix.

In other words, if the user wants ``0.04``, we will expect him to type
*``-p04``*, or set ``PINHOLE=04`` in his environment. So, if he says
*``-p9999999``*, we will interpret it as ``0.9999999``—still ridiculous
but at least safer.

Secondly, many users will just want to go with either Bender's constant
or Connors' constant. To make it easier on them, we will interpret
*``-b``* as identical to *``-p04``*, and *``-c``* as identical to
*``-p037``*.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.3.3.?The Output
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We need to decide what we want our software to send to the output, and
in what format.

Since our input allows for an unspecified number of focal length
entries, it makes sense to use a traditional database–style output of
showing the result of the calculation for each focal length on a
separate line, while separating all values on one line by a ``tab``
character.

Optionally, we should also allow the user to specify the use of the CSV
format we have studied earlier. In this case, we will print out a line
of comma–separated names describing each field of every line, then show
our results as before, but substituting a ``comma`` for the ``tab``.

We need a command line option for the CSV format. We cannot use *``-c``*
because that already means *use Connors' constant*. For some strange
reason, many web sites refer to CSV files as *"Excel spreadsheet"*
(though the CSV format predates Excel). We will, therefore, use the
*``-e``* switch to inform our software we want the output in the CSV
format.

We will start each line of the output with the focal length. This may
sound repetitious at first, especially in the interactive mode: The user
types in the focal length, and we are repeating it.

But the user can type several focal lengths on one line. The input can
also come in from a file or from the output of another program. In that
case the user does not see the input at all.

By the same token, the output can go to a file which we will want to
examine later, or it could go to the printer, or become the input of
another program.

So, it makes perfect sense to start each line with the focal length as
entered by the user.

No, wait! Not as entered by the user. What if the user types in
something like this:

.. code:: screen

    00000000150

Clearly, we need to strip those leading zeros.

So, we might consider reading the user input as is, converting it to
binary inside the FPU, and printing it out from there.

But...

What if the user types something like this:

.. code:: screen

    17459765723452353453534535353530530534563507309676764423

Ha! The packed decimal FPU format lets us input 18–digit numbers. But
the user has entered more than 18 digits. How do we handle that?

Well, we *could* modify our code to read the first 18 digits, enter it
to the FPU, then read more, multiply what we already have on the TOS by
10 raised to the number of additional digits, then ``add`` to it.

Yes, we could do that. But in *this* program it would be ridiculous (in
a different one it may be just the thing to do): Even the circumference
of the Earth expressed in millimeters only takes 11 digits. Clearly, we
cannot build a camera that large (not yet, anyway).

So, if the user enters such a huge number, he is either bored, or
testing us, or trying to break into the system, or playing games—doing
anything but designing a pinhole camera.

What will we do?

We will slap him in the face, in a manner of speaking:

.. code:: screen

    17459765723452353453534535353530530534563507309676764423  ??? ??? ??? ??? ???

To achieve that, we will simply ignore any leading zeros. Once we find a
non–zero digit, we will initialize a counter to ``0`` and start taking
three steps:

.. raw:: html

   <div class="procedure">

#. Send the digit to the output.

#. Append the digit to a buffer we will use later to produce the packed
   decimal we can send to the FPU.

#. Increase the counter.

.. raw:: html

   </div>

Now, while we are taking these three steps, we also need to watch out
for one of two conditions:

.. raw:: html

   <div class="itemizedlist">

-  If the counter grows above 18, we stop appending to the buffer. We
   continue reading the digits and sending them to the output.

-  If, or rather *when*, the next input character is not a digit, we are
   done inputting for now.

   Incidentally, we can simply discard the non–digit, unless it is a
   ``#``, which we must return to the input stream. It starts a comment,
   so we must see it after we are done producing output and start
   looking for more input.

.. raw:: html

   </div>

That still leaves one possibility uncovered: If all the user enters is a
zero (or several zeros), we will never find a non–zero to display.

We can determine this has happened whenever our counter stays at ``0``.
In that case we need to send ``0`` to the output, and perform another
"slap in the face":

.. code:: screen

    0   ??? ??? ??? ??? ???

Once we have displayed the focal length and determined it is valid
(greater than ``0`` but not exceeding 18 digits), we can calculate the
pinhole diameter.

It is not by coincidence that *pinhole* contains the word *pin*. Indeed,
many a pinhole literally is a *pin hole*, a hole carefully punched with
the tip of a pin.

That is because a typical pinhole is very small. Our formula gets the
result in millimeters. We will multiply it by ``1000``, so we can output
the result in *microns*.

At this point we have yet another trap to face: *Too much precision.*

Yes, the FPU was designed for high precision mathematics. But we are not
dealing with high precision mathematics. We are dealing with physics
(optics, specifically).

Suppose we want to convert a truck into a pinhole camera (we would not
be the first ones to do that!). Suppose its box is ``12`` meters long,
so we have the focal length of ``12000``. Well, using Bender's constant,
it gives us square root of ``12000`` multiplied by ``0.04``, which is
``4.381780460`` millimeters, or ``4381.780460`` microns.

Put either way, the result is absurdly precise. Our truck is not
*exactly* ``12000`` millimeters long. We did not measure its length with
such a precision, so stating we need a pinhole with the diameter of
``4.381780460`` millimeters is, well, deceiving. ``4.4`` millimeters
would do just fine.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

I "only" used ten digits in the above example. Imagine the absurdity of
going for all 18!

.. raw:: html

   </div>

We need to limit the number of significant digits of our result. One way
of doing it is by using an integer representing microns. So, our truck
would need a pinhole with the diameter of ``4382`` microns. Looking at
that number, we still decide that ``4400`` microns, or ``4.4``
millimeters is close enough.

Additionally, we can decide that no matter how big a result we get, we
only want to display four significant digits (or any other number of
them, of course). Alas, the FPU does not offer rounding to a specific
number of digits (after all, it does not view the numbers as decimal but
as binary).

We, therefore, must devise an algorithm to reduce the number of
significant digits.

Here is mine (I think it is awkward—if you know a better one, *please*,
let me know):

.. raw:: html

   <div class="procedure">

#. Initialize a counter to ``0``.

#. While the number is greater than or equal to ``10000``, divide it by
   ``10`` and increase the counter.

#. Output the result.

#. While the counter is greater than ``0``, output ``0`` and decrease
   the counter.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``10000`` is only good if you want *four* significant digits. For
any other number of significant digits, replace ``10000`` with ``10``
raised to the number of significant digits.

.. raw:: html

   </div>

We will, then, output the pinhole diameter in microns, rounded off to
four significant digits.

At this point, we know the *focal length* and the *pinhole diameter*.
That means we have enough information to also calculate the *f–number*.

We will display the f–number, rounded to four significant digits.
Chances are the f–number will tell us very little. To make it more
meaningful, we can find the nearest *normalized f–number*, i.e., the
nearest power of the square root of 2.

We do that by multiplying the actual f–number by itself, which, of
course, will give us its ``square``. We will then calculate its base–2
logarithm, which is much easier to do than calculating the
base–square–root–of–2 logarithm! We will round the result to the nearest
integer. Next, we will raise 2 to the result. Actually, the FPU gives us
a good shortcut to do that: We can use the ``fscale`` op code to "scale"
1, which is analogous to ``shift``\ ing an integer left. Finally, we
calculate the square root of it all, and we have the nearest normalized
f–number.

If all that sounds overwhelming—or too much work, perhaps—it may become
much clearer if you see the code. It takes 9 op codes altogether:

.. code:: programlisting

        fmul    st0, st0
        fld1
        fld st1
        fyl2x
        frndint
        fld1
        fscale
        fsqrt
        fstp    st1

The first line, ``fmul st0, st0``, squares the contents of the TOS (top
of the stack, same as ``st``, called ``st0`` by nasm). The ``fld1``
pushes ``1`` on the TOS.

The next line, ``fld st1``, pushes the square back to the TOS. At this
point the square is both in ``st`` and ``st(2)`` (it will become clear
why we leave a second copy on the stack in a moment). ``st(1)`` contains
``1``.

Next, ``fyl2x`` calculates base–2 logarithm of ``st`` multiplied by
``st(1)``. That is why we placed ``1`` on ``st(1)`` before.

At this point, ``st`` contains the logarithm we have just calculated,
``st(1)`` contains the square of the actual f–number we saved for later.

``frndint`` rounds the TOS to the nearest integer. ``fld1`` pushes a
``1``. ``fscale`` shifts the ``1`` we have on the TOS by the value in
``st(1)``, effectively raising 2 to ``st(1)``.

Finally, ``fsqrt`` calculates the square root of the result, i.e., the
nearest normalized f–number.

We now have the nearest normalized f–number on the TOS, the base–2
logarithm rounded to the nearest integer in ``st(1)``, and the square of
the actual f–number in ``st(2)``. We are saving the value in ``st(2)``
for later.

But we do not need the contents of ``st(1)`` anymore. The last line,
``fstp st1``, places the contents of ``st`` to ``st(1)``, and pops. As a
result, what was ``st(1)`` is now ``st``, what was ``st(2)`` is now
``st(1)``, etc. The new ``st`` contains the normalized f–number. The new
``st(1)`` contains the square of the actual f–number we have stored
there for posterity.

At this point, we are ready to output the normalized f–number. Because
it is normalized, we will not round it off to four significant digits,
but will send it out in its full precision.

The normalized f-number is useful as long as it is reasonably small and
can be found on our light meter. Otherwise we need a different method of
determining proper exposure.

Earlier we have figured out the formula of calculating proper exposure
at an arbitrary f–number from that measured at a different f–number.

Every light meter I have ever seen can determine proper exposure at
f5.6. We will, therefore, calculate an *"f5.6 multiplier,"* i.e., by how
much we need to multiply the exposure measured at f5.6 to determine the
proper exposure for our pinhole camera.

From the above formula we know this factor can be calculated by dividing
our f–number (the actual one, not the normalized one) by ``5.6``, and
squaring the result.

Mathematically, dividing the square of our f–number by the square of
``5.6`` will give us the same result.

Computationally, we do not want to square two numbers when we can only
square one. So, the first solution seems better at first.

But...

``5.6`` is a *constant*. We do not have to have our FPU waste precious
cycles. We can just tell it to divide the square of the f–number by
whatever ``5.6?`` equals to. Or we can divide the f–number by ``5.6``,
and then square the result. The two ways now seem equal.

But, they are not!

Having studied the principles of photography above, we remember that the
``5.6`` is actually square root of 2 raised to the fifth power. An
*irrational* number. The square of this number is *exactly* ``32``.

Not only is ``32`` an integer, it is a power of 2. We do not need to
divide the square of the f–number by ``32``. We only need to use
``fscale`` to shift it right by five positions. In the FPU lingo it
means we will ``fscale`` it with ``st(1)`` equal to ``-5``. That is
*much faster* than a division.

So, now it has become clear why we have saved the square of the f–number
on the top of the FPU stack. The calculation of the f5.6 multiplier is
the easiest calculation of this entire program! We will output it
rounded to four significant digits.

There is one more useful number we can calculate: The number of stops
our f–number is from f5.6. This may help us if our f–number is just
outside the range of our light meter, but we have a shutter which lets
us set various speeds, and this shutter uses stops.

Say, our f–number is 5 stops from f5.6, and the light meter says we
should use 1/1000 sec. Then we can set our shutter speed to 1/1000
first, then move the dial by 5 stops.

This calculation is quite easy as well. All we have to do is to
calculate the base-2 logarithm of the f5.6 multiplier we had just
calculated (though we need its value from before we rounded it off). We
then output the result rounded to the nearest integer. We do not need to
worry about having more than four significant digits in this one: The
result is most likely to have only one or two digits anyway.

.. raw:: html

   </div>

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

11.13.4.?FPU Optimizations
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In assembly language we can optimize the FPU code in ways impossible in
high languages, including C.

Whenever a C function needs to calculate a floating–point value, it
loads all necessary variables and constants into FPU registers. It then
does whatever calculation is required to get the correct result. Good C
compilers can optimize that part of the code really well.

It "returns" the value by leaving the result on the TOS. However, before
it returns, it cleans up. Any variables and constants it used in its
calculation are now gone from the FPU.

It cannot do what we just did above: We calculated the square of the
f–number and kept it on the stack for later use by another function.

We *knew* we would need that value later on. We also knew we had enough
room on the stack (which only has room for 8 numbers) to store it there.

A C compiler has no way of knowing that a value it has on the stack will
be required again in the very near future.

Of course, the C programmer may know it. But the only recourse he has is
to store the value in a memory variable.

That means, for one, the value will be changed from the 80-bit precision
used internally by the FPU to a C *double* (64 bits) or even *single*
(32 bits).

That also means that the value must be moved from the TOS into the
memory, and then back again. Alas, of all FPU operations, the ones that
access the computer memory are the slowest.

So, whenever programming the FPU in assembly language, look for the ways
of keeping intermediate results on the FPU stack.

We can take that idea even further! In our program we are using a
*constant* (the one we named ``PC``).

It does not matter how many pinhole diameters we are calculating: 1, 10,
20, 1000, we are always using the same constant. Therefore, we can
optimize our program by keeping the constant on the stack all the time.

Early on in our program, we are calculating the value of the above
constant. We need to divide our input by ``10`` for every digit in the
constant.

It is much faster to multiply than to divide. So, at the start of our
program, we divide ``10`` into ``1`` to obtain ``0.1``, which we then
keep on the stack: Instead of dividing the input by ``10`` for every
digit, we multiply it by ``0.1``.

By the way, we do not input ``0.1`` directly, even though we could. We
have a reason for that: While ``0.1`` can be expressed with just one
decimal place, we do not know how many *binary* places it takes. We,
therefore, let the FPU calculate its binary value to its own high
precision.

We are using other constants: We multiply the pinhole diameter by
``1000`` to convert it from millimeters to microns. We compare numbers
to ``10000`` when we are rounding them off to four significant digits.
So, we keep both, ``1000`` and ``10000``, on the stack. And, of course,
we reuse the ``0.1`` when rounding off numbers to four digits.

Last but not least, we keep ``-5`` on the stack. We need it to scale the
square of the f–number, instead of dividing it by ``32``. It is not by
coincidence we load this constant last. That makes it the top of the
stack when only the constants are on it. So, when the square of the
f–number is being scaled, the ``-5`` is at ``st(1)``, precisely where
``fscale`` expects it to be.

It is common to create certain constants from scratch instead of loading
them from the memory. That is what we are doing with ``-5``:

.. code:: programlisting

        fld1            ; TOS =  1
        fadd    st0, st0    ; TOS =  2
        fadd    st0, st0    ; TOS =  4
        fld1            ; TOS =  1
        faddp   st1, st0    ; TOS =  5
        fchs            ; TOS = -5

We can generalize all these optimizations into one rule: *Keep repeat
values on the stack!*

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

*PostScript?* is a stack–oriented programming language. There are many
more books available about PostScript? than about the FPU assembly
language: Mastering PostScript? will help you master the FPU.

.. raw:: html

   </div>

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

11.13.5.?pinhole—The Code
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    ;;;;;;; pinhole.asm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;
    ; Find various parameters of a pinhole camera construction and use
    ;
    ; Started:   9-Jun-2001
    ; Updated:  10-Jun-2001
    ;
    ; Copyright (c) 2001 G. Adam Stanislav
    ; All rights reserved.
    ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    %include    'system.inc'

    %define BUFSIZE 2048

    section .data
    align 4
    ten dd  10
    thousand    dd  1000
    tthou   dd  10000
    fd.in   dd  stdin
    fd.out  dd  stdout
    envar   db  'PINHOLE='  ; Exactly 8 bytes, or 2 dwords long
    pinhole db  '04,',      ; Bender's constant (0.04)
    connors db  '037', 0Ah  ; Connors' constant
    usg db  'Usage: pinhole [-b] [-c] [-e] [-p <value>] [-o <outfile>] [-i <infile>]', 0Ah
    usglen  equ $-usg
    iemsg   db  "pinhole: Can't open input file", 0Ah
    iemlen  equ $-iemsg
    oemsg   db  "pinhole: Can't create output file", 0Ah
    oemlen  equ $-oemsg
    pinmsg  db  "pinhole: The PINHOLE constant must not be 0", 0Ah
    pinlen  equ $-pinmsg
    toobig  db  "pinhole: The PINHOLE constant may not exceed 18 decimal places", 0Ah
    biglen  equ $-toobig
    huhmsg  db  9, '???'
    separ   db  9, '???'
    sep2    db  9, '???'
    sep3    db  9, '???'
    sep4    db  9, '???', 0Ah
    huhlen  equ $-huhmsg
    header  db  'focal length in millimeters,pinhole diameter in microns,'
        db  'F-number,normalized F-number,F-5.6 multiplier,stops '
        db  'from F-5.6', 0Ah
    headlen equ $-header

    section .bss
    ibuffer resb    BUFSIZE
    obuffer resb    BUFSIZE
    dbuffer resb    20      ; decimal input buffer
    bbuffer resb    10      ; BCD buffer

    section .text
    align 4
    huh:
        call    write
        push    dword huhlen
        push    dword huhmsg
        push    dword [fd.out]
        sys.write
        add esp, byte 12
        ret

    align 4
    perr:
        push    dword pinlen
        push    dword pinmsg
        push    dword stderr
        sys.write
        push    dword 4     ; return failure
        sys.exit

    align 4
    consttoobig:
        push    dword biglen
        push    dword toobig
        push    dword stderr
        sys.write
        push    dword 5     ; return failure
        sys.exit

    align 4
    ierr:
        push    dword iemlen
        push    dword iemsg
        push    dword stderr
        sys.write
        push    dword 1     ; return failure
        sys.exit

    align 4
    oerr:
        push    dword oemlen
        push    dword oemsg
        push    dword stderr
        sys.write
        push    dword 2
        sys.exit

    align 4
    usage:
        push    dword usglen
        push    dword usg
        push    dword stderr
        sys.write
        push    dword 3
        sys.exit

    align 4
    global  _start
    _start:
        add esp, byte 8 ; discard argc and argv[0]
        sub esi, esi

    .arg:
        pop ecx
        or  ecx, ecx
        je  near .getenv        ; no more arguments

        ; ECX contains the pointer to an argument
        cmp byte [ecx], '-'
        jne usage

        inc ecx
        mov ax, [ecx]
        inc ecx

    .o:
        cmp al, 'o'
        jne .i

        ; Make sure we are not asked for the output file twice
        cmp dword [fd.out], stdout
        jne usage

        ; Find the path to output file - it is either at [ECX+1],
        ; i.e., -ofile --
        ; or in the next argument,
        ; i.e., -o file

        or  ah, ah
        jne .openoutput
        pop ecx
        jecxz   usage

    .openoutput:
        push    dword 420   ; file mode (644 octal)
        push    dword 0200h | 0400h | 01h
        ; O_CREAT | O_TRUNC | O_WRONLY
        push    ecx
        sys.open
        jc  near oerr

        add esp, byte 12
        mov [fd.out], eax
        jmp short .arg

    .i:
        cmp al, 'i'
        jne .p

        ; Make sure we are not asked twice
        cmp dword [fd.in], stdin
        jne near usage

        ; Find the path to the input file
        or  ah, ah
        jne .openinput
        pop ecx
        or  ecx, ecx
        je near usage

    .openinput:
        push    dword 0     ; O_RDONLY
        push    ecx
        sys.open
        jc  near ierr       ; open failed

        add esp, byte 8
        mov [fd.in], eax
        jmp .arg

    .p:
        cmp al, 'p'
        jne .c
        or  ah, ah
        jne .pcheck

        pop ecx
        or  ecx, ecx
        je  near usage

        mov ah, [ecx]

    .pcheck:
        cmp ah, '0'
        jl  near usage
        cmp ah, '9'
        ja  near usage
        mov esi, ecx
        jmp .arg

    .c:
        cmp al, 'c'
        jne .b
        or  ah, ah
        jne near usage
        mov esi, connors
        jmp .arg

    .b:
        cmp al, 'b'
        jne .e
        or  ah, ah
        jne near usage
        mov esi, pinhole
        jmp .arg

    .e:
        cmp al, 'e'
        jne near usage
        or  ah, ah
        jne near usage
        mov al, ','
        mov [huhmsg], al
        mov [separ], al
        mov [sep2], al
        mov [sep3], al
        mov [sep4], al
        jmp .arg

    align 4
    .getenv:
        ; If ESI = 0, we did not have a -p argument,
        ; and need to check the environment for "PINHOLE="
        or  esi, esi
        jne .init

        sub ecx, ecx

    .nextenv:
        pop esi
        or  esi, esi
        je  .default    ; no PINHOLE envar found

        ; check if this envar starts with 'PINHOLE='
        mov edi, envar
        mov cl, 2       ; 'PINHOLE=' is 2 dwords long
    rep cmpsd
        jne .nextenv

        ; Check if it is followed by a digit
        mov al, [esi]
        cmp al, '0'
        jl  .default
        cmp al, '9'
        jbe .init
        ; fall through

    align 4
    .default:
        ; We got here because we had no -p argument,
        ; and did not find the PINHOLE envar.
        mov esi, pinhole
        ; fall through

    align 4
    .init:
        sub eax, eax
        sub ebx, ebx
        sub ecx, ecx
        sub edx, edx
        mov edi, dbuffer+1
        mov byte [dbuffer], '0'

        ; Convert the pinhole constant to real
    .constloop:
        lodsb
        cmp al, '9'
        ja  .setconst
        cmp al, '0'
        je  .processconst
        jb  .setconst

        inc dl

    .processconst:
        inc cl
        cmp cl, 18
        ja  near consttoobig
        stosb
        jmp short .constloop

    align 4
    .setconst:
        or  dl, dl
        je  near perr

        finit
        fild    dword [tthou]

        fld1
        fild    dword [ten]
        fdivp   st1, st0

        fild    dword [thousand]
        mov edi, obuffer

        mov ebp, ecx
        call    bcdload

    .constdiv:
        fmul    st0, st2
        loop    .constdiv

        fld1
        fadd    st0, st0
        fadd    st0, st0
        fld1
        faddp   st1, st0
        fchs

        ; If we are creating a CSV file,
        ; print header
        cmp byte [separ], ','
        jne .bigloop

        push    dword headlen
        push    dword header
        push    dword [fd.out]
        sys.write

    .bigloop:
        call    getchar
        jc  near done

        ; Skip to the end of the line if you got '#'
        cmp al, '#'
        jne .num
        call    skiptoeol
        jmp short .bigloop

    .num:
        ; See if you got a number
        cmp al, '0'
        jl  .bigloop
        cmp al, '9'
        ja  .bigloop

        ; Yes, we have a number
        sub ebp, ebp
        sub edx, edx

    .number:
        cmp al, '0'
        je  .number0
        mov dl, 1

    .number0:
        or  dl, dl      ; Skip leading 0's
        je  .nextnumber
        push    eax
        call    putchar
        pop eax
        inc ebp
        cmp ebp, 19
        jae .nextnumber
        mov [dbuffer+ebp], al

    .nextnumber:
        call    getchar
        jc  .work
        cmp al, '#'
        je  .ungetc
        cmp al, '0'
        jl  .work
        cmp al, '9'
        ja  .work
        jmp short .number

    .ungetc:
        dec esi
        inc ebx

    .work:
        ; Now, do all the work
        or  dl, dl
        je  near .work0

        cmp ebp, 19
        jae near .toobig

        call    bcdload

        ; Calculate pinhole diameter

        fld st0 ; save it
        fsqrt
        fmul    st0, st3
        fld st0
        fmul    st5
        sub ebp, ebp

        ; Round off to 4 significant digits
    .diameter:
        fcom    st0, st7
        fstsw   ax
        sahf
        jb  .printdiameter
        fmul    st0, st6
        inc ebp
        jmp short .diameter

    .printdiameter:
        call    printnumber ; pinhole diameter

        ; Calculate F-number

        fdivp   st1, st0
        fld st0

        sub ebp, ebp

    .fnumber:
        fcom    st0, st6
        fstsw   ax
        sahf
        jb  .printfnumber
        fmul    st0, st5
        inc ebp
        jmp short .fnumber

    .printfnumber:
        call    printnumber ; F number

        ; Calculate normalized F-number
        fmul    st0, st0
        fld1
        fld st1
        fyl2x
        frndint
        fld1
        fscale
        fsqrt
        fstp    st1

        sub ebp, ebp
        call    printnumber

        ; Calculate time multiplier from F-5.6

        fscale
        fld st0

        ; Round off to 4 significant digits
    .fmul:
        fcom    st0, st6
        fstsw   ax
        sahf

        jb  .printfmul
        inc ebp
        fmul    st0, st5
        jmp short .fmul

    .printfmul:
        call    printnumber ; F multiplier

        ; Calculate F-stops from 5.6

        fld1
        fxch    st1
        fyl2x

        sub ebp, ebp
        call    printnumber

        mov al, 0Ah
        call    putchar
        jmp .bigloop

    .work0:
        mov al, '0'
        call    putchar

    align 4
    .toobig:
        call    huh
        jmp .bigloop

    align 4
    done:
        call    write       ; flush output buffer

        ; close files
        push    dword [fd.in]
        sys.close

        push    dword [fd.out]
        sys.close

        finit

        ; return success
        push    dword 0
        sys.exit

    align 4
    skiptoeol:
        ; Keep reading until you come to cr, lf, or eof
        call    getchar
        jc  done
        cmp al, 0Ah
        jne .cr
        ret

    .cr:
        cmp al, 0Dh
        jne skiptoeol
        ret

    align 4
    getchar:
        or  ebx, ebx
        jne .fetch

        call    read

    .fetch:
        lodsb
        dec ebx
        clc
        ret

    read:
        jecxz   .read
        call    write

    .read:
        push    dword BUFSIZE
        mov esi, ibuffer
        push    esi
        push    dword [fd.in]
        sys.read
        add esp, byte 12
        mov ebx, eax
        or  eax, eax
        je  .empty
        sub eax, eax
        ret

    align 4
    .empty:
        add esp, byte 4
        stc
        ret

    align 4
    putchar:
        stosb
        inc ecx
        cmp ecx, BUFSIZE
        je  write
        ret

    align 4
    write:
        jecxz   .ret    ; nothing to write
        sub edi, ecx    ; start of buffer
        push    ecx
        push    edi
        push    dword [fd.out]
        sys.write
        add esp, byte 12
        sub eax, eax
        sub ecx, ecx    ; buffer is empty now
    .ret:
        ret

    align 4
    bcdload:
        ; EBP contains the number of chars in dbuffer
        push    ecx
        push    esi
        push    edi

        lea ecx, [ebp+1]
        lea esi, [dbuffer+ebp-1]
        shr ecx, 1

        std

        mov edi, bbuffer
        sub eax, eax
        mov [edi], eax
        mov [edi+4], eax
        mov [edi+2], ax

    .loop:
        lodsw
        sub ax, 3030h
        shl al, 4
        or  al, ah
        mov [edi], al
        inc edi
        loop    .loop

        fbld    [bbuffer]

        cld
        pop edi
        pop esi
        pop ecx
        sub eax, eax
        ret

    align 4
    printnumber:
        push    ebp
        mov al, [separ]
        call    putchar

        ; Print the integer at the TOS
        mov ebp, bbuffer+9
        fbstp   [bbuffer]

        ; Check the sign
        mov al, [ebp]
        dec ebp
        or  al, al
        jns .leading

        ; We got a negative number (should never happen)
        mov al, '-'
        call    putchar

    .leading:
        ; Skip leading zeros
        mov al, [ebp]
        dec ebp
        or  al, al
        jne .first
        cmp ebp, bbuffer
        jae .leading

        ; We are here because the result was 0.
        ; Print '0' and return
        mov al, '0'
        jmp putchar

    .first:
        ; We have found the first non-zero.
        ; But it is still packed
        test    al, 0F0h
        jz  .second
        push    eax
        shr al, 4
        add al, '0'
        call    putchar
        pop eax
        and al, 0Fh

    .second:
        add al, '0'
        call    putchar

    .next:
        cmp ebp, bbuffer
        jb  .done

        mov al, [ebp]
        push    eax
        shr al, 4
        add al, '0'
        call    putchar
        pop eax
        and al, 0Fh
        add al, '0'
        call    putchar

        dec ebp
        jmp short .next

    .done:
        pop ebp
        or  ebp, ebp
        je  .ret

    .zeros:
        mov al, '0'
        call    putchar
        dec ebp
        jne .zeros

    .ret:
        ret

The code follows the same format as all the other filters we have seen
before, with one subtle exception:

.. raw:: html

   <div class="blockquote">

    We are no longer assuming that the end of input implies the end of
    things to do, something we took for granted in the
    *character–oriented* filters.

    This filter does not process characters. It processes a *language*
    (albeit a very simple one, consisting only of numbers).

    When we have no more input, it can mean one of two things:

    .. raw:: html

       <div class="itemizedlist">

    -  We are done and can quit. This is the same as before.

    -  The last character we have read was a digit. We have stored it at
       the end of our ASCII–to–float conversion buffer. We now need to
       convert the contents of that buffer into a number and write the
       last line of our output.

    .. raw:: html

       </div>

    For that reason, we have modified our ``getchar`` and our ``read``
    routines to return with the ``carry flag`` *clear* whenever we are
    fetching another character from the input, or the ``carry flag``
    *set* whenever there is no more input.

    Of course, we are still using assembly language magic to do that!
    Take a good look at ``getchar``. It *always* returns with the
    ``carry flag`` *clear*.

    Yet, our main code relies on the ``carry flag`` to tell it when to
    quit—and it works.

    The magic is in ``read``. Whenever it receives more input from the
    system, it just returns to ``getchar``, which fetches a character
    from the input buffer, *clears* the ``carry flag`` and returns.

    But when ``read`` receives no more input from the system, it does
    *not* return to ``getchar`` at all. Instead, the ``add esp, byte 4``
    op code adds ``4`` to ``ESP``, *sets* the ``carry flag``, and
    returns.

    So, where does it return to? Whenever a program uses the ``call`` op
    code, the microprocessor ``push``\ es the return address, i.e., it
    stores it on the top of the stack (not the FPU stack, the system
    stack, which is in the memory). When a program uses the ``ret`` op
    code, the microprocessor ``pop``\ s the return value from the stack,
    and jumps to the address that was stored there.

    But since we added ``4`` to ``ESP`` (which is the stack pointer
    register), we have effectively given the microprocessor a minor case
    of *amnesia*: It no longer remembers it was ``getchar`` that
    ``call``\ ed ``read``.

    And since ``getchar`` never ``push``\ ed anything before
    ``call``\ ing ``read``, the top of the stack now contains the return
    address to whatever or whoever ``call``\ ed ``getchar``. As far as
    that caller is concerned, he ``call``\ ed ``getchar``, which
    ``ret``\ urned with the ``carry flag`` set!

.. raw:: html

   </div>

Other than that, the ``bcdload`` routine is caught up in the middle of a
Lilliputian conflict between the Big–Endians and the Little–Endians.

It is converting the text representation of a number into that number:
The text is stored in the big–endian order, but the *packed decimal* is
little–endian.

To solve the conflict, we use the ``std`` op code early on. We cancel it
with ``cld`` later on: It is quite important we do not ``call`` anything
that may depend on the default setting of the *direction flag* while
``std`` is active.

Everything else in this code should be quite clear, providing you have
read the entire chapter that precedes it.

It is a classical example of the adage that programming requires a lot
of thought and only a little coding. Once we have thought through every
tiny detail, the code almost writes itself.

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

11.13.6.?Using pinhole
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because we have decided to make the program *ignore* any input except
for numbers (and even those inside a comment), we can actually perform
*textual queries*. We do not *have to*, but we *can*.

In my humble opinion, forming a textual query, instead of having to
follow a very strict syntax, makes software much more user friendly.

Suppose we want to build a pinhole camera to use the 4x5 inch film. The
standard focal length for that film is about 150mm. We want to
*fine–tune* our focal length so the pinhole diameter is as round a
number as possible. Let us also suppose we are quite comfortable with
cameras but somewhat intimidated by computers. Rather than just have to
type in a bunch of numbers, we want to *ask* a couple of questions.

Our session might look like this:

.. code:: screen

    % pinhole

    Computer,

    What size pinhole do I need for the focal length of 150?
    150 490 306 362 2930    12
    Hmmm... How about 160?
    160 506 316 362 3125    12
    Let's make it 155, please.
    155 498 311 362 3027    12
    Ah, let's try 157...
    157 501 313 362 3066    12
    156?
    156 500 312 362 3047    12
    That's it! Perfect! Thank you very much!
    ^D

We have found that while for the focal length of 150, our pinhole
diameter should be 490 microns, or 0.49 mm, if we go with the almost
identical focal length of 156 mm, we can get away with a pinhole
diameter of exactly one half of a millimeter.

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

11.13.7.?Scripting
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because we have chosen the ``#`` character to denote the start of a
comment, we can treat our pinhole software as a *scripting language*.

You have probably seen shell *scripts* that start with:

.. code:: programlisting

    #! /bin/sh

...or...

.. code:: programlisting

    #!/bin/sh

...because the blank space after the ``#!`` is optional.

Whenever UNIX? is asked to run an executable file which starts with the
``#!``, it assumes the file is a script. It adds the command to the rest
of the first line of the script, and tries to execute that.

Suppose now that we have installed pinhole in /usr/local/bin/, we can
now write a script to calculate various pinhole diameters suitable for
various focal lengths commonly used with the 120 film.

The script might look something like this:

.. code:: programlisting

    #! /usr/local/bin/pinhole -b -i
    # Find the best pinhole diameter
    # for the 120 film

    ### Standard
    80

    ### Wide angle
    30, 40, 50, 60, 70

    ### Telephoto
    100, 120, 140

Because 120 is a medium size film, we may name this file medium.

We can set its permissions to execute, and run it as if it were a
program:

.. code:: screen

    % chmod 755 medium
    % ./medium

UNIX? will interpret that last command as:

.. code:: screen

    % /usr/local/bin/pinhole -b -i ./medium

It will run that command and display:

.. code:: screen

    80  358 224 256 1562    11
    30  219 137 128 586 9
    40  253 158 181 781 10
    50  283 177 181 977 10
    60  310 194 181 1172    10
    70  335 209 181 1367    10
    100 400 250 256 1953    11
    120 438 274 256 2344    11
    140 473 296 256 2734    11

Now, let us enter:

.. code:: screen

    % ./medium -c

UNIX? will treat that as:

.. code:: screen

    % /usr/local/bin/pinhole -b -i ./medium -c

That gives it two conflicting options: *``-b``* and *``-c``* (Use
Bender's constant and use Connors' constant). We have programmed it so
later options override early ones—our program will calculate everything
using Connors' constant:

.. code:: screen

    80  331 242 256 1826    11
    30  203 148 128 685 9
    40  234 171 181 913 10
    50  262 191 181 1141    10
    60  287 209 181 1370    10
    70  310 226 256 1598    11
    100 370 270 256 2283    11
    120 405 296 256 2739    11
    140 438 320 362 3196    12

We decide we want to go with Bender's constant after all. We want to
save its values as a comma–separated file:

.. code:: screen

    % ./medium -b -e > bender
    % cat bender
    focal length in millimeters,pinhole diameter in microns,F-number,normalized F-number,F-5.6 multiplier,stops from F-5.6
    80,358,224,256,1562,11
    30,219,137,128,586,9
    40,253,158,181,781,10
    50,283,177,181,977,10
    60,310,194,181,1172,10
    70,335,209,181,1367,10
    100,400,250,256,1953,11
    120,438,274,256,2344,11
    140,473,296,256,2734,11
    %

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+----------------------------------+
| `Prev <x86-one-pointed-mind.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-caveats.html>`__   |
+-----------------------------------------+-------------------------+----------------------------------+
| 11.12.?One-Pointed Mind?                | `Home <index.html>`__   | ?11.14.?Caveats                  |
+-----------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

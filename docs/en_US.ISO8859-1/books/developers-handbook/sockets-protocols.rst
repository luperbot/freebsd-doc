==============
7.3.?Protocols
==============

.. raw:: html

   <div class="navheader">

7.3.?Protocols
`Prev <sockets-diversity.html>`__?
Chapter?7.?Sockets
?\ `Next <sockets-model.html>`__

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

7.3.?Protocols
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While various programming languages tend to have complex syntax and use
a number of multi-letter reserved words (which makes them easy for the
human programmer to understand), the languages of data communications
tend to be very terse. Instead of multi-byte words, they often use
individual *bits*. There is a very convincing reason for it: While data
travels *inside* your computer at speeds approaching the speed of light,
it often travels considerably slower between two computers.

Because the languages used in data communications are so terse, we
usually refer to them as *protocols* rather than languages.

As data travels from one computer to another, it always uses more than
one protocol. These protocols are *layered*. The data can be compared to
the inside of an onion: You have to peel off several layers of “skin” to
get to the data. This is best illustrated with a picture:

.. raw:: html

   <div class="mediaobject">

|Protocol Layers|

.. raw:: html

   </div>

In this example, we are trying to get an image from a web page we are
connected to via an Ethernet.

The image consists of raw data, which is simply a sequence of RGB values
that our software can process, i.e., convert into an image and display
on our monitor.

Alas, our software has no way of knowing how the raw data is organized:
Is it a sequence of RGB values, or a sequence of grayscale intensities,
or perhaps of CMYK encoded colors? Is the data represented by 8-bit
quanta, or are they 16 bits in size, or perhaps 4 bits? How many rows
and columns does the image consist of? Should certain pixels be
transparent?

I think you get the picture...

To inform our software how to handle the raw data, it is encoded as a
PNG file. It could be a GIF, or a JPEG, but it is a PNG.

And PNG is a protocol.

At this point, I can hear some of you yelling, *“No, it is not! It is a
file format!”*

Well, of course it is a file format. But from the perspective of data
communications, a file format is a protocol: The file structure is a
*language*, a terse one at that, communicating to our *process* how the
data is organized. Ergo, it is a *protocol*.

Alas, if all we received was the PNG file, our software would be facing
a serious problem: How is it supposed to know the data is representing
an image, as opposed to some text, or perhaps a sound, or what not?
Secondly, how is it supposed to know the image is in the PNG format as
opposed to GIF, or JPEG, or some other image format?

To obtain that information, we are using another protocol: HTTP. This
protocol can tell us exactly that the data represents an image, and that
it uses the PNG protocol. It can also tell us some other things, but let
us stay focused on protocol layers here.

So, now we have some data wrapped in the PNG protocol, wrapped in the
HTTP protocol. How did we get it from the server?

By using TCP/IP over Ethernet, that is how. Indeed, that is three more
protocols. Instead of continuing inside out, I am now going to talk
about Ethernet, simply because it is easier to explain the rest that
way.

Ethernet is an interesting system of connecting computers in a *local
area network* (LAN). Each computer has a *network interface card* (NIC),
which has a unique 48-bit ID called its *address*. No two Ethernet NICs
in the world have the same address.

These NICs are all connected with each other. Whenever one computer
wants to communicate with another in the same Ethernet LAN, it sends a
message over the network. Every NIC sees the message. But as part of the
Ethernet *protocol*, the data contains the address of the destination
NIC (among other things). So, only one of all the network interface
cards will pay attention to it, the rest will ignore it.

But not all computers are connected to the same network. Just because we
have received the data over our Ethernet does not mean it originated in
our own local area network. It could have come to us from some other
network (which may not even be Ethernet based) connected with our own
network via the Internet.

All data is transferred over the Internet using IP, which stands for
*Internet Protocol*. Its basic role is to let us know where in the world
the data has arrived from, and where it is supposed to go to. It does
not *guarantee* we will receive the data, only that we will know where
it came from *if* we do receive it.

Even if we do receive the data, IP does not guarantee we will receive
various chunks of data in the same order the other computer has sent it
to us. So, we can receive the center of our image before we receive the
upper left corner and after the lower right, for example.

It is TCP (*Transmission Control Protocol*) that asks the sender to
resend any lost data and that places it all into the proper order.

All in all, it took *five* different protocols for one computer to
communicate to another what an image looks like. We received the data
wrapped into the PNG protocol, which was wrapped into the HTTP protocol,
which was wrapped into the TCP protocol, which was wrapped into the IP
protocol, which was wrapped into the Ethernet protocol.

Oh, and by the way, there probably were several other protocols involved
somewhere on the way. For example, if our LAN was connected to the
Internet through a dial-up call, it used the PPP protocol over the modem
which used one (or several) of the various modem protocols, et cetera,
et cetera, et cetera...

As a developer you should be asking by now, *“How am I supposed to
handle it all?”*

Luckily for you, you are *not* supposed to handle it all. You *are*
supposed to handle some of it, but not all of it. Specifically, you need
not worry about the physical connection (in our case Ethernet and
possibly PPP, etc). Nor do you need to handle the Internet Protocol, or
the Transmission Control Protocol.

In other words, you do not have to do anything to receive the data from
the other computer. Well, you do have to *ask* for it, but that is
almost as simple as opening a file.

Once you have received the data, it is up to you to figure out what to
do with it. In our case, you would need to understand the HTTP protocol
and the PNG file structure.

To use an analogy, all the internetworking protocols become a gray area:
Not so much because we do not understand how it works, but because we
are no longer concerned about it. The sockets interface takes care of
this gray area for us:

.. raw:: html

   <div class="mediaobject">

|Sockets Covered Protocol Layers|

.. raw:: html

   </div>

We only need to understand any protocols that tell us how to *interpret
the data*, not how to *receive* it from another process, nor how to
*send* it to another process.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+------------------------------------+
| `Prev <sockets-diversity.html>`__?   | `Up <sockets.html>`__   | ?\ `Next <sockets-model.html>`__   |
+--------------------------------------+-------------------------+------------------------------------+
| 7.2.?Networking and Diversity?       | `Home <index.html>`__   | ?7.4.?The Sockets Model            |
+--------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Protocol Layers| image:: sockets/layers.png
.. |Sockets Covered Protocol Layers| image:: sockets/slayers.png

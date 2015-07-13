=====================
7.6.?Helper Functions
=====================

.. raw:: html

   <div class="navheader">

7.6.?Helper Functions
`Prev <sockets-essential-functions.html>`__?
Chapter?7.?Sockets
?\ `Next <sockets-concurrent-servers.html>`__

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

7.6.?Helper Functions
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD C library contains many helper functions for sockets
programming. For example, in our sample client we hard coded the
``time.nist.gov`` IP address. But we do not always know the IP address.
Even if we do, our software is more flexible if it allows the user to
enter the IP address, or even the domain name.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.1.?\ ``gethostbyname``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While there is no way to pass the domain name directly to any of the
sockets functions, the FreeBSD C library comes with the
`gethostbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyname&sektion=3>`__
and
`gethostbyname2(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyname2&sektion=3>`__
functions, declared in ``netdb.h``.

.. code:: programlisting

    struct hostent * gethostbyname(const char *name);
    struct hostent * gethostbyname2(const char *name, int af);

Both return a pointer to the ``hostent`` structure, with much
information about the domain. For our purposes, the ``h_addr_list[0]``
field of the structure points at ``h_length`` bytes of the correct
address, already stored in the *network byte order*.

This allows us to create a much more flexible—and much more
useful—version of our daytime program:

.. code:: programlisting

    /*
     * daytime.c
     *
     * Programmed by G. Adam Stanislav
     * 19 June 2001
     */
    #include <stdio.h>
    #include <string.h>
    #include <sys/types.h>
    #include <sys/socket.h>
    #include <netinet/in.h>
    #include <netdb.h>

    int main(int argc, char *argv[]) {
      register int s;
      register int bytes;
      struct sockaddr_in sa;
      struct hostent *he;
      char buf[BUFSIZ+1];
      char *host;

      if ((s = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
        perror("socket");
        return 1;
      }

      bzero(&sa, sizeof sa);

      sa.sin_family = AF_INET;
      sa.sin_port = htons(13);

      host = (argc > 1) ? (char *)argv[1] : "time.nist.gov";

      if ((he = gethostbyname(host)) == NULL) {
        herror(host);
        return 2;
      }

      bcopy(he->h_addr_list[0],&sa.sin_addr, he->h_length);

      if (connect(s, (struct sockaddr *)&sa, sizeof sa) < 0) {
        perror("connect");
        return 3;
      }

      while ((bytes = read(s, buf, BUFSIZ)) > 0)
        write(1, buf, bytes);

      close(s);
      return 0;
    }

We now can type a domain name (or an IP address, it works both ways) on
the command line, and the program will try to connect to its *daytime*
server. Otherwise, it will still default to ``time.nist.gov``. However,
even in this case we will use ``gethostbyname`` rather than hard coding
``192.43.244.18``. That way, even if its IP address changes in the
future, we will still find it.

Since it takes virtually no time to get the time from your local server,
you could run daytime twice in a row: First to get the time from
``time.nist.gov``, the second time from your own system. You can then
compare the results and see how exact your system clock is:

.. code:: screen

    % daytime ; daytime localhost


    52080 01-06-20 04:02:33 50 0 0 390.2 UTC(NIST) *
    2001-06-20T04:02:35Z
    %

As you can see, my system was two seconds ahead of the NIST time.

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

7.6.2.?\ ``getservbyname``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes you may not be sure what port a certain service uses. The
`getservbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getservbyname&sektion=3>`__
function, also declared in ``netdb.h`` comes in very handy in those
cases:

.. code:: programlisting

    struct servent * getservbyname(const char *name, const char *proto);

The ``servent`` structure contains the ``s_port``, which contains the
proper port, already in *network byte order*.

Had we not known the correct port for the *daytime* service, we could
have found it this way:

.. code:: programlisting

      struct servent *se;
      ...
      if ((se = getservbyname("daytime", "tcp")) == NULL {
        fprintf(stderr, "Cannot determine which port to use.\n");
        return 7;
      }
      sa.sin_port = se->s_port;

You usually do know the port. But if you are developing a new protocol,
you may be testing it on an unofficial port. Some day, you will register
the protocol and its port (if nowhere else, at least in your
``/etc/services``, which is where ``getservbyname`` looks). Instead of
returning an error in the above code, you just use the temporary port
number. Once you have listed the protocol in ``/etc/services``, your
software will find its port without you having to rewrite the code.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------+-------------------------------------------------+
| `Prev <sockets-essential-functions.html>`__?   | `Up <sockets.html>`__   | ?\ `Next <sockets-concurrent-servers.html>`__   |
+------------------------------------------------+-------------------------+-------------------------------------------------+
| 7.5.?Essential Socket Functions?               | `Home <index.html>`__   | ?7.7.?Concurrent Servers                        |
+------------------------------------------------+-------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

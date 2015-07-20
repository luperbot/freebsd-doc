=========================
15.4. DES, MD5, and Crypt
=========================

.. raw:: html

   <div class="navheader">

15.4. DES, MD5, and Crypt
`????? <securing-freebsd.html>`__?
???????? 15. ????????
?\ `??????? <one-time-passwords.html>`__

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

15.4. DES, MD5, and Crypt
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Parts rewritten and updated by Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every user on a UNIX(R) system has a password associated with their
account. It seems obvious that these passwords need to be known only to
the user and the actual operating system. In order to keep these
passwords secret, they are encrypted with what is known as a ?one-way
hash?, that is, they can only be easily encrypted but not decrypted. In
other words, what we told you a moment ago was obvious is not even true:
the operating system itself does not *really* know the password. It only
knows the *encrypted* form of the password. The only way to get the
?plain-text? password is by a brute force search of the space of
possible passwords.

Unfortunately the only secure way to encrypt passwords when UNIX(R) came
into being was based on DES, the Data Encryption Standard. This was not
such a problem for users resident in the US, but since the source code
for DES could not be exported outside the US, FreeBSD had to find a way
to both comply with US law and retain compatibility with all the other
UNIX(R) variants that still used DES.

The solution was to divide up the encryption libraries so that US users
could install the DES libraries and use DES but international users
still had an encryption method that could be exported abroad. This is
how FreeBSD came to use MD5 as its default encryption method. MD5 is
believed to be more secure than DES, so installing DES is offered
primarily for compatibility reasons.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.4.1. Recognizing Your Crypt Mechanism
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Currently the library supports DES, MD5 and Blowfish hash functions. By
default FreeBSD uses MD5 to encrypt passwords.

It is pretty easy to identify which encryption method FreeBSD is set up
to use. Examining the encrypted passwords in the ``/etc/master.passwd``
file is one way. Passwords encrypted with the MD5 hash are longer than
those encrypted with the DES hash and also begin with the characters
``$1$``. Passwords starting with ``$2a$`` are encrypted with the
Blowfish hash function. DES password strings do not have any particular
identifying characteristics, but they are shorter than MD5 passwords,
and are coded in a 64-character alphabet which does not include the
``$`` character, so a relatively short string which does not begin with
a dollar sign is very likely a DES password.

The password format used for new passwords is controlled by the
``passwd_format`` login capability in ``/etc/login.conf``, which takes
values of ``des``, ``md5`` or ``blf``. See the
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
manual page for more information about login capabilities.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------+--------------------------------------------+
| `????? <securing-freebsd.html>`__?   | `???? <security.html>`__   | ?\ `??????? <one-time-passwords.html>`__   |
+--------------------------------------+----------------------------+--------------------------------------------+
| 15.3. Securing FreeBSD?              | `???? <index.html>`__      | ?15.5. One-time Passwords                  |
+--------------------------------------+----------------------------+--------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

===========================
2.?OpenPGP Keys for FreeBSD
===========================

.. raw:: html

   <div class="navheader">

2.?OpenPGP Keys for FreeBSD
`Prev <index.html>`__?
?
?\ `Next <kerberos-ldap.html>`__

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

2.?OpenPGP Keys for FreeBSD
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cryptographic keys conforming to the OpenPGP (*Pretty Good Privacy*)
standard are used by the FreeBSD project to authenticate committers.
Messages carrying important information like public SSH keys can be
signed with the OpenPGP key to prove that they are really from the
committer. See `PGP & GPG: Email for the Practical Paranoid by Michael
Lucas <http://www.nostarch.com/pgp_ml.htm>`__ and
http://en.wikipedia.org/wiki/Pretty_Good_Privacy for more information.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Creating a Key
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existing keys can be used, but should be checked with
``doc/head/share/pgpkeys/checkkey.sh`` first.

For those who do not yet have an OpenPGP key, or need a new key to meet
FreeBSD security requirements, here we show how to generate one.

.. raw:: html

   <div class="procedure">

#. Install ``security/gnupg``. Enter these lines in
   ``~/.gnupg/gpg.conf`` to set minimum acceptable defaults:

   .. code:: programlisting

       fixed-list-mode
       keyid-format 0xlong
       personal-digest-preferences SHA512 SHA384 SHA256 SHA224
       default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 BZIP2 ZLIB ZIP Uncompressed
       use-agent
       verify-options show-uid-validity
       list-options show-uid-validity
       sig-notation issuer-fpr@notations.openpgp.fifthhorseman.net=%g
       cert-digest-algo SHA512

#. Generate a key:

   .. code:: screen

       % gpg --gen-key
       gpg (GnuPG) 2.0.22; Copyright (C) 2013 Free Software Foundation, Inc.
       This is free software: you are free to change and redistribute it.
       There is NO WARRANTY, to the extent permitted by law.

       Warning: using insecure memory!
       Please select what kind of key you want:
          (1) RSA and RSA (default)
          (2) DSA and Elgamal
          (3) DSA (sign only)
          (4) RSA (sign only)
       Your selection? 1
       RSA keys may be between 1024 and 4096 bits long.
       What keysize do you want? (2048) 2048  
       Requested keysize is 2048 bits
       Please specify how long the key should be valid.
                0 = key does not expire
             <n>  = key expires in n days
             <n>w = key expires in n weeks
             <n>m = key expires in n months
             <n>y = key expires in n years
       Key is valid for? (0) 3y  
       Key expires at Wed Nov  4 17:20:20 2015 MST
       Is this correct? (y/N) y

       GnuPG needs to construct a user ID to identify your key.

       Real name: Chucky Daemon 
       Email address: notreal@example.com
       Comment:
       You selected this USER-ID:
           "Chucky Daemon <notreal@example.com>"

       Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o
       You need a Passphrase to protect your secret key.

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#co-pgp-bits>`__               | 2048-bit keys with a three-year      |
   |                                      | expiration provide adequate          |
   |                                      | protection at present (2013-12).     |
   |                                      | http://danielpocock.com/rsa-key-size |
   |                                      | s-2048-or-4096-bits                  |
   |                                      | describes the situation in more      |
   |                                      | detail.                              |
   +--------------------------------------+--------------------------------------+
   | `|2| <#co-pgp-expire>`__             | A three year key lifespan is short   |
   |                                      | enough to obsolete keys weakened by  |
   |                                      | advancing computer power, but long   |
   |                                      | enough to reduce key management      |
   |                                      | problems.                            |
   +--------------------------------------+--------------------------------------+
   | `|3| <#co-pgp-realname>`__           | Use your real name here, preferably  |
   |                                      | matching that shown on               |
   |                                      | government-issued ID to make it      |
   |                                      | easier for others to verify your     |
   |                                      | identity. Text that may help others  |
   |                                      | identify you can be entered in the   |
   |                                      | ``Comment`` section.                 |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

   After the email address is entered, a passphrase is requested.
   Methods of creating a secure passphrase are contentious. Rather than
   suggest a single way, here are some links to sites that describe
   various methods: http://world.std.com/~reinhold/diceware.html,
   http://www.iusmentis.com/security/passphrasefaq/,
   http://xkcd.com/936/, http://en.wikipedia.org/wiki/Passphrase.

.. raw:: html

   </div>

Protect your private key and passphrase. If either the private key or
passphrase may have been compromised or disclosed, immediately notify
``<accounts@FreeBSD.org>`` and revoke the key.

Committing the new key is shown in `Procedure?1, “Steps for New
Committers” <conventions.html#commit-steps>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+----------------------------------------------------------+
| `Prev <index.html>`__?   | ?                       | ?\ `Next <kerberos-ldap.html>`__                         |
+--------------------------+-------------------------+----------------------------------------------------------+
| Committer's Guide?       | `Home <index.html>`__   | ?3.?Kerberos and LDAP web Password for FreeBSD Cluster   |
+--------------------------+-------------------------+----------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png

===========================
Chapter?28.?Electronic Mail
===========================

.. raw:: html

   <div class="navheader">

Chapter?28.?Electronic Mail
`Prev <pppoa.html>`__?
Part?IV.?Network Communication
?\ `Next <mail-using.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?28.?Electronic Mail
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Original work by Bill Lloyd.

.. raw:: html

   </div>

.. raw:: html

   <div>

Rewritten by Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`28.1. Synopsis <mail.html#mail-synopsis>`__
`28.2. Mail Components <mail-using.html>`__
`28.3. Sendmail Configuration Files <sendmail.html>`__
`28.4. Changing the Mail Transfer Agent <mail-changingmta.html>`__
`28.5. Troubleshooting <mail-trouble.html>`__
`28.6. Advanced Topics <mail-advanced.html>`__
`28.7. Setting Up to Send Only <outgoing-only.html>`__
`28.8. Using Mail with a Dialup Connection <SMTP-dialup.html>`__
`28.9. SMTP Authentication <SMTP-Auth.html>`__
`28.10. Mail User Agents <mail-agents.html>`__
`28.11. Using fetchmail <mail-fetchmail.html>`__
`28.12. Using procmail <mail-procmail.html>`__

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

28.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

“Electronic Mail”, better known as email, is one of the most widely used
forms of communication today. This chapter provides a basic introduction
to running a mail server on FreeBSD, as well as an introduction to
sending and receiving email using FreeBSD. For more complete coverage of
this subject, refer to the books listed in `Appendix?B,
*Bibliography* <bibliography.html>`__.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  Which software components are involved in sending and receiving
   electronic mail.

-  Where basic sendmail configuration files are located in FreeBSD.

-  The difference between remote and local mailboxes.

-  How to block spammers from illegally using a mail server as a relay.

-  How to install and configure an alternate Mail Transfer Agent,
   replacing sendmail.

-  How to troubleshoot common mail server problems.

-  How to set up the system to send mail only.

-  How to use mail with a dialup connection.

-  How to configure SMTP authentication for added security.

-  How to install and use a Mail User Agent, such as mutt, to send and
   receive email.

-  How to download mail from a remote POP or IMAP server.

-  How to automatically apply filters and rules to incoming email.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Properly set up a network connection (`Chapter?31, *Advanced
   Networking* <advanced-networking.html>`__).

-  Properly set up the DNS information for a mail host (`Chapter?29,
   *Network Servers* <network-servers.html>`__).

-  Know how to install additional third-party software (`Chapter?5,
   *Installing Applications: Packages and Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------------+---------------------------------+
| `Prev <pppoa.html>`__?              | `Up <network-communication.html>`__   | ?\ `Next <mail-using.html>`__   |
+-------------------------------------+---------------------------------------+---------------------------------+
| 27.5.?Using PPP over ATM (PPPoA)?   | `Home <index.html>`__                 | ?28.2.?Mail Components          |
+-------------------------------------+---------------------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

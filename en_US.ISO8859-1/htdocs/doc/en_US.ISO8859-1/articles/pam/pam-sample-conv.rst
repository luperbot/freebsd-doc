===================================
C.?Sample PAM Conversation Function
===================================

.. raw:: html

   <div class="navheader">

C.?Sample PAM Conversation Function
`Prev <pam-sample-module.html>`__?
?
?\ `Next <pam-further.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="appendix">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

C.?Sample PAM Conversation Function
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The conversation function presented below is a greatly simplified
version of OpenPAM's
`openpam\_ttyconv(3) <http://www.FreeBSD.org/cgi/man.cgi?query=openpam_ttyconv&sektion=3>`__.
It is fully functional, and should give the reader a good idea of how a
conversation function should behave, but it is far too simple for
real-world use. Even if you are not using OpenPAM, feel free to download
the source code and adapt
`openpam\_ttyconv(3) <http://www.FreeBSD.org/cgi/man.cgi?query=openpam_ttyconv&sektion=3>`__
to your uses; we believe it to be as robust as a tty-oriented
conversation function can reasonably get.

.. code:: programlisting

    /*-
     * Copyright (c) 2002 Networks Associates Technology, Inc.
     * All rights reserved.
     *
     * This software was developed for the FreeBSD Project by ThinkSec AS and
     * Network Associates Laboratories, the Security Research Division of
     * Network Associates, Inc.  under DARPA/SPAWAR contract N66001-01-C-8035
     * ("CBOSS"), as part of the DARPA CHATS research program.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions
     * are met:
     * 1. Redistributions of source code must retain the above copyright
     *    notice, this list of conditions and the following disclaimer.
     * 2. Redistributions in binary form must reproduce the above copyright
     *    notice, this list of conditions and the following disclaimer in the
     *    documentation and/or other materials provided with the distribution.
     * 3. The name of the author may not be used to endorse or promote
     *    products derived from this software without specific prior written
     *    permission.
     *
     * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
     * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
     * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
     * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
     * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
     * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
     * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
     * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
     * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
     * SUCH DAMAGE.
     *
     * $FreeBSD$
     */

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <unistd.h>

    #include <security/pam_appl.h>

    int
    converse(int n, const struct pam_message **msg,
        struct pam_response **resp, void *data)
    {
        struct pam_response *aresp;
        char buf[PAM_MAX_RESP_SIZE];
        int i;

        data = data;
        if (n <= 0 || n > PAM_MAX_NUM_MSG)
            return (PAM_CONV_ERR);
        if ((aresp = calloc(n, sizeof *aresp)) == NULL)
            return (PAM_BUF_ERR);
        for (i = 0; i < n; ++i) {
            aresp[i].resp_retcode = 0;
            aresp[i].resp = NULL;
            switch (msg[i]->msg_style) {
            case PAM_PROMPT_ECHO_OFF:
                aresp[i].resp = strdup(getpass(msg[i]->msg));
                if (aresp[i].resp == NULL)
                    goto fail;
                break;
            case PAM_PROMPT_ECHO_ON:
                fputs(msg[i]->msg, stderr);
                if (fgets(buf, sizeof buf, stdin) == NULL)
                    goto fail;
                aresp[i].resp = strdup(buf);
                if (aresp[i].resp == NULL)
                    goto fail;
                break;
            case PAM_ERROR_MSG:
                fputs(msg[i]->msg, stderr);
                if (strlen(msg[i]->msg) > 0 &&
                    msg[i]->msg[strlen(msg[i]->msg) - 1] != '\n')
                    fputc('\n', stderr);
                break;
            case PAM_TEXT_INFO:
                fputs(msg[i]->msg, stdout);
                if (strlen(msg[i]->msg) > 0 &&
                    msg[i]->msg[strlen(msg[i]->msg) - 1] != '\n')
                    fputc('\n', stdout);
                break;
            default:
                goto fail;
            }
        }
        *resp = aresp;
        return (PAM_SUCCESS);
     fail:
            for (i = 0; i < n; ++i) {
                    if (aresp[i].resp != NULL) {
                            memset(aresp[i].resp, 0, strlen(aresp[i].resp));
                            free(aresp[i].resp);
                    }
            }
            memset(aresp, 0, n * sizeof *aresp);
        *resp = NULL;
        return (PAM_CONV_ERR);
    }

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+----------------------------------+
| `Prev <pam-sample-module.html>`__?   | ?                       | ?\ `Next <pam-further.html>`__   |
+--------------------------------------+-------------------------+----------------------------------+
| B.?Sample PAM Module?                | `Home <index.html>`__   | ?Further Reading                 |
+--------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

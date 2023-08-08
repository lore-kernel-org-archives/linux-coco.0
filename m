Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89D914F94
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 16:07:44 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4036bd4fff1so293661cf.0
        for <linux-coco@lists.linux.dev>; Tue, 08 Aug 2023 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691510863; x=1692115663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8KJ5t+CiuSqsFYkiJ2Ez3PlStQR/yi3Jik6zirchtNg=;
        b=3rruu8VuQ6sEnx24V6i4EeBKQXuAYJ3UJoVV/TwptPF1nnHVWsrENT6C/rgoUsFLpE
         u2ZH6Mm2HudmF4Tq+4yZJMk2KulpkkZh60w6a+vnXK4a1OYH4JSUo2PdGAxHIrbuHrOM
         FCL1WDxv2EL9XJPzMm0P4NU77fqKLaU6dWV+qvWA3MSmdC4/XAPy86kEj3PV1pntJle2
         BCcQWfjCyWxvFx+H9XOnpKQeGwMIm409WshtOtmW5iWsWxkCSH/wS39fwcjRsbcE03NF
         zdZFukacIMYWAolIqT5GLdX8hyytJeXHnAiJgJ43z+vbPgvMGz5v0BXHYxMeXUnBpcfw
         OJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510863; x=1692115663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KJ5t+CiuSqsFYkiJ2Ez3PlStQR/yi3Jik6zirchtNg=;
        b=L50ZOhFJJqfMOleG12nnkCriCGv0WYVrvhicVn2Z3K+pMAEVqj2k7d2T0CWVonzaEd
         GAOvdH+LH1kdCWhYl5x6cu/cKZ47tdXUpkdJrx6AItMHgcjPDSpUocJLvqCczsGvPXov
         Nu58DrB9A48kXs/xR1mOKkFcYoEdcZF39GSq9cEoPLML50CffJ/gEt7Ufwz7Mun6Bnba
         FBq55agoUp/tpnC3kZ8UP556f+aknuZ1OqSdO1HuxXsMA0J/Ftt8t8JGWZQOqKEyIc2y
         zx7zfm/Mo+1Z2MlTagukSzOSsnJHDT838XR02F9FR6h3RxxsSrL8ZSoZkO2XJHLxmIk3
         KOuw==
X-Gm-Message-State: AOJu0Yz+IpC2bZjtsHDO1pWwtNQNoZSZefuERefRV82Pa2Cmt15wbJx1
	f/SB369UOBfpVjfyVzlMpwn3AuNxlSEuXtwnm5ucqA==
X-Google-Smtp-Source: AGHT+IHt6voO9BYVJcWdEkniRLCcqBRLef735ePpp1tfW1zNahlgGDA7vGpo612clikAIgeIZaaP9JI5rM3a1iauBbg=
X-Received: by 2002:ac8:5b08:0:b0:403:b1d0:2f0a with SMTP id
 m8-20020ac85b08000000b00403b1d02f0amr746939qtw.28.1691510863628; Tue, 08 Aug
 2023 09:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
 <a507ef3302d3afff58d82528ee17e82df1f21de0.camel@HansenPartnership.com>
 <64c5ed6eb4ca1_a88b2942a@dwillia2-xfh.jf.intel.com.notmuch>
 <c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com>
 <64cdb5f25c56_2138e294f1@dwillia2-xfh.jf.intel.com.notmuch>
 <1180481830431165d49c5e64b92b81c396ebc9b1.camel@HansenPartnership.com>
 <64d17f5728fbc_5ea6e2943f@dwillia2-xfh.jf.intel.com.notmuch>
 <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
 <2425e00b-defb-c12b-03e5-c3d23b30be01@linux.intel.com> <64d263e44e401_2138e29486@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <64d263e44e401_2138e29486@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 8 Aug 2023 09:07:32 -0700
Message-ID: <CAAH4kHamob7g_+BRd0JW76cM7_vS=jzXzRjrgCPDxZ29VnzdCQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] keys: Introduce a keys frontend for attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, dhowells@redhat.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Peter Zijlstra <peterz@infradead.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-coco@lists.linux.dev, keyrings@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> At least that was not the level of concurrency I was worried about. The
> sysfs approach makes it so that concurrency problem of option-writing vs
> report-reading is pushed to userspace.
>

The reason I would advocate against making attestation report
collection single-threaded in user space at a machine level is that
there are new schemes of attested connections that may become the
basis of server handshakes. I think folks are mainly looking at this
from the use case of

1. workload will do large amounts of work on behalf of the VM owner,
provided it gets a sealing key released by the VM owner once on boot
after proving its code identity

however I'm thinking of the case of a more user-centric use case that
enables service users to challenge for proof of workload identity

2. workload is a server that accepts incoming connections that include
a hardware attestation challenge. It generates an attestation report
that includes the challenge as part of the connection handshake

This posits the existence of such an advanced user, but high security
applications also have users with high expectations. I want the option
to be open to empower more users to have access to provable workload
provenance, not just the VM owners that are unlocking resources.

> For example, take the following script:
>
> $ cat -n get_report
>      1  #!/bin/bash
>      2  tsm=/sys/class/tsm/tsm0
>      3  echo $1 > ${tsm}/privlevel
>      4  echo $2 > ${tsm}/format
>      5  echo "hex encoded attestation report for: $(cat ${tsm}/provider)"
>      6  xxd -p -c 0 -r ${tsm}/report
>
> The kernel handles the concurrency of line 6 where it synchronizes
> against new writes to the options for the duration of emitting a
> coherent report. However, if you do:
>
> $ get_report 2 extended > reportA & get_report 0 default > reportB
>
> ...there is race between those invocations to set the options and read
> the report.
>
> So to solve that concurrency problem userspace needs to be well behaved
> and only have one thread at a time configuring the options and reading
> out the report before the next agent is allowed to proceed. There are
> several ways to do that, but the kernel only guarantees that the state
> of the options is snapshotted for the duration of 6.



-- 
-Dionna Glaze, PhD (she/her)

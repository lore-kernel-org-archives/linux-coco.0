Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED52571B4
	for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 22:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349375; cv=none; b=pZcdu+d3b6/shglHV3XO4yGwW4rWd0mO9wsHGTf+IRbjRsR07G1GXecnpNW6U6tZUnPW1LRf/be25U/lAjqrTmdRg8xTwNxP15g+q7aB1g5FgiZL9RqX9DDXXaWjL3J7yV++Hz/543vEBmu5oekdMDcJlnadIuaACxhgzank6Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349375; c=relaxed/simple;
	bh=89+mIPSEyl1jk20Zi3bSoa8/o1ewvizvZ+xuQMqcg1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTSV0xfJf6EKgv7toxC1T7CMtTdvbMr/6iExa/XodAwTjD4uXG9f3YoS7LYlb7swGk0Cdj/uad6mf2Rs12zt7pM2cjwhbX4rqrmhbThrq6YP9527H/AZlmDiR5I7eP1VHg2jXIw+GwvD0oefk7EDnhyBt7szfUraK0zgiIkgWFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E+Jm1p15; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E+Jm1p15"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-327fa3ceccdso14088541fa.1
        for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 15:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747349372; x=1747954172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCSS97t3u1kdRKYKlrm084u+oSo6ltFMNTSE/4G2Uf8=;
        b=E+Jm1p1584P9OHdWlWziH/n8jQllMJG/KHnBtOZWGkPD9XqdyPpS/2s0KHCJeCb38s
         U8com2Y6TCxaK+suRXj+y66fRm9OSeRdr19omF4+toNmc5hmzN8+7gG2hvBjmGNrM8CM
         8NRTDOSar5l52GXtm7vWONx2A/EOIhEu5lovfATud+7ce8RKjis1IvDaP0OTjFPuPefL
         +Gpj66JVnbc57CYQvsaZroEolpG6oFFgjpyaRRZ/1hYDxu3dcH/I7iQ6+hYpqsLDBlc5
         oxRJPNE2Pi435MyytanIKHDkNvlZF98TZPah0T1j18QNye4QQtaFefi4FCzEmMIlLfOr
         2WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747349372; x=1747954172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCSS97t3u1kdRKYKlrm084u+oSo6ltFMNTSE/4G2Uf8=;
        b=D7COcvNIMVrDkPY8l27LA9LkzrrL0sd/CK0GYbVVhMf17I5irPjKYpq/0QT18Luy5c
         02zGIMuioiH3B0k4IEFY13ckrdEYcHh2Tio0VsXyWJa76EMDI65xl/rJOWimvtz/5IiW
         g51YLHs4uBiutB4DYHUCQIfkR08s73a/JyGCdPfeQfhbsqy7W9M5WFLkqYA9eT27RFH7
         xTzfxtlnoTMuARntMJrVuJbpCP9L06cbqGtGHmDPHAHMNU2dPysGV9TOpaPDQd1rZbbh
         9jP+OPYBBPwytCrISURsTyHbp31XEfDMZ8XbuMYg/42NQfAYpGoC0Kzyjz8PGrgwImys
         a59Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzURZq2I9C3hhF/s3JpcBXoJajOw9B5yY82O0oTo/i6kSordT7XOstqMT3crBndiDa1aPqwLD3jj+t@lists.linux.dev
X-Gm-Message-State: AOJu0YygYJk2XF0pO7HrPtRmqA48ga3yE2Px4xHw4N+WEQUYlh2b7qSS
	7R9/c7Dy98MB/c0jjaV6EjZNcOfATyTga3t/BVjxu0lgF4IL+pYJ50xDB0+c3l03GGz8iA/zdxD
	eN7pci7DupSfcikpbgPB2H7apc4nNThRvuqex0owJ
X-Gm-Gg: ASbGncvBz23nXYaIVvyJG8KCQY8+cAABq33dpuiH5Hp7bmJRB1Cm5sH5qofHiLbkxQX
	ucaqZ6E9QjDf84ubdarESxejZJzlTxu090k5LdovFNdIDoXnDcNyWoV5asUnOonS3wB225+/j3+
	iL+X62QKSk9X4HJsAzw1oCYDPgRL7bqbG4WVdEs6ksnn4nxQIXC/5yyzdcW6GEwQ==
X-Google-Smtp-Source: AGHT+IHWtANlYcuCC0/XDTHQZBRE5/tMfTuNY3gJfr1KwCQEvBfhzh2eNdxODeINaXFLI/yLb0ytPZNTnpKZvqT9UXY=
X-Received: by 2002:a05:651c:b25:b0:328:604:9da8 with SMTP id
 38308e7fff4ca-328096986cdmr1537141fa.6.1747349371669; Thu, 15 May 2025
 15:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
 <20250515220400.1096945-2-dionnaglaze@google.com> <aCZtdN0LhkRqm1Vn@google.com>
In-Reply-To: <aCZtdN0LhkRqm1Vn@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 15 May 2025 15:49:11 -0700
X-Gm-Features: AX0GCFspY1AzLrcrLzhIyg__-nVMLoKyDv5UQXRrl1jv0rhubP1IoCC60mMRPaQ
Message-ID: <CAAH4kHYBoGeGftvGwPb+NtB8pz-LKubseZfa+oHsd1TbSxU6kA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 3:40=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, May 15, 2025, Dionna Glaze wrote:
> > The AMD-SP is a precious resource that doesn't have a scheduler other
> > than a mutex lock queue. To avoid customers from causing a DoS, a
> > mem_enc_ioctl command for rate limiting guest requests is added.
> >
> > Recommended values are {.interval_ms =3D 1000, .burst =3D 1} or
> > {.interval_ms =3D 2000, .burst =3D 2} to average 1 request every second=
.
> > You may need to allow 2 requests back to back to allow for the guest
> > to query the certificate length in an extended guest request without
> > a pause. The 1 second average is our target for quality of service
> > since empirical tests show that 64 VMs can concurrently request an
> > attestation report with a maximum latency of 1 second. We don't
>
> Who is we?
>
> > anticipate more concurrency than that for a seldom used request for
> > a majority well-behaved set of VMs. The majority point is decided as
> > >64 VMs given the assumed 128 VM count for "extreme load".
> >
> > Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Joerg Roedel <jroedel@suse.de>
> > Cc: Peter Gonda <pgonda@google.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Sean Christopherson <seanjc@google.com>
> >
> > Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
> > ---
> >  .../virt/kvm/x86/amd-memory-encryption.rst    | 23 +++++++++++++
> >  arch/x86/include/uapi/asm/kvm.h               |  7 ++++
> >  arch/x86/kvm/svm/sev.c                        | 33 +++++++++++++++++++
> >  arch/x86/kvm/svm/svm.h                        |  3 ++
> >  4 files changed, 66 insertions(+)
> >
> > diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Doc=
umentation/virt/kvm/x86/amd-memory-encryption.rst
> > index 1ddb6a86ce7f..1b5b4fc35aac 100644
> > --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> > +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> > @@ -572,6 +572,29 @@ Returns: 0 on success, -negative on error
> >  See SNP_LAUNCH_FINISH in the SEV-SNP specification [snp-fw-abi]_ for f=
urther
> >  details on the input parameters in ``struct kvm_sev_snp_launch_finish`=
`.
> >
> > +21. KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE
> > +-----------------------------------------
> > +
> > +The KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE command is used to set a per=
-VM rate
> > +limit on responding to requests for AMD-SP to process a guest request.
> > +The AMD-SP is a global resource with limited capacity, so to avoid noi=
sy
> > +neighbor effects, the host may set a request rate for guests.
> > +
> > +Parameters (in): struct kvm_sev_snp_set_request_throttle_rate
> > +
> > +Returns: 0 on success, -negative on error
> > +
> > +::
> > +
> > +     struct kvm_sev_snp_set_request_throttle_rate {
> > +             __u32 interval_ms;
> > +             __u32 burst;
> > +     };
> > +
> > +The interval will be translated into jiffies, so if it after transform=
ation
>
> I assume this is a limitation of the __ratelimit() interface?

It is.
>
> > +the interval is 0, the command will return ``-EINVAL``. The ``burst`` =
value
> > +must be greater than 0.
>
> Ugh, whose terribly idea was a per-VM capability?  Oh, mine[*].  *sigh*
>
> Looking at this again, a per-VM capability doesn't change anything.  In f=
act,
> it's far, far worse.  At least with a module param there's guaranteed to =
be some
> amount of ratelimiting.  Relying on the VMM to opt-in to ratelimiting its=
 VM if
> userspace is compromised is completely nonsensical.
>
> Unless someone has a better idea, let's just go with a module param.

Thanks for that. Do you want the module param to be in units of KHZ (1
interval / x milliseconds),
and treat 0 as unlimited?

The original burst value of 2 is due to an oddity of an older version
of the kernel that would ratelimit
before handling the certificate buffer length negotiation, so we could
simply have a single module
parameter and set the burst rate to 1 unconditionally.

I'd generally prefer this to go in after Michael Roth's patch that
adds the extended guest request support.

>
> [*] https://lore.kernel.org/all/Y8rEFpbMV58yJIKy@google.com
>
> > @@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_svm =
*svm, gpa_t req_gpa, gpa_t resp_
> >
> >       mutex_lock(&sev->guest_req_mutex);
> >
> > +     if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> > +             svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ER=
R_BUSY, 0));
> > +             ret =3D 1;
> > +             goto out_unlock;
>
> Can you (or anyone) explain what a well-behaved guest will do in in respo=
nse to
> BUSY?  And/or explain why KVM injecting an error into the guest is better=
 than
> exiting to userspace.



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)

Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118A1E25FB
	for <linux-coco@lists.linux.dev>; Fri,  1 Nov 2024 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730494422; cv=none; b=Xc748dd6IMxxWL/WU7W6Ou1kmCDZdpbVjAXeN2TE0uhPROgqMS+w65bQZHzHmUFOterV6Q/RivpHUiUS216+Z0G/ZqHaAxWn8YN1p+mx3+qGCCqthPa5eq5NUIQbtkMR87BxhUOdtG2U3JiSKCsDn1seSwCaxauVmvPH8lyipU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730494422; c=relaxed/simple;
	bh=YhxBh8Iax95XN2vr+xnyoQlastBvm7la0Lczo0OzpQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TaRaUjiJ9HdBAHr4xOMJ/MASkJkOkGSFnjfAbIE1Wx6DTkcr5CiN+FpE5IGm7EAVF0Ucpo6AeMzCHSu2Oizl+7P5Kx85tti4igWQ86ioK/3i32YxNu4g5K0/MRM7bkWSG6+DhrwBqRGXFbeFQ0pxp27fXmNPQKbLqjMpqDc8k8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iLbFOC7F; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iLbFOC7F"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so42507a12.0
        for <linux-coco@lists.linux.dev>; Fri, 01 Nov 2024 13:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730494419; x=1731099219; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58tht0yElv8TtI+sAULnDvoOIpdA327LXw1TPAfTplE=;
        b=iLbFOC7FW36aHqfVB4eyAdJHm/febhgWSon1/3qSBVDbRIjBYh25AVWMTZCpaexO/D
         8O0zg6SjByyRNDZr7VxhdNM3sJv7NEa3J3C1rtNNkLM5Oy5I5VDgxuN5FMURTHCXLu70
         m3uQF/+XW5xPlyt7AlOulMnCB65wNJfMbnCjQDc43U5uIeIDf4YSBMBdelcg2zyZxMoC
         vnAccvqlTx1K4rHp7xRjD7IbNULsL18zR/wQAnPyKoXPStOOW+Cs4J6pzIUdaS/GE2p5
         LlN6+OdJikdo5N1pBiF+4Kl1kzAFA+daTy2aRk/fFTlkkNLQFfYMkVQ5Ir8cuPOBj/Ts
         e42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730494419; x=1731099219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58tht0yElv8TtI+sAULnDvoOIpdA327LXw1TPAfTplE=;
        b=ZBTMG3q91w2QSIqrWJhrCHZqVtHVYzmBK8rLIy22MmyIhIOA3XWIbf8/wgydyQkchZ
         CkGBBCtd/255dZSt3SLrUSQMU9sqHaQAk35NPN74z4mdmYDnCiPHzHjgiUE1mufyhf7B
         /lHOTfN33mNkfiVXFVOnSvi3NLbN1g3FCyyK8rsI0yuPil2mF/+sfr0SlNe4RbY3rN1Z
         sL5RLNYpVVKTOLova5pd4R+DIl4MVUhHyrhXh4FWkoBDvh50KmNQPQmWX9D985UiyCAg
         eyLtPFpNsAZbeYQgL2Z9TvR8qhoOPquzGUbmMfsInfZSZ2b7sKyzwdnWgj4GVsZj5/sz
         tnnA==
X-Forwarded-Encrypted: i=1; AJvYcCVEuLbfXO5jKQBQfifTyLCTMbOTRMET26Se1JLPUl5ioOix1EXjpqvUITqUOWi5IC31AmbOMz2THEm6@lists.linux.dev
X-Gm-Message-State: AOJu0YxTAr+pgHxhf41WpsHGATl1mCtgkAn8wz3QXQNZ/TlFlOyJFtuD
	pV842JzLPQeMCuUlV1EugogrDGaeVqs9tKAYutkE3U1qh3Jy/Oeg3BROn+YlLcUgxwlgzBNLJLe
	JTCKQyM9S/AmHas/tUKqirrfkzv82+ycMhU70
X-Google-Smtp-Source: AGHT+IE4TWdxH1MLmqqXHDxQAw+ZDcpavLufUykLmmX4/YLQSUoEUsRYxXg3C+icr7ZlE2NhvH0m2iLVncVh8fgUUXo=
X-Received: by 2002:a17:907:7211:b0:a9a:ad8:fc56 with SMTP id
 a640c23a62f3a-a9de6167c81mr2142334766b.44.1730494419041; Fri, 01 Nov 2024
 13:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-5-michael.roth@amd.com> <ZnwkMyy1kgu0dFdv@google.com>
 <r3tffokfww4yaytdfunj5kfy2aqqcsxp7sm3ga7wdytgyb3vnz@pfmstnvtuyg2>
 <Zn8YM-s0TRUk-6T-@google.com> <r7wqzejwpcvmys6jx7qcio2r6wvxfiideniqmwv5tohbohnvzu@6stwuvmnrkpo>
 <f8dfeab2-e5f2-4df6-9406-0aff36afc08a@linux.intel.com> <CAAH4kHZ-9ajaLH8C1N2MKzFuBKjx+BVk9-t24xhyEL3AKEeMQQ@mail.gmail.com>
 <Zx_V5SHwzDAl8ZQR@google.com>
In-Reply-To: <Zx_V5SHwzDAl8ZQR@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 1 Nov 2024 13:53:26 -0700
Message-ID: <CAAH4kHaOy0s93vp96-ZeX3PykCv_XsGM3z36=Fr1dEADsctMrg@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] KVM: Introduce KVM_EXIT_COCO exit type
To: Sean Christopherson <seanjc@google.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	pbonzini@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, 
	pgonda@google.com, ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Chao P Peng <chao.p.peng@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 11:20=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Fri, Sep 13, 2024, Dionna Amalie Glaze wrote:
> > We can extend the ccp driver to, on extended guest request, lock the
> > command buffer, get the REPORTED_TCB, complete the request, unlock the
> > command buffer, and return both the response and the REPORTED_TCB at
> > the time of the request.
>
> Holding a lock across an exit to userspace seems wildly unsafe.

I wasn't suggesting this. I was suggesting adding a special ccp symbol
that would perform two sev commands under the same lock to ensure we
know the REPORTED_TCB that was used to derive the VCEK that signs an
attestation report in the MSG_REPORT_REQ guest request. We use that
atomicity to be sure that when we exit to user space to request
certificates that we're getting the right version certificates.

>
> Can you explain the race that you are trying to close, with the exact "ba=
d" sequence
> of events laid out in chronological order, and an explanation of why the =
race can't
> be sovled in userspace?  I read through your previous comment[*] (which I=
 assume
> is the race you want to close?), but I couldn't quite piece together exac=
tly what's
> broken.

1. the control plane delivers a firmware update. Current TCB version
goes up. The machine signals that it needs new certificates before it
can commit.
2. VM performs an extended guest request.
3. KVM exits to user space to get certificates before getting the
report from firmware.
4. [what I understand Michael Roth was suggesting] User space grabs a
file lock to see if it can read the cached certificates. It reads the
certificates and releases the lock before returning to KVM.
5. the control plane delivers the certificates to the machine and
tells it to commit. The machine grabs the certificate file lock, runs
SNP_COMMIT, and releases the file lock. This command updates both
COMMITTED_TCB and REPORTED_TCB.
6. KVM asks firmware to complete the MSG_REPORT_REQ request, but it's
a different REPORTED_TCB.
7. Guest receives the wrong certificates for certifying the report it
just received.

The fact that 4 has to release the lock before getting the attestation
report is the problem.
If we instead get the report and know what the REPORTED_TCB was when
serving that request, then we can exit to user space requesting the
certificates for the report in hand.
A concurrent update can update the reported_tcb like in the above
scenario, but it won't interfere with certificates since the machine
should have certificates for both TCB_VERSIONs to provide until the
commit is complete.

I don't think it's workable to have 1 grab the file lock and for 5 to
release it. Waiting for a service to update stale certificates should
not block user attestation requests. It would make 4's failure to get
the lock return VMM_BUSY and eventually cause attestations to time out
in sev-guest.

>
> [*] https://lore.kernel.org/all/CAAH4kHb03Una2kcvyC3W=3D1ZfANBWF_7a7zsSmW=
hr_r9g3rCDZw@mail.gmail.com



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)

Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949523B27D1
	for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786469817; cv=none; b=eFV1NuYZLxcYdLDssALmvUZBiSUF6pz0YM2kFuasYoHTMwkk3BGUJkJw0OoRc70iSh30PvorDehOpR8MJzHNarCIrn6uMFAdkBYrj8NphSUXx7RQxaqPzwlAD/7JHon3sF0upTmYJmiTmkemuZkom0HwyIBrU5nIljfDHf4LlVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786469817; c=relaxed/simple;
	bh=HoEmxgbK/wtPn0Cayj/QuLhhlOz/pCLd2KRV41VuIzA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pswIlHym7A5AeSQt0HaEZYtStJ561H3JCYRT5CSW1xSTHA5cKvatx5goI4flNQTle7w9XV6gQFYJOJvxCLtFB0Yd2mLchbmiNClyCBwVtHlo7sqrJtBbYv0T7i/aRrggswiry7Iv1hWU5sUuapa4Eb8JuBb35AjNrYHjVLrc8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1KHdrkC; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1KHdrkC"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedf42f199so20796a12.2
        for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786469816; x=1787074616; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uJUp/BOYCSOq/Hvm932vFhS6A5T0Mt8edhLMmR3oVSU=;
        b=c1KHdrkC8uxBwNOE5DRbDSqKLacUqUuy4xrSl3QokdCs7wlPdSXqlRbuSQfSL3rucR
         DrjZBaT9wT5qv1HZTP9WsUGhi5/pGTUbImMdNLn6JYJFQr+645JfIYi36FWywePw3ugT
         c3kozirNqrt8JFInjDRo6mJubvBVTAG+hT/L22+we2gV0bVisNTKbFguIPVrOPpFPc+g
         pkYoXfvALZJLs9dcG6EuiCsHqNhtEWPTB6DynVAXRRqsQ7kTlpKZP6nKUsllZf4zC6ib
         JCVjSJ1O6jsXFw8cYWe6nd/kUeHstwyarwW4E+4h+4G3xPhxKDkXF4looQHWGi7ujNA8
         Sfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786469816; x=1787074616;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJUp/BOYCSOq/Hvm932vFhS6A5T0Mt8edhLMmR3oVSU=;
        b=gnHwyhUAX27p2Jpp3QKkrheiD8yriPQZKaooWNX+VSn3/qgnDOLMXOlrNM2RY6jxgE
         3rDqv0mExK+Qb0Px3VBVW/w6OT/V9hIFjJMuihvf/w5s3fZfshO4BZTgV9RkeO4YGiy0
         /ibxCij4I55DYCy2SVW8RcwTUoI+FjJJ0kcbMyoZViTLBZBfqw+e1jIULGFuVgT4/t8I
         8EPx/h9hNycQ2ST4/EG1o2G98NIOGg6VpdWIv4yMblA3A94XB9UdViECqiVgiU+3EXvQ
         f5GmK/vwuAevG0B/1nevWL83VrSpvkYkknTiJnvLUcpUKk/QgazkW7/MloWDlDwyeagU
         x7RQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwIWETGJsMGFgKtYj0gP9sWmJ4VXlnQN6KvYklsggC625/KnIXsekQELB6bx+9JRuRHi01to4BUGIY@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx7Jlgg0Oa6S7zvY5296qt/E0mpeLNXcKiBTrJC2BX8kbRdIky
	7YSNcXlcvg5tFdYkllghnyRNLUuAxvkCYMJUjw/WJeCuXhCvysbzUneIuj4rhoQak2Kk+GEHfpy
	2+BJXJA==
X-Received: from pggr14.prod.google.com ([2002:a63:d90e:0:b0:c93:72f7:5d59])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9217:b0:3bf:5539:f93
 with SMTP id adf61e73a8af0-3cc2bbcdb17mr7184530637.38.1786469815484; Tue, 11
 Aug 2026 10:36:55 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:36:54 -0700
In-Reply-To: <30686bd2-37a4-4cff-82df-29c918444a58@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810112200.2326727-1-xiaoyao.li@intel.com>
 <20260810112200.2326727-3-xiaoyao.li@intel.com> <anpmxJOESl3swUpd@google.com> <30686bd2-37a4-4cff-82df-29c918444a58@intel.com>
Message-ID: <antdtqaEZz5EkZS2@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Nikolay Borisov <nik.borisov@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026, Xiaoyao Li wrote:
> On 8/11/2026 8:03 AM, Sean Christopherson wrote:
> > The shortlog is way too generic, and the changelog is light on details.=
  Over
> > the weekend, I managed to forget why this was necessary, and it took me=
 a few
> > seconds to recall why we need to avoid setting bits 31:16.  Of course, =
one could
> > argue that says as much about me as it does the shortlog+changelog...
> >=20
> > Oh, and shortlogs like "Fix the exit reason handling" sometimes lead to=
 amusing
> > follow-ups like "Really fix the exit reason handling".  Don't be that p=
erson :-)
> >=20
> > Something like:
> >=20
> >    KVM: TDX: Don't clobber exit_reason[31:16] when TDX-Module didn't tr=
y VM-Entry
>=20
> 1. It's not only about clobbering the exit_reason[31:16], but also about =
how
> to interpret the basic exit, e.g.. the change
>=20
> -	switch (exit_reason) {
> +	switch (exit_reason.basic) {

But the current TDX code doesn't care.  The switch in tdx_to_vmx_exit_reaso=
n()
operates on the raw vp_enter_ret value, not a synthesized/clobbered exit re=
ason.

And the switch in tdx_handle_exit() isn't reachable for the clobbering case
thanks to this check.

	if (unlikely(vp_enter_ret =3D=3D EXIT_REASON_EPT_MISCONFIG)) {
		KVM_BUG_ON(1, vcpu->kvm);
		return -EIO;
	}

I agree that not clobbering exit_reason[31:16] is useful for additional cle=
anups,
but that isn't the main motiviation for the patch.  The precision matters, =
because
it changes this patch from a "nice to have cleanup" to "this is 100% mandat=
ory to
enable Instruction Timeout VM-Exits on TDX".

> 2. It's not only about TDX module doesn't try VM entry, bus also about a
> valid VM exit after successful VM entry. This patch also preserves the
> exit_reason[31:16] for a valid VM exit. (One could argue that existing co=
de
> cannot clobber exit_reason[31=EF=BC=9B16] because the code to clobber it =
requires
> the [31:16] to be 0, because of switch (exit_reason))
>=20
> 3. For the case where TDX module doesn't try VM-Entry, I'm not sure if
> "clobber" is the correct word. There is no valid exit reason, so nothing =
to
> be really clobbered. Just don't synthesize a exit reason with non-zero bi=
t
> 31:16.
>=20
> My intent was just using one patch to handle them all, so as to make KVM
> behave correctly after enabling Bus Lock VM exit for TDX in the next patc=
h.
> Because they are targeted for stable kernels.
>=20
> What's your advice then? What do you think of spliting it into multiple s=
o
> that it's easier to write a shortlog and changelog for each one.

Heh, my advice is pretty much always the same: when in doubt, split.  Squas=
hing
patches together is trivial, disentangling changes after the fact is not.

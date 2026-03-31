Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D757A45BD71
	for <linux-coco@lists.linux.dev>; Tue, 31 Mar 2026 23:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774998283; cv=none; b=tXTu4ElWNmhXe98CmLQffaRHtTj1WDPrpTSidVnn34hhj8/Bh7jOvx4EgLXU6+DyetDoaJuvNIcv5CUl7YHEawp5TZJDb4m1QYedoF8s9DpgWREZxiqHEiOBJxiI2n+kmZVINafUlsROnETe3dhd1obXbx1rBnL7kQrjNvwqZyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774998283; c=relaxed/simple;
	bh=pN/i0QyQE864eRZEEAl0yyK2SbJLSBPkZs34zuowLPE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hqXYRmy6+UqSt9wu0L28ftKUoVIKao7VJbp6b1EQd1ObWmBEzoNOILRKyIRsImEgvlmL3OGHLEkHAeGsph8xOaUYeTFWoLP64ySWQ+PuJ5vuTuW4Loi2M8FKnL0u3ekvFXsY7rGTRwipz3s6HdXFGbw85r1/Jdn+Qi+MjRgmAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dU6q958+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dU6q958+"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c7691378914so1694500a12.0
        for <linux-coco@lists.linux.dev>; Tue, 31 Mar 2026 16:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774998281; x=1775603081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEnbERBIDQ4MTbld4MJTDZBsNz2jmuUspcqZ6/0jR0c=;
        b=dU6q958+AVfwkO4I4nQgGH8CLOQnf3wvrD7WwlKfCZIMf3YKIQZIBUERkaOPCTn80l
         KUAA2/Ap5+16yQw7lDIOcM8zNb2bYXea4vGg3wRJFxlkfMDo67KNWSo6DG6q0+DvkE/I
         1ru688QKsdpWjsw4PwBrYBn0Oxb8kFTWitBHfkcHaMz7DuEqaedjdcwiEMjcTyME8afc
         HD4cOGZi2l2pbTrvU/nQUE0HXPAn8ACHoSOdHrss1edhctAJi+6HJbMxuBhcXZVIHn9k
         C9U+7M8/CaSr3gtrq1pDSJS25kKgXnJS/15ewC/iyPsAXymz86d/d+c89vZG+M0rQ/+H
         MugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774998281; x=1775603081;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HEnbERBIDQ4MTbld4MJTDZBsNz2jmuUspcqZ6/0jR0c=;
        b=VNii/X3CE3POOocGeYXMCpp2YmpXdToApAK9yyrnViRmuIMP63CgJ0CnJKqC4HDUS4
         o3tOAnb43D6sEzMjyIolGpc49a50N7UHoyhLysBAzr6Swa5T0BitolLiHepbam0ckUkY
         UYdOSpSvOH5GEN28p0VfZeEtG7P9SE61Wpzh+FqUN6OrRU5ePtfLClxkTptTQ/SlTYQE
         KRPkApXor6lYw3+BMHK0vaVR3dofoCTsLCT6M436mcj/ULAS/493pZ+lxqFmbKWgY+nu
         7hIh9PBeNivLI+Kd//rQPCIs1TiVz0e/8pnxCzWYsrwfbymktp8PEP1hBO4w48eWsY9/
         rP9A==
X-Forwarded-Encrypted: i=1; AJvYcCXeXoi8zcTGJgj1G+bJ+JHMOfuicyetG+gYRPlAhVT8yKqJGGJ0GyxKoyCSrt9hGRMRzU99xwjzbMjL@lists.linux.dev
X-Gm-Message-State: AOJu0YzPM3qenYR+33btoCI6PNXUPqXELTETWETxdskJmKjV/NbwCDY5
	56coTYsAP5XnYuhhqnxNx9h+1w/aZTuz2YGjUe+zfFGCgCm1BZ7FCtAoKuX+3oAnDL3Jp/6cUQH
	spilipQ==
X-Received: from pfbw8.prod.google.com ([2002:a05:6a00:b488:b0:82a:128b:1d95])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6c86:b0:82a:190b:2225
 with SMTP id d2e1a72fcca58-82ce8992790mr1124317b3a.31.1774998280940; Tue, 31
 Mar 2026 16:04:40 -0700 (PDT)
Date: Tue, 31 Mar 2026 16:04:39 -0700
In-Reply-To: <6ad3ff51bbab85147b716de0b1f4e8b994b1998b.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260323-fuller_tdx_kexec_support-v2-0-87a36409e051@intel.com>
 <20260323-fuller_tdx_kexec_support-v2-2-87a36409e051@intel.com>
 <acwe7kKyjfEQ0sIf@google.com> <6ad3ff51bbab85147b716de0b1f4e8b994b1998b.camel@intel.com>
Message-ID: <acxTBwaw6_xYSShf@google.com>
Subject: Re: [PATCH v2 2/5] x86/virt/tdx: Pull kexec cache flush logic into arch/x86
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Vishal L Verma <vishal.l.verma@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-03-31 at 12:22 -0700, Sean Christopherson wrote:
> > > -
> > > -#ifdef CONFIG_KEXEC_CORE
> > > -void tdx_cpu_flush_cache_for_kexec(void)
> > > -{
> > > -	lockdep_assert_preemption_disabled();
> >=20
> > Is there a pre-existing bug here that gets propagate to tdx_shutdown_cp=
u()?=C2=A0
> > When called from kvm_offline_cpu(), preemption won't be fully disabled,=
 but
> > per-CPU access are fine because the task is pinned to the target CPU.
> >=20
> > See https://lore.kernel.org/all/aUVx20ZRjOzKgKqy@google.com
>=20
> Yes. And actually it got hit during development of this series. This patc=
h will
> conflict with the fix:
> https://lore.kernel.org/lkml/20260312100009.924136-1-kai.huang@intel.com/
>=20
> Oh, you acked it actually. But I was under the impression that after this=
 patch
> here, the splat wouldn't be triggered. So it inadvertently fixes it.

Ah, that's why I was a bit confused.  I was assuming tdx_shutdown_cpu() was=
 a
cpuhp callback, but it's actually an IPI callback.

Hmm, isn't this patch wrong then?  Ah, no, the changelog says:

  However, WBINVD is already generally done at CPU offline as matter of cou=
rse.
  So don't bother adding TDX specific logic for this, and rely on the norma=
l
  WBINVD to handle it.

What's the "normal" WBINVD?  At the very least, tdx_offline_cpu() should ha=
ve a
comment that explicitly calls out where that WBVIND is.  I assume you're re=
ferring
to the wbinvd() calls in things like hlt_play_dead()?

But unless the WBINVD is actually costly, why bother getting fancy?

> But that other patch is much more backport friendly.


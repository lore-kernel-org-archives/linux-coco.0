Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D9F2D77E2
	for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762979101; cv=none; b=By6VFyIesXqZd/LOQLgYkTBBeFQ+fBm8SEoQSHJKuIPpB5xYDKNEATP/MWfVSFKUbfF4YERmexc22MgXIWp7+S5kb1wXlqAZKl55O3gtoq+BCIWftbdxJQXaf7UUpFs6E9B3ViA9MFbD4OYE54OwXBx7I3A/kd/9UFwtKaWRGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762979101; c=relaxed/simple;
	bh=xOBJurVKNAB+JN8ysTBvLTNXtFm6u8VFeaWdmIXvjpo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bmGECT0CCJd12QNnOzpOoYhoUl291joRjxqYR4EJUcTni1U8GB/RNtOElYxmQEfEPry8Z237ON7yAEheTWlNFQRvSKcxJZcmJb6wlfd0ytsB6MHa4cNoo+/Cxx2WA3V2QWIovi28GZKag+fLc8qk8Yj7NrIB33NBNGs6wJ3PY0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMXQZbjR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMXQZbjR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3437f0760daso159255a91.1
        for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 12:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762979099; x=1763583899; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R19jKoKnEOV3T9FY0coy72Eb+Kw/7o9G8gT0tt1VVRU=;
        b=fMXQZbjRjLzwCjDJks3aibm8pmQoYXNmKU9ft96GyV3LFTzIFeQbemCulhGU8ctXBZ
         IcBnT6mfJGF4/cfZDUaAlieXHPGk30nPmFWtaUxvoIfKOX0TrnrdGXoOdT9sC5fdIjdF
         GTnCtq+NS97+bBppNDs3JfswLkIFx4k4p4D7Gi98jSkVvvnvMdbPmpc4VZQYkQvidUnB
         7ldyr1uIfK1/Uf1xA65Htr2nvumiNOg/lYQLYlYcJwWOnRzwgk5+eadyjO21zElth+b7
         Uw6s16xqHwMByexb/q49EPRziTlxM7FUhoHm1xH5ch///kP7P7gmfvkAdQ7y1XmCZpN9
         YqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762979099; x=1763583899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R19jKoKnEOV3T9FY0coy72Eb+Kw/7o9G8gT0tt1VVRU=;
        b=YOVUMZz82huV3dCH8mPMpkyFWyW3zDcu+42QwcY8pigJ+SrGtKwdKT63etcBq4aqwk
         UsLuSNZbIGjhjWD2VTXvIJ5Fu8RJxwIWL5ki1WRY/65EN5MbTJg1PSm389agjTP8yMqv
         tM5xgbuYMtS23uYbaTj3ySLM7OArN3nHLJCVbdnCB+RFUD72ceP3+hpMxoaSxQCaLgFN
         Pq2v8ShVQ/xBeLy4A4wlHNtE/vvPcJWalj9ibIDJwdH33r1cvPf481abNrHz4GREPnYE
         034aagY0A+rszfTJ+pC6V/oGLH9f4MnRe1uFownEl2/vxqarSUWLfXAxXEx+KBuQviw3
         dMug==
X-Forwarded-Encrypted: i=1; AJvYcCVxocgdKG+eTpHMiUn2548ixAeyxK7djHfyHkvnGQ3INwme2S2WW0NvTHl5Enn4zUbhz9pB23xwSPaq@lists.linux.dev
X-Gm-Message-State: AOJu0YyIRHXcQ8pFOk2J8dGxDTVXOq6YyL+NqnNL7Hg/Qakf+8AKuzJY
	UMF/xBpN9YczUas2Gpf2yrrDm3EJfUJSDPZ8PnWDTrUbMey4MHX8lSY4EggWItpZLwVrmsINUXs
	3/PoUBg==
X-Google-Smtp-Source: AGHT+IEhrkRuxdVjG9E1wg6vwlC1Maca+rkxHkRIYFv3rPQj/aKYOj4uyC5LCnl4mOfkA9YSmbhXYZTSx+4=
X-Received: from pjbgc20.prod.google.com ([2002:a17:90b:3114:b0:340:bb32:f5cf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2741:b0:340:d569:d295
 with SMTP id 98e67ed59e1d1-343ddec5a1amr5597730a91.24.1762979099327; Wed, 12
 Nov 2025 12:24:59 -0800 (PST)
Date: Wed, 12 Nov 2025 12:24:57 -0800
In-Reply-To: <4a2a74e01bfd31bc4bd7a672452c2d3d513c33db.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251112171630.3375-1-thorsten.blum@linux.dev> <4a2a74e01bfd31bc4bd7a672452c2d3d513c33db.camel@intel.com>
Message-ID: <aRTtGQlywvaPmb8v@google.com>
Subject: Re: [PATCH RESEND] KVM: TDX: Use struct_size and simplify tdx_get_capabilities
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"thorsten.blum@linux.dev" <thorsten.blum@linux.dev>, "bp@alien8.de" <bp@alien8.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "hpa@zytor.com" <hpa@zytor.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 12, 2025, Rick P Edgecombe wrote:
> On Wed, 2025-11-12 at 18:16 +0100, Thorsten Blum wrote:
> 
> kvm x86 logs are suggested to start with a short summary of the patch. Maybe:
> 
> Simplify the logic for copying the KVM_TDX_CAPABILITIES struct to userspace.

Yeah, I have this locally as two separate patches:

  KVM: TDX: Use struct_size to simplify tdx_get_capabilities()
  KVM: TDX: Check size of user's kvm_tdx_capabilities array before allocating

Your CI caught me just in time; I applied this locally last week, but haven't
fully pushed it to kvm-x86 yet. :-)

> It looks like you are conducting a treewide pattern matching cleanup?
> 
> > > Retrieve the number of user entries with get_user() first and return
> > > -E2BIG early if 'user_caps' is too small to fit 'caps'.
> > > 
> > > Allocate memory for 'caps' only after checking the user buffer's number
> > > of entries, thus removing two gotos and the need for premature freeing.
> > > 
> > > Use struct_size() instead of manually calculating the number of bytes to
> > > allocate for 'caps', including the nested flexible array.
> > > 
> > > Finally, copy 'caps' to user space with a single copy_to_user() call.
> 
> In the handling of get_user(nr_user_entries, &user_caps->cpuid.nent), the old
> code forced -EFAULT, this patch doesn't. But it leaves the copy_to_user()'s to
> still force EFAULT. Why?

I'll tweak it to explicitly return -EFAULT.  Doesn't matter terribly, but KVM's
standard pattern is to explicitly return -EFAULT.

> Tested-by: Rick Edgecombe <rick.p.edgecombe@intel.com> (really the TDX CI)

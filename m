Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D730AAD7
	for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051352; cv=none; b=W3KXQANb3dYb+ZOPzHFxsRcXcFYVRbRNs3paDx8kZBz/+cP4QDCvGNhe09Gm81yxxl8QDL7gxj7BwMODy03rlchqRpSJBF+FcCQeZTSKjPhRfClKEVClZ14BzS/Nm3v8uyygQH7wKg41l5vG9t5xWNixVHRpS1XGJfa1HFgjJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051352; c=relaxed/simple;
	bh=JPzSVp59ZCmlDUI9Beydu0hu21hddcAy+tsckcJKHLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uswx50AhyXZtyqpO47MtsyvW5ymGmYUF/QAI6rwwgnQj1b0EGr3PsFyjP2QmpOtVZDlAbnoXeX9I+QPcz2NwlX3FgXyhhPCB1fa6Wbl9WoHbESjpAZf4cXHjGimEq8qYsfgpFMRDMAfqjJ7skmz5uagJy6sIED+zZ8PD1lfNHoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q8zVT3nD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q8zVT3nD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-297f587dc2eso12902235ad.2
        for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 08:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763051350; x=1763656150; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jggj5Ym/rIR7T7fXmMSGr1c+7mHxEtZV9zaRb5SwErk=;
        b=q8zVT3nDw1NbUt7Xt4q3lq4I53qyv6ZztrOONG5bsdWQI7V4NCLfU0hVUC60gZmCD1
         BI76sB56MakEA0n/21ziEg0vooIRC08it/7Tq/8Vukzob2P3hF+5R0Oz2MuLASipGk1S
         UOMwChEcC/maxUAZCAUcb431T1Qam8jzHuKMkDcrSwYN5NVJgBOEKwpa6ZVEffzwm+FZ
         WHAnWhan0sruHW+2TdKcrieak1GfSuVkQZ9XKgeEISmfSeI4/mACADL27GLtxhnZzoc0
         g0egOwSg/KFBfwHMG36OHaibxpGMY+2QLyCSYaBC/HFlwPEhmRPKRelG8SjGyngZTlJH
         OZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051350; x=1763656150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jggj5Ym/rIR7T7fXmMSGr1c+7mHxEtZV9zaRb5SwErk=;
        b=dEn1hnpZs9soENr34ZcFzn2PvmvEt5QZFhF1XJGj1AdaX2MfkBJnWhQhiN8bSrUFWU
         6luunyRzjbue4ShnzI35Q4S7Q4XpLWfLokM8zzYwX2NtucHCHVttdAW2vLMx3yBcmzz0
         Gj4ULdiAZjfRIyKIptTBWVY6EIYgBwTa3BZU88B0Wscgf32AQvJKs8AHt7tyZ2SbcA8K
         gZhKpqDvGoNOJVTP5KqeKu/szuZgjdTfX1ZrsvR5UY8UGnBYefZtNnaGYnP2u8zvW+6b
         Q45Ya3eZMzy16wz5LUqWWDaWTr3pgsG030rrZ0kqqMVx7devCSIJ2JBRZ0fDNCWmn3Id
         OZNw==
X-Forwarded-Encrypted: i=1; AJvYcCUGboRBtks5aN9Ss2TUpVP8ukBE16qyHGezIAdiPDmMOtGIAQhefajpXsNuUq+jEx6+V9MC05CkuqF4@lists.linux.dev
X-Gm-Message-State: AOJu0YyYGXa8YTYrgen601hvl6G0rC4+Ni/hCdjdnxeErJwcfLW4l4SF
	trw0JyqUvHhwJ5QIsLtMsqgPHQ+OpAxK9akMO5AHZKnljGE9ERHZhZTE4JTlhrOyylSqFrbp30B
	KSaQvOw==
X-Google-Smtp-Source: AGHT+IGN4f1Z5MZfxK3TyPutsSVmoeFbSOAbtCMPNamHDfo8B2Hxzq7CUQshCWhzAT4nMU/PWEj7huMl4y8=
X-Received: from plbkj13.prod.google.com ([2002:a17:903:6cd:b0:268:cfa:6a80])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f683:b0:298:60d5:d27a
 with SMTP id d9443c01a7336-29860d5d2famr21044725ad.28.1763051350343; Thu, 13
 Nov 2025 08:29:10 -0800 (PST)
Date: Thu, 13 Nov 2025 08:29:08 -0800
In-Reply-To: <0d9e4840da85ae419b5f583c9dacee1588a509ba.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251112171630.3375-1-thorsten.blum@linux.dev>
 <4a2a74e01bfd31bc4bd7a672452c2d3d513c33db.camel@intel.com>
 <aRTtGQlywvaPmb8v@google.com> <0d9e4840da85ae419b5f583c9dacee1588a509ba.camel@intel.com>
Message-ID: <aRYHVHOex4zkyt5z@google.com>
Subject: Re: [PATCH RESEND] KVM: TDX: Use struct_size and simplify tdx_get_capabilities
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, 
	"thorsten.blum@linux.dev" <thorsten.blum@linux.dev>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kas@kernel.org" <kas@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 13, 2025, Rick P Edgecombe wrote:
> On Wed, 2025-11-12 at 12:24 -0800, Sean Christopherson wrote:
> > Your CI caught me just in time; I applied this locally last week, but haven't
> > fully pushed it to kvm-x86 yet. :-)
> 
> The TDX CI tracks some upstream branches. Is there one in kvm_x86 tree that
> would be useful? It's not foolproof enough to warrant sending out automated
> mails. But we monitor it and might notice TDX specific issues. Ideally we would
> not be chasing generic bugs in like scratch code not headed upstream or
> something.

Assuming you're tracking linux-next, I wouldn't bother adding kvm-x86 as kvm-x86/next
is fed into linux-next.  I do push to topic branches, e.g. kvm-x86/tdx, before
merging to kvm-x86/next, but at best you might "gain" a day or two, and the entire
reason I do "half" pushes is so that I can run everything through my testing
before "officially" publishing it to the world.

All in all, explicitly tracking anything kvm-x86 would likely be a net negative.

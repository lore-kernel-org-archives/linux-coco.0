Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89722243956
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729714; cv=none; b=KnvvhmNKUBlDy8caQr3HKZYv6VjCG7T6Ek9zreDxA8c+Yf6qnmPHJ7dcQpTpxEKJ0Qwlp1TRKRPolGetFu8PhANc2TX+NalMwWkSnmV+0VAfnrJEw9SkVMdaIRE/H8R337ESv7nNvW8xkiKkGtSy+x7eH16HK+n8FLrrUnX/kYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729714; c=relaxed/simple;
	bh=p2yWYS6720l1AamDkwuIrJ88Ej7lEOXOTezg8g01GzU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O5zYYxkKwQ0lBghYCC5+lbkI3rl/Plondv7jgLYwxfYBMVQkdyQp+WF08fnsQndfVUVa+TCrsssH/DfwPG026B54uGb3NgKZpx2bUCgSoIGpucPwTgalHul8OGiH7eitd4PFl9fC3RMctIlpMqrh94dgM4pCHcFCZ9gi335NwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HeNWR4iF; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HeNWR4iF"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso3200775a12.2
        for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 17:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790729713; x=1791334513; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wAW//sr3pC2NBc7liE6tPMI+ECsOTrk881ZsZeZAzE4=;
        b=HeNWR4iFf30n3a7BNLa5DxmVqtuKBu/+a4dWT8plvZmuEdb1r7qLhgVpd2mJXyoPO0
         WT9WTM79k+HjxvAhOWUBg5wqLkUnWc48mCZdn80llq/obcbZfxwH0B4bmZRQBkJinalS
         pvEQ337KuYoGWWMLzcCaYUlGndwuRjeWUxK9k0EiZjbiMrmC30TiXPAtMyWuRYaL8UUK
         Y2Z5Dnsh+7aiNfQZok0hJ0BOOgh4TtN7dMTpQvTsWAqVu0u5GqEAFk7gjZygi4v84vNh
         NC/M68xfVzVbHYQ2/p0T/ZRgNk1oR67tq39b6n+hU6Ul4epQy47+O/ItCtb8Nthp/TSw
         8UDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790729713; x=1791334513;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAW//sr3pC2NBc7liE6tPMI+ECsOTrk881ZsZeZAzE4=;
        b=l2ZgTO54pqsOAi6Jt4r8Y3sFX5uhCduymIOhsru2QEq8TI3/lubiLnKzOJzf9WNbFl
         NjwfJG/w9x0gy3vxU/qmoKG4hxgiufiAidQ/IGjuSrdLtLGN3QLaS8zfdVGYWonDJ/zV
         C7XzIV+hlpS3jGFrD17+rXZGT2/sWW4tMzXTlSxWGKQ9DtJhQ/KaE39VZYh+6IAmfpyN
         3aggdt8hAqcmi7HHjBnEDhLGdeL//CctR0ou9C0puQpIPr5oe2/tOZXTWlD7grkzN0Jr
         lqyQ2tUZUmXI67+2zmvn1ZshpLjx7gpnteGgPyGpCMXCBCvHNHk/vgV8zn+Zi/bWMXIH
         1a+w==
X-Forwarded-Encrypted: i=1; AKwUvBxCItRU3BKZOJ4rIy8kxgwDE0sbyZJZcHnFu6lRmj44t4zMlYrCpfaxqsqQhupi8WhxRVnSCNB75s32@lists.linux.dev
X-Gm-Message-State: AFuF++myaac/LI4EeLdZPSWJpbVbIfNUMops1XLr+whWIJtuo0Z4qaQ1
	GyjWxIK17xiOrcUiRTgFkziBE1K/wG6nw8m+TTFxDI7aP5v8IinoQkHxG7MHfVb9T0l97tbGKt8
	aKZ8sdg==
X-Received: from pgbcw4.prod.google.com ([2002:a05:6a02:4284:b0:cc7:b387:6d4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa5:b0:3de:849f:9053
 with SMTP id adf61e73a8af0-3de9530b969mr741880637.45.1790729712492; Tue, 29
 Sep 2026 17:55:12 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:55:11 -0700
In-Reply-To: <3c0ee89f560b0235f293b32019327186785aa795.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com> <3c0ee89f560b0235f293b32019327186785aa795.camel@intel.com>
Message-ID: <arxd78Pn6WWL6TGq@google.com>
Subject: Re: [PATCH v2 0/3] KVM: TDX: Syntehsize SHUTDOWN on unhandled EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"jthoughton@google.com" <jthoughton@google.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"sashiko-bot@kernel.org" <sashiko-bot@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-09-29 at 17:11 -0700, Sean Christopherson wrote:
> > Signal SHUTDOWN instead of -EIO if the guest accesses an unaccepted pag=
e and
> > has disabled EPT Violation #VEs on such accesses.=C2=A0 Returning -EIO =
is all but
> > guaranteed to mislead the VMM into thinking KVM (or the VMM) messed up,=
 and
> > will likely result in the VM being terminated instead of rebooted.
>=20
> I'm pretty sure Yan had a test for this path, and I'd love to see it actu=
ally
> exercised. What is the urgency on getting this fix upstream? Can we wait =
a week?

Absolutely.  It can probably wait a month and no one would care.  IIRC, thi=
s got
hit by someone (internal to Google) deliberately crashing a guest kernel an=
d doing
funky things with kexec.  It showed up on my radar purely because our autom=
ated
madness alerted on the resulting assertion (on -EIO) in the VMM.

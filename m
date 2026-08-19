Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B193B100A
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787168484; cv=none; b=Be/SYLWVrkQR3duqz6vXKtTVWJUPaMPlDdIXodFHHYn+obaQ5DXUoDpfNnO+O7Iqs/DhHE+TnInn+amhrtLSIL1bH8sxyFbjzWtkcAoP7WP11ypQ8WNIUsaYD1FFgP9b7kVDF+LPKsTHY6ohQilqRdZs3FBiPZ6YtAtw07d74C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787168484; c=relaxed/simple;
	bh=Mq5+V5+ZUmpq7Hw/9XupS65+jzwahk6GhQuhDlgNwE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fiUBh1JAEV0gyn4euvwCWgB0OXFmXe8Vk93QLKLdzB9exx6OhhmMQ/xRiyfKNxAn0i71KTHIA+J1wK9fbZqAP+oOSCaSPZ25L2r9fKCBLwfZRDO5bn6fRMhD+Hygi5Q7Ouu4kRuQsdUlfpl7o1ghATgSLbH6L/UKdoc4MxhY7t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nm4p9Ufr; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nm4p9Ufr"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e024d2129so2195825b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787168482; x=1787773282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nHPfz+9xnErJIyGrKM7A488aJznVuuAajDljXkIrQvo=;
        b=Nm4p9UfrHtje0PVJN2ZlU7Bff7yb7Y+mWfbiz2oOLlgYTtmC6nrZOlmP2x78cUQ5J9
         Z7e1R5zgzeiDfubPnXv4EyBSzJ4j3V3bVoLQCYkmgoemNlLBx4FMldSGtAz2Sb/bIxNh
         Vv9b977Q18JWdu35+mHfia44yQO8gn03akImY+Zpdz0E4BkvC1BooP5W1dgsBtt2Z9P4
         vdQpfEj/JOYwzagsUoAhqUExIjPVC2X9gT2nfHHVn8NdnUbxfTVIgBYFHy43mt4OCf/k
         U/QYG4ThOfwiezRn+Ot/MlcIQbyL7HGeTdrl+ieWkzYF8wXPueWmJfyaG69WzqJ/YvAG
         vByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787168482; x=1787773282;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHPfz+9xnErJIyGrKM7A488aJznVuuAajDljXkIrQvo=;
        b=rYJJRB/FMTGR8uVhkCRHXm8ylBb6VXbwQ5iUrff7fl04+CP99sE+nTVHpfP8pyTldS
         2+0IzU76exUez0I7goVQSKzwU5WePjwl0ZtPuttdl++M8ynvC5n8F4ZJHbTXdm2a0p6M
         C5cLIRJIAAQ3SAKVCYMCoCORtig79UIBunVRPcbdIlOIbvcnY4aIcWVweZMLunqTeJsN
         3VqLLN8xfsBj25WyNtiyVyw7PEnOSekq2M0h4IAeijdV46d0XzcRorgO80qFF8Vd4t+l
         Po0OY7JGaByp5gqGS+5ru4LCNtFBSS/Et56d4SoysnSNFr4fka7bPFu4w1xgsGI/fzaN
         IQPA==
X-Forwarded-Encrypted: i=1; AHgh+RqpJ2FIpITOwNPiDTKDUAWUWb/J9Uus/jVbVB1ypcT5WHWEgmIJ7Pnz513B3cubU/2RlIazfixN82EL@lists.linux.dev
X-Gm-Message-State: AOJu0YwhGfhvG1wFkHE5BCLQBWY2vnyNv/1vtoCsNnEQ+VjSWV+6dgjn
	o4vrICVA4Ch/9A+asYLbvZmvuVawnNrV1H+XTvYIfLtDweEZPm3+y5SBluZMI9ZkMguSCBaGCAj
	kJ77+wA==
X-Received: from pgwa2.prod.google.com ([2002:a65:6542:0:b0:c8f:f76a:4b22])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4309:b0:847:8b11:5966
 with SMTP id d2e1a72fcca58-851d38313f0mr12376916b3a.1.1787168481981; Wed, 19
 Aug 2026 12:41:21 -0700 (PDT)
Date: Wed, 19 Aug 2026 12:41:21 -0700
In-Reply-To: <e5979a0a4d7c24d88f57981aba0fda6d8a5e2f29.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814224509.2342760-1-seanjc@google.com> <3a622cdb03b553cc9f8ce55b6df3c0091b3b06b9.camel@intel.com>
 <aoT_6cnARCAYTrYG@google.com> <bd8f77eb6605f771fafbcef55a47211ecbb70e19.camel@intel.com>
 <aoXSKH4QLTA5DTXe@google.com> <4f8428e0784224c55a2026eb32d046a2051193ea.camel@intel.com>
 <aoX5sbITQYeB7USY@google.com> <e5979a0a4d7c24d88f57981aba0fda6d8a5e2f29.camel@intel.com>
Message-ID: <aoYG4XA6pXAXiHlP@google.com>
Subject: Re: [PATCH] KVM: VMX: Explicitly track TDX VMs' root level instead of
 guessing it from CPUID
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-08-19 at 11:45 -0700, Sean Christopherson wrote:
> > Hmm, for defense in depth, I want to explicitly check mirror_root_level=
,
> > because returning '0' would likely have dire consequences.=C2=A0 How ab=
out this?
>=20
> :) Sure.
>=20
> Yan and I were discussing what might be a new level of defense on MMU che=
cking.
> We were basically trying to work out your thinking on some of the defensi=
ve
> patches lately. It seems there has also been a new level of activity on t=
he bugs
> front so we want to adapt to any learnings you had. I actually planned to=
 bring
> it up in PUCK, but...
>=20
> Can you share any thoughts? Should we be more paranoid in general, or sam=
e as
> always? Or more specifically paranoid where issues hit?

The big learning I've had is that simply detecting bugs doesn't help protec=
t the
host unless KVM also takes evasive action when the bug is detected.  E.g. a=
 WARN
will (hopefully) be super helpful in root causing what went wrong, but it d=
oesn't
do anything to mitigate the bug in real time.

A theme common to several (not all, but several) of the recent guest-exploi=
table
vulnerabilities is that KVM *did* have relevant sanity checks, but KVM didn=
't
actually do anything meaningful when a check failed and/or an assumption di=
dn't
hold true.  It's not always possible/desirable to take evasive action (see =
below),
but in most cases it is.

Other than that, I don't think there's anything "new" per se, just a bit mo=
re of
a sense of urgency.  E.g. avoid BUG() and BUG_ON() unless there's a *very* =
high
probability the alternative is worse (this is why I said above that doing m=
ore
than WARNing may not be desirable).  If you fix a bug that could be applica=
ble to
other code, look for ways to (practically) eliminate the potential source o=
f bugs
(much of the guard() stuff falls into this category; the cleanup behavior m=
akes
it a lot hard to end up with deadlock due to forgetting an unlock in a rare=
 path).
And so on and so forth.

As for this exact sanity check, the reason why I think it's worth keeping i=
s that
we've already messed it up once, the code pretty much only runs once per VM=
 boot,
and if KVM configures the wrong level, the *best* case scenario is probably=
 that
the host panics.  I.e. my past statements along the lines of "at some point=
 we have
to not screw up" still hold true, but as with many kernel rules and guidlin=
es, it
needs to be applied with a healthy dose of critical thinking.

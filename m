Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313ED426D32
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395757; cv=none; b=gjpeuT1TXao6mtkWWYnyoxmNLLX2eigAbuHQnI5b1fCYN0+5pVW13p/DsruZoUnIYWl6az7YRPWD2RZ4OepihZzQ4f/EaojjC/GQSLAdeGkwZ/HXuVmGSGlBD/nkTbE4q/1ddfOToLF5Rr+viBDhfVafK2PSEKNiaJKGKm3TVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395757; c=relaxed/simple;
	bh=ipWhDnS3c8Of+slJErBTF5Vqt6ODkaCbWe9MFVov0zI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MKI7T64V9elgeTCv0WHFjpAsucX+DH2CXNbkYpFhGz1BOeH2H9umhNjRgKxmW+Y6dT35ED3YWgK8WAUJhaNCepa6wC0fM/9Zth5H5LUdPzQ1NNATYYgxDDb5FPnRiVACcOm4EH+MImWBZwaCxblBalpOhbOKIuaEm8fe3qsOrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lkacSS6N; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkacSS6N"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c82c477290bso3442772a12.3
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 13:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779395754; x=1780000554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipWhDnS3c8Of+slJErBTF5Vqt6ODkaCbWe9MFVov0zI=;
        b=lkacSS6NGUgZGw0MKI4O7j2c5hHkNv9Yhd806a88XULF/5eJJUDVthjR/O/u71b6GK
         4Z1XhN/9E5VNHIRt/B0PWaDvW2Ee9UOV6k4QHt99x47UGRCSlBeWhjdUfHzOZRt1zYct
         FxEDKf970lSr+135Ze3Kzi/Z/OzKhG4nfOGujxsO8lHtNUH03fzm6ecMTOnIEujy5nYT
         4W7B6Osl0kJwmzTJEsduJn/PnsRhMqUancVDLW84fjk+ysdnH6p563axTyRtD2uFrhAx
         NYsMqXG41ofrZlHN30x/AA919Fcf2zRYwjJSwj0j63b1U7xvSDqOnJgKjLIHxk+AWOTu
         95Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779395754; x=1780000554;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ipWhDnS3c8Of+slJErBTF5Vqt6ODkaCbWe9MFVov0zI=;
        b=CvYl6lEhznw3qJJFsQdb3ZA6EzMmQNyEQtXdY9J54KPunCWqX916nrigCFtu4wVaKc
         T7BqdKYVkuSLiJZY9BNHViU2IImxBHp2Q2ElWVsAYtNQXaa2xs/mM1BTfuW4llxm6E3a
         iXYYNOkqy8dBEfP5fjoT6CTKBo/hHW+wepdEURszosMJK8ox+qeFUvQsdx5xf1vEXZuB
         44tV7opQ4WjdOLNiuphh8C7SWi7pH73hh3ojF7Z8Q0gRk2lRKRmmgf2df4VGhteIPWQ/
         N5Jtb6IYCQGMQRKoRsFkHqJ5usL7yOHM8QFe04zCg3E4N8JPBaAJ8lv5R2HKcI4nOsJr
         nfMw==
X-Forwarded-Encrypted: i=1; AFNElJ9r/8l9GE27FmbwzO64t4dghKegBekocvNPsvW8CFEgfd867zmr+L0NmkbkjaXKkl51+QySPCJtFpS6@lists.linux.dev
X-Gm-Message-State: AOJu0YxdePiaZQRcey9zS/T0RS7ccEMPnwA0eANnFcJDnoeAqvx5gnwj
	nGIkuaNFs9Ss6y6Q4Y72L7IsS59SaGDREYfIjyxDqMaL4UsNLP5qIPe+0lksHuFTMpK07Kac+xU
	l+lQg9Q==
X-Received: from pglv7.prod.google.com ([2002:a63:1507:0:b0:c80:192c:51ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d491:b0:3b2:8677:813e
 with SMTP id adf61e73a8af0-3b328ec5909mr476744637.42.1779395753857; Thu, 21
 May 2026 13:35:53 -0700 (PDT)
Date: Thu, 21 May 2026 13:35:53 -0700
In-Reply-To: <13d79ba1e0450068c9573ccd8deb3ec007aea8d6.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-30-seanjc@google.com>
 <13d79ba1e0450068c9573ccd8deb3ec007aea8d6.camel@infradead.org>
Message-ID: <ag9sqdLCAqJwaaE-@google.com>
Subject: Re: [PATCH v3 29/41] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > Add a return code to __paravirt_set_sched_clock() so that the kernel ca=
n
> > reject attempts to use a PV sched_clock without breaking the caller.=C2=
=A0 E.g.
> > when running as a CoCo VM with a secure TSC, using a PV clock is genera=
lly
> > undesirable.
> >=20
> > Note, kvmclock is the only PV clock that does anything "extra" beyond
> > simply registering itself as sched_clock, i.e. is the only caller that
> > needs to check the new return value.
> >=20
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Oooh... can we use this to reject the kvmclock when we have a stable
> and reliable TSC even for non-CoCo guests?

Yes, but I would much rather "fix" kvmclock to not even attempt to register=
 itself
as the sched_clock (which this series does).

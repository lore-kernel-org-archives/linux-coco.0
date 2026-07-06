Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9361422537
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360827; cv=none; b=ThtehEvUGeIVkQW0iSKINoes5IMzmC4ud3l/awNXBJ11A1+B816Os1tVt5ub5Z8XRj2pRK3kXPfss2GuxFxAL8GlBqPsyBJ9dapaISQMkQgbEIM+kkLKjYWn93b/Uc1FbekHqOzWpZDxq8YvDD1Pi/3eY7VSvYmD+8GYlafcJgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360827; c=relaxed/simple;
	bh=6HvxXL/hPWnIS2ERxITvaZCHswmXyfcfLFJrYY619nA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D3MaGLDk1xCyxaz7o/zCyDqW/iV2Zn8mlyEyLaiHjSnjN2p72sZ3NLTmIvmNX6LkieOYz83slOfj550rx9AUnH3JRKDpWNJT4dDyM+X4iV8s5sPagjpfTZeGIp05Y5V5VzsUNctIuNl4KO7HT9dSdce9sqto8PMGYXaHWuFlWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rk9x56/i; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rk9x56/i"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-846f50381a6so2645847b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 11:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360824; x=1783965624; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYcfhMi5NCPMduPSvGqKtbO87FaKSq3RfhmI47bcB1U=;
        b=Rk9x56/i5VeveWONvO+YSiz/o5QxCBR8O7FyynQb1dg+yQRWowsUjzn20UuFR+AN2r
         gtWZJErTF8M+uqrmCQSiHzakSO3WoqFJ4vAStTm7dJULzIkYyCx0KdNRWYGy4ZikIiqT
         /dn4vfC1psCVqMffcH5BcdWZgBFfDIC0iusrTQPUlRJTlup01NmARDA6BfQqiARCm+en
         UH1l+dIWgJUjevpL74choWMDNB0NWKrnQvLu82qeu8sgAk+73R5NkWtHUxjwO8FxU/aO
         YpV5uHVhh0Jm90VRZUw3BminKy7b4svqlShu4jAaKv57mIU2GzgjEdf+xjb2ecMWh0rB
         xGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360824; x=1783965624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYcfhMi5NCPMduPSvGqKtbO87FaKSq3RfhmI47bcB1U=;
        b=Wj0+PTS+IZPFqAikS4oMWoe6+udo6TuafifXUlPC0G9bLss2epzvt5KE/HWwMdLxXg
         lhcIQJt8hwhTuWqir1UJnQUCiOt3Jy1K2PUDMEAO2UwPijZYHbYaERH359UZIfVwj7xj
         5m4+/RbZ1QKSx23WfAnWCZJC5UFXfAwWKCpbqsmnEYMaBniiTD7Yx7sqHqU7xUThHnzx
         iPAzzXYlbCl+l0M8ng2BLQvN3Et19hsQ8qZZSsHeghddxCKEJFr7n4Q3wRNxmWhEIFzs
         buOvC9/K52Z0gX2o8KqgYIUfUxXWqEE30GMuoq35lESGJiVC3m3h/7G5bdtADOlYYk38
         igxw==
X-Forwarded-Encrypted: i=1; AHgh+Rpq26TG48TbmRDzhkPgjGdZtu6GPuIinl+cpqS3q0mc8uXQAjAOISEQIIto1ubDsQ9vVPDw1/gcVruj@lists.linux.dev
X-Gm-Message-State: AOJu0YwH4xXqOz7EOns9ezgS312h1ayUG9q8XkfRULBx2qSd6yGwUkj5
	m4IMBvqMP9DjNnTAuH1wzgU8LiI8GZZXLg3+/VHPTsIH2zuiFJdgrGTcNShI+9IWc8iAh/WJsjf
	k3a/8Lg==
X-Received: from pgam14.prod.google.com ([2002:a05:6a02:2b4e:b0:c92:460e:4f73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4307:b0:847:8c6d:2f24
 with SMTP id d2e1a72fcca58-84826ec2591mr1691676b3a.56.1783360823962; Mon, 06
 Jul 2026 11:00:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:00:23 -0700
In-Reply-To: <SN6PR02MB41578D3C34AB283B892C27A4D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-2-seanjc@google.com>
 <SN6PR02MB41578D3C34AB283B892C27A4D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <akvtN7aIjZ7gOq4o@google.com>
Subject: Re: [PATCH v5 01/51] x86/apic: Provide helpers to set local APIC
 timer period in hz and khz
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 02, 2026, Michael Kelley wrote:
> > @@ -796,6 +796,16 @@ bool __init apic_needs_pit(void)
> >  	return lapic_timer_period == 0;
> >  }
> > 
> > +void apic_set_timer_period_khz(u64 period_khz, const char *source)
> > +{
> > +	lapic_timer_period = mul_u64_u32_div(period_khz, 1000, HZ);
> > +}
> > +
> > +void apic_set_timer_period_hz(u64 period_hz, const char *source)
> > +{
> > +	lapic_timer_period = div_u64(period_hz, HZ);
> > +}
> 
> A string "source" argument is passed in, but not used. Is there an
> envisioned future use? Also, this function doesn't output a pr_info()
> message like the existing Hyper-V and VMware code does. 

It was a complete goof on my part (Sashiko also pointed out the oddity[*]).  I
fully intended to log a message and provide equivalent Hyper-V/VMware behavior,
and totally spaced it.

[*] https://lore.kernel.org/all/20260701194621.4BD691F000E9@smtp.kernel.org

> I don't know that the message is all that useful, though I do remember one
> case where I was debugging some clock/timer issue when I looked at it. 


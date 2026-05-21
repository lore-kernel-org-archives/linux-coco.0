Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43332B128
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395668; cv=none; b=QVH78Qpl3KMsF2U+0f9SquImRN91yxyiLsh27O7Y3gNBHB77d6Hpd4M0+I+ggM5fYlK7ib3sRzt7ZG6HnjkgfHV/oZwzELPW9ePx7fblyhWqmwUWvH+5dfPEfVibHsK9AjkKFQu+GibyljZ8M3fgmWLODaUbNBe4AO3fYqaOLKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395668; c=relaxed/simple;
	bh=Vidk3LDEKL2XnrVS0/5PJ+6dbEOeauOpV9iuOcmzzjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qHTRBvwx57mbtYz2bZitfhR+tO/dy7rz5I/dNfr6SgHvBzyyDy714BAlI4SBbJsnHEeFJkq1IaH2KmnKoBITl3xo58zz7DHz7eh5537v6SmagOvNTCB7zXq0R/bIndXgmrq0jpIPII/QoIM7LQSAlemL/1hDyxr/nL3MnLYFqtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pgG6B3ab; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pgG6B3ab"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so91168335ad.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 13:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779395666; x=1780000466; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIireasEnp8AQZjS+o0HC63+VEosuYCnO+TKDPQR05s=;
        b=pgG6B3abg1ZdTgdD1TaZylbtnj7eudX7FgzRoFBLnv4TA7oVPzCzSQgX+dREw28kI+
         zzhyURzjAFp9TqyEmhtVXu6ikVnDWipou3xEf1rqEgfAinHDCjHyExDAQ3pyHoy8cDRL
         EsNlNqovVki0UVF4L3kKpIBNjOzx8wuENtlKFjJFml6nk9ON6rGImtvQ2ctNNqjWry5M
         dPuezohJmPyis+p3jS0jdBIz3cPvyuuoDkacBZYWJ1lBjIZozpqreYxSP94kiMYpAZTm
         00jwk2BhFN0dmu0jVWGfD+TQZfnwozdje5lJdDlgFmRNWhm6hg6VpV+cW4zmmUVsMF47
         R75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779395666; x=1780000466;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIireasEnp8AQZjS+o0HC63+VEosuYCnO+TKDPQR05s=;
        b=LrKmZMQDnKmUgiwHK4qi/XtiG08R5CsvaTcFcmIrXQWH2H0DBntGNHvbZfJN2dQqER
         5XCVGFKvFWNuFbqUdaLTk0iQ2SMHj4WUTGHm/Ft4/G0O8QU3iUlwYbphlRJmUTuOD4kG
         o5AdXu6aC9hxCzkIN76ME0rMFtXdXvzpmW5IQuGPQR6KFZEm8GPEG3CVo9fSql6eH1If
         fG+5mSXMTxNXo0Q992pb6wMsTocIc9EMu05R1bcycQqoiB1ykq1tdsW0cs/ntN4y1tts
         z8xZto9VSMDsbHFx50gZFGkh3r5IEzc7Ty/R1xlArAbbCQhtjAV+2FfF68Dskbtc7hFq
         rjsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rxcScc11fu24LBxFItpKZRi15nXTBaESALwvf38PPE9aM7QOHRKSaOqJINq39EGif1MOdGqcXgj5J@lists.linux.dev
X-Gm-Message-State: AOJu0YzrG2BfvZ/XrzLe04IeIqeXVgOjzCDVii7rIpW9jBtYY8vbXrsB
	dcc0Am9KKNfeT77Ht32yMJQY23tDNoQ5qiAJkDrGm5H7eJEkxL8i49wbb9i0PAlKudTEEo6i+s9
	s2ndA+Q==
X-Received: from plip15.prod.google.com ([2002:a17:903:38cf:b0:2bc:ae06:63be])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4405:b0:2b9:6458:1a2c
 with SMTP id d9443c01a7336-2beb06733bemr4530925ad.13.1779395665926; Thu, 21
 May 2026 13:34:25 -0700 (PDT)
Date: Thu, 21 May 2026 13:34:24 -0700
In-Reply-To: <7489ff3cc1ff402bf0ade38272fc52dcbcc75fc1.camel@amazon.co.uk>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-37-seanjc@google.com>
 <7489ff3cc1ff402bf0ade38272fc52dcbcc75fc1.camel@amazon.co.uk>
Message-ID: <ag9sUI8pBJda0Ml5@google.com>
Subject: Re: [PATCH v3 36/41] x86/kvmclock: Get local APIC bus frequency from
 PV CPUID Timing Info
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: "tglx@kernel.org" <tglx@kernel.org>, "longli@microsoft.com" <longli@microsoft.com>, 
	"luto@kernel.org" <luto@kernel.org>, 
	"alexey.makhalov@broadcom.com" <alexey.makhalov@broadcom.com>, "jstultz@google.com" <jstultz@google.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"ajay.kaher@broadcom.com" <ajay.kaher@broadcom.com>, "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>, 
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>, "kas@kernel.org" <kas@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kys@microsoft.com" <kys@microsoft.com>, 
	"decui@microsoft.com" <decui@microsoft.com>, 
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>, "wei.liu@kernel.org" <wei.liu@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "jgross@suse.com" <jgross@suse.com>, 
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"mhklinux@outlook.com" <mhklinux@outlook.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "nikunj@amd.com" <nikunj@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 20, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > When running as a KVM guest with kvmclock support enabled, stuff the APIC
> > timer period/frequency with the local APIC bus frequency reported in
> > CPUID.0x40000010.EBX instead of trying to calibrate/guess the frequency.
> > 
> > See Documentation/virt/kvm/x86/cpuid.rst for details.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> I still don't much like the way this is done inside kvm_get_tsc_khz().

Yeah, I don't like it either (understatement).  Aha!  native_calibrate_tsc() is
the oddball, all of the PV flows stuff lapic_timer_period when parsing the initial
timing info.  I'll just do that.  Blindly writing a global is all kinds of fugly,
but that's a future
problem to solve.

> We also probably ought to be looking for the timing leaf on other
> hypervisors including VMware 

VMware gets the frequency via hypercall.  Why, I have no idea.  I'll let the
VMware folks deal with that.

	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);

> and probably Bhyve too.  Should it be done somewhere else?

I'm not opposed to that, though I don't know that it'd be a net positive. The
"hard" part of getting the info is finding the CPUID base and checking if the
leaf is available.  Unlike the native CPUID leaf, no math is necessary, and so
once the leaf is obtained, getting the frequency is trivial.

Regardless, I definitely don't want to take it on in this series. :-)


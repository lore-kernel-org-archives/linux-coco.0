Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613C1D5160
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 01:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661735; cv=none; b=TcEayZvMZAAQnSJkMiAk98y0zN8r5RWVNNUCK6qxVWBa+jfw1pnr59ats2BCpaeeqqsqpxOmaeu3JisJ0Eh3K8AXuFWHP4Ih7ZB1h4zmhnWX2tPzmnj1UyYBPGbKpLbhBeYpQRsw/Kv4rpeXugtv8OklYLX49tf/BW7Q3dzgSrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661735; c=relaxed/simple;
	bh=pO0j7GuzvWJfjnqiMCHzKhY1IFHPrINkCoW5T1e+LYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HHJ1PmCQGLaVRZGnrAL5m1K2KqSBsNokrPQ/Q0+ZkMW3l73LzN4xoOv1vNfOTUMYKPqOZ2PuKJlYz3hIyiio7kgdc8wcXgsYh8Jn5wXMlELYT0jLz0nR5Aj6AYxHAiqg9++HBkPm3sBM1pE2amcSEQ5UKoFtKwi2vZhLCAFab3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+4Ol7ta; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+4Ol7ta"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso1146359a91.0
        for <linux-coco@lists.linux.dev>; Mon, 05 Jan 2026 17:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767661734; x=1768266534; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeXJukaOG7ITY8q7wIEYbKLQQxqyX6h4rpkmy0xfeiQ=;
        b=p+4Ol7taSIvvd3M5rpyfpJiRnfRYUZ5dk4lpqtU8ebhrJMxZnvnZHNmbkLh/e0Iogo
         tNI3Kp7AsT1+cOsg0oVQhOICub2kSODVIPL9E4a/NMNzxyNdufZeWXTm7rKlRRq8L5F7
         TnmSlKkNR8INyts28mWj6hd0zJ7X40FPZsZxGeZdEPR0IHyYXUokE1YY5r8RjXFs160M
         yC5ldGyuZf/FSR6EiJNkpyMzE7Zar+3ejdkPBpIrjMz0yBXvU6eY3E4dZbFKykUScUDq
         w6EbxdfkeeOXkz5+R4fxGMExclS3fjDlXrP4W8lyCFCH2ZN8e8KLBW/7Jb4N0A2OLzKi
         U8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661734; x=1768266534;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeXJukaOG7ITY8q7wIEYbKLQQxqyX6h4rpkmy0xfeiQ=;
        b=Wfq0XcfFAf39ARqblOE3w2avDo9cHy6XOQegdIxWcne2gNSqqbhvZ1BXbPyRQiXJh7
         eQxuN6Pul3ECxdP5G8Pl+z3f0crd3cVzAFXBrWTtDND7Rj6A4UNFHgDJbQZMp5EilXUR
         AwJpsnqSFaEyVKsLjAoMj4pUiE05WdMUL312siEfDyBuHp7ScT2yG4qOSeAXp09fQJ6e
         cBnX4cMIzyxc5iatwdk1NAvl/jxssLPkWYIvkwgWuS/1bBsHREGpr/AJOqUlAUVMq0mZ
         5Av0I2gE7CJnZ1J5qs8uBfkhhRPkHvQAYen/AlOkBCG1TuYSFLcG42zte2RY8oFYwJ+y
         zq6A==
X-Forwarded-Encrypted: i=1; AJvYcCUrAFo3OxUi4IPbj11vl6WKf0pCt4yfSxpyk40/sVnEeJWheyLNw2qhR6iJwiubhx5fhHJtnk3b9FVO@lists.linux.dev
X-Gm-Message-State: AOJu0YzXj7aMRw++P2S96xO1iDp4AKZbzYyNvE9jw3m8mGshE6TE+bMx
	kG6IvhdJS3qaHePT/pD1yRMzLM9IPCpSohVtIx8CQi2ldtnUF9cFPuN6QQQKMpz0nThPtfxlSOn
	J8o6atQ==
X-Google-Smtp-Source: AGHT+IG/DsAOalJyfpcjmRGKdjYsrw8KVzXpazZLXxGjc4HRgwPtIZlZ7CEqqBxQ1jpDiyfY7W01mv56pIc=
X-Received: from pjji3.prod.google.com ([2002:a17:90a:6503:b0:340:c53d:2599])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:558c:b0:32e:a5ae:d00
 with SMTP id 98e67ed59e1d1-34f5f271f98mr835146a91.13.1767661733717; Mon, 05
 Jan 2026 17:08:53 -0800 (PST)
Date: Mon, 5 Jan 2026 17:08:51 -0800
In-Reply-To: <71f42b9e-793b-4f8d-8159-a6ca7800f292@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <695c50eee68e3_4b7a100e8@dwillia2-mobl4.notmuch> <71f42b9e-793b-4f8d-8159-a6ca7800f292@intel.com>
Message-ID: <aVxgo4Kb-Ng3g2Ci@google.com>
Subject: Re: "Paravisor" Feature Enumeration
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: dan.j.williams@intel.com, Jon Lange <jlange@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, john.starks@microsoft.com, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 05, 2026, Dave Hansen wrote:
> On 1/5/26 16:01, dan.j.williams@intel.com wrote:
> > Dave Hansen wrote:
> ...
> >> 	X86_FEATURE_KVM_CLOCKSOURCE in arm,pvclock
> >> or
> >> 	X86_FEATURE_KVM_STEAL_TIME  in arm,kvm-steal-time
> >>
> >> As far as I can tell, these aliases are all done ad-hoc. This approach
> >> could obviously be extended to paravisor features, but it would probably
> >> be on the slow side to do it for each new feature.
> > 
> > "Slow" as in standardization time?
> 
> Yes.
> 
> ...
> >> Is there anything stopping us from carving out a chunk of CPUID for
> >> this purpose?
> > 
> > At what point does an ACPI property become a CPUID? In other words if
> > there is an ACPI / DeviceTree enumeration of CPU/platform capabilities
> > in firmware that can supsersede / extend native enumeration, does it
> > matter if x86 maps that to extended CPUID space and ARM maps it however
> > is convenient?
> > 
> > I have no problem with an extended CPUID concept, just trying to
> > understand more about the assumptions.
> 
> The way it _seems_ to have worked until now is that KVM/x86 has led the
> way by defining a CPUID bit for things like KVM_CLOCK of KVM_STEAL_TIME.
> Then, the ARM folks came along and DeviceTree enumerations. Last, ACPI
> came along with a way to package up all the DeviceTree enumerations into
> a single table.
> 
> So, maybe that's a hack on a hack on a hack and we should just start
> with ACPI this time. That would certainly make this pretty straightforward.
> 
> I'd love to hear a take from the x86/KVM folks, though.

KVM x86 is blissfully unaware of ACPI.  I believe the same goes for DeviceTree on
ARM64, but don't quote me on that.  I can't envision a world where KVM would ever
enumerate or parse ACPI, let alone make ACPI a hard requirement, so any features
that need KVM support need KVM specific uAPI and/or arch-specific enumeration.

KVM uses CPUID for *KVM-defined* PV features on x86 because KVM already advertises
support for CPUID-based features via KVM_GET_SUPPORTED_CPUID.  And KVM is handed a
userspace-defined virtual CPU module that includes virtual CPUID information
(KVM_SET_CPUID{,2}), which KVM can then use to know whether or not a feature is
enabled for a given guest.  I.e. using CPUID gets KVM all the uAPI and guest ABI
it needs for super cheap.

PV features/devices that are provided solely by the VMM are a completely different
matter.  E.g. KVM similiar has no direct knowledge of VirtIO.  There are plenty of
optimizations in KVM that exist to make VirtIO go faster, but like ACPI, KVM is
blissfully unaware of what VirtIO devices are exposed to a guest, where they reside
in the platform topology, how they are enumerated to the guest, etc.

Concretely, exactly what type of PV features are we talking about?  To me,
"Confidential Services" sounds like things that should be implemented as virtual
devices in userspace, attached via whatever bus the VMM is using (e.g. vmbus vs.
PCIe), and enumerated to the guest via whatever mechanism the VMM chooses (which
on x86 is pretty much guaranteed to be ACPI).

Trying to use CPUID for any such virtual devices will never fly in a KVM-based
setup (outside of completely private/proprietary environments).  KVM shouldn't
ever accept a patch to define a CPUID feature for something that is conceptually
a device, and Linux-as-a-guest shouldn't ever accept a patch to consume CPUID
entries defined by a VMM (even if that VMM is QEMU).

So unless we're talking about services that require specific, dedicated KVM
support, i.e. where the KVM involvement can't be abstracted in some generic way,
I don't think there's a whole lot to discuss (in a good way).

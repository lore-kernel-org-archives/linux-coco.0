Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821072;
	b=wCpNlwIU/rmirp5TQGpErlTpd5cppMiAn0VZhx/2QXUCp0oq9QO4qJIVs+XR7aavFME1
	 kdBKwtnXsqpqUxub+A8KMp2ElxTIOsn20MB/EHtiToMCRAxAx5KHOT8dBxFEJ4fkL33o2
	 mJdXWHJauu11PtR/0cc3NBEurZlT3MNceqKj947TgU4tG3oHedx54QxWsDGayTV6mInFB
	 HMODQcQ1RJFIs1untHFLL750PvZKy0YVAVAdkDQqUmGB9orYaXJhRLHFGi+1xqGkscZd1
	 FOlVyu4il5L5kJEARutXjLn4Z8jJM/rMEL//Is37RTILFJTOUrFLm+jZbNECfGpm90Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=/5MszlfJHB7Xr7Xp5GjEvhWx25u5UBjAyc2/c9bnue0=;
	b=Ne4yvMecULK/YNKeYIblKgfZQzHRgZRyY9h4ecifpB4RleWk/ckN0ipO4StxKa7MwjLd
	 M8FuHgKiFmDyYJKa8MsPviDXqRCYt5QY3K2cdL3Bgwc45eLzt8fDrWn6HpmBNpkoLiGwC
	 Tgji932/OmZBD0MOF6enHyHZBxEm1/TI3tAYo/kXndjvCDNi149B7wfdoRcFbquXTIJPV
	 h5se+sZt4e2ZARD4BFyrdYq87X7RRxcMFQHkygjBLmWdfRp0DVBOmHS6Je6RyNNh5XfQ0
	 8UHyWeYrVeznbpJfxkqeusgRvzOHMKiBiFaYvPLvnP4NgaFRFHyMx7dN6M4HJ6sllkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ee6AMn5b;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3FF60B4C02
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 19:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3FF60B4C02
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ee6AMn5b
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb2437d752so15698055ad.0
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 11:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793821071; x=1794425871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/5MszlfJHB7Xr7Xp5GjEvhWx25u5UBjAyc2/c9bnue0=;
        b=Ee6AMn5bfUK+y0OpzwmKyBxhk6j6xNUGvBlwR8hOxQ06TQLfj91odSF1TsKr9z+MOb
         DQvdM1N0+zMs3G3zjkndSdLKm9umd8m74B7SkOxLgdswtvToeNIDWh+np6Ew6J9AUA5W
         O8dIM9JASmcOyGcxBJ6hNg7ZOYvhpslPP0zn1+xWcwpN3u9dFMERcYcrsbB803DjHwqH
         n7cf1kxkqEL3SDW3vhfeQIlqTBeG6nRy5Jx0psJ8YhscA/M2SqKg2h+pBwkxxEXu37/4
         Wpclj57TNo8JndwREzDpimCjKw/IgPPQ53FKvUBxGMKvBB0Hs8TilXlaFV4MiT5FPneb
         +Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821071; x=1794425871;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5MszlfJHB7Xr7Xp5GjEvhWx25u5UBjAyc2/c9bnue0=;
        b=Udf5eJwzX8igooib+Y7lJtNln8XpD0Zq9bVK8/q9VSy41UwfoAxnRIopcfIYRz8fT8
         u7L2lyqrQtseI3jaBqEb8I+a52FHdx7ZaE5kIl1T8letqeOinESzRX2eUMdkkv7bXQ0w
         /AKqGVEfZPQUrR/ckajJEbZQrLU+VLVgreN5N3GK+v0AsTsevgHeFDURDDNy7bNCiU2D
         sXDcGZZZPC0HO6fF5+15l/8vTf9w9Z6JhY2lt/PRlE6EmmNcWtBC8rC8bKy+n4rGbvJZ
         rJtnfv0t/qHAs+tzCaPMf0bIRxI9E10Obu4SSjuweG0y/NnQ7sCa9GQjUju1FRnS8mqe
         48Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxPt1wYw5j0iP1QxPYpqkqlgkRktMs7zeGxy3dsEOESDfEy7J/T7lntP+JyOD9f3Zcefu6JFUotvP/e@lists.linux.dev
X-Gm-Message-State: APuU4Z9SkvSJEAzgDtIPMuvodW9Hh+KwX5Li61ErCJDfSkEzIJ6maej0
	1B4AaoDRZA/Xn/UD8gOsjVdHZySWmMaV8irJxds1wsAVEDLDL4Tl8R0ZOypS36UGMmn4t0rYnJE
	2Zgh3eA==
X-Received: from plww1.prod.google.com ([2002:a17:902:d101:b0:2e9:4a78:9294])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1986:b0:2e9:4d9f:a65b
 with SMTP id d9443c01a7336-2eb3651d564mr160599195ad.53.1793821071087; Wed, 04
 Nov 2026 11:37:51 -0800 (PST)
Date: Wed, 4 Nov 2026 11:37:50 -0800
In-Reply-To: <c9a6455eb88c24d4271b7a7c86f7a4e90799e40a.camel@infradead.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com> <aqLv9GwBNymyHs8q@google.com>
 <c9a6455eb88c24d4271b7a7c86f7a4e90799e40a.camel@infradead.org>
Message-ID: <auuJjiowddGlysWI@google.com>
Subject: Re: [PATCH v6 00/51] x86: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026, David Woodhouse wrote:
> On Thu, 2026-09-10 at 10:59 -0700, Sean Christopherson wrote:
> > On Thu, Aug 06, 2026, Sean Christopherson wrote:
> > > The primary goal of this series to fix flaws with SNP and TDX guests =
where a
> > > PV clock provided by the untrusted hypervisor is used instead of the =
secure
> > > TSC that is controlled by trusted firmware.
> > >=20
> > > The secondary goal is modernize running under KVM.=C2=A0 Currently, K=
VM guests will
> > > use TSC for clocksource, but not sched_clock.=C2=A0 And Linux-as-a-KV=
M-guest doesn't
> > > support paravirt enumeration of the TSC/APIC frequencies, even though=
 QEMU
> > > provides that information by default.
> > >=20
> > > The tertiary goal is to clean up the PV clock code to deduplicate log=
ic across
> > > hypervisors, and to hopefully make it all easier to maintain going fo=
rward.
> > >=20
> > > The quaternary goal is to clean up the TSC calibration code, which wa=
s made
> > > stupidly hard to follow by hypervisor code mixing in with the native
> > > calibration routines, instead of being implemented as a pure alternat=
ive.
> > >=20
> > > Note, the VMware and Xen changes still probably should get acks from =
those
> > > maintainers, as my understanding of what they're trying to do may be =
flawed.
> >=20
> > This (thankfully) still applies cleanly.=C2=A0 What can I do to help mo=
ve this forward?
>=20
> Nudge Thomas to spot that this is guest-side and we want him to pick it u=
p, I guess?

Amazingly, still applies cleanly on 7.4-rc1 and tip/master.  I know we're s=
hortly
after the merge window, but this has been sitting idle for months and addre=
sses
issues that are impacting a variety of end users.

Note, this also provides meaningful hardening for SNP and TDX.  /me stares =
intently
in the direction of Dave and Boris.

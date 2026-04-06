Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E403A0B1D
	for <linux-coco@lists.linux.dev>; Mon,  6 Apr 2026 23:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775516839; cv=none; b=gA3bZ1YciK+QAkD3xcBmfMe4mSlhRjk4hHEP0CYMhpbXx+8ocUXE1clnENfp8gvHi+mTYdqBpV7Vnn17stDHBatFGHqvcU5Wz59goZb8NHXjWzs2oQ+9wQlYzuMQerQvXq78HNzAoC4Wz/vgBxhdI21xjkKPHfr4DlqWa4MIz9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775516839; c=relaxed/simple;
	bh=FdaAfUF++iEK12cCowkIbtrFVQfugukfeRU3XOEBdOs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KMyuF00UX7x6UChzTVy6gE6aV94mHGmk8z4Gt0XeHjvHX+BZW//kz47GXk8pIaQw0PpJBiImXHe5O6ZU1POZc3B1HI4QMaLd+uGyd7HodhsgWWeM7ct6H5Dy2wF0iNLB5DgbWOcTefuvPqIElqm4uzEyHnLMoUoydiB14GB4mXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ib3SvmGW; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ib3SvmGW"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c741f038f7cso2133996a12.2
        for <linux-coco@lists.linux.dev>; Mon, 06 Apr 2026 16:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775516837; x=1776121637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdaAfUF++iEK12cCowkIbtrFVQfugukfeRU3XOEBdOs=;
        b=ib3SvmGWEtGL87OxPM5xZSHNic8mXcXt/Rq3kPBXwYirlJ/dnbxOTc3/0NjTgU7q68
         LCR7wW5TqynYR9hCAM1RVE4i/wxUqmwWfixtd+5QlIIvxS4o+n1k+/AZmbrHEnfRLI0T
         wVeARcSiut5hKDVKCu1ljY5o6lrzjFww9VOtFmupyIKTo9i+gunyp8NllGh6EA/u1KOL
         a0adSbgzLDGOX9uhQWVTO6ds0y7sQolfb6TCo+AzTHGyIaNgFlPUMdw+d00g4YX6NhG2
         ZrwFiF5C734mL/QRg6EYEiP2IHYL3iPNxz55OB/eax46Ax/1iCYKHECPkf6zTkIWpzID
         n+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775516837; x=1776121637;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FdaAfUF++iEK12cCowkIbtrFVQfugukfeRU3XOEBdOs=;
        b=qoc9amDva9QR+c4iKbT0Bb02/Nw92OWo3QRP99xhasic3WlXSYCp2lX3jJUVGnHEAo
         VFno2pKtSwkuQ4B8hHtjrfG1bLdBDJM2qCKhd5/XxHia7o+RjfgSwMxOTSxO6158I8Rl
         MfMjrFg434VvW0Gsh6xhJZJ4jQ2sz3hLmuNRGjm1/NQ7nd5Yo2wKDNvpG09JFDFL1A5B
         At9Al8HaOlRGwJwLJZ8NVFkhimaWYraUlVzvF5nHxk1l9C02W9Qt7VkMmqXRTzjTpCO7
         kv3UC2eXoQhQAbOHu+OFbzWVDfoKrT7udUfBMNgNpNX705Ch8qFqirkL76XLUfG+1WvP
         gyjg==
X-Forwarded-Encrypted: i=1; AJvYcCWC7AguWvjNnVtE78ONi8SzcK+Xw6j4WepzzVyRgAeRPaEUhS+w1M9wO3n3uy/qfLYZ27X+r81AZbX2@lists.linux.dev
X-Gm-Message-State: AOJu0YyYwuda38PdjJUB4QrXH1ERYZ7DlLBznG1ZdaiggP/nWQQ4pFOD
	btuYbEfvq+ci14ZX3MEqQUl2aLphRFg9ZR/jKxN766XFyzKVYQnLDVasiTGlAJFA1lXvFLJzqy8
	2SHhGsQ==
X-Received: from pfbk27.prod.google.com ([2002:a05:6a00:b01b:b0:82a:f09:7a6a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:338e:b0:82a:8163:4bf4
 with SMTP id d2e1a72fcca58-82d0db9c30amr13345230b3a.46.1775516837154; Mon, 06
 Apr 2026 16:07:17 -0700 (PDT)
Date: Mon, 6 Apr 2026 16:07:15 -0700
In-Reply-To: <faac37c7ba9e3a2e8d996e18c74301d9cefad3dc.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cb99e44c-8bc9-4bab-b485-9f63a4d0b262@linux.intel.com>
 <93358559-5ed1-4574-8951-24d7ea9354e4@intel.com> <ee8d7ea3-0ece-43cf-ab07-6954df4c01ad@linux.intel.com>
 <f67179d7050ae28ac261bb6227b1c045c10579c9.camel@intel.com>
 <ac_rNT69TdocrMYc@google.com> <401db97a254b356ad8539a5d637d68ee826179a5.camel@intel.com>
 <adAQCXI-7Yj0wcKA@google.com> <ec581571ab4141ed77e6979b3e03773e301a62c1.camel@intel.com>
 <adBIPdBA-aJWcUrY@google.com> <faac37c7ba9e3a2e8d996e18c74301d9cefad3dc.camel@intel.com>
Message-ID: <adQ8o2U4ChisMEjS@google.com>
Subject: Re: [PATCH] KVM: TDX: Fix APIC MSR ranges in tdx_has_emulated_msr()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, "dmaluka@chromium.org" <dmaluka@chromium.org>, 
	"x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2026, Rick P Edgecombe wrote:
> On Fri, 2026-04-03 at 16:07 -0700, Sean Christopherson wrote:
> > > So... "Reduced #VE" (also called "VE reduction") reduces which things=
 cause
> > > a #VE. The guest opts into it and the TDX module starts behaving
> > > differently. It's kind of grab bag of changes including changing CPUI=
D
> > > behavior, which is another wrinkle. It was intended to fixup guest si=
de TDX
> > > arch issues.
> >=20
> > And KVM has no visilibity into which mode the guest has selected?=C2=A0=
 That's
> > awful.
>=20
> Yea, on both accounts. So where we are at with this is, starting to rejec=
t
> changes that build on the pattern. We haven't gone so far as to ask for a
> feature to notify the host of the guest opt-ins. But I wouldn't say we ha=
ve a
> grand design in mind either. If you have any clarity, please feel free to=
 drop a
> quotable.

I got nothing, probably best to just deal with things on a case-by-case bas=
is
unless we end up with a recurring theme.

> > If KVM has no visiblity, then I don't see an option other than for KVM =
to
> > advertise and emulate what it can at all times, and it becomes the gues=
t's
> > responsibility to not screw up.=C2=A0 I guess it's not really any diffe=
rent from
> > not trying to use MMIO accesses after switching to x2APIC mode.
>=20
> Like your diff? Expose any MSRs that might be emulated in the TDX paradig=
m. But
> don't expose all MSRs that KVM supports.

Yep.

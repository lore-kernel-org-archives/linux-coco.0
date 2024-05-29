Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6772518E06
	for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 20:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717012929; cv=none; b=PWdoou/H/FVWKvILkdUtil9uChxrFO0PMduDYngIq/szWrgkT7XBL8BmSO+YSs1y0XiU2kLxx0F9VRhxNRjjw++g4dTIALZOmnXUSKcBulJ4isb/C5/8GWdyya+UhEQzx4rRBmWF69fu4JgGJmC9Wgehngt6ccLWIMxoeMdCFYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717012929; c=relaxed/simple;
	bh=2hRlvy/RjWARtjo6oSUZO1Wu+DhCOpznFy5U6Li2iQs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s4EcSlqPFfwn4Inx2nkHXbpUisqsKNb96b27uWouif3DzdVP3cmIe0c3aq+uprwlyDOznIfhQYQaK/TnxWW+di7KKuaYs2HIYt6+GxRmnY9XTpG3+IabAK+uIxj0oJoH1oB8RgM0XFuxYMZobfZUGJ7GwqmsoGxycuJV97JrcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2HV7Vvs5; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2HV7Vvs5"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6bcf28cf82aso120921a12.2
        for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717012928; x=1717617728; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB9I1KtyGLGWJZbJtvz+lEDv77A0FrVSDAPAJPLn2YA=;
        b=2HV7Vvs55IWiuKz2mDHw41OsNd4dOl6cTauKX7UiEi6b9wCowTDNiBdZzz0XRqeq2o
         mWBRn+iL+7ly455CFW/jx90nvt6icqmuGq838zdSfts/Y0Y9yIQ/3rsyERxKv8nsS6+R
         znNq4XFGGDQtrn1WdEWt7Iz9I1S46r4sQ3rL5cyf/xdBT/vGtrl+T1fJ+XwF255fl8lJ
         m2f72WBgSjAs/ulWt0Ag764GNuM3Gp104d0w40sJBgqE0aq6/9+6rtOxvRWxSsdC1HlH
         IgeC0G5yQB5yI8EOfuPa4unUA856sZxxttIlQTAGDWpqbuohhpy7limYto0+nKs0r1ds
         xxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012928; x=1717617728;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HB9I1KtyGLGWJZbJtvz+lEDv77A0FrVSDAPAJPLn2YA=;
        b=ipT6BI+6w79qr6oKXsGLm5EsDhFTd45hSO9JdWNZuJqCy0eWDntbnmBeYM0BT/IYfd
         3gRDwRtc+QMfEmi5wbUIjSUxGUiWLfH45iXw1gkpIAHpfdxdvO+yMZZmWq/GfuOjwAC1
         WVT75xg2qOdoT5Wbst0n3caWO6OGQdGxAD/OzR7YNwkNlEtm82dj+DOMBBEQ6O9LXlyd
         jONYi7HoAML0KPuucNbGLkwOKfah0LF7hdPx6luhIyjrIDtJ2EZx9xA+zjW9SppoN330
         dbWuRvEO/sHA+olQq4rvFu1qoj8WwMxtZoBjOHD2EuDbFcPXe26O158VnqLm4I0JBySY
         mg9g==
X-Forwarded-Encrypted: i=1; AJvYcCXzixhcj/DW1+H6nww/4M+I3y2msEMdnoGP+lyv9wKKrN0epD8lz6k+7F1rNt3/EBIOH4E5crGlVF4fxU4/3ZMiGJYzIIn4CjuHcw==
X-Gm-Message-State: AOJu0YzNPBW2F8Wp0s+i4FhCjanvVsthyU8brlJy1JVVTfBvJX8CxisA
	FKaV+yWqctoD3nRpvZs3LJsKfq5AkXedJsRtLH2v+l3R/WvM6AkbqlGyhBOAL8oK/jKvq/lT2fT
	iKw==
X-Google-Smtp-Source: AGHT+IGnVjGAGUdS+QWuXtFD6JYVk48kHHGOYEmxpJY5fF1LGZtFCwusKyw4nxPICVEtyh7y/Kks5wf6ja0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1258:b0:2b8:9aac:2b04 with SMTP id
 98e67ed59e1d1-2c1abc659ddmr252a91.5.1717012927588; Wed, 29 May 2024 13:02:07
 -0700 (PDT)
Date: Wed, 29 May 2024 13:02:06 -0700
In-Reply-To: <CABgObfajCDkbDbK6-QyZABGTh=5rmE5q3ifvHfZD1A2Z+u0v3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240501085210.2213060-1-michael.roth@amd.com>
 <20240501085210.2213060-10-michael.roth@amd.com> <84e8460d-f8e7-46d7-a274-90ea7aec2203@linux.intel.com>
 <CABgObfaXmMUYHEuK+D+2E9pybKMJqGZsKB033X1aOSQHSEqqVA@mail.gmail.com>
 <7d6a4320-89f5-48ce-95ff-54b00e7e9597@linux.intel.com> <rczrxq3lhqguarwh4cwxwa35j5riiagbilcw32oaxd7aqpyaq7@6bqrqn6ontba>
 <7da9c4a3-8597-44aa-a7ad-cc2bd2a85024@linux.intel.com> <CABgObfajCDkbDbK6-QyZABGTh=5rmE5q3ifvHfZD1A2Z+u0v3A@mail.gmail.com>
Message-ID: <ZleJvmCawKqmpFIa@google.com>
Subject: Re: [PATCH v15 09/20] KVM: SEV: Add support to handle MSR based Page
 State Change VMGEXIT
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, 
	ardb@kernel.org, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024, Paolo Bonzini wrote:
> On Mon, May 27, 2024 at 2:26=E2=80=AFPM Binbin Wu <binbin.wu@linux.intel.=
com> wrote:
> > > It seems like TDX should be able to do something similar by limiting =
the
> > > size of each KVM_HC_MAP_GPA_RANGE to TDX_MAP_GPA_MAX_LEN, and then
> > > returning TDG_VP_VMCALL_RETRY to guest if the original size was great=
er
> > > than TDX_MAP_GPA_MAX_LEN. But at that point you're effectively done w=
ith
> > > the entire request and can return to guest, so it actually seems a li=
ttle
> > > more straightforward than the SNP case above. E.g. TDX has a 1:1 mapp=
ing
> > > between TDG_VP_VMCALL_MAP_GPA and KVM_HC_MAP_GPA_RANGE events. (And e=
ven
> > > similar names :))
> > >
> > > So doesn't seem like there's a good reason to expose any of these
> > > throttling details to userspace,
>=20
> I think userspace should never be worried about throttling. I would
> say it's up to the guest to split the GPA into multiple ranges,

I agree in principle, but in practice I can understand not wanting to split=
 up
the conversion in the guest due to the additional overhead of the world swi=
tches.

>  but that's not how arch/x86/coco/tdx/tdx.c is implemented so instead we =
can
>  do the split in KVM instead. It can be a module parameter or VM attribut=
e,
>  establishing the size that will be processed in a single TDVMCALL.

Is it just interrupts that are problematic for conversions?  I assume so, b=
ecause
I can't think of anything else where telling the guest to retry would be ap=
propriate
and useful.

If so, KVM shouldn't need to unconditionally restrict the size for a single
TDVMCALL, KVM just needs to ensure interrupts are handled soonish.  To do t=
hat,
KVM could use a much smaller chunk size, e.g. 64KiB (completely made up num=
ber),
and keep processing the TDVMCALL as long as there is no interrupt pending.
Hopefully that would obviate the need for a tunable.

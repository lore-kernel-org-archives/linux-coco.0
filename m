Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76BCA60
	for <linux-coco@lists.linux.dev>; Fri, 25 Aug 2023 15:16:43 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d72403b9e03so1256339276.0
        for <linux-coco@lists.linux.dev>; Fri, 25 Aug 2023 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692976603; x=1693581403;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+qZacLeLST20WZkZg3X0HYv6ogNb3zY8VuXIgkvKTM=;
        b=wy5uj3vbEV2+F5QHSyG/Uu55Wui8ykorU6ZqmdfA1CBcqSWOg+pTi21HsEVPW7Irbn
         dOmh+bIklq8wcJTlc7FBHFPsb6uymbOCb9cdfbByqVZtTdRYGr3EjsPrV0xDUYe3IiEo
         lLz16ZA+8ea3Lie+fA/7sPS0TrFqrt5+2Tref6WQTD4pZDj3RVdnGNxRWz+AIqvoJFWR
         y68RJJnOhi3Q1uOolWhYNaas3ZOMdh/IeVZ00Hld7lr6psC4Dqf58EXlZtn8UIAmt4FG
         +BeCS3nuxGBRtH7rjIuPcbhYQ0m8a3UmtZcgu7oZFm/D9izDwidGWEkjeF0V8YAcqadW
         RpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692976603; x=1693581403;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+qZacLeLST20WZkZg3X0HYv6ogNb3zY8VuXIgkvKTM=;
        b=WZQh2vvB/GIMcNiayRnlbZ20N2cPHlIYFRTZechxEb7GE6+K469A7oHsdWa3tTDmwZ
         sISWJjUUnyODuG0kU71jDsi7Kc4puzch8Agqohr3j6LXOELpKQ6hRZx85gnSujD6u6ZA
         GUEqgY1ox9a0Wu+pQ6tbTM8/+8nGCYGUqbNhHCxbA5DYhfUgcK685tG6CP4IuCGr2PKL
         xJAUy2yrSxzKlakn+//2FqN7GxDrBJ+MltGm5p3Ez9xTKjNjxdnNrAXq6UZmiBXu+O1b
         bqJlId5C5ScyuRVBhiloCvzsBqpd/No+A8Y/hwveWVPsHtkkDk1B3lmWjNUqZLrZ/YyF
         H0Yw==
X-Gm-Message-State: AOJu0Yz8Ytp3lV2KpY0e9qBUDfbBDBVLKGot4/7L/AFeIIrzPJdsc5Ye
	MFqhnZ8Zq6UZfhzlV6ZLmECLlnwdhsA=
X-Google-Smtp-Source: AGHT+IF+/YvF1hNJ+A+CNqAw1K04tkGFrxR2jOQYlvT3+gAer086xMv3+AuVoyCU/SHLKlBrUlL5JVwu+2M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:41c1:0:b0:d4d:564d:8fbf with SMTP id
 o184-20020a2541c1000000b00d4d564d8fbfmr456787yba.13.1692976602984; Fri, 25
 Aug 2023 08:16:42 -0700 (PDT)
Date: Fri, 25 Aug 2023 08:16:40 -0700
In-Reply-To: <20230825134746.k7hkpa3e7wnsuq7m@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com> <20230808200111.nz74tmschph435ri@box>
 <878ra0ck4k.ffs@tglx> <20230825134746.k7hkpa3e7wnsuq7m@box.shutemov.name>
Message-ID: <ZOjF2DMBgW/zVvL3@google.com>
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 25, 2023, Kirill A. Shutemov wrote:
> On Thu, Aug 24, 2023 at 09:31:39PM +0200, Thomas Gleixner wrote:
> > On Tue, Aug 08 2023 at 23:01, Kirill A. Shutemov wrote:
> > > On Tue, Aug 08, 2023 at 10:13:05AM -0700, Dave Hansen wrote:
> > >> On 8/8/23 09:23, Kirill A. Shutemov wrote:
> > >> ...
> > >> > On the other hand, other clock sources (such as HPET, ACPI timer,
> > >> > APIC, etc.) necessitate VM exits to implement, resulting in more 
> > >> > fluctuating measurements compared to TSC. Thus, those clock sources
> > >> > are not effective for calibrating TSC.
> > >> 
> > >> Do we need to do anything to _those_ to mark them as slightly stinky?
> > >
> > > I don't know what the rules here. As far as I can see, all other clock
> > > sources relevant for TDX guest have lower rating. I guess we are fine?
> > 
> > Ideally they are not enumerated in the first place, which prevents the
> > kernel from trying.
> 
> We can ask QEMU/KVM not to advertise them to TDX guest, but guest has to
> protect itself as the VMM is not trusted. And we are back to device
> filtering...
> 
> > > There's notable exception to the rating order is kvmclock which is higher
> > > than tsc.
> > 
> > Which is silly aside of TDX.

It made a lot more sense back when stable TSC weren't a thing, which is why
kvmclock_init() drops its rating below the TSC's "300" rating when the TSC is
stable and nonstop.

	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
	    !check_tsc_unstable())
		kvm_clock.rating = 299;

Xen and Hyper-V also have a paravirt clock with a rating that is initially higher
than the TSC, but xen_time_init() and hv_init_tsc_clocksource() have similar behavior
to lower their rating when the TSC is deemed to be safe/stable.

Note, because KVM clock isn't marked VALID_FOR_HRES, even if kvmclock didn't
drop its rating, most guests will end up selecting the TSC anyways.

> > > It has to be disabled, but it is not clear to me how. This topic
> > > is related to how we are going to filter allowed devices/drivers, so I
> > > would postpone the decision until we settle on wider filtering schema.
> > 
> > TDX aside it might be useful to have a mechanism to select TSC over KVM
> > clock in general.
> 
> Sean, Paolo, any comment on this?

I would expect the VMM to not advertise KVM clock if the VM is going to run on
hosts with stable TSCs, i.e. the guest really shouldn't need to do anything in.
But I avoid clocks and timekeeping like the plague, so take that with a grain of
salt, e.g. maybe there's a good reason to always advertise kvmclock.

For TDX and other paranoid guests, I assume the kernel command line is captured
as part of attestation.   And so the existing "no-kvmclock" param should be
sufficient to ensure the guest doesn't use KVM clock over the TSC, though IIRC
TDX requires a constant, non-stop TSC, so it's likely not strictly necessary.

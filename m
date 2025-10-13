Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3CB2C08C4
	for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 23:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399403; cv=none; b=ccLPDh+iEr4ZsTWsUvyRoGfbVCPBZQ1M8TgTLNEgrH28+WhhVhhi0mxvDHgLrFvH6qd1IcVJpjXe1qSAhD5KqgL6GbEmM0yIePzZesFsfA6S8WDJ2UcYHFkR18tr+BI+dz9rEiCKcsExdC2DtXkAq3YcPSBLbszmX0TiwPYZwx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399403; c=relaxed/simple;
	bh=p1/z9JXn/6u67zL4YtuE3iecUE2DhRP6BHFknbwMdZs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bddtVn41r6w4AFlyv6i6p+kzv/nNcNUNdAG6Hy6+PQjws2w42sonbtefeYhiBHvam8KVfFlEhTt1mro8L6HEjGGx1wRyBtvzaciQoVs4PCX/9bkmx5l++28nlTaT0udeiuc8J7H2RgjCIVSWH7LbxBXHBloOdQsEPCc1EpyvjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HK4L32Kf; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HK4L32Kf"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-780fb254938so6931526b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 16:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760399400; x=1761004200; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xOsqthpgUN+7hMYU4tdGq9Dk1J6tZ/phPwfI6EdZH7w=;
        b=HK4L32KfGa/afc92kuU+tzhqsf91k0HJBleAEAr5aVghiCmYm1e3UF+4R0jkTB0rgn
         Mw1+R1qUknR18SKlHWJ4HfahoSkc+PeoZ9o6hDLNaCEZgCZDIo/q4RnKjsCFrvaJeStO
         NHZmj/ozU5PUfp0It9KEe8DAIJlyI6KelofQ0K8vugvg1hPsHGrUeLigQAGjLqkO7wKL
         jtDLP5Jv4OCRucuSOZAdkacjueWA4KH+j3pawuWU8KbdejfrIkxoB2yQV0aiTTa1mD4d
         rCVK/XJFij12hJabODyHTyqy4KqUrL1mhfZfTd9dXvR4R6fPMKqiiom7o01nZMHa+a/i
         2fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399400; x=1761004200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOsqthpgUN+7hMYU4tdGq9Dk1J6tZ/phPwfI6EdZH7w=;
        b=R89QFwFCl7gx5gPblRzvH07eh8oaaZ2v9ewR12i7X2sQuJM9tTkDBms72u9LT+zn5Y
         l1hrA+90GaAjIgddYd6A27dlvRrD6AqqY8mjvPnIy2a2uSL9VuZ5HTW5SdDhhmp8GzPp
         IQEfLqv6Qy5oD+2kYIFB7R3d1Te8zC/HBGdmYUL3S2ldbMaNF6An0LOFGVDmZwEzMWOt
         j98VYpn+CHZhoyq0VzKfngQJUj7xshMCCiW0wZGFxlJhH91a/qp2KlB6W5jZ+E9SZLbL
         et55x2gmBWk90mzBG3y5cNL9NRbguPK/Q1MekCmSNZiocGNCnUIprGTWk2WSrLUeeYUc
         a+wA==
X-Forwarded-Encrypted: i=1; AJvYcCUctZnCIIpt1LeWZ3uj3BxjsV8kMMtAqM5GR2QdCinqq8oRFIMoGNgoHVdfA7c+g899HxzT//CFHU4Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwpkeRdRpDZlNIRrmYKCHbSzvADPEA7GWHwn/GSB/aKrzEm12fv
	drhT7pAmC1RLqB87soDCfZd8LsW05vYfIDfp+RQUOCJJzGmvWuqq2EbqPk4YrJYzSrP66Jqdchb
	6fLmZRw==
X-Google-Smtp-Source: AGHT+IGzRn21y2SOJv+cqH5j2+OiAKh5F8oTXvdefE1kD/L60D8YTn/fnpdk+gNG0UEKzZnXP8ieD//uQt4=
X-Received: from pjbgt20.prod.google.com ([2002:a17:90a:f2d4:b0:33b:51fe:1a76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:258f:b0:2f6:14c6:95ea
 with SMTP id adf61e73a8af0-32da8130d99mr30976889637.20.1760399400534; Mon, 13
 Oct 2025 16:50:00 -0700 (PDT)
Date: Mon, 13 Oct 2025 16:49:59 -0700
In-Reply-To: <68ed7bc0c987a_19928100ed@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010220403.987927-1-seanjc@google.com> <68ed7bc0c987a_19928100ed@dwillia2-mobl4.notmuch>
Message-ID: <aO2QJ-YapvJXxE1z@google.com>
Subject: Re: [RFC PATCH 0/4] KVM: x86/tdx: Have TDX handle VMXON during bringup
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xin Li <xin@zytor.com>, Kai Huang <kai.huang@intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, aik@amd.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 13, 2025, dan.j.williams@intel.com wrote:
> > Emphasis on "only", because leaving VMCS tracking and clearing in KVM is
> > another key difference from Xin's series.  The "light bulb" moment on that
> > front is that TDX isn't a hypervisor, and isn't trying to be a hypervisor.
> > Specifically, TDX should _never_ have it's own VMCSes (that are visible to the
> > host; the TDX-Module has it's own VMCSes to do SEAMCALL/SEAMRET), and so there
> > is simply no reason to move that functionality out of KVM.
> > 
> > With that out of the way, dealing with VMXON/VMXOFF and EFER.SVME is a fairly
> > simple refcounting game.
> > 
> > Oh, and I didn't bother looking to see if it would work, but if TDX only needs
> > VMXON during boot, then the TDX use of VMXON could be transient.
> 
> With the work-in-progress "Host Services", the expectation is that VMX
> would remain on especially because there is no current way to de-init
> TDX.

What are Host Services?

> Now, the "TDX always-on even outside of Host Services" this series is
> proposing gives me slight pause. I.e. Any resources that TDX gobbles, or
> features that TDX is incompatible (ACPI S3), need a trip through a BIOS
> menu to turn off.  However, if that becomes a problem in practice we can
> circle back later to fix that up.

Oooh, by "TDX always-on" you mean invoking tdx_enable() during boot, as opposed
to throwing it into a loadable module.  To be honest, I completely missed the
whole PAMT allocation and imcompatible features side of things.

And Rick already pointed out that doing tdx_enable() during tdx_init() would be
far too early.

So it seems like the simple answer is to continue to have __tdx_bringup() invoke
tdx_enable(), but without all the caveats about the caller needed to hold the
CPUs lock, be post-VMXON, etc.

> > could simply blast on_each_cpu() and forego the cpuhp and syscore hooks (a
> > non-emergency reboot during init isn't possible).  I don't particuarly care
> > what TDX does, as it's a fairly minor detail all things concerned.  I went with
> > the "harder" approach, e.g. to validate keeping the VMXON users count elevated
> > would do the right thing with respect to CPU offlining, etc.
> > 
> > Lightly tested (see the hacks below to verify the TDX side appears to do what
> > it's supposed to do), but it seems to work?  Heavily RFC, e.g. the third patch
> > in particular needs to be chunked up, I'm sure there's polishing to be done,
> > etc.
> 
> Sounds good and I read this as "hey, this is the form I would like to
> see, when someone else cleans this up and sends it back to me as a
> non-RFC".

Actually, I think I can take it forward.  Knock wood, but I don't think there's
all that much left to be done.  Heck, even writing the code for the initial RFC
was a pretty short adventure once I had my head wrapped around the concept.

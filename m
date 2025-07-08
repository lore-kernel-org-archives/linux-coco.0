Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A52DEA73
	for <linux-coco@lists.linux.dev>; Tue,  8 Jul 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984651; cv=none; b=WSM8ouzX9PbEBDJbAdno5hQGYLZ6poH2rHFwXMDO0j4YM6fYXDRNDmiFL0Gv3j/ss/pC4dsuGYd7rrr+sLXId/JVkQyLp3im1gsMftdTqUHWoXyYdxnyIwk82GagV4+p/ZbObZ4cA1wVl3cXijlRP6AWnQ8bHBcZITFGnoGvyp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984651; c=relaxed/simple;
	bh=/kZqCbhqYh5YCXTxk+fK0iWg1EAtPt/kehn1Ec6GM3g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NtCoC9viBfqnR2I3zTLabrvVsYN0UbiDgf7cXydi/K8IJiexY1eLXVttoFAGSrOHx1rfjRJAKCJcnZ6ml3U968Z5x/iQlK5fuun/YoMCQ5Izy30VaQ2a95hed5RTJpzQhwZPGp5LApZre7daGKAgSZZ0zC7nwsqg7IW5knojFgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UvIFia/R; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UvIFia/R"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2365ab89b52so35116475ad.2
        for <linux-coco@lists.linux.dev>; Tue, 08 Jul 2025 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751984649; x=1752589449; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F91em5bdhzH0evEHfCzXh2OqMZgsdjbMrBY86+xRXLE=;
        b=UvIFia/Rm0zuttF4tzZio7WYQTctPkQTpaHUOcdMn9qn4FGCZU+pgUQuR+jz2c2OLb
         2RwxqBdMhFYMvrd78lb8QHrzyc9HYqXnq+5Jngm80m0ad9DYTgE/CRTrcXahz3deR6KF
         pwkpkC55SMnEn2dxoPp97jKjS8g0Lz10AgnQnW8UsVW7Vuy8USPKiaR9HKqizvGfs01J
         iuTQpiEVva8UjQkSFD497v3e3T0Z9okEC8HRxrRlJ+v2EXl8D0o2xxXzdPRL2Z+wvo5A
         WZjMrx9k6EEvW2R7fNH2460BjY7IINkWxyEnhw1h4t4jSLJitXQatO2hLEO5y1MGxuxa
         sdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984649; x=1752589449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F91em5bdhzH0evEHfCzXh2OqMZgsdjbMrBY86+xRXLE=;
        b=mBWjMlBXrg0+4kdvQfq/FZQk835Qq23U4KgR9zdCw1IS0AFRxp1XdiVCqmhL/AT7rb
         Hy7YHs3VZTVcfFyo5Fc3pQAQmOQ+8HmlICCdtNBzvb7dMKVHDeJZyGD14l465gUwW1SD
         mAxiFTtXoUMxRX9LZMgpgDf8qJQUWTlXtOkCSfPd+3cN128zoclnxlPeoJcMbrobiz6C
         5EbunVaEBddr1CQPicucU9jqupssXEdRsgiwwGFniTKb8FNi3gCCFH3hEwZVcfKS6JpL
         I6efozjvJwzrVm1v9xhV1wA/Z1PzSO3nEQpZCHmrPHZg64/sG3+SdF2eVUBCbrdzI+LV
         JnMg==
X-Forwarded-Encrypted: i=1; AJvYcCXP6To9xWZc/v5GlFb2V7omV4gQrJ0aRC0bNnUncHIQdHdFXsB1USrvej2xoUuZKTrnEds5QUPRRZOI@lists.linux.dev
X-Gm-Message-State: AOJu0YwObWplw6POfq7oc6V5ijzjLCVENgbyTPr5BwZlgKD1ynMaxMoO
	ULovJj5UJUtLYBgGNh6HHl1ozxg43xk87uNI3B4QpDSyZ28vB8Bi+cT6bFg1TUS5W56/rLY/PaG
	lQEF5/g==
X-Google-Smtp-Source: AGHT+IFbF1V38gdww09JJdOKoOpDJjez8aU/gHvPRnPoc/lwUMPRCGZHI+DXUdaAyT+Hz7B4vCxsYKhdwN4=
X-Received: from pjbsd4.prod.google.com ([2002:a17:90b:5144:b0:311:eb65:e269])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54d:b0:234:f6ba:e68a
 with SMTP id d9443c01a7336-23dd0b2174dmr54565265ad.45.1751984649451; Tue, 08
 Jul 2025 07:24:09 -0700 (PDT)
Date: Tue, 8 Jul 2025 07:24:07 -0700
In-Reply-To: <d38b37c7-70fe-4c94-9ef2-e5d765ca5c79@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250708101922.50560-1-kirill.shutemov@linux.intel.com>
 <20250708101922.50560-2-kirill.shutemov@linux.intel.com> <d38b37c7-70fe-4c94-9ef2-e5d765ca5c79@intel.com>
Message-ID: <aG0qB2OEUmBTKzpY@google.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the file list in the TDX entry.
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 08, 2025, Dave Hansen wrote:
> On 7/8/25 03:19, Kirill A. Shutemov wrote:
> > @@ -26952,12 +26952,18 @@ L:	linux-coco@lists.linux.dev
> >  S:	Supported
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
> >  F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
> > +F:	Documentation/arch/x86/tdx.rst
> > +F:	Documentation/virt/coco/tdx-guest.rst
> > +F:	Documentation/virt/kvm/x86/intel-tdx.rst
> >  F:	arch/x86/boot/compressed/tdx*
> > +F:	arch/x86/boot/compressed/tdcall.S
> >  F:	arch/x86/coco/tdx/
> > -F:	arch/x86/include/asm/shared/tdx.h
> > -F:	arch/x86/include/asm/tdx.h
> > +F:	arch/x86/include/asm/shared/tdx*
> > +F:	arch/x86/include/asm/tdx*
> > +F:	arch/x86/kvm/vmx/tdx*
> >  F:	arch/x86/virt/vmx/tdx/
> > -F:	drivers/virt/coco/tdx-guest
> > +F:	drivers/virt/coco/tdx-guest/
> > +F:	tools/testing/selftests/tdx/
> 
> That file list is getting a bit long, but it _is_ the truth.

What about adding

K:	tdx

instead of listing each file individually?  That might also help clarify what's
up for cases where there is overlap, e.g. with KVM, to convey that this is a
"secondary" entry of sorts.

> It's also adding some arch/x86/kvm/vmx/ files, but I assume Sean and
> Paolo will welcome having some more people cc'd on those patches. The
> hyper-v folks have a similar entry.

No objection from me.

> I'll plan to apply this as-is unless someone screams.

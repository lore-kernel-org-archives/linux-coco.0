Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127F1DF248
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 00:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754354870; cv=none; b=brAIspUnvGti9s01O9tzomxOEoVTFn7ngkCTtixpP7ZAmGtnHYBWnQ1F9f9XP6eIKAG++Pw6zUz7f0IM6xW3JzsAvwslQ/ePEdT0JnvmECbfQXLj9oba2pyoL+I2veRKARVal8IenaWgyenMUS5Wia4fcwp7/sulz/2EJCHYoGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754354870; c=relaxed/simple;
	bh=T8nD+fX6rDNRkCaFiQRFYPADN1FCVuJB1qjvodeEbJM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i5uP4ym1nCoSzXC/7+YmxwQdlXD2pYDVR4BD4JtDEHr4ii3j6E/cJJX+jSOrj22D3QsJ0z21zh4PxmmskTKSOGJGb1p+8R+fOHj+619FcRJ6xhPjshj1PmVz7puJY/ekgCVqRD4ETdbYT+5ibUZPPOHa66U2cGGJ+HW6xXWLz/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2J7P8bCT; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2J7P8bCT"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so6659718a91.1
        for <linux-coco@lists.linux.dev>; Mon, 04 Aug 2025 17:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754354868; x=1754959668; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu8xPNeiA0Tn8TRzhuzSXVcIKY6L0tnmUlXuLitCJyQ=;
        b=2J7P8bCTsKT54bATlj53NKFUd1pguR16pXQRYcAlM4Xs3yO1nGP9GY4zuE30t5Zrt+
         0PDFHtkgMZguu9ENF0pQCo05pNc352XNRPRHXym/N5z8sQn8XjzM9KgwmsQK7oee3Zi9
         Nzon6wz8h2ttTZt1k62Y8od1mymiU3MjxRcg2eTCu99OuMV5TLCz9YEifnMb4T86PO8n
         hiYWkUoqjlVxUcIN1cZa/V2ksjbZ/m/33/w3szWX8jgNY/+vOHZSBKvNNbi2JUJ+4duG
         Za/H7eiM5SvCVJhAVW3uHTbTCK7VUyl7Fihi+UvsxeAE0TKHmqFsWjgy1sUIvlAz79Qu
         dI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754354868; x=1754959668;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu8xPNeiA0Tn8TRzhuzSXVcIKY6L0tnmUlXuLitCJyQ=;
        b=hKNQ9PaYd4E0ExnUUdpYuYJmZwLFjHFM9ycxsgTcmtI6vEsGMYalUFsVrpALnuypf9
         CIlZG9PfZTfw3kvgM/HCvOYzTRm+ic6veRKQcLo4uYd+LVdl6JFIzQe2wOB8c5VDqVFK
         Xwrs/yleZPM/s/HOvxu/jOrtadqkyTyN2oxky8TcUArlVPc8zPR9AcoC0bmp+hs5MX80
         PDc/Jb4vXEWhU9v6YAZn6JAHC+ezvKCg2EXmSOCpGAE3z2ZIdJ5gqbtQ4u2A07/hFZgO
         3NUlQI0VXL0BhcYb+bmuTp6mU6mMkSiZQGxH25XRt9qlWKsHbskPJV83etuhyPrGU4yH
         aCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVE7RhY6kChTC3pgw6sATZd6pF8RlFO3CC7vCdGAr3119zIcfZ7b1/OnG3OcTN7sG3samYdYTYFrez@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2+qHEEnMv8sCgEAWkleozPhH7kvT0n9CAhsJI4XMCXG9ofiyW
	Uc3JJxGr6X0joyZzLsg/OT/MwRFdyAvSd9iSYBXDjnc9jWXp5LP1G0M9C8DjaQhBOCjZQI6age0
	8LwbbKQ==
X-Google-Smtp-Source: AGHT+IEZYBSAKiguuNjj28l/9brar2wCZOQTwnXlJ0BcU5UbbgBHEEX5wjUA9Z/lzBYCbEZSZi06SPbrXHo=
X-Received: from pjf11.prod.google.com ([2002:a17:90b:3f0b:b0:31f:6ddd:ef5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c4a:b0:31f:11d6:cea0
 with SMTP id 98e67ed59e1d1-321162cc3d0mr16395187a91.27.1754354868127; Mon, 04
 Aug 2025 17:47:48 -0700 (PDT)
Date: Mon, 4 Aug 2025 17:47:46 -0700
In-Reply-To: <68914d8f61c20_55f0910074@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250523095322.88774-1-chao.gao@intel.com> <20250523095322.88774-8-chao.gao@intel.com>
 <aIhUVyJVQ+rhRB4r@yilunxu-OptiPlex-7050> <688bd9a164334_48e5100f1@dwillia2-xfh.jf.intel.com.notmuch>
 <aIwhUb3z9/cgsMwb@yilunxu-OptiPlex-7050> <688cdc169163a_32afb100b3@dwillia2-mobl4.notmuch>
 <aJBamtHaXpeu+ZR6@yilunxu-OptiPlex-7050> <68914d8f61c20_55f0910074@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <aJFUspObVxdqInBo@google.com>
Subject: Re: [RFC PATCH 07/20] x86/virt/tdx: Expose SEAMLDR information via sysfs
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org, 
	pbonzini@redhat.com, eddie.dong@intel.com, kirill.shutemov@intel.com, 
	dave.hansen@intel.com, kai.huang@intel.com, isaku.yamahata@intel.com, 
	elena.reshetova@intel.com, rick.p.edgecombe@intel.com, 
	Farrah Chen <farrah.chen@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 04, 2025, dan.j.williams@intel.com wrote:
> Xu Yilun wrote:
> > So my idea is to remove tdx_tsm device (thus disables tdx_tsm driver) on
> > vmxoff.
> > 
> >   KVM                TDX core            TDX TSM driver
> >   -----------------------------------------------------
> >   tdx_disable()
> >                      tdx_tsm dev del
> >                                          driver.remove()
> >   vmxoff()
> > 
> > An alternative is to move vmxon/off management out of KVM, that requires
> > a lot of complex work IMHO, Chao & I both prefer not to touch it.

Eh, it's complex, but not _that_ complex.

> It is fine to require that vmxon/off management remain within KVM, and
> tie the lifetime of the device to the lifetime of the kvm_intel module*.

Nah, let's do this right.  Speaking from experience; horrible, make-your-eyes-bleed
experience; playing games with kvm-intel.ko to try to get and keep CPUs post-VMXON
will end in tears.

And it's not just TDX-feature-of-the-day that needs VMXON to be handled outside
of KVM, I'd also like to do so to allow out-of-tree hypervisors to do the "right
thing"[*].  Not because I care deeply about out-of-tree hypervisors, but because
the lack of proper infrastructure for utilizing virtualization hardware irks me.

The basic gist is to extract system-wide resources out of KVM and into a separate
module, so that e.g. tdx_tsm or whatever can take a dependency on _that_ module
and elevate refcounts as needed.  All things considered, there aren't so many
system-wide resources that it's an insurmountable task.

I can provide some rough patches to kickstart things.  It'll probably take me a
few weeks to extract them from an old internal branch, and I can't promise they'll
compile.  But they should be good enough to serve as an RFC.

https://lore.kernel.org/all/ZwQjUSOle6sWARsr@google.com

> * It would be unfortunate if userspace needed to manually probe for TDX
>   Connect when KVM is not built-in. We might add a simple module that
>   requests kvm_intel in that case:

Oh hell no :-)

We have internal code that "requests" vendor module, and it might just be my least
favorite thing.  Juggling the locks and module lifetimes is just /shudder.

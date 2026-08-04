Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFB426D18
	for <linux-coco@lists.linux.dev>; Tue,  4 Aug 2026 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878766; cv=none; b=bXo3iuME6hILa0+dGrNh4AwRvy0wdhkiVWYxf5Z4BfFXkOzM6+d+IMH9Bs3IaWgrqE7R4zm1LkrYt7G8fRJ0O71hok7oa7C6H7gu5p/BwhETNJ2etmUlBq3M61F7QQJzv2pm9XtZWvcLp+Lx1dATcljMIwVXvSNGpjJwdXpcl/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878766; c=relaxed/simple;
	bh=BCQAfpaUqnDRdhFBqf5W6hE9jelLT+UwP2GtKgTlhtw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aJhWJs/e/nEBpETQjBQu4+ITpJ+EPt0OnKch0ET0Q/KW0raseByes8QFZJcg/cQEOFkFmXbkIvWVK7huiLrkuY/VcNFLZOkfDZXMoh4+fldNenQtBDbX0qpIjjxNooTFdROhhusJ5YR3ZTT7iizue6KRxVZOdTXY/gxHc6t5uzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rIZkueP3; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rIZkueP3"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso301136a12.0
        for <linux-coco@lists.linux.dev>; Tue, 04 Aug 2026 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785878763; x=1786483563; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1m+pWGOS10uU1f2bsRnNlJub5JOhExh9V1AKmoVmG8=;
        b=rIZkueP3QXiqGTkWesZpPhGwTajF2CULDSw49SBPpULeYLxFe0eaYYxDm1aQXvM0Lw
         F2eIJoKr1Jq1urues2V0IZ57q8v80Jv/aTiTy7HcxJaYMYUDyR+r7pAT+HLvt1OpflJb
         mXvtOOxRgoXg63OxZzlf3dRwjgRrmffR05n966yakTJe/3Rb/+/Ckhjp1QqmHX6e6ZPL
         dDpTPCGuqw9q16p9dB5llDf0yTZ6UG8zwd4ewV4o5tUG/CHoZpX1TKlTRc0m8B3ofTaO
         S6GBoFvlejMriwBoBCbt6/cKleB44I1f8TLug1p5jz6rPZIVCs/Kx82LzMV7mijsyUhL
         c2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878763; x=1786483563;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1m+pWGOS10uU1f2bsRnNlJub5JOhExh9V1AKmoVmG8=;
        b=ppWga9cGqHDI1fWVivfi0GIiAN0RHXT/jER+CePajyNin+mJMOsVLNuLdpyOV4s5PH
         L560MM27cebIxAuWz8zcxiU0VPicpGQLDwumsH6bSL9+Pl0fIR95wYGs/BuVyZRQL//s
         6FA9KQThTYsmhI2I2aNztCpLlxr+9M21ZxAvjvuVrO+15xj69xWExxM+AgHh7RDepBga
         tjSuVykUEl1N9cd5B0skC5taMTUAopuAbDMh1NA4x7Myq8jyz7+IRTYZc6pnlOoqTy4f
         tlgc4hFxMSR3GpooExXcbRB+kD+LhIlKvGOQZ++N9fnccA3G2Da+6Qso7gMmZXgriXMN
         4+QA==
X-Forwarded-Encrypted: i=1; AHgh+RoVL+N6KkhMszB5zD4HsinhBHEjcyNmlOn5aK7eGEV/apNyiYmaF82dov+Ecz/CkW+QpWsE3+Mz7p5z@lists.linux.dev
X-Gm-Message-State: AOJu0Ywquuj7W8KGbDuUBHk4qbVbuLZAr6Dcgto7cSAqGr58P4cjIOti
	2bhQyUuNrJWu8QAyOM5eASv7tPuxovteNqh3oSjT4wI3+YYDYxsoZhi0Sz9OY1402PhrtsJA28s
	HCVytAQ==
X-Received: from pgip24.prod.google.com ([2002:a63:c158:0:b0:c82:7761:9936])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a103:b0:3bf:6237:4d3f
 with SMTP id adf61e73a8af0-3cb85e4dc7fmr1611110637.18.1785878762819; Tue, 04
 Aug 2026 14:26:02 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:26:02 -0700
In-Reply-To: <CAEvNRgErZqaLPpBveBd2VxdrS_8mjMbArL_=AhzMdikXmUU5VA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-20-35f9aec2aed2@google.com>
 <7f23d149-b7f0-465a-a9c0-5c7484e289d2@intel.com> <CAEvNRgErZqaLPpBveBd2VxdrS_8mjMbArL_=AhzMdikXmUU5VA@mail.gmail.com>
Message-ID: <anJY6opttIJ4OQHP@google.com>
Subject: Re: [PATCH v9 20/41] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 04, 2026, Ackerley Tng wrote:
> Xiaoyao Li <xiaoyao.li@intel.com> writes:
> 
> >
> > [...snip...]
> >
> >> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> >> index ea2752989f8bd..df67a6188aa99 100644
> >> --- a/virt/kvm/guest_memfd.c
> >> +++ b/virt/kvm/guest_memfd.c
> >> @@ -1137,10 +1137,12 @@ static bool kvm_range_is_private(struct file *file, pgoff_t index,
> >>   {
> >>   	struct inode *inode = file_inode(file);
> >>
> >> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> >>   	if (!gmem_in_place_conversion)
> >>   		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
> >>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
> >>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
> >> +#endif
> >>
> >>   	return kvm_gmem_range_has_attributes(inode, index, nr_pages,
> >>   					     KVM_MEMORY_ATTRIBUTE_PRIVATE);
> >
> > With my suggestion[1] on patch 7, this diff block can be dropped.
> >
> > [1]
> > https://lore.kernel.org/all/dd4201f2-3660-46ad-958f-c70feb1ab1c3@intel.com/
> >
> > The code looks good to me,
> >
> > Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> >
> 
> I think your earlier suggestion on only defining the module_param when
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES is selected still applies, since it
> removes an avenue for a user to turn off gmem_in_place_conversion if
> the other option (VM memory attributes) isn't available.
> 
>   +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>   +module_param(gmem_in_place_conversion, bool, 0444);
>   +#endif
> 
> Given that we're now dropping the diff block as you suggested, do you
> agree that we should keep this #ifdef?

Yes, the param needs to remain hidden if CONFIG_KVM_VM_MEMORY_ATTRIBUTES=n, so
that userspace attempts to disable gmem_in_place_conversion are ignored (and
logged as such).

The obvious downside is that the param won't exist when in-place conversion is
forced on, which is kinda weird, but I think it's the lesser evil?

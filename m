Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7D76416
	for <linux-coco@lists.linux.dev>; Thu,  8 Feb 2024 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707413361; cv=none; b=Zlo5+cncemI7eZKdFD2IvhqnUnjSBzp6sjTSzmvEIPf4mW7cj5Rtc0/65a7VnOo/PreziNQhT121um38Kf6qNt2o+wml0CI1Zue2VmaN6jw4ZHTfKZm0uzvMz0sXUX0PwbnCfQ/b/djru0mQ2mCBDpV/+8ShZqZffYd456suSbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707413361; c=relaxed/simple;
	bh=AX7TeYinvud28ImFWW86bz254UkZVLDeLl1zuOjja7E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CyIGzsQnSWoggimTrZAT9mwS33wu6GbXuUjPiishj/7qdllgYVGQjEftqsnv5fCWNOiqALoUaRCoL8BheXpPHSHDkYfMs9w+xwAS0NbcOH/2ZQ7ijivcQTcugREene3jgY/u7WmqlmHZRhQkNJYSst2WsMKG4igfaVSm2q9TixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=itjCQXz5; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="itjCQXz5"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-602dae507caso2276387b3.0
        for <linux-coco@lists.linux.dev>; Thu, 08 Feb 2024 09:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707413358; x=1708018158; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6cgRpz8693x11vAqn90eHX9IMRr7lrwTkc2QUZSb++M=;
        b=itjCQXz5DK0kRByqDZLGpV84tSxtIk+1PhvOBIcl+0MXQE/VcUIFc0Gisl8S2fCPBz
         nzz+B4SHMV7fDWYLoOm7y7kprQ7ULtGnYbN/WLng01xZETFh7Olk6f6ZbNglJFXm7cWx
         0cNXYmOGeiAwIYE8QAFic4g9jfKZCRQJpxcNBp8EOEuyCLoFsadbhN6hSk9v55Z//omD
         tsHx4najwS7RT3W+wJSjMpIEuFOHQSY0DIDA1siL9fBCfKcBFZ+Vb+a8cdVT5ItZWEcc
         aFloVyKnyNfXzOTMyoD2Lvp8p1VoDxUPvByqH/GCyDT2WO7Wx5hWYEXi8G7RsIUdY2fh
         Jp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707413358; x=1708018158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6cgRpz8693x11vAqn90eHX9IMRr7lrwTkc2QUZSb++M=;
        b=uPdZkEvSDCckmCMmysVWkAGN46vfxpvzXEtni/IixE09wLw3j7z/8rfede7JLebEfs
         iriWaXRu807V12OPfcvqJhuQwM+pYfrYJEie3lW9l1ch4W74b7TGsHmgOJgYp6s9qzs/
         g2cHha3tcON7iHI0zXCNOg6hfFlSWkvzxKOf87qgAOAqA9KHkSg+Swo4kmT82iIbRGgV
         3AJO8TRPwdz8+s+xawrBvy6CYLQJ3/vn2HgAiCltedxM4yi5fSGrWkWtRl4BgCYd827v
         AyHSVaFV+0134mWMEXNjN73YD8n9XKRT/7hk/5NXasF/RZT0FEIcWRtYmGVuQtp7pznH
         guTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCD6mmQ5vxEMMz/s/yIlVh8HT4gfPJ+e/MWP+UBi0FQPXaEdpXEkPRrU5VpPcGDMoGf16hreHzA9pr688WDNvaUjw03qx+gRIIdg==
X-Gm-Message-State: AOJu0YwZ9XcS164U+kyflHGzjmIaeMSkiw89vehVKjBjc9vSjz+mA/OC
	s4kLG+GA0WCQBrrsPrBKNHVQfiElnIkhkXCpBT/APQ8CAx4+MrYqyOa1Xy3dHIa4/Oc2Czu2hPf
	0Fw==
X-Google-Smtp-Source: AGHT+IHvm3H6o6yo8+Vn1cBwz43f6GmzmcO3Z4xZiRVKXYRGzCH9lsIFsssSc9r8mHXp4gU3C6XX9+NehWg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:70b:b0:dc6:55ac:d08d with SMTP id
 k11-20020a056902070b00b00dc655acd08dmr22497ybt.5.1707413358591; Thu, 08 Feb
 2024 09:29:18 -0800 (PST)
Date: Thu, 8 Feb 2024 09:29:16 -0800
In-Reply-To: <761a3982-c7a1-40f1-92d8-5c08dad8383a@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231016115028.996656-1-michael.roth@amd.com> <20231016115028.996656-4-michael.roth@amd.com>
 <761a3982-c7a1-40f1-92d8-5c08dad8383a@arm.com>
Message-ID: <ZcUPbO2hmf9y1Zii@google.com>
Subject: Re: [PATCH RFC gmem v1 3/8] KVM: x86: Add gmem hook for initializing memory
From: Sean Christopherson <seanjc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	pbonzini@redhat.com, isaku.yamahata@intel.com, ackerleytng@google.com, 
	vbabka@suse.cz, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	jroedel@suse.de, pankaj.gupta@amd.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 08, 2024, Suzuki K Poulose wrote:
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 8c5c017ab4e9..c7f82c2f1bcf 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2403,9 +2403,19 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >   #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> >   #ifdef CONFIG_KVM_PRIVATE_MEM
> > +int __kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> > +		       gfn_t gfn, kvm_pfn_t *pfn, int *max_order, bool prep);
> >   int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >   			      gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
> >   #else
> > +static inline int __kvm_gmem_get_pfn(struct kvm *kvm,
> > +				     struct kvm_memory_slot *slot, gfn_t gfn,
> > +				     kvm_pfn_t *pfn, int *max_order)
> 
> Missing "bool prep" here ?
> 
> minor nit: Do we need to export both __kvm_gmem_get_pfn and kvm_gmem_get_pfn

Minor nit on the nit: s/export/expose.  My initial reaction was "we should *never*
export any of these" :-)

> ? I don't see anyone else using the former.
> 
> We could have :
> 
> #ifdef CONFIG_KVM_PRIVATE_MEM
> int __kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> 		       gfn_t gfn, kvm_pfn_t *pfn, int *max_order, bool prep);
> #else
> static inline int __kvm_gmem_get_pfn(struct kvm *kvm,
> 				    struct kvm_memory_slot *slot, gfn_t gfn,
> 				    kvm_pfn_t *pfn, int *max_order,
> 				    bool prep)
> {
> 	KVM_BUG_ON(1, kvm);
> 	return -EIO;
> }
> #endif
> 
> static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> 				 struct kvm_memory_slot *slot, gfn_t gfn,
> 				kvm_pfn_t *pfn, int *max_order)
> {
> 	return __kvm_gmem_get_pfn(kvm, slot, gfn, pfn, max_order, true);
> }

I suspect all of this will be moot.  As discussed on the PUCK call[1] and in the
SNP enabling series[2], the plan is to have guest_memfd do (or at least initiate)
the actual copying into the backing pages, e.g. to guarantee that the pages are
in the correct state, that the appropriate locks are held, etc.

[1] https://drive.google.com/drive/folders/116YTH1h9yBZmjqeJc03cV4_AhSe-VBkc?resourcekey=0-sOGeFEUi60-znJJmZBsTHQ&usp=drive_link
[2] https://lore.kernel.org/all/ZcLuGxZ-w4fPmFxd@google.com

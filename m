Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438640759C
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 16:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814030; cv=none; b=OOv10klgFk2mIeGDUpScnh5DocP/bHKEZt0w6A5zXDG+8e33xmLmd6MYlTArTndD3qQ5AgsyCrtiCtrh2jiE7u9pq6rV8iw5ReMKbUzs4NJAndp2B3iWdPKVeknIpNXli9qzzL/HdnZdlRVFwnItqp4srhzw2lQDHtDOrcqXMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814030; c=relaxed/simple;
	bh=HGgVKFUyZeW/doyt/1y5AWLdMAlMEEHs85xRlHMS8CI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bl1bBh/a3wh8mZA+Y0pWVPOLoUNflldhGjGSYq5vXlF7UBkLtv4mfN4sO9/0I4+awkqdpfaA0uBBaTz2hhs/dbCbciI4KcRimOt0cEnBD64wyRf8Efd+d8OGNyQDV1rgBqGD7Q0bU2+ruEbT2Jk1SaKwUAjdDcDAl0OKXRhGriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KB0ZebRD; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KB0ZebRD"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bc977e6aedso114954175ad.2
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779814028; x=1780418828; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5hEkpl5l62+cN1SxJ1PimRF17M7yN52dY6rYG/782eM=;
        b=KB0ZebRD28S3iw3/ElwHpoPkMHGbUWrYbmWNyVJyikPdaFdBSaaZNIh3MecxXQExxX
         wFCQPM9DSg/PA7sJhhJyFSCabof+9kf78du0ao0/A2aq96IszEDBTbtFwcAjBhBu7owo
         qgF+gNif9wq7C6yGtAs4q7w/OXgHYePXxu5Srj6sMmB12oKgvZhBxaH/GDFpknE8V/YF
         aauGBbTU4dvVmj553IFDe/OgAGKiwEa2rDTpx95k0INybl4GHjwaRSG7dRag0PEHGP0v
         IYshv4FEfCN6NGnRR++328I7Yg4tI+GpMOhluv6u8Ixx4TD45cISXvjSI2GMO2NR9gks
         vWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779814028; x=1780418828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5hEkpl5l62+cN1SxJ1PimRF17M7yN52dY6rYG/782eM=;
        b=J5WU3zxAXOobr32FuyEMXKD0KU6Bzz9rH5DAGLwDkgJS6FWs0Rp3qsZX3cnakWpqzL
         HaIi4E6GFknJn0edYDN2J1+CHZbbLnyJSB4oouTnhCwJmkl6mw0Ra+CH8+Q3n7BsZtjV
         bbl0sXP2WhuZ/q6+L8l5So/oycP6e0ok3Wo2dTAj9IGASR0WDda8dMJ3IPcKDYKgoGVK
         +69emW1WN7hdBxQH0+8VTSqM3SsISLISk5suaFs833pjxaW9/hZskRIhXQvOacwByXYg
         YV2XBngDtfL/7H0zGCWFcMXuvObIF4rIVEndE6NYjjpMnmAo88KRrReetbpKqHrjWJbC
         sxsQ==
X-Forwarded-Encrypted: i=1; AFNElJ90yVwY/wkSFSUy/fi+8k6iLYvu1t7/DefKhEzvdxzmBFaQtAecAS64hwLpPoygyTzJpVryjo3lThWm@lists.linux.dev
X-Gm-Message-State: AOJu0YyuNEPL+k6ZJDwZ3vYCW9CgRuzw8zVuRZXnIt7toHFjHa4S9ZFo
	mBRAiE+3dvXqy4UtDZ1y1Frs/yZbHUgitFGBxiEJQJIRKrz8mrcXXv0ZpLsugb+enTXuEpaPzWc
	gMS/kgQ==
X-Received: from pgbbj8.prod.google.com ([2002:a05:6a02:188:b0:c73:8741:7555])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a03:b0:3a1:90ef:7e46
 with SMTP id adf61e73a8af0-3b328ed621bmr19755806637.33.1779814027730; Tue, 26
 May 2026 09:47:07 -0700 (PDT)
Date: Tue, 26 May 2026 09:47:07 -0700
In-Reply-To: <20260522-fix-sev-gmem-post-populate-v2-5-3f196bfad5a1@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com> <20260522-fix-sev-gmem-post-populate-v2-5-3f196bfad5a1@google.com>
Message-ID: <ahXOiy0dBSBOQli2@google.com>
Subject: Re: [PATCH v2 5/5] KVM: SNP: Mark source page dirty in sev_gmem_post_populate
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 22, 2026, Ackerley Tng wrote:
> Mark the folio as dirty after copying data into the source page in
> sev_gmem_post_populate. After the memcpy, failing to mark the page dirty
> can lead to the memory management subsystem discarding the changes if the
> page is reclaimed or otherwise processed by the swap subsystem.
> 
> Fixes: 2a62345b3052 ("KVM: guest_memfd: GUP source pages prior to populating guest memory")
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  arch/x86/kvm/svm/sev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index dbf75326a40f4..1a361f08c7a3d 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2395,6 +2395,7 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  		void *dst_vaddr = kmap_local_pfn(pfn);
>  
>  		memcpy(src_vaddr, dst_vaddr, PAGE_SIZE);
> +		folio_mark_dirty(page_folio(src_page));

I'd rather use set_page_dirty().  I'll fixup when applying, unless someon objects.

>  		kunmap_local(dst_vaddr);
>  		kunmap_local(src_vaddr);
> 
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60E38C402
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810951; cv=none; b=HEdp4H4WHDpjxwXDNYjNlDtg16yfueCuw7ijLQdiKmj3232WpF95mV1GsEk/HAf3oj0FmOEMNj47uwmv9eilr9qzjtZxZbsdZS9DTVRS6qPwL233k8dikYRPvMv9T/ZLXRBjD6BKK6qpRsgEMmwQizgvu20V2lgmfbPJTCqbRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810951; c=relaxed/simple;
	bh=vlcIXZfpF5z544D6f/NmQwNsL7FDGdksfw3NZhpVsGk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eWohOE6d54AtN6LP1t9y9q4F58WDoVLuInk6IKhHP2EbGqyYH89J3fxJcxCjlIgPVTW/fipTXWLQWy8DHzhKA9JLs6wBOSgTyGEL0QGYclc8ByH/xCVX9eT4KeUzse6rynO55Z26AHjkUZMbK7sL1RVRx47T+oX2mVB/AdezRI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v6EsR8dR; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v6EsR8dR"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2babc42244aso4363865ad.3
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779810950; x=1780415750; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hySHD8b2TDWrlaxMGeF1pIvJSXR1GuivjeYjS/HSokw=;
        b=v6EsR8dRziXpYUOY95mWd7cZr1U2StqxGOUNffPD/vwWLPqOh9EfmU46ko4d1S5q2M
         vRaAHxaz4G0Ax9ZEmRurn3yDei8xkTwVt6AiC+1hV70r4h0JIaSw4IqclWmbbQvfoBkH
         k3YI92nNkivtEI3ujWNrdLuWO5I24a7tVSaIJsraMtXVA9pouOhDdWZp4tYJ544qEKW2
         6Lx++Eh8vIuFqCeNPFYFDjX+BzzZRJ+pc+Bff7YX1c/8vgJvVQlbmBXIWtNO1tkYHY9O
         DqhsXz/SAHaLKp66UNP7OdhFyEra676mucZCztC79YkAmiYwD7yz2DOG+I5acbBHy8UQ
         58nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779810950; x=1780415750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hySHD8b2TDWrlaxMGeF1pIvJSXR1GuivjeYjS/HSokw=;
        b=J39xhV7SaCLiBYck4N1H/FeR5JDIIKINPbbQfLIbA5jCgtNniRBkGLAcOAgH3wcPUO
         2VEa16+xmqyrOmAZWKtejP5aZAGDTTO3YmFX44/klH4hGzP++Oh8UWRdpGWH0Zpg1+4h
         veFI2L3mM+mKAtRVCNwBY2O7wnAklDjl6tQIm1ZeSjAIp2P+KTNBS/HRPnnKbeJyDqiD
         fd7UN+Bkkx2GBRNZiEO9QFp5am9EmSVAW8Y8qxpBsF5EP6zpfSRAQYw+edq9VfNpLSYL
         E7t1Z17m4aXMVCb9d5kA5GY2dH4Z62rIq9qPjexxya1O+pN5d2dbFC/Q9NLc9WqT1wND
         yTFg==
X-Forwarded-Encrypted: i=1; AFNElJ8415P5Ox6fjPFwD1I8tBulyuacB/Mb90HY56bL5SBDESVNoy7F4V2w95q327yaaQeaKLpdHcLsXZqU@lists.linux.dev
X-Gm-Message-State: AOJu0YxaWWxFhenlEMFKMsiHVE9RsrkvuSpahAqv4BKHyqS3LDyOvcHC
	oEqCWtgJ6xuGuSRnW6q9n4T6F9dv7DbsKrHReuP9MnJA8bVrg6DLGyHAfa1C9h/ITKRM3+crShB
	waN2XlA==
X-Received: from plnz8.prod.google.com ([2002:a17:902:8348:b0:2bd:7eaa:5d77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b87:b0:2ba:3e2f:6883
 with SMTP id d9443c01a7336-2beb05d9f8cmr216024545ad.19.1779810949754; Tue, 26
 May 2026 08:55:49 -0700 (PDT)
Date: Tue, 26 May 2026 08:55:49 -0700
In-Reply-To: <20260522-fix-sev-gmem-post-populate-v2-4-3f196bfad5a1@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com> <20260522-fix-sev-gmem-post-populate-v2-4-3f196bfad5a1@google.com>
Message-ID: <ahXChYgryPiOck1L@google.com>
Subject: Re: [PATCH v2 4/5] KVM: SNP: Fix kunmap_local() unmapping order
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

Similar comment on the shortlog as patch two.  "Fix the order" tells the reader
nothing useful, other than the author of the patch thought there was a bug.

  KVM: SEV: Unmap local kmaps in LIFO order, per highmem requirements

No need for a new version, I'll massage when applying.

On Fri, May 22, 2026, Ackerley Tng wrote:
> Mappings created with kmap_local_page() or kmap_local_pfn() must be
> unmapped in the reverse order they were acquired, following a LIFO
> (last-in, first-out) stack-based approach.
> 
> In sev_gmem_post_populate(), src_vaddr is mapped first and dst_vaddr is
> mapped second. The current code incorrectly calls kunmap_local() for
> src_vaddr before dst_vaddr.
> 
> Swap the kunmap_local() calls to ensure the mappings are released in the
> correct order.

It's worth calling out that this is completely benign since SNP is 64-bit only.

Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E3322A3E
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511272; cv=none; b=n6sgWSY2y21f8XuTcbMd4hrHj+jWNzV2oCwgAzwT6mwM7c7neuqmqG/KgmL0pRRb6RtZtNsfKbRCZgQ5aqtoPbDwVmqoYoocy9nervcYo6+2WN1R9s3rrEIKNDs2rAV0sQpi3gAI66WcE1KDR7xA56b9RF5/TNkBmhzQWtWQ79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511272; c=relaxed/simple;
	bh=RMi5gX9RXeXwJzPuAbDfslFEC8LCMJRoHS6UE4uQmWg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pdz8rff7fwuEwR32aSvvNcJ65Lylqc/bdyZzZbeCzQGJ2jxH4Pam1Mha6pqBR1dO6COy5smcpLjIIv4wY4Le4joK3soEjZj8WZpLxh+bWmsB+oNE6zTvUH0Y4Lz2zYOhlw5Yg7KewxDbaqXUf2Lsor7y7mGiOgU3kI6y5Ge8G4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rhT7GA0q; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rhT7GA0q"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29f1450189eso10776865ad.1
        for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 13:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768511270; x=1769116070; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+q0zy3rt0+W46s/KLmj4uNeydBrbpj2ej0hXrXM1xwo=;
        b=rhT7GA0qynhlNZXeiFv0DVOvChfNEW/7UNkQ0FcX23KlIedu0QI5FpCPphF3ix9bOX
         BrO1VXHEV27MwiWTOs6xUEBPDRneYGWAlw9PbITmFwGNpjcNhesr3Gg58ExtbvFgGhbv
         VsXm1e+9UZw9ifNjsRORiB9I8LO7WIN5jQAkoCAI+oP5IiqTuzUQ51B4LjFfugOVJFxe
         VI/a4Bsb5pTfeDYvzNPj1w7xMwfqhTQ/FBPVneRq5H0p/NXUjyWEBYeeOvMiatf60Qhl
         7rdaff5l21YezzmneJjPAwJymRf/0XlmgfNRMrBQLe5w62aLSLd7dViept0GxjqwG+OT
         2UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511270; x=1769116070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+q0zy3rt0+W46s/KLmj4uNeydBrbpj2ej0hXrXM1xwo=;
        b=hh1DWK2GyLFVJ44eQPlwii4K+j9dci4mon4wEl121fo3HPY3xT+Hn7gtwgSgM+664e
         4p+DDUTiySC7UxOd4VQL97UttvO/Kibk8au1B9CM+PL/3dEgftlD709IWV43V5sRv6hr
         qZ1oBDFri65nyCES+Z4NUXa+EMM9XNCzPecoRk+CLoF3IVo4JjSi7OVukpMLkqkCnRRZ
         vfvaIUW1iw0gZj4KNA1BbnkKRxEfbn5KHRLbRDGPgREV+xSPDNPDd7X4RmZXOGRokYTO
         WYawtlTV6slyL5VkeqgMBH4CA04KwCtPjYHnW/nSqJqe9bjGWK+8snlZ+BYoSigdu77/
         /skA==
X-Gm-Message-State: AOJu0YyUNmbb0pNwTU0MtZO9oVAZd641J/1sfG12px5HMFK34sEXTv4d
	5hwxCXcuErnTDHzU+We2CUZNw2G8M2WrV/gpkFBZSQzvOgaILpy5lW1vLidNzM03Q8UIu61g2rY
	8/nsmOg==
X-Received: from plch3.prod.google.com ([2002:a17:902:f2c3:b0:2a3:e3b:89b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c08:b0:2a0:c92e:a378
 with SMTP id d9443c01a7336-2a71756b899mr7431015ad.7.1768511269740; Thu, 15
 Jan 2026 13:07:49 -0800 (PST)
Date: Thu, 15 Jan 2026 13:07:47 -0800
In-Reply-To: <176849903000.720660.2401438098975748028.b4-ty@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260108214622.1084057-1-michael.roth@amd.com> <176849903000.720660.2401438098975748028.b4-ty@google.com>
Message-ID: <aWlXI3F6AyokM23l@google.com>
Subject: Re: [PATCH v3 0/6] KVM: guest_memfd: Rework preparation/population
 flows in prep for in-place conversion
From: Sean Christopherson <seanjc@google.com>
To: kvm@vger.kernel.org, Michael Roth <michael.roth@amd.com>
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	vbabka@suse.cz, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	vannapurve@google.com, ackerleytng@google.com, aik@amd.com, 
	ira.weiny@intel.com, yan.y.zhao@intel.com, pankaj.gupta@amd.com, 
	David Hildenbrand <david@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 15, 2026, Sean Christopherson wrote:
> On Thu, 08 Jan 2026 15:46:16 -0600, Michael Roth wrote:
> > This patchset is also available at:
> > 
> >   https://github.com/AMDESE/linux/tree/gmem-populate-rework-v3
> > 
> > and is based on top of kvm/next (0499add8efd7)
> > 
> > 
> > [...]
> 
> Applied to kvm-x86 gmem, with the tweaked logic I suggested.  Thanks!
> 
> [1/6] KVM: SVM: Fix a missing kunmap_local() in sev_gmem_post_populate()
>       https://github.com/kvm-x86/linux/commit/60b590de8b30
> [2/6] KVM: guest_memfd: Remove partial hugepage handling from kvm_gmem_populate()
>       https://github.com/kvm-x86/linux/commit/0726d3e164f1
> [3/6] KVM: guest_memfd: Remove preparation tracking
>       https://github.com/kvm-x86/linux/commit/188349ceb0f0
> [4/6] KVM: SEV: Document/enforce page-alignment for KVM_SEV_SNP_LAUNCH_UPDATE
>       https://github.com/kvm-x86/linux/commit/b2e648758038
> [5/6] KVM: TDX: Document alignment requirements for KVM_TDX_INIT_MEM_REGION
>       https://github.com/kvm-x86/linux/commit/894c3cc35b89
> [6/6] KVM: guest_memfd: GUP source pages prior to populating guest memory
>       https://github.com/kvm-x86/linux/commit/ba375af3d04d

New hashes after fixing the IS_ERR() goof:

[1/6] KVM: SVM: Fix a missing kunmap_local() in sev_gmem_post_populate()
      https://github.com/kvm-x86/linux/commit/60b590de8b30
[2/6] KVM: guest_memfd: Remove partial hugepage handling from kvm_gmem_populate()
      https://github.com/kvm-x86/linux/commit/6538b6221cc2
[3/6] KVM: guest_memfd: Remove preparation tracking
      https://github.com/kvm-x86/linux/commit/8622ef05709f
[4/6] KVM: SEV: Document/enforce page-alignment for KVM_SEV_SNP_LAUNCH_UPDATE
      https://github.com/kvm-x86/linux/commit/dcbcc2323c80
[5/6] KVM: TDX: Document alignment requirements for KVM_TDX_INIT_MEM_REGION
      https://github.com/kvm-x86/linux/commit/189fd1b059a9
[6/6] KVM: guest_memfd: GUP source pages prior to populating guest memory
      https://github.com/kvm-x86/linux/commit/2a62345b3052

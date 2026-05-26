Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BD3AFB09
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812004; cv=none; b=FLnmxKkUcSBdGOlVlg0Kg3Fy63Tb6jVz8b8C13wN3Sz1nsUjshZW+vUJgPi/s7j3HPpi2c/lV8dci6Oh4yhUVN+e50ZqcQhk7h1C6MAHostX5/ucjOlZoh1B4lxtsHZVDzNnmQsLvuDu+egVrzWYzbqHCKut750hqW5EGJBmbw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812004; c=relaxed/simple;
	bh=su9JZyL6kCCByom6RtyIOUZV/R46eYJ7VEk1jdF4Ucg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zul/fUZcazKwSmzC7+dCYSSG/y+Ew/4VXPkSIPj/CrgA+9LLCvKH6+TsdbqB0aiEhDcydzYiRGAxQ2bDiPkisP90a28Z0dEj7ZmA7G2SttWlIuy6pUpVvh5lNeVqIO+hF96H3KvYzXbO4DSfDYEcDpGYCKahmgB0Ko1LNhC61w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tIYyc/KM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tIYyc/KM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so10748652a91.0
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779812003; x=1780416803; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EKti3bpIeaw9DUQ7b6OosKHvIytGX0/8ZwQX1bJsL8w=;
        b=tIYyc/KM5s40iMtxFl3IOB8KTDK/VmbnbcxlDfoh34rhHuedtSpG59t78K4NXD4wvx
         GHI04pklUtKAexrgsF1F3C5Yp8VUWMuyuz0bJ7oK9cXExSgxjOcp4x1GK8GPHqiWWZ79
         3lsOwbmj2SyqaEml/SyNpuGMqNQ2FeZ2/MuWLXW11BblJyIndxyNfBzmTn78Yi6kQ2Ll
         PVmjMJZWlMIp+rM9DYWo2j2XTUZsZ5qZ9/xvYWcLNTQ1z8SwOVtj4USL/NSJ5MfqUA5T
         FSeLs7WHURq09gXC5d0AK35QX27d7o9NX/v9ewqou04WSMJb3CMBmjZXCDWZbBBuFMG+
         kARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779812003; x=1780416803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKti3bpIeaw9DUQ7b6OosKHvIytGX0/8ZwQX1bJsL8w=;
        b=L3tv0NrcF6ajn7hptZhZ/kMacK+12SX4nPagCX5I1Vj1H+1BeqXQpFkPy5V8kq81oK
         xYpm9NGVaXWtcJ+W2M6Ldv/nmfcFZEIQ6G0ZV/e/AUyd7DQd2xKarBBBUJiJcoHU8Mu5
         uBqmZN5hge7jBMmsucmo8z+7g0TYlEAZU5QuykzOKe9DCNp7/f+Lxbg02v14DwrtYvsF
         Foi+XTwhoKmpqu5RTXueynefI0yJ8gPUPMHKi4CoRC/HDAxD41c5oQmk2PWWQQ8hYmm/
         RboPvd8S92D/4llqEpdx2AsRY72Mf8YWriQo2d47FVKX7OLKlJdjLuq+owzk5X8e+ZHq
         x6/w==
X-Forwarded-Encrypted: i=1; AFNElJ+pgpKcfQqKjjpVK1a0Z3ATNm3fwWfCsa3r/RpfLMtVkU5aa/6UK/il+ahs6ECeardBuSqInneWEFid@lists.linux.dev
X-Gm-Message-State: AOJu0YzRvkAsmwnyw+FHGpCumFzeu6GZq/CalXeobiXosrXZgrVVgMAq
	Q04Lio9HkaQt2KifnwU8XMDi6MvFw9xnfntFIZ8VVBaRruxr/oxbt+ObVv2kGadHpLRx4uqUIKn
	LUXy1rA==
X-Received: from pjbsj15.prod.google.com ([2002:a17:90b:2d8f:b0:368:45e6:af08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c1:b0:368:cefe:ddd0
 with SMTP id 98e67ed59e1d1-36a6765aa6bmr17580098a91.15.1779812002650; Tue, 26
 May 2026 09:13:22 -0700 (PDT)
Date: Tue, 26 May 2026 09:13:21 -0700
In-Reply-To: <20260522-fix-sev-gmem-post-populate-v2-1-3f196bfad5a1@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com> <20260522-fix-sev-gmem-post-populate-v2-1-3f196bfad5a1@google.com>
Message-ID: <ahXGoTaknK4KVuAz@google.com>
Subject: Re: [PATCH v2 1/5] KVM: guest_memfd: Use write permissions when
 GUP-ing source pages
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

The shortlog is misleading, bordering on outright wrong.  I think most people
would read it as "ALWAYS Use write permissions when GUP-ing source pages".  I
also think it should be scoped to:

  KVM: SEV:

because this only affects SNP, and IMO is an SNP bug, not a guest_memfd bug.  E.g.

  KVM: SEV: Pin source page for write when adding CPUID data for SNP guest

On Fri, May 22, 2026, Ackerley Tng wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> sev_gmem_post_populate() may write to the source page if there was an error

Avoid referencing function names in changelogs when possible.  Unless the reader
is already familiar with the code, the name is meaningless.  The purpose of the
changelog is to complement the literal patch, not to provide a play-by-play
description.

> while performing SNP_LAUNCH_UPDATE.
> 
> Since GUP requested only reads, there is a chance sev_gmem_post_populate()
> could be writing to some read-only page.
> 
> sev_gmem_post_populate() will only ever write the source page if the type
> of page being LAUNCH_UPDATEd is a CPUID page. Hence, request a writable
> page only when loading the CPUID page.
> 
> Since TDX never writes to the source page, always pass false to
> kvm_gmem_populate().

Describe changes in human-friendly, conversational language.  And in a way that
doesn't require looking at the patch to understand the changelog: "pass false"
is meaningless without looking at the code to see what flag was added (or exists).

> With this, even if a read-only mapping or the global zero page was provided
> as the source page, GUP will do a copy-on-write, making it writable before
> the write happens in gvm_post_populate.

Objection, speculation.  If the mapping is truly read-only, i.e. doesn't allow
writes at all, then GUP will fail.  This is all superfluous information though;
"read-only" is a pretty ubiquitous concept, there's no need to explain it in
gory detail.


I'll rewrite to this when applying:

---
When populating a guest_memfd instance with the initial CPUID data for an
SNP guest, acquire a writable pin on the source page as KVM will write back
the "correct" CPUID information if the userspace provided data is rejected
by trusted firmware.  Because KVM writes to the source page using a kernel
mapping, pinning for read could result in KVM clobbering read-only memory.

Note, well-behaved VMMs are unlikely to be affected, as CPUID information
is almost always dynamically generated by userspace, i.e. it's unlikely for
the CPUID information to be backed by a read-only mapping.
---

> Fixes: 2a62345b30529 ("KVM: guest_memfd: GUP source pages prior to populating guest memory")
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Cc: stable@vger.kernel.org

> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---


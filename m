Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134502DE6F4
	for <linux-coco@lists.linux.dev>; Fri, 11 Jul 2025 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242785; cv=none; b=pJdqoV7kGri5Mw28Fge9TNakUPYzSRMcm0+V/89xyMsilcUJPOT8b+zd4NcZkmnZIpTWViqLKS8YPvcwCBTuAYHOJjG7aP907Ef7MySGk1yFHsYGqScThxjRgzGHhjmBS+2CjjzNo2yQjvPejIXBKF2tt0BoBYxFMPjUNYPcXq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242785; c=relaxed/simple;
	bh=HWvaEhuXDSYgLYWRHKSUTXBSay+No1KBht70inNpu30=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mMs55gpDX9BsAB49hn5eRV3U74qSHnO25k9IGvsDCuUS/fknyd/t2Fi9tJSlxMqDeCfIOAkiRHJVwpmpAJZ+edplhLZBTU+6Q0HzDw193gLO11eNpXkvnVRVI1V7Z+Li6C33fKnmvJvpiKDvhgz8461l1KQF6e2dF3dgxZ51Qsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sBF3siV3; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sBF3siV3"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso2161991a91.2
        for <linux-coco@lists.linux.dev>; Fri, 11 Jul 2025 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752242783; x=1752847583; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnCZqhs2jpFslJPdY5U6nIr7Bo2uyg2ScFEtRB8bErs=;
        b=sBF3siV3owTqGd52VzF0MQfHqz0gCAIFD8aXs2VePWL+oPgNA88I8q/D/sFCHmGZOF
         4HMMUwhKcr0tDsuvo2kS1F9yTmMQ2Gr+DglSqWoP8SwZXyVBq/boqSS1KEF7uvbTgmeT
         vsewbCHSakqSCXMsSd3WLq5q13lxPYxboW347ZZWjiRFqy8wT+9q1ebFC5sUmPftd8VH
         h7NQW4RyBbEjjeJDKdV5qGNt8xO8aeZ0wyGAkKHgJT3nQS49Ye6MZ85LK8KtYaNEex5R
         coIWBd4cAT4Adr3BmTuV35HcYmHTkDQevftz/o+4IMNuLWu1wukp1S59ZsC/Rq0kIzYY
         eUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242783; x=1752847583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnCZqhs2jpFslJPdY5U6nIr7Bo2uyg2ScFEtRB8bErs=;
        b=iaz1fzZm2ITg1RgrkKqjhuY6EpCgcpLRx1VoeOUDyN6N/NQG3l4yZkg48+IKXzULbR
         JHYNKlnf8AhfYvRe06QzrIukv9U8rWRZRaQ7NcDMpvGIgNpmRu2QI57HvcAV2+AWdA9d
         SZoag5B8c1C8Bbxyvku0IkCDuU4Jt7ny5GZm4ZZzweV/uH16CRhtCVtSERUr0yoytenW
         kuXRjwkI06IUXUuBgGupWR29Y5sUY0ui1eYIEhTA8mUvNEUXj38aBVIcH0n62NvFPeC1
         HXYhAU9dmvsMLqZTHpsqYyFxm+LN3jHaXRAoM7Q7E4Bxqdsauv8necop9P9P84E9YkyE
         45mw==
X-Gm-Message-State: AOJu0YwvBZeKyrxoGHRUj045TS+Neaednvk3gSMGSl5LmRwLDOp2neS7
	sTHXclSHoqljQeyi0LlmXbUVDToJokVKt3kXqjQ9L7I20bLrw8oH0BBUYgrpJIoqX22rHfrRunL
	hu3o4eg==
X-Google-Smtp-Source: AGHT+IFP1G+BwI9fgjlF9li/vRzlrSC4JG0EC5WsLxaZfXdd6Ao/Nfb+aDJQsUkaL0KTxYCII+FkDDc445A=
X-Received: from pjee11.prod.google.com ([2002:a17:90b:578b:b0:31c:2fe4:33b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37cf:b0:31c:15d9:8aa
 with SMTP id 98e67ed59e1d1-31c4cdb64b8mr4842398a91.34.1752242783439; Fri, 11
 Jul 2025 07:06:23 -0700 (PDT)
Date: Fri, 11 Jul 2025 07:06:21 -0700
In-Reply-To: <aHDFoIvB5+33blGp@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250523095322.88774-1-chao.gao@intel.com> <aHDFoIvB5+33blGp@intel.com>
Message-ID: <aHEaXYmeolKNCqgk@google.com>
Subject: Re: [RFC PATCH 00/20] TD-Preserving updates
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org, 
	paulmck@kernel.org, pbonzini@redhat.com, eddie.dong@intel.com, 
	kirill.shutemov@intel.com, dave.hansen@intel.com, dan.j.williams@intel.com, 
	kai.huang@intel.com, isaku.yamahata@intel.com, elena.reshetova@intel.com, 
	rick.p.edgecombe@intel.com, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 11, 2025, Chao Gao wrote:
> >2. P-SEAMLDR seamcalls (specificially SEAMRET from P-SEAMLDR) clear current
> >   VMCS pointers, which may disrupt KVM. To prevent VMX instructions in IRQ
> >   context from encountering NULL current-VMCS pointers, P-SEAMLDR
> >   seamcalls are called with IRQ disabled. I'm uncertain if NMIs could
> >   cause a problem, but I believe they won't. See more information in patch 3.

NMIs shouldn't be a problem.  KVM does access the current VMCS in NMI context
(to do VMREAD(GUEST_RIP) in response to a perf NMI), but only when KVM knows the
NMI occurred in KVM's run loop.  So in effect, only in KVM_RUN context, which I
gotta image is mutually exclusive with tdx_fw_write().

It'd be nice if we could make the P-SEAMLDR calls completely NMI safe, but
practically speaking, if KVM (or any other hypervisor) is playing with the VMCS
in arbitrary NMI handlers, then we've probably got bigger issues.

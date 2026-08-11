Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF301891A9
	for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786406603; cv=none; b=Vj6RcI2Hm4m7A08514mTVc7uCDJRdXNOBNmroUaWscwWYsif/JhZcnPQXHOieWzXWIT1UeOGd3WOvZERsLmJXEDns3wwpXA9qATiyRigK9PvQLge09Gp0ImGD5F8T8WKn09lpKD5eOadqCc41MeAhTR5CS8MsayeNZxxWCL/atU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786406603; c=relaxed/simple;
	bh=VknSZXDkyZLJjuTzL9I1xTfQa1Mt40VNpMN4ud71R3w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V96oP3ePUenbUsqMiqozSo3j9p9avDt4GuliZkzoiWC/jlj5YOCWjHu2mcL4fVTHKxVXm1lUH4sIagFI7JmyMQwphClCLDFsTor6jYxNKvqTie3Xi7X22Ase4B7mOdZumbYr/sE63fuW2MOLAdzRRIwv6QZHlfjOaHSrI/I06/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PiZ0I17a; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PiZ0I17a"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so4932241b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 17:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786406597; x=1787011397; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V34LZvL3zmDJfeGU5wjT5dtwNItHoDZBEfOxW5gT6qU=;
        b=PiZ0I17aKm5/Slcl1tSNEyqaAUjngU4P5Rb3dvuRZ/+8ECgr2Vu+7xUlt02vFFzHuU
         OfPgAyTT6tdrIQIGMVLF6XbmsicuSmt10gaFt3aHNYaYHIniUV5kxd1QO2RhZbeREfPo
         PQoIDj/O0IJ22+96u9ix1ew/uzQfFyCGDGn37DFLJTuG46cxejRfRJ8P/sY3Dy8d/bcy
         2RA32iL1FsI2fMvuU821R6WRziM6xsrIMNTRt3yy2Xws71iAWlZ7x77Zbic+rRkjK2Wv
         Xq44KPleWJe0QUfmU/cTa4JaL6QOOzgttENU3YTHPem/A0/1oovqqMPUu8RqIvugw3XW
         +TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786406597; x=1787011397;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V34LZvL3zmDJfeGU5wjT5dtwNItHoDZBEfOxW5gT6qU=;
        b=dNitna4knAwsDkNcatOMg+eIlCU8H4jadQGkM4FEyjLuuKccPBgjYVRcChYPtenemw
         KZ+TbydgrOb1yce8pqyzlY98k9q9ss5gSOxFWW8jBsHKv5geylOEzhYhWWHj52lcseh1
         v9WNPUh/z8Ztqi+utah37iZqS8LPAWz3fvtWX0UNfgP6IoxEjwQTS6OAGPC+QFf8igoy
         r1oarns/mzfYG7VHZZy9bF8T4X0NRa+oM8cEL7Dk/3VahuGqI4WfpjQwgV/aWa9rAZTa
         OUwu//6H8BzCcpcfr1t/JIQdX3V56B0Rxwu2y63K1BVwP0qZNFJ3J6ten9ST+eH3TbTI
         aGkw==
X-Forwarded-Encrypted: i=1; AHgh+RpQpc2b/QUfzwb3VJCw+iS0qJZG6mXt7Ej79DA/gtl/ip5pVjsFJWaYNsO0q3KlzLboI9dpbcL6++lX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/8tSHAtGb++nO7peWJZ0SjhkjEA5Vq4RxBVhM+cMBKS21wn17
	8I+uk9EHeuzXA40elaPV7v7Ne4yWB9IA4ARaxT27UrCBES8jtTR0IYjqUf1+fVOXbrgIf6mc27a
	ecv+SPw==
X-Received: from pfbgp14.prod.google.com ([2002:a05:6a00:3b8e:b0:847:8e58:df6f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b11:b0:845:e41f:9696
 with SMTP id d2e1a72fcca58-84f2e00ea6dmr48897452b3a.25.1786406597125; Mon, 10
 Aug 2026 17:03:17 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:03:16 -0700
In-Reply-To: <20260810112200.2326727-3-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810112200.2326727-1-xiaoyao.li@intel.com> <20260810112200.2326727-3-xiaoyao.li@intel.com>
Message-ID: <anpmxJOESl3swUpd@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Nikolay Borisov <nik.borisov@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

The shortlog is way too generic, and the changelog is light on details.  Over
the weekend, I managed to forget why this was necessary, and it took me a few
seconds to recall why we need to avoid setting bits 31:16.  Of course, one could
argue that says as much about me as it does the shortlog+changelog...

Oh, and shortlogs like "Fix the exit reason handling" sometimes lead to amusing
follow-ups like "Really fix the exit reason handling".  Don't be that person :-)

Something like:

  KVM: TDX: Don't clobber exit_reason[31:16] when TDX-Module didn't try VM-Entry

and then in the changelog explain precisely why KVM needs to avoid clobbering
those bits.

On Mon, Aug 10, 2026, Xiaoyao Li wrote:
> Get and check the exit reason from the low 16 bits of vp_enter_ret, and
> store the synthesized/transformed exit reason in the "basic" field.
> 
> Some bits in the upper 16 bits in the exit reason have their own meanings
> and they might be 1.  When handling the exit reason, only do handling on
> the lower 16 bits and keep the upper 16 bits unchanged.  This change
> also helps remove the additional check in tdx_failed_vmentry().
> 
> Note, due to the synthesized invalid exit reason, -1, is changed to
> assigned to the "basic" field, adjust the checking in tdx_get_exit_info()
> accordingly.

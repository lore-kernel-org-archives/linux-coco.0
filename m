Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C263B27E7
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370193; cv=none; b=QlBUK1Y4rN1wBZQLDV/HbPF15NlI/IZPQo6Q6DtoYVadHGoUG1vvOMwQBkOs4ukYST3N5ljY2o3euOxSxnEGcfgh08z443879NVif3l3o4ZdiNUHYFyLw6tVB8+hA1NXT0CQKcaiuIjEC/kqGUHZtWm5ovn9Jo1tBI6tlDoaw78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370193; c=relaxed/simple;
	bh=T4h+0OngmiFLBNepEjU3d20+8UJV2w5wRPCm1XE6zT0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eAttsJRHIbE/MgQ34y5fxWfD3dfZ/oIuB5t8Eidt9wa9KFeldjVhdCoe1lmvMA8RXcb8tYCK0j5RwQn2T6V5mg9BiM4qL+4Iq7Nri4oKyOyfHcG1oTVkblCzxhHNgIzjC8dquj3DiiUvJgL9x+MS4LirD1OqSTaHk9pMhBJuezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fVoxqVSx; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fVoxqVSx"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so49666215ad.1
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786370192; x=1786974992; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scUOSvWK83pq1cJ9Y23cB7+1ZF4+W+kSdr2X3LP0fns=;
        b=fVoxqVSxYkduSOFbjvc8ClJk0S42eYldS4hGWuI7oIsMZyOiK9uoZAg/1gX6U0yasa
         teK6JrCwKfZJHgXF9FOm23O/IRh7YYRp82LWo30F3+9g8MNsZULmYjaqLq93SOSlCjo3
         DnIDLGI2hypGhsATQJq23gMvi9VgYSLMWHTPowHoUqazmF6rdUI+RzwIbDNZPY2IfOgC
         IwyCtYl7StLU+v2EDcpTmnnlf+FNEIIlpD/eIp4vv4vFiB0KfTVT1iytfASuIJhGj0d8
         Mg6t7FgFh5NDLEBZSXK8poiW/PE3ZaKodlyg7DkXznp7oaZj1mL/27cf0TYCAv1xABAv
         fAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370192; x=1786974992;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scUOSvWK83pq1cJ9Y23cB7+1ZF4+W+kSdr2X3LP0fns=;
        b=F+8w3DsxQ8jFXnwiQsnDvmjpGbcfE7s6fUDhCNAy0xB+fDhzVc+rX5+iOqA2t+7Fse
         AqjDGMB4VN4X6iLO/mlPe53m+7gytS6oophkG89StP745FVmZqqq5Zs+1N+708XUS/vx
         1Kk+lLDofUpuh2G+HFVxW+WAupqJRLj2vfkyLZ6XvMxOQvdrcuJScv1J7N/5vr8RWvoc
         JNPQd9rfLDNX+DrecH1fvMTzU4/5L25EB/0KMtfgnWk8k1UF23IdkSJeXksB7Fdh3Ppj
         azamtkzII3/pEKBHTaRgQE8fB1O5DSkt0w4OPQgXPa3LWL80McopqVRXY1SfPqZZxxt8
         KWlw==
X-Forwarded-Encrypted: i=1; AHgh+RrqHL8dtltdJCdmdDzHS2LjzeJdmILWHvpBAbgqb6JCk7y3nZiiLjQLre3+IR9X0zQGx19I1oIHdNXG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+T322oBy7psoTwDblqDEEkphrjTYDA+KV2AIXGRES4yOXgVhE
	ybvHKKMsgaciutZklGXK1yH7LAiYi2VdfPWtgcX6YXvQK+Ixk316sZmItQ9NiYolCvnTqrGxD4X
	4NeZQew==
X-Received: from plml3.prod.google.com ([2002:a17:903:1843:b0:2cc:7ef7:ea41])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:13c7:b0:2ce:9c48:22d3
 with SMTP id d9443c01a7336-2d30033718fmr21913835ad.11.1786370191619; Mon, 10
 Aug 2026 06:56:31 -0700 (PDT)
Date: Mon, 10 Aug 2026 06:56:31 -0700
In-Reply-To: <d0ee3cf97854b904323db3799e05117d065a6ba0.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-14-seanjc@google.com> <d0ee3cf97854b904323db3799e05117d065a6ba0.camel@infradead.org>
Message-ID: <annYj0zj68hH8zIu@google.com>
Subject: Re: [PATCH v6 13/51] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, pbonzini@redhat.com, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, ajay.kaher@broadcom.com, 
	alexey.makhalov@broadcom.com, jan.kiszka@siemens.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	jgross@suse.com, daniel.lezcano@kernel.org, tglx@kernel.org, 
	jstultz@google.com, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Aug 08, 2026, David Woodhouse wrote:
> On Thu, 2026-08-06 at 16:35 -0700, Sean Christopherson wrote:
> > Mark the TSC frequency as known when using ACRN's PV CPUID information.
> > Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
> > the TSC freq is explicitly provided by the hypervisor.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Huh... does this literally get reverted completely in the very *next*
> patch in the series? Kind of weird, but I guess in some ways it makes
> sense...

The literal code gets reverted, but the functional change does not.  Before this
change, ACRN is the only guest-side PV code that doesn't set X86_FEATURE_TSC_KNOWN_FREQ
when the hypervisor provides the exact frequency.  I.e. this patch allows for
making the "No functional change intended" claim in the next patch.

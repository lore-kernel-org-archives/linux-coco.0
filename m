Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22953A6F09
	for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786989962; cv=none; b=IPcOLjKRejUKI78jXor+u58YovmPGCkksx726Ib5JPPFyRc8u7oTz20JxoEtq9ZNIk27zX/l8yVonWtmOKL3RsTRXoicV8bgC3dJuIh8gSpNssqsFf+m/fCyEg7UXVo9wdnuvHDmzYy9azOdQK2wOiG9LQorcBlEbdAdOI9w1eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786989962; c=relaxed/simple;
	bh=FGUMDOgcOkl98gJszN7Sm/3/hHjQkI7CnxUDvMb9QvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qw2PJvD0dOxt9JQbvWNyXr2T1vG36hHWytrRZ1EPXpnxcGdU2Sh4SLoS6Itwi7kZZDO2LEO1s5vLJUOhlE5bE10NuK5UcF3LX68b7AGWjp/yix79sRVaY3Ed/GuAQfGPrr4a+xRvgJHNuab2rh7QMTDIElnwBbOyCFZQsK0Bad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pME9IFxi; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pME9IFxi"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso3690640b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786989961; x=1787594761; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wgkmOaK7dMi31fjCigxw9/SOFHhN8te1ABKHYJcTbc=;
        b=pME9IFxiHIJCYn0JTldXQiuEgfv81Rxnktm6Vt0eDCRWhiZ9jwtoI0NsKz3hFuDGdN
         Ucy869Gs+b74GMc8jvIcpW+sHInoxRE0GsDwIPJSmK26bidN0pbBgZs8VjtxsoeFc+SF
         eqd5k5Nq67BN7q08bhmqbPkWRPXDTgXMuMW9Qfu3gcxFkwcu1iIF9yhEeK1Q5ODlIXtD
         cp/Ywo7NTb1mkZZ8EDyOf7/vSjv/DMqJ10uuB7KuDqyOWQ7y521pV7ncvdttG+fpBczm
         eCUVAYfqmtM3kRmzCqDg6RcxML+dgseuJDtoOGXeGTfpmwCvYAn8AXktfsgq5D+KLaDm
         6S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786989961; x=1787594761;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wgkmOaK7dMi31fjCigxw9/SOFHhN8te1ABKHYJcTbc=;
        b=EKtx/FLfX6UjHc1FQ5xu58Ior9MQ8apNxrjn8gxDPeajj+XIaxe+oU9qi4WxA6CqL0
         OF5CxiVpYlnqYLlFe2vDku0ayJkWHvzIoa1z3t5X9BeV1i+1wdw68uHQhVxwJvnNiyZI
         TsRA82fviibPkiveyjP08L6hwCt0Eb/ORKzf4PxurSrJfUeQcuqX0RCSHSQdz9N57GXK
         ofiVEge+fA+3qlLsPrgHb7Zys1+arrkYuguCpSiSgN2jNBLdAcYssaMe6JIUzpaS+0z0
         9b+3YhLKdVZNX7/VqkRmrktTVI4JsSWpS1nncuafg3nzkJvXB65NaUO02s6/jHimJBpb
         dMpA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+nMT61KkmgEHAUPzoyPhemdyaZ01vFWNW+oL8/7krAI0Am46CmAp3ipjs4iJAgp6gEeaMbRt9i/j9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg3jfREp7zWA2PHwzc6ShUwllMwM2Cab3dEUZtrabdm8/0cubg
	8pltOz0cbo7Cdh2Qy2QtfdLYvTQ9iGb12WsnLttztc9ZQWVEGpoct4n/xsxeMorZoaQ9ePpY1cU
	JNkueJA==
X-Received: from pfwz3.prod.google.com ([2002:a05:6a00:1d83:b0:84a:6b32:7768])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14ca:b0:84e:216d:7e4e
 with SMTP id d2e1a72fcca58-84fde14ffb3mr21192194b3a.1.1786989960782; Mon, 17
 Aug 2026 11:06:00 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:06:00 -0700
In-Reply-To: <1dcbf1b2-dc89-4624-b98e-d34f40558cfb@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-5-xiaoyao.li@intel.com> <868c0d3c792d789347c767031612977c31cc227f.camel@intel.com>
 <1cf47118-2a19-44d5-ab74-b4c7ffa8890c@intel.com> <an3YFiDbjRs3PUwn@google.com>
 <77567574-d26c-4d2c-b5ce-5da28a7178d6@intel.com> <an84cenJjf7EqhVM@google.com>
 <1dcbf1b2-dc89-4624-b98e-d34f40558cfb@intel.com>
Message-ID: <aoNNiAbZUbkWoZ6t@google.com>
Subject: Re: [PATCH v3 4/4] KVM: TDX: Enable Bus Lock VM exit
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Aug 15, 2026, Xiaoyao Li wrote:
> On 8/14/2026 11:46 PM, Sean Christopherson wrote:
> > On Fri, Aug 14, 2026, Xiaoyao Li wrote:
> > > On 8/13/2026 10:43 PM, Sean Christopherson wrote:
> > > > On Thu, Aug 13, 2026, Xiaoyao Li wrote:
> > > > > On 8/13/2026 6:58 AM, Edgecombe, Rick P wrote:
> > 
> > ...
> > 
> > > > The more I look at this, the more I'm against shoving garbage into vt->exit_reasons.
> > > > With tdx_is_exit_reason_valid(), this is trivially easy to handle, *and* explicitly
> > > > captures the logic instead of subtly rerouting KVM away from meaningful handling.
> > > 
> > > tdx_is_exit_reason_valid() doesn't work unless we update the vp_enter_ret to
> > > one that isn't one of the status code with valid Exit Reason. See below.
> > 
> > Correct.
> > 
> > > About the idea, isn't the purpose of setting the Exit Reason to a synthesized
> > > one is to avoid the undefined Exit Reason causing false-positives when it
> > > happens to match one of the existing ones?
> > 
> > Yes.  The nuance is that I'm against clobbering the *full* exit reason.  I am
> > not against setting exit_reason.basic to something like EXIT_REASON_INVALID_STATE.
> 
> I'm not sure why you are not OK with setting the bit[31:16] to 0 ...

I'm all for that.  I'm against setting them to 1, which is what using -1u does.

Ah, I'm guessing my use of "clobbering" is confusing.  I was mentally viewing
setting them to '1' as clobbering, versus setting them to '0' as "doing the right
thing.

E.g. the VM-Exit (that didn't happen) wasn't due to a failed guest consistency
check; it certainly wasn't an SMI from VMX Root, nor was an MTF pending at the
time of the SMI that didn't happen; the guest wasn't in enclave mode; there was
no concident bus lock; all other bits are reserved to zero.

Sorry, I should have clarified that writing the full exit reason is ok, but setting
arbitrary bits in a way that isn't consistent with reality is not.

Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2542171B1
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 00:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786580219; cv=none; b=eY2+7YlqYwjq2feSR23u83s0m7e2MYSm91HuUO+6knGnoKzqgVabbQy6ka5b/ephHDGZAVttoWU12Xb7vY/tHbqJFYrIrcsMNOCIv2EeAM2vTb++r+7pCptUXj4J55aptOmL6bxD2biUEYr2MCrqgMVsqOuoOd6k8c8kjEw5Zgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786580219; c=relaxed/simple;
	bh=rj+2YVxpFBxwMriFLetMJMWkavMI/yhxuIBVc8tSPYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ncHxfsblaSkyZ17qc51WeDu5J24WhWcPOGGWPp+p5U5WdLLIK59HaEHGv/U/MaMZtchnBWptXrCMDmREDGWLAoaD+QlseC8esadGliHcqW1MIwK3+h3zO1JEuF+FW8GCHglaFq5FtdoKLtPZLOpdCjhHvodkKIX6ayZKus5Ymds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNixLh/x; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNixLh/x"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so283896a12.3
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 17:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786580217; x=1787185017; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dmmb7kHHOuSL08Tsf/+CaC3gxX+k6w8HGJQJEOhDkmw=;
        b=NNixLh/xwfaGF8PWHldxE/Esr4lvmBP/fDArQ9L3Uq1WI1WjicsjmOddOt+oVLZD5T
         ZliTs2Lc9gwzvTj2GZyTofFxIQUDbgwNZOEXShY4Qn7GwOPcpZi+znXFooxPhtKggRaN
         /EviCi83vK7+B0P6JLS7FYGVpc75+NJyXXxNZsIz3VZI7iVlDYiaYArWKsAIhSOT2UlJ
         4gDJtfdg+biS79pxD1D36O3nYDGHGcIthlzgFE8CthgLsahxONosCBQtNL3J2TAu/mfP
         oZbE913fxewH65RGeYokkX5mm7Xlxt1jI7brSUT/jtXz6rvSGZ4UaFtj5nPhW/fPiYVg
         xg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786580217; x=1787185017;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dmmb7kHHOuSL08Tsf/+CaC3gxX+k6w8HGJQJEOhDkmw=;
        b=mZXxFab2j0s6dLnGIqLBojC5WQL+Ta8pmy1jPLqIuxClDejklivlJu5aHrmJDtyAE6
         BwvGjOHeKW2kygFU08OWkItR1ep8RAuTUxZRgta2Jr6JBuAVrgf4eZuRA3iJ4ZJ65xGS
         NfctM14Mp+6TW2+V4LbpYsARWoC6tbloyrB6W/59QbOn0B9gtmb2pi+B0BujzGnEIi7Y
         z6cTCGhuelznfmZLbq34UMkp4GYuDxdjBri9iPodDC2VXXWfJLtwMFun8NJR0OQSmbhx
         XIIznVcYxqOAdaEAfREVa0EDAP1OiE85WevpC1bEw2buZwL3SAQ13ENgCsThlTeRcb3D
         BOJw==
X-Forwarded-Encrypted: i=1; AHgh+Rrk5pB0YFrOLhXZKNYi7hRXp2kqQfrYzu9FOCuWH3AYBYew4ozr8rUFrGUluc1suXxt72/5wRdg1gPK@lists.linux.dev
X-Gm-Message-State: AOJu0YxOoqsx0lf+WAWC4NJpGsvs8n5ttMqdRoCqkOy09fmL7VJyRpD1
	4PiHcDDKsTtLUOZMO1wmw22wLHKTJur6UIKMIPsRFl/s+ssCKtdP5MeskvGZBBAxIbzlucAkrS8
	cokSF3Q==
X-Received: from pgld13.prod.google.com ([2002:a63:e0d:0:b0:c99:3b68:c9d7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7286:b0:3b2:8685:118b
 with SMTP id adf61e73a8af0-3cc5524622bmr2530914637.20.1786580216761; Wed, 12
 Aug 2026 17:16:56 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:16:56 -0700
In-Reply-To: <6bb1328d-e995-4ad7-9744-3ab01d2ae591@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810112200.2326727-1-xiaoyao.li@intel.com>
 <20260810112200.2326727-3-xiaoyao.li@intel.com> <5dfed336a46329ba39922dcb3a8723116dae9ae4.camel@intel.com>
 <6bb1328d-e995-4ad7-9744-3ab01d2ae591@intel.com>
Message-ID: <an0M-LwrKxLrNC9H@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 11, 2026, Xiaoyao Li wrote:
> On 8/11/2026 8:38 AM, Edgecombe, Rick P wrote:
> > On Mon, 2026-08-10 at 19:21 +0800, Xiaoyao Li wrote:
> > > ---
> > >   arch/x86/kvm/vmx/tdx.c | 35 ++++++++++++++++++++++-------------
> > >   1 file changed, 22 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > index 7338ac0af693..a89885d550c9 100644
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -921,10 +921,10 @@ static __always_inline u32 tdcall_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
> > >   	return EXIT_REASON_TDCALL;
> > >   }
> > > -static __always_inline u32 tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
> > > +static __always_inline union vmx_exit_reason tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
> > >   {
> > >   	struct vcpu_tdx *tdx = to_tdx(vcpu);
> > > -	u32 exit_reason;
> > > +	union vmx_exit_reason exit_reason;
> > >   	switch (tdx->vp_enter_ret & TDX_SEAMCALL_STATUS_MASK) {
> > >   	case TDX_SUCCESS:
> > > @@ -934,23 +934,33 @@ static __always_inline u32 tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
> > >   	case TDX_NON_RECOVERABLE_TD_WRONG_APIC_MODE:
> > >   		break;
> > >   	default:
> > > -		return -1u;
> > > +		/*
> > > +		 * Synthesize an invalid bogus Exit Reason, as the TDX-Module
> > 
> > I think this blurb came from Sean, but can we standardize on "TDX module"? The
> > code currently uses "TDX module" and "TDX-module" and "TDX-module" used much
> > less. I also don't see why it needs the "-".

FWIW, I like TDX-Module to clearly identify it as _the_ TDX-Module, versus a
potential TDX module provided the kernel, i.e. a tdx.ko module.

Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EEC3C3BFE
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722420; cv=none; b=cmTsEE6HAbtsC7+Fewql9GJB9d+JIyLPDzzeEn2fckHbKZ2cCJZ7O3IWlQrFP7bi+QUdKokZmdrBHqeXLp/hUIL3RPe58W0CUBtGibYljvZE5ovm1W7PV66spwT9HrONv1Pd4l3SSz/jTOCBnZP1mq/ZANxHRbRinhB2AfeyOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722420; c=relaxed/simple;
	bh=gZQkoVaAFOmTY3m1sYFYvHE001BRKNgszU9tlSAzwJ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GJoi9PSLYYQNsHalPX9QqbXo1rmNTXMeYmchBBOHFTeO66p3CeOpYTHjVlSYm7e7iPZtS5S/AOFDe2CYwoEawb1sD4NrFNgYKRUU/cBMXi7Q+jKkzWYOGNj/y5pQLJy6NNyQly219TM57XlzZzW66ile8pqdkOCJdOH17CDQBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=At5/X1k4; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="At5/X1k4"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so21975015ad.1
        for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786722418; x=1787327218; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vj129hgq53XjDebLrehf04tZFQC4vvxtUD+vRkJLjFg=;
        b=At5/X1k49TH2+f+WK1rwaFZOXAfzLznxlnPCjy81+YMhgSGx4ii8eeie2oEokNTxXg
         TENeIzx6aMC7an/bnuOkrUl27thb6fxiyGsIaZMCuiKk0v3chX/TT+TtNERe7yPrQYW+
         pvE6lTaQsyZeZ4oPFokT1lNEjfLvxPhOClnzK0/gsnxgIIRUoy1teMfIO1w/kOxhjFjZ
         x6vz3uDhxs6NqPYhOL3Xook5FsSViBAiMfwe3PCVZMEfL37I44OCr5Uo0HiZhy6A8kOv
         oQUVBiOV5cXy67IwvE6qH0fLmB8rkXci50atq4BsjKH7+zPge4Py40x40azw2ySM7AIH
         5ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786722418; x=1787327218;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj129hgq53XjDebLrehf04tZFQC4vvxtUD+vRkJLjFg=;
        b=hBSEiowMR8zunFXBefvZYOmqcfzq6UE1IoWLaKok5LcSo7+cw1Dy1gCqBqn0lCRL8l
         Cx4ODVpV7jS/h5wCyl4aVxhe8rDe14/zkLVhyDKiX3LlERm78Tz+xCc6Ou2PsG/sz9g1
         RislUJ8smPO2eev3wZJHzrrUvRaAqt1kGwrVEOW3DR9u4Zvis9M1SDuTKfUl66rtGErG
         dG43hpioldDOlimcC/PZYExZ8FjRA6ZaemLMKWJUxt4Fz/ZtrdXIQOAtvNKjzYy9AOzI
         fRF2bx2dQr6NeEW0uYBP12hx+4Q4VSWer/sfpJ8MdmIiRIh9G8VG+E56IdMU/cfnL80h
         QMCA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/CRcs3jDrcSBZizyrGYFBgilrSIfS/ticZ4f891nQBNw4kJAANDUJIafmJZgsrLaqP0wYXQNhVyYN@lists.linux.dev
X-Gm-Message-State: AOJu0YyzVdJdBtllq+8hp1NBITTuiur4kteojCw0IcOBS/4GgjO5UZhj
	GaMgcrUlj5dRVgWcYCqTnGs2I4lwrSkSsMX4k91bv/m3nJDENLdOiQqLqPH+FhfnmvUUBD10hLX
	T2vMiIg==
X-Received: from plbky6.prod.google.com ([2002:a17:902:f986:b0:2cf:75c1:ab87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1aed:b0:2c9:e846:a589
 with SMTP id d9443c01a7336-2d3affcc1f5mr59975515ad.13.1786722418007; Fri, 14
 Aug 2026 08:46:58 -0700 (PDT)
Date: Fri, 14 Aug 2026 15:46:57 +0000
In-Reply-To: <77567574-d26c-4d2c-b5ce-5da28a7178d6@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-5-xiaoyao.li@intel.com> <868c0d3c792d789347c767031612977c31cc227f.camel@intel.com>
 <1cf47118-2a19-44d5-ab74-b4c7ffa8890c@intel.com> <an3YFiDbjRs3PUwn@google.com>
 <77567574-d26c-4d2c-b5ce-5da28a7178d6@intel.com>
Message-ID: <an84cenJjf7EqhVM@google.com>
Subject: Re: [PATCH v3 4/4] KVM: TDX: Enable Bus Lock VM exit
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 14, 2026, Xiaoyao Li wrote:
> On 8/13/2026 10:43 PM, Sean Christopherson wrote:
> > On Thu, Aug 13, 2026, Xiaoyao Li wrote:
> > > On 8/13/2026 6:58 AM, Edgecombe, Rick P wrote:

...

> > The more I look at this, the more I'm against shoving garbage into vt->exit_reasons.
> > With tdx_is_exit_reason_valid(), this is trivially easy to handle, *and* explicitly
> > captures the logic instead of subtly rerouting KVM away from meaningful handling.
> 
> tdx_is_exit_reason_valid() doesn't work unless we update the vp_enter_ret to
> one that isn't one of the status code with valid Exit Reason. See below.

Correct.

> About the idea, isn't the purpose of setting the Exit Reason to a synthesized
> one is to avoid the undefined Exit Reason causing false-positives when it
> happens to match one of the existing ones?

Yes.  The nuance is that I'm against clobbering the *full* exit reason.  I am
not against setting exit_reason.basic to something like EXIT_REASON_INVALID_STATE.

> If we are going to use tdx_is_exit_reason_valid(), does it mean we can drop
> the synthesized Exit Reason entirely and check tdx_is_exit_reason_valid()
> everywhere when KVM is going to consume Exit Reason?  e.g., for this initial
> bus_lock_detected bit handling here. we can avoid it by below. (Which makes
> it different for VMX, and somehow prevents consolidating the code between VMX
> and TDX around the exit handlers that we plan to do after series)

I'd rather not, as it would make checking for tdx_is_exit_reason_valid() much
more load bearing.  I.e. I want to minimize the number of flows that *need* to
check tdx_is_exit_reason_valid(), and an easy way to help on that front is to
ensure that exit_reason[31:16] is accurate with respect to what to the last
(attempted) entry to the guest.

> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index b6c30c4c6b84..52360313dd82 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2169,7 +2169,8 @@ int tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t
> fastpath)
>         int ret = __tdx_handle_exit(vcpu, fastpath);
> 
>         /* Exit to user space when bus lock was detected */
> -       if (vmx_get_exit_reason(vcpu).bus_lock_detected) {
> +       if (tdx_is_exit_reason_valid(vcpu) &&
> +           vmx_get_exit_reason(vcpu).bus_lock_detected) {
>                 if (ret > 0) {
>                         vcpu->run->exit_reason = KVM_EXIT_X86_BUS_LOCK;
>                         ret = 0;
> 
> > diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
> > index 95d89d809c19..a1f5b5dc1fa3 100644
> > --- a/arch/x86/kvm/vmx/main.c
> > +++ b/arch/x86/kvm/vmx/main.c
> > @@ -157,6 +157,14 @@ static fastpath_t vt_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
> >          return vmx_vcpu_run(vcpu, run_flags);
> >   }
> > +static void vt_handle_exit_irqoff(struct kvm_vcpu *vcpu)
> > +{
> > +       if (is_td_vcpu(vcpu) && !tdx_is_exit_reason_valid(vcpu))
> 
> No, this doesn't work.
> 
> The previous vp_enter_ret was TDX_SUCCESS with
> EXIT_REASON_EXTERNAL_INTERRUPT. KVM handled it and is going to re-enter the
> TD. But wait_for_sept_zap is set by other vCPU thread, KVM decides to return
> directly but the vp_entere_ret isn't updated.

Oh, right, it really is the same situation as emulation_required, sort of.  The
key difference is that wait_for_sept_zap is per-VM, not per-VM, and so if it's
*cleared* between tdx_vcpu_run() and vt_handle_exit_irqoff(), then KVM would get
a false negative and again synthesize a duplicate IRQ.

Actually, can't we just do this?  Logically it's sound: if the exit was handled,
then there's nothing to be done.

diff --git arch/x86/kvm/x86.c arch/x86/kvm/x86.c
index 0626e835e9eb..6cace57e45fd 100644
--- arch/x86/kvm/x86.c
+++ arch/x86/kvm/x86.c
@@ -8374,7 +8374,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
        if (vcpu->arch.xfd_no_write_intercept)
                fpu_sync_guest_vmexit_xfd_state();
 
-       kvm_x86_call(handle_exit_irqoff)(vcpu);
+       if (exit_fastpath != EXIT_FASTPATH_EXIT_HANDLED)
+               kvm_x86_call(handle_exit_irqoff)(vcpu);
 
        if (vcpu->arch.guest_fpu.xfd_err)
                wrmsrq(MSR_IA32_XFD_ERR, 0);

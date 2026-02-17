Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B282749EA
	for <linux-coco@lists.linux.dev>; Tue, 17 Feb 2026 19:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356027; cv=none; b=IDzIUvzuiX1PD0yX1KVXWEMPh0uv1Sr1UDGGcPNsEuYsmrhGMoYWmMinAvHainAEq8MsF2+Jn9v+aCe8jtoVtixJV2awQEQB3rYQ7ZSb/UfdOmQ4a6MJ9+Ag1fdv4cJDYs+JSI8qFTPGU9e+pXJVrly7BD+n8goT9NYHK1MIw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356027; c=relaxed/simple;
	bh=Vv3QMpSIcWnjWa0xaJUaOqm9MHPLlXF/eFco6dBpQTQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nEzVIvTf+Lw2RVL1Ml5UvQKyDl27ygEG+hLNS5fAKGryzrQ+MNAt+p7YphmjGR2UIp5UklXghsDz6urynDCBZwTzN8wniB0A0PU9G4O47obUS1YzeyEI/EdWE0dxN0RfBgotrmf0vusNQmUbtbdFtkpSwH65leObVzgyduOK6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NePHDkHC; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NePHDkHC"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2aad5fec176so54080625ad.2
        for <linux-coco@lists.linux.dev>; Tue, 17 Feb 2026 11:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356026; x=1771960826; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1eH/mwAkqLmfyEh1EvqsNY2VkqyRMUhzopmOJ1U3e7Q=;
        b=NePHDkHCSZ4XF+CGUWFZOkn2qsDhzGDf076K3+BnVAZ9WqEzBNvZTaCQ2M1J5bPNDe
         ZYKdnzWpczi48ro+L1MijRHe2bxDB2ltb0acEWy/sTG2aqFuwMGSoGJxgURNauEyqxl3
         usQkC8U/NIEAyKc1MxEyQcxuHQ+zZRZAr69HbxjfflzYhHN0h4YszpRSfpvMO4mRyRhd
         rs8TbemsJcOlSRfMH73ByBu5h3fImM+rkpBZWdb9rrynAO74MA8icBJAjIVTQaMnMHQb
         CXtTFt/m7bU79pldJL5Ac+v9iUZXECej9ct2/Ng4M6M4+P5APUXygtaCF10TScYJp6tV
         /iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356026; x=1771960826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eH/mwAkqLmfyEh1EvqsNY2VkqyRMUhzopmOJ1U3e7Q=;
        b=XcZ3eJE6P0bMC0XTQynPguZoot+pjwPp9zbCQ+W+SB/ZT5nMJ3jcTSBcRjtJGEER8N
         qCwGMvSCze/OObf3g9EKNb9cMzrTsjcJNfuQ0AQjHTNpBhHyvJ0t9SxPjBPxyAzFyIcr
         nLm5z5fl50V7d/qyVkZjR4r1RSy1bPi8E/SUiHxOYclhzxohXJHcFhuc835D3lYefQ3a
         Qpuc5SEjsekvH5qJFKM3v8bkYU/ZPsWz23kvzBpm6Y0HAfyjyJHkivwGFUTtmkFMOgMf
         ohuUA6aZ1VGC0Elz66oiXhXBFQWMJgR497/BIJxOi4WgpRZeerZN5xY6E1UhtOPElS6X
         gjIw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Wlyum2+8L8OHOiPzCXUogA1KeJXV162wj14ccprt+x7e4jJZxZ+/aY3LHCFoZeGSlzs2ca6D/E0Z@lists.linux.dev
X-Gm-Message-State: AOJu0YxMnD9m1hBKMDcwg8Ss+IfiwPIlPZShqYqTWnfcoTvbPRrtoTv6
	WpKGxfBBKhh4Ydw57atxeeBwfVt0FIqqvqpHQomLMXylCOHIpIopwh7FhFYPW1ag1iqIPHdmKAS
	fVXdZWA==
X-Received: from pjbmd6.prod.google.com ([2002:a17:90b:23c6:b0:352:f162:7d9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8a:b0:34a:9d9a:3f67
 with SMTP id 98e67ed59e1d1-356aad7eacemr12756476a91.33.1771356025579; Tue, 17
 Feb 2026 11:20:25 -0800 (PST)
Date: Tue, 17 Feb 2026 19:20:24 +0000
In-Reply-To: <20260217191635.swit2awsmwrj57th@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260206222829.3758171-1-sagis@google.com> <20260206222829.3758171-2-sagis@google.com>
 <20260217180511.rvgsx7y45xfmrxvz@amd.com> <037084a1-2019-4bd2-b1ed-7f34f9128e37@amd.com>
 <20260217191635.swit2awsmwrj57th@amd.com>
Message-ID: <aZS_ePUyLcTyZ4Am@google.com>
Subject: Re: [PATCH v3 1/2] KVM: TDX: Allow userspace to return errors to
 guest for MAPGPA
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Sagi Shahar <sagis@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 17, 2026, Michael Roth wrote:
> On Tue, Feb 17, 2026 at 12:45:52PM -0600, Tom Lendacky wrote:
> > On 2/17/26 12:05, Michael Roth wrote:
> > >> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > >> index 2d7a4d52ccfb..056a44b9d78b 100644
> > >> --- a/arch/x86/kvm/vmx/tdx.c
> > >> +++ b/arch/x86/kvm/vmx/tdx.c
> > >> @@ -1186,10 +1186,21 @@ static void __tdx_map_gpa(struct vcpu_tdx *tdx);
> > >>  
> > >>  static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
> > >>  {
> > >> +	u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
> > >>  	struct vcpu_tdx *tdx = to_tdx(vcpu);
> > >>  
> > >> -	if (vcpu->run->hypercall.ret) {
> > >> -		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> > >> +	if (hypercall_ret) {
> > >> +		if (hypercall_ret == EAGAIN) {
> > >> +			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> > >> +		} else if (vcpu->run->hypercall.ret == EINVAL) {
> > >> +			tdvmcall_set_return_code(
> > >> +				vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> > >> +		} else {
> > >> +			WARN_ON_ONCE(
> > >> +				kvm_is_valid_map_gpa_range_ret(hypercall_ret));
> > >> +			return -EINVAL;
> > >> +		}
> > >> +
> > >>  		tdx->vp_enter_args.r11 = tdx->map_gpa_next;
> > >>  		return 1;
> > >>  	}
> > > 
> > > Maybe slightly more readable?
> > > 
> > >     switch (hypercall_ret) {
> > >     case EAGAIN:
> > >         tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> > >         /* fallthrough */
> > 
> > I think you want a break here, not a fallthrough, so that you don't set
> > the return code twice with the last one not being correct for EAGAIN.
> 
> Doh, thanks for the catch. I guess a break for the EINVAL case as well would
> be more consistent then.
> 
>     switch (hypercall_ret) {
>     case EAGAIN:
>         tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
>         break;
>     case EINVAL:
>         tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
>         break;
>     case 0:
>         break;
>     case default:
>         WARN_ON_ONCE(kvm_is_valid_map_gpa_range_ret(hypercall_ret));
>         return -EINVAL;
>     }
>   
>     tdx->vp_enter_args.r11 = tdx->map_gpa_next;
>     return 1;

Heh, except then KVM will fail to handle the next chunk on success.  I like the
idea of a switch statement, so what if we add that and dedup the error handling?

static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
{
	u64 hypercall_ret = READ_ONCE(vcpu->run->hypercall.ret);
	struct vcpu_tdx *tdx = to_tdx(vcpu);
	long rc;

	switch (hypercall_ret) {
	case 0:
		break;
	case EAGAIN:
		rc = TDVMCALL_STATUS_RETRY;
		goto propagate_error;
	case EINVAL:
		rc = TDVMCALL_STATUS_INVALID_OPERAND;
		goto propagate_error;
	default:
		WARN_ON_ONCE(kvm_is_valid_map_gpa_range_ret(hypercall_ret));
		return -EINVAL;
	}

	tdx->map_gpa_next += TDX_MAP_GPA_MAX_LEN;
	if (tdx->map_gpa_next >= tdx->map_gpa_end)
		return 1;

	/*
	 * Stop processing the remaining part if there is a pending interrupt,
	 * which could be qualified to deliver.  Skip checking pending RVI for
	 * TDVMCALL_MAP_GPA, see comments in tdx_protected_apic_has_interrupt().
	 */
	if (kvm_vcpu_has_events(vcpu)) {
		rc = TDVMCALL_STATUS_RETRY;
		goto propagate_error;
	}

	__tdx_map_gpa(tdx);
	return 0;

propagate_error:
	tdvmcall_set_return_code(vcpu, rc);
	tdx->vp_enter_args.r11 = tdx->map_gpa_next;
	return 1;
}

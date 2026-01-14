Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB123A0B16
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406224; cv=none; b=oiFDVRxJwrm3zzolPONIAQTzUWyaoQDoezLBo2h4bz2G7Prdq23LaOd55PLWzkfYVwWmF5W/JwqfeXLWFAilJKF9qZYGnJNE0PvFxa7tQ8w8R/KEPMy0gf29LTsucr5gmFwPJNTKfQj9d2rLZVRAVr403hEo9lviqtYyVwhgCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406224; c=relaxed/simple;
	bh=plmJrM4Se7rFmiaOzKgP6Sb4M38+0ruz3YVru8xcG7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aK8l0HycoMqqLtUNbGMPcJs8BEpQ4cJYFyrGQmHJ7kJK3S2cDZcQFv8IwBe5oMDG3ogMpDx+tYWcNRElL45jM9pTRTP+5ryoKsCKwQfq9yY0lnO9NmjpB0Dl8d5zoaLnsEvZPKONBNfqUrrEwSghXMl1Ikg6Si1Eb8k/3UIPn14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mt6Hy1d9; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mt6Hy1d9"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso17692853a91.1
        for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 07:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768406222; x=1769011022; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TESbXwe5btdTHXLnikBmh+4rP2d4ldUek6p375d2gQE=;
        b=mt6Hy1d9xRlKHznJlUkTOjRkt1ZXj60zgzO83a+50y99KF35n0Q35Xqaw/HChaXOtY
         U5xOXfIanr87mGub3Bifs/pV/W6h+rjoAEmNDmNOab4k1a9hL0caxgCMS1ACWIYPX1hg
         8q6+WZiAt8nvhu+Ec0ahCZ/RViz6TRrgpomjeOYiVHLEnmFyos/nH/XoWh5zoZ9Osm+I
         HSl8O+nToEJquRZ9INI+XJoqAKKIbcNT8FPRadn7BZLCIqlIVjTanyN/HyX1J+MqorBP
         G+YRIOPI4rv50n6fg16HYNVQysVb1rnrlmiRmiDc0D9zgZiCcNgGB3bvY7YwsNlJNM/d
         1ElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406222; x=1769011022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TESbXwe5btdTHXLnikBmh+4rP2d4ldUek6p375d2gQE=;
        b=LNpoOG03efq6OJb8RQV49uTFtBHwWHicmWqEcYOBOreY/hqkWKEZOg7qcr8GyyExjb
         DQppk6MgPN5I/i8x6rLK+BTfmZRGzW7wLxK2MzafiKxm+CXp8vadFu+TEPnBL6sR/WO9
         1HE5zESIXMCtYFy54E1VfCadunwT9u/hg0qjVy2rdJsj5nh1Yyc3UZBpXKgg8IDBun6h
         c3371ja8SCqrps9oo5E3nwcKUj3FCoMyXt7gQANJ9ihsLRdy5f/rrefZtNoQhxZ2/mUK
         +xO4DKXNfRSKY4b1EV2qVYsPoQtKdmhBMTr39M3tpPtAWDHDtbefoMSajnkrMustgL7G
         ajHg==
X-Forwarded-Encrypted: i=1; AJvYcCV+ayrIHYA0z67KYXqUw1XAwTPWXV5I8bte9nR88bftQSAZgMr2KnO//TlP0ep/HaNoElSS4RQ4opo/@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu/hxJ2oaoegZhRA7sosZeG24YSQtKSbicucktKqQeBk/bIB5n
	pW0Nh3Fo4abfBw2tZ+kG4lx9gaDKgddJYEDJmNxVbpqU9apJGQBDyMf3K2T4pIS3ECAIOHC3zt6
	6qxvyqA==
X-Received: from pjbev23.prod.google.com ([2002:a17:90a:ead7:b0:34c:1d76:2fe9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:564d:b0:32b:65e6:ec48
 with SMTP id 98e67ed59e1d1-3510909c20amr3201357a91.8.1768406222394; Wed, 14
 Jan 2026 07:57:02 -0800 (PST)
Date: Wed, 14 Jan 2026 07:57:00 -0800
In-Reply-To: <43a0558a-4cca-4d9c-97dc-ffd085186fd9@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260114003015.1386066-1-sagis@google.com> <43a0558a-4cca-4d9c-97dc-ffd085186fd9@intel.com>
Message-ID: <aWe8zESCJ0ZeAOT3@google.com>
Subject: Re: [PATCH] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sagi Shahar <sagis@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 14, 2026, Xiaoyao Li wrote:
> On 1/14/2026 8:30 AM, Sagi Shahar wrote:
> > From: Vishal Annapurve <vannapurve@google.com>
> > 
> > MAPGPA request from TDX VMs gets split into chunks by KVM using a loop
> > of userspace exits until the complete range is handled.
> > 
> > In some cases userspace VMM might decide to break the MAPGPA operation
> > and continue it later. For example: in the case of intrahost migration
> > userspace might decide to continue the MAPGPA operation after the
> > migrration is completed

migration

> > Allow userspace to signal to TDX guests that the MAPGPA operation should
> > be retried the next time the guest is scheduled.

To Xiaoyao's point, changes like this either need new uAPI, or a detailed
explanation in the changelog of why such uAPI isn't deemed necessary.

> > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > Co-developed-by: Sagi Shahar <sagis@google.com>
> > Signed-off-by: Sagi Shahar <sagis@google.com>
> > ---
> >   arch/x86/kvm/vmx/tdx.c | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 2d7a4d52ccfb..3244064b1a04 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -1189,7 +1189,13 @@ static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
> >   	struct vcpu_tdx *tdx = to_tdx(vcpu);
> >   	if (vcpu->run->hypercall.ret) {
> > -		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> > +		if (vcpu->run->hypercall.ret == -EBUSY)
> > +			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> > +		else if (vcpu->run->hypercall.ret == -EINVAL)
> > +			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> > +		else
> > +			return -EINVAL;
> 
> It's incorrect to return -EINVAL here. 

It's not incorrect, just potentially a breaking change.

> The -EINVAL will eventually be
> returned to userspace for the VCPU_RUN ioctl. It certainly breaks userspace.

It _might_ break userspace.  It certainly changes KVM's ABI, but if no userspace
actually utilizes the existing ABI, then userspace hasn't been broken.

And unless I'm missing something, QEMU _still_ doesn't set hypercall.ret.  E.g.
see this code in __tdx_map_gpa().

	/*
	 * In principle this should have been -KVM_ENOSYS, but userspace (QEMU <=9.2)
	 * assumed that vcpu->run->hypercall.ret is never changed by KVM and thus that
	 * it was always zero on KVM_EXIT_HYPERCALL.  Since KVM is now overwriting
	 * vcpu->run->hypercall.ret, ensuring that it is zero to not break QEMU.
	 */
	tdx->vcpu.run->hypercall.ret = 0;

AFAICT, QEMU kills the VM if anything goes wrong.

So while I initially had the exact same reaction of "this is a breaking change
and needs to be opt-in", we might actually be able to get away with just making
the change (assuming no other VMMs care, or are willing to change themselves).

> So it needs to be
> 
> 	if (vcpu->run->hypercall.ret == -EBUSY)
> 		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> 	else
> 		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);

No, because assuming everything except -EBUSY translates to
TDVMCALL_STATUS_INVALID_OPERAND paints KVM back into the same corner its already
in.  What I care most about is eliminating KVM's assumption that a non-zero
hypercall.ret means TDVMCALL_STATUS_INVALID_OPERAND.

For the new ABI, I see two options:

 1. Translate -errno as done in this patch.
 2. Propagate hypercall.ret directly to the TDVMCALL return code, i.e. let
    userspace set any return code it wants.

#1 has the downside of needing KVM changes and new uAPI every time a new return
code is supported.

#2 has the downside of preventing KVM from establishing its own ABI around the
return code, and making the return code vendor specific.  E.g. if KVM ever wanted
to do something in response to -EBUSY beyond propagating the error to the guest,
then we can't reasonably do that with #2.

Whatever we do, I want to change snp_complete_psc_msr() and snp_complete_one_psc()
in the same patch, so that whatever ABI we establish is common to TDX and SNP.

See also https://lore.kernel.org/all/Zn8YM-s0TRUk-6T-@google.com.

> But I'm not sure if such change breaks the userspace ABI that if needs to be
> opted-in.

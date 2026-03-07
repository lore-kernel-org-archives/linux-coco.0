Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA43290A5
	for <linux-coco@lists.linux.dev>; Sat,  7 Mar 2026 01:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772848335; cv=none; b=rbsFH+64RGqV8hbOB7yBiD4Y721z8EQAzrF7Y+3ry/YERLan5sLQhQkxQt3pnRoldlxiU1b89DUgXAuuY0n3nBGH1xRhhkixHfI8PfXQLcOiEht/O9EooZXdfRMLEcIgbDMRNS/SxZ+MLb7rLxqUxX+wTvp4ZZVRVIBjBPYL2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772848335; c=relaxed/simple;
	bh=9TdYo2hrAmXwNx2QzpsSdZDhIlxyPDORKhsBkkATOPk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CjrDzH7wIgU2dmi30racbhihoWuYYennC3lFH8LcRTfU8XRh6oHUp5Ea63v4GEl5uPHMWumYSSD72WjNucvvMq/0WzO69AXQ6ngQhtOkFQr9S/fxTUBHU6+F8VWDVWjc0SitYw3sZ5BzzmbTfd9W845tWx5u8BfCbDu5d1Mjj0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0b5ODcpz; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0b5ODcpz"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-829b8bb5211so214616b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772848317; x=1773453117; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8Y0ox6GXyJuz0HXLsf/EcxN0tNLkLTey5RZvxhe0co=;
        b=0b5ODcpz2tR1FP18jzOEbeM7OhfInyieFYvmiCnzHUvUJO1ejhc2M8MtX1coSpplZ+
         UBVARuM7SAOVWYvoG2zSirzfJ1nnkaLj6FH1fOgeewY7J1Y4Lxcp6uNftpbn2n7GRyb4
         atLnSxOcquZPOVo4Z9z+frDzkge7C2lbcRfihJCvy+4/b1WOvh1gyHxCvDep3WBkH5g/
         qPuD8bY5sRXi5CVblokaH2yjqcZGHqNtl/t7u28r+H9/cXLgICUhKWaA0DjhOz/NFUuA
         NZPGZYuCaDbzrQ8p+TdW016iFjbOMtFLFDlw7GJwLyNo2tirP5sWjcfQuCL2cs2qHcd0
         GcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772848317; x=1773453117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8Y0ox6GXyJuz0HXLsf/EcxN0tNLkLTey5RZvxhe0co=;
        b=mSm3QLvgQ7OXvKmHvstiWUVuejtYIDrr4taWN8yK9l08ukL1KBQZlGtlygT81q6Ed4
         vA6r1UUeFZ4J403u7C2WGYZ0DqCN6vTYc5x8tgjDtdQU94SRvU7ojQuT122lXejtA/2k
         DtH9GMXN3yU+cvIhCM5YYwPL4CJ7PTqTWZiM3xfKxOW6ZsZjFCw2MAA17a/qsNGyCTan
         7ulozk/J5CrHS+hF3VMNllVEDCTqhDKiSRVxlVMpnW99wNi7TSLee2mGhs7WKSu2VYr4
         j0K8VI50MiF+LCHi3oZfkp2tmWBS6YgtofZuMP831Xp6JPoP2XWt/iMLPmdVd9kizqKC
         6T9g==
X-Forwarded-Encrypted: i=1; AJvYcCVBodfjCJlVlcaqLrsqXN5LawTDlj3H82pBJVIEdjYAkHwt7hFAHo6ygxPsxghS/v1aubVJ3Wjwm0TP@lists.linux.dev
X-Gm-Message-State: AOJu0YxwgpG5bldA4ixVBkJV8INNbQTRFXTlrkyT2I2s1eqJ61jWa7p8
	g1GS4AOtpB9t3n8jnA67rSXIfcwxWs61xmYKRi79U7FIZjfoz/QJYLnU0Y+uci/oAFj3hullH3B
	BaJluXw==
X-Received: from pfbbj28.prod.google.com ([2002:a05:6a00:319c:b0:827:44d1:121d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3c8a:b0:829:86aa:e168
 with SMTP id d2e1a72fcca58-829a2d655a2mr3760934b3a.8.1772848317055; Fri, 06
 Mar 2026 17:51:57 -0800 (PST)
Date: Fri, 6 Mar 2026 17:51:55 -0800
In-Reply-To: <aaCfcwdA1E4V5qgE@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <d98692e2-d96b-4c36-8089-4bc1e5cc3d57@fortanix.com>
 <aZ9V_O5SGGKa-Vdn@google.com> <928a31e1-bb6f-44d4-b1de-654d6968fd55@fortanix.com>
 <aZ9Zs0laC2p5W-OL@google.com> <64a01647-2f99-44a8-a183-702d6eb6fd81@fortanix.com>
 <aaCfcwdA1E4V5qgE@google.com>
Message-ID: <aauEu5APj4Eaw73Q@google.com>
Subject: Re: [PATCH] KVM: SEV: Track SNP launch state and disallow invalid
 userspace interactions
From: Sean Christopherson <seanjc@google.com>
To: Jethro Beekman <jethro@fortanix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 26, 2026, Sean Christopherson wrote:
> On Wed, Feb 25, 2026, Jethro Beekman wrote:
> > On 2026-02-25 12:21, Sean Christopherson wrote:
> > > On Wed, Feb 25, 2026, Jethro Beekman wrote:
> > >> On 2026-02-25 12:05, Sean Christopherson wrote:
> > >>> On Mon, Jan 19, 2026, Jethro Beekman wrote:
> > >>>> Calling any of the SNP_LAUNCH_ ioctls after SNP_LAUNCH_FINISH results in a
> > >>>> kernel page fault due to RMP violation. Track SNP launch state and exit early.
> > >>>
> > >>> What exactly trips the RMP #PF?  A backtrace would be especially helpful for
> > >>> posterity.
> > >>
> > >> Here's a backtrace for calling ioctl(KVM_SEV_SNP_LAUNCH_FINISH) twice. Note this is with a modified version of QEMU.
> > > 
> > >> RIP: 0010:sev_es_sync_vmsa+0x54/0x4c0 [kvm_amd]
> > >>  snp_launch_update_vmsa+0x19d/0x290 [kvm_amd]
> > >>  snp_launch_finish+0xb6/0x380 [kvm_amd]
> > >>  sev_mem_enc_ioctl+0x14e/0x720 [kvm_amd]
> > >>  kvm_arch_vm_ioctl+0x837/0xcf0 [kvm]
> > > 
> > > Ah, it's the VMSA that's being accessed.  Can't we just do?
> > > 
> > > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > > index 723f4452302a..1e40ae592c93 100644
> > > --- a/arch/x86/kvm/svm/sev.c
> > > +++ b/arch/x86/kvm/svm/sev.c
> > > @@ -882,6 +882,9 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
> > >         u8 *d;
> > >         int i;
> > >  
> > > +       if (vcpu->arch.guest_state_protected)
> > > +               return -EINVAL;
> > > +
> > >         /* Check some debug related fields before encrypting the VMSA */
> > >         if (svm->vcpu.guest_debug || (svm->vmcb->save.dr7 & ~DR7_FIXED_1))
> > >                 return -EINVAL;
> > 
> > I tried relying on guest_state_protected instead of creating new state but I
> > don't think it's sufficient. In particular, your proposal may fix
> > snp_launch_finish() 
> 
> But it does fix that case, correct?  I don't want to complicate one fix just
> because there are other bugs that are similar but yet distinct.
> 
> > but I don't believe this addresses the issues in snp_launch_update() and
> 
> Do you mean snp_launch_update_vmsa() here?  Or am I missing an interaction with
> vCPUs in snp_launch_update()?
> 
> > sev_vcpu_create().
> 
> There are a pile of SEV lifecycle and locking issues, i.e. this is just one of
> several flaws.  Fixing the locking has been on my todo list for a few months (we
> found some "fun" bugs with an internal run of syzkaller), and I'm finally getting
> to it.  Hopefully I'll post a series early next week.
> 
> Somewhat off the cuff, but I think the easiest way to close the race between
> KVM_CREATE_VCPU and KVM_SEV_SNP_LAUNCH_FINISH is to reject KVM_SEV_SNP_LAUNCH_FINISH
> if a vCPU is being created.  Or did I misunderstand the race you're pointing out?
> 
> Though unless there's a strong reason not to, I'd prefer to get greedy and block
> all of sev_mem_enc_ioctl(), e.g.

Circling back to this (writing changelogs), I don't think there's actually a
novel bug with respect to KVM_SEV_SNP_LAUNCH_FINISH racing with KVM_CREATE_VCPU.

kvm_for_each_vcpu() operates on online_vcpus, LAUNCH_FINISH (all SEV+ sub-ioctls)
holds kvm->mutex, and fully onlining a vCPU in kvm_vm_ioctl_create_vcpu() is done
under kvm->mutex.  So AFAICT, there's no difference between an in-progress vCPU
and a vCPU that is created entirely after LAUNCH_FINISH.

It's probably worth preventing as a hardening measure, but I don't think there's
an actual bug to be fixed.

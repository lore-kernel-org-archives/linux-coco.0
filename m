Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB262D249E
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 20:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050871; cv=none; b=Z1zbmoJ2FU8xNY90IFsB5mVjwO34IiVHTlPBJfl9uT0n4jP/Ayx1xia1ercKakODj7nlhOpZ5FzUG0D15iTM4WivOgIWnNbsTTaOVIvwZJ3RVLxAD9fYayBubptvIzyK58GhRpKv5MxMoaCgiFxsxrJXuBXXKKe1DetWm1Gl0z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050871; c=relaxed/simple;
	bh=CjFbqOLn5WP5KXf0R1Hc9sBVWXyOe7id4YswrRUGc7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=osVefgdwY7xI/pvmzc08IEiyxqsh4CESfx6eQtcaEMU+k76eaklG6R7Zr8Fvc7ovvKIURX6Hs6188Jc+IvI3snt9MVXJ4JRioB4+ZutfvYdNJ9WUlXhlSNlm8dgvk+MgHSvLx8XoHttcBUOuC7YCVQl4mtubQ8yjZBt2qreBLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPmakBSb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPmakBSb"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3561f5bd22eso5894248a91.2
        for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 12:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772050869; x=1772655669; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldmr9oU0MSeitk+1OIgY+rdK40ygdsN3dEDub2L4tpc=;
        b=WPmakBSbtEJKDMAvJj3T+3bY3CI+60iIo6vQTzU2bUI82H0Kbk3iuvYxmpY9G/QCu3
         TWVIss2p38oRkJY/gfQFl3y37cvQT88OFmzqOEn4wyDomvKAGTsQVc7mbqCBj9mn7OWW
         XGQP1xosO5hVmjcg81WImC4jz5Nlpx31ADEwbBTvsoMkBqyDX3JqeYorgUq2hGfZflMc
         BLNJfv3UEvsVB7jyV60uJnex0OEc9j/d+KmFLrfuiYwCZRsjVK9mzA5gxyVzYTgKWLov
         iUQ7MKLTQvocieFS8y90VlNzGsxSr/WFMwRp0z4AWnVysGB4k61SMzHkCsMeGWsI9+x0
         xfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772050869; x=1772655669;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldmr9oU0MSeitk+1OIgY+rdK40ygdsN3dEDub2L4tpc=;
        b=Kh5DtKLG+Pk8pCYLbVGzj1C1jvc2bFPQXN38S58QT+vPRF7E8xBdP/c2+CdwBl3J2k
         RbDPqKrm/azas2FNl3mz6BR96XB8jJsiIAOx59tM4wT2Lap26LWzrGKbThSe6EooD/HR
         0v+jXCHKoZVXhIfYeA9C1tfm7ZBtAqiOwQZuS08cGd9D+y+vKx75FRQ1VMl/qnvFTu5g
         8XMSTOsB7sqRWkhmOXJrhqb/XATwSfch97Pvzb6PX4m7iELreD396vchywJ3GQs58mrU
         XYKxU7iZWPz5bxuZeSdf8tWH5F5GFWQH1a3Twtf4StnAejMa/z4/2sv6Yr9NlNdt7RZk
         MM/A==
X-Forwarded-Encrypted: i=1; AJvYcCWGkRFMT1jcV0VbPhtBAHBJTRapk31sM+zvlBEMJDWsef3uus+wWBtW0zSWHdj6aU6XZBEICOub7fnK@lists.linux.dev
X-Gm-Message-State: AOJu0YykrsJf5gkGnzOcmKaHwazRYiTqB0l8Yjmsw3k5RyqYrPBBkwAO
	kZalY5+D8mrS5uZDX9oznOnaiGF1uHpCs3tZEp+SEOA2EO9WLfPem1XbsqGhJHJ3efUoMviaxv0
	mG2dI+A==
X-Received: from pjbsl11.prod.google.com ([2002:a17:90b:2e0b:b0:34e:90d2:55c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2812:b0:354:a9f3:68bc
 with SMTP id 98e67ed59e1d1-358ae8e8390mr13614658a91.30.1772050869370; Wed, 25
 Feb 2026 12:21:09 -0800 (PST)
Date: Wed, 25 Feb 2026 12:21:07 -0800
In-Reply-To: <928a31e1-bb6f-44d4-b1de-654d6968fd55@fortanix.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <d98692e2-d96b-4c36-8089-4bc1e5cc3d57@fortanix.com>
 <aZ9V_O5SGGKa-Vdn@google.com> <928a31e1-bb6f-44d4-b1de-654d6968fd55@fortanix.com>
Message-ID: <aZ9Zs0laC2p5W-OL@google.com>
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

On Wed, Feb 25, 2026, Jethro Beekman wrote:
> On 2026-02-25 12:05, Sean Christopherson wrote:
> > On Mon, Jan 19, 2026, Jethro Beekman wrote:
> >> Calling any of the SNP_LAUNCH_ ioctls after SNP_LAUNCH_FINISH results in a
> >> kernel page fault due to RMP violation. Track SNP launch state and exit early.
> > 
> > What exactly trips the RMP #PF?  A backtrace would be especially helpful for
> > posterity.
> 
> Here's a backtrace for calling ioctl(KVM_SEV_SNP_LAUNCH_FINISH) twice. Note this is with a modified version of QEMU.

> RIP: 0010:sev_es_sync_vmsa+0x54/0x4c0 [kvm_amd]
>  snp_launch_update_vmsa+0x19d/0x290 [kvm_amd]
>  snp_launch_finish+0xb6/0x380 [kvm_amd]
>  sev_mem_enc_ioctl+0x14e/0x720 [kvm_amd]
>  kvm_arch_vm_ioctl+0x837/0xcf0 [kvm]

Ah, it's the VMSA that's being accessed.  Can't we just do?

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 723f4452302a..1e40ae592c93 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -882,6 +882,9 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
        u8 *d;
        int i;
 
+       if (vcpu->arch.guest_state_protected)
+               return -EINVAL;
+
        /* Check some debug related fields before encrypting the VMSA */
        if (svm->vcpu.guest_debug || (svm->vmcb->save.dr7 & ~DR7_FIXED_1))
                return -EINVAL;

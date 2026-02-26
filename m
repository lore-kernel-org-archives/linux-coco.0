Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909DC313293
	for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134268; cv=none; b=iwpMyoBB/L8yKwXeHXRb/TE6uCI9pfkU8Nfb109RoJcdOgciBiBipSoB2mmJ8ch1tNx8RzkVEyQiCe98sPjvlQv3UKNmVX67wyUI9rOwQnuxlXKzMviu8QjH/0LYAedQxC41kWIZRYnGTqxhQHdNxssSLHNk5jsK9sPkQxabZpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134268; c=relaxed/simple;
	bh=7npd9tyd1xyz0W3kxuTvPbP2Ku0X4fbvz4wieBxiuu4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TlQIrJBAk1GVQxizSE8u89a4o7jXCgYwmuudR97lb8nUuzoo0J7U4n9eqLHuwhoAQSeRJa+2eVhIs35DC99KbNJWe007LMPddGzdTEyMkdg/FND42X9/hG8n55JeYLUMkFvuFFR53tWeoTl08vjmk+354g85fWqJ9ulTBhpEQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iU2o9lzW; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iU2o9lzW"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c70f2120583so709262a12.3
        for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 11:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772134262; x=1772739062; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ce8oFKsmBFWAiBnyfUlbpaUHm9SVUDVrI9bHqHsCJH0=;
        b=iU2o9lzW3LWrr6kPCPGXNcoZNybFRA/6xOSR0ZMAT5sRC1krR+zx/VwkGXwI5RnH7u
         A8/jBNTuPQzV13clrkzdXFpoDsDw8/D1XRqAP6oa3abWGjXBUftq56vaj4zmtjJIwYnI
         jbw7XofcYWS8/G5o1Fy6yXh2KjEd8HFtwfvBHPXPR28vxqYg3YARHA0UW/ZYguJM0p/r
         HxrRgVCD/Rn5CesPx4oplOGSD1+s59LFGZ0kazvo3ksUHY5DxBXUu4d2pny3hNfudvAE
         FFdEwE9DN9wuCn8cWx8mGT+ThD1wJr89DnENYjK7QKU6zco9IuN9OaDdx7aFA+Y9TgLU
         VX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772134262; x=1772739062;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ce8oFKsmBFWAiBnyfUlbpaUHm9SVUDVrI9bHqHsCJH0=;
        b=IQe99aMIpLHcKiqqHfzBLVrXQjIWT8OnyB8k8WFPSp3Z3LcLTUN1pM8qFxL+u1wEBc
         dMnrMO1iFXBWmXHehr0haxJCoxO7T95mMYKTr4YOf0/AhOF5HLl21Ik6ljd/qFuPc719
         ZjF0Az8EjhYoPhXbB8tNDJl2WqY9Kwiqbs+xBxWYhS7ZP4INNDHEgsi8ihw1NE+7e1v5
         03N8jplCsC6UnbBJ/4SiutPo4kA7/4aWBucrTbTGdjT17Q6kdn0i74X1qW7Biad2U8Yn
         nZXdfJlcau78iRkv9DpFrQpXxX8zWz30786v0/bXuhZ7ywe+VeRgy9TL3/xc3a6uyDW+
         AHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk72+0Umta9RLrm9J32bJ6q2Lf0w5Ym+PVX1qi1IeeVrly4aIZOWC7o5otlr6fIxvzW/EqgAWi/h2e@lists.linux.dev
X-Gm-Message-State: AOJu0YyFab1PXVIgBUlBuK1uRUUNUYEmCX2/HBxvT/tsIiWLgk35Sr+0
	YbD2sCbMTVYP7KL6GX4aYefCsoITYIAqhQWZf9Mar+4NbruzpCm62g+SW+bPYUUo/dh0VWMMPd6
	tgKk6ZQ==
X-Received: from pgbdk13.prod.google.com ([2002:a05:6a02:c8d:b0:c6e:7278:d9e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e40a:b0:32d:a91a:7713
 with SMTP id adf61e73a8af0-395c3af1f03mr327981637.40.1772134261378; Thu, 26
 Feb 2026 11:31:01 -0800 (PST)
Date: Thu, 26 Feb 2026 11:30:59 -0800
In-Reply-To: <64a01647-2f99-44a8-a183-702d6eb6fd81@fortanix.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <d98692e2-d96b-4c36-8089-4bc1e5cc3d57@fortanix.com>
 <aZ9V_O5SGGKa-Vdn@google.com> <928a31e1-bb6f-44d4-b1de-654d6968fd55@fortanix.com>
 <aZ9Zs0laC2p5W-OL@google.com> <64a01647-2f99-44a8-a183-702d6eb6fd81@fortanix.com>
Message-ID: <aaCfcwdA1E4V5qgE@google.com>
Subject: Re: [PATCH] KVM: SEV: Track SNP launch state and disallow invalid
 userspace interactions
From: Sean Christopherson <seanjc@google.com>
To: Jethro Beekman <jethro@fortanix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026, Jethro Beekman wrote:
> On 2026-02-25 12:21, Sean Christopherson wrote:
> > On Wed, Feb 25, 2026, Jethro Beekman wrote:
> >> On 2026-02-25 12:05, Sean Christopherson wrote:
> >>> On Mon, Jan 19, 2026, Jethro Beekman wrote:
> >>>> Calling any of the SNP_LAUNCH_ ioctls after SNP_LAUNCH_FINISH result=
s in a
> >>>> kernel page fault due to RMP violation. Track SNP launch state and e=
xit early.
> >>>
> >>> What exactly trips the RMP #PF?  A backtrace would be especially help=
ful for
> >>> posterity.
> >>
> >> Here's a backtrace for calling ioctl(KVM_SEV_SNP_LAUNCH_FINISH) twice.=
 Note this is with a modified version of QEMU.
> >=20
> >> RIP: 0010:sev_es_sync_vmsa+0x54/0x4c0 [kvm_amd]
> >>  snp_launch_update_vmsa+0x19d/0x290 [kvm_amd]
> >>  snp_launch_finish+0xb6/0x380 [kvm_amd]
> >>  sev_mem_enc_ioctl+0x14e/0x720 [kvm_amd]
> >>  kvm_arch_vm_ioctl+0x837/0xcf0 [kvm]
> >=20
> > Ah, it's the VMSA that's being accessed.  Can't we just do?
> >=20
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index 723f4452302a..1e40ae592c93 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -882,6 +882,9 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
> >         u8 *d;
> >         int i;
> > =20
> > +       if (vcpu->arch.guest_state_protected)
> > +               return -EINVAL;
> > +
> >         /* Check some debug related fields before encrypting the VMSA *=
/
> >         if (svm->vcpu.guest_debug || (svm->vmcb->save.dr7 & ~DR7_FIXED_=
1))
> >                 return -EINVAL;
>=20
> I tried relying on guest_state_protected instead of creating new state bu=
t I
> don't think it's sufficient. In particular, your proposal may fix
> snp_launch_finish()=20

But it does fix that case, correct?  I don't want to complicate one fix jus=
t
because there are other bugs that are similar but yet distinct.

> but I don't believe this addresses the issues in snp_launch_update() and

Do you mean snp_launch_update_vmsa() here?  Or am I missing an interaction =
with
vCPUs in snp_launch_update()?

> sev_vcpu_create().

There are a pile of SEV lifecycle and locking issues, i.e. this is just one=
 of
several flaws.  Fixing the locking has been on my todo list for a few month=
s (we
found some "fun" bugs with an internal run of syzkaller), and I'm finally g=
etting
to it.  Hopefully I'll post a series early next week.

Somewhat off the cuff, but I think the easiest way to close the race betwee=
n
KVM_CREATE_VCPU and KVM_SEV_SNP_LAUNCH_FINISH is to reject KVM_SEV_SNP_LAUN=
CH_FINISH
if a vCPU is being created.  Or did I misunderstand the race you're pointin=
g out?

Though unless there's a strong reason not to, I'd prefer to get greedy and =
block
all of sev_mem_enc_ioctl(), e.g.

11:23:23 =E2=9C=94 ~/go/src/kernel.org/linux $ gdd
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index ea515cf41168..2b1033c0ec54 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2047,8 +2047,8 @@ static int sev_check_source_vcpus(struct kvm *dst, st=
ruct kvm *src)
        struct kvm_vcpu *src_vcpu;
        unsigned long i;
=20
-       if (src->created_vcpus !=3D atomic_read(&src->online_vcpus) ||
-           dst->created_vcpus !=3D atomic_read(&dst->online_vcpus))
+       if (kvm_is_vcpu_creation_in_progress(src) ||
+           kvm_is_vcpu_creation_in_progress(dst))
                return -EBUSY;
=20
        if (!sev_es_guest(src))
@@ -2596,6 +2596,11 @@ int sev_mem_enc_ioctl(struct kvm *kvm, void __user *=
argp)
                goto out;
        }
=20
+       if (kvm_is_vcpu_creation_in_progress(kvm)) {
+               r =3D -EBUSY;
+               goto out;
+       }
+
        /*
         * Once KVM_SEV_INIT2 initializes a KVM instance as an SNP guest, o=
nly
         * allow the use of SNP-specific commands.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2c7d76262898..60ca5222e1e5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1032,6 +1032,13 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(st=
ruct kvm *kvm, int id)
        return NULL;
 }
=20
+static inline bool kvm_is_vcpu_creation_in_progress(struct kvm *kvm)
+{
+       lockdep_assert_held(&kvm->lock);
+
+       return kvm->created_vcpus !=3D atomic_read(&kvm->online_vcpus);
+}
+
 void kvm_destroy_vcpus(struct kvm *kvm);
=20
 int kvm_trylock_all_vcpus(struct kvm *kvm);

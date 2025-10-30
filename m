Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F333BBDB
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855063; cv=none; b=T3R7Muy9hAj+toqVI2bjzH/2RVIKA9bh+NPW8WvdzA5aC7+PJHoy5KPXmyKu4vbkqG8/jaW6B04amAHt7Jp73PP+6eAXNtoW/wPuIsTjusFFRxj6Yyk1fmLVXNJLNVAfjtHCziU+qq7fzkqcJuZ/kyZ6teaOo40fUEdOm7Ads9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855063; c=relaxed/simple;
	bh=P1goZ+98qKVEWbuRxPkvfQzAqWl2KpW9bCv/jdGFRzQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IzeXsg9QYs7GnByGeHNQEmK27ew73xcNE79WTnUP+A3NBhM98C3CMdDBGti3hra75MYJCsXVecIV6h8tGIhRYgh+PTJYtA/ky0At1sS5iMwWZ92YoHu6fc38rBmi3ieKgLNth7x8j/2OTo/gJ10jCQX5qbYwT9zte4pUsa9QWd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1rst4AB; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1rst4AB"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-78117b8e49fso3032875b3a.3
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855059; x=1762459859; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=B1rst4ABFDdK50m54yfW3H9ooDyTUn9P2jCAYXWhADCIH0VIcohEhpcrS3lu33l1+L
         gbRyR1Ntke+jO2fjihSSeOuNkr9BBbr/vHcIcEwWu1CDpRezk/OlgWJBUWLI3fLMJCyO
         0CUWg9DYGJjEebnh/ZIPEs4Sz6PinlMbzKSKp5QIIUs/DWQhCImrVTBTfOAt26dzhYv6
         UPP/UpfTfPSr0w1CLhfT0R23RBheuoXsenB/O7+ZyfLk1Rr/TmaA4llYBwfl103hXnck
         TzcYfpgi+25sd3dkdnaPIJmCtxJ1TwvQePtUk5Uq+Wei4RP0X6FjHsrh3x75tkSJiAtE
         lMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855059; x=1762459859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=fqmVvqwhvx95QvjL27/tqJPU1GfDukYB2a4WamgVBqRDBYa6twp9FBvUQP4jil68OC
         avMwKroCJ9fDfCjN/bxAR7ooUFlKdMAXDC+Fa3ZEEFpYt1b7V3/Ya/v4lenj8yNvZPpO
         t3eZaqVOw7kQ5DCMaYEOoOCVjtBjHFjahG989/grNKeiFooHRdqc86CATjOguz2Z/by9
         wmE/ino69oqiZviUB+TJjB1aqWw5HfvRBj4l05vWPzznowbsKoBSVI/54mxQIbtPfa+o
         AAX0A3d/rxSr98RPHrDwAmXxUhrVMc6UTVEhlb6y4LURnZiOfrKq5RWUCeeXPQHbG7Ur
         U3rw==
X-Forwarded-Encrypted: i=1; AJvYcCUE51zilEaWN9Ui0Q4WuARPqIvRUrJ2zD4IC1kJaIPdqPQcHuM3af99SjFHIohLxCRYS5OoADav7xPV@lists.linux.dev
X-Gm-Message-State: AOJu0YxsM6skjzzeLmuPeiMwm6p68YUF83LZ7T50p9YJl57YlNr74dcm
	H9pLW7SXwaL/gBKYdsScocwyVf0bgx4hJuX+YA5kKjDwbR0OgPuXWzhnkeqVJGK+ziRfgJZ+hxH
	VG+5yag==
X-Google-Smtp-Source: AGHT+IE4oqFNhFQQZr1IyqSPUxhZWizKY8+4h3k61YypjXkX/4HyRwAM2GyKD7DH49xWshMyjNqw52ssRLY=
X-Received: from pfbgi4.prod.google.com ([2002:a05:6a00:63c4:b0:793:b157:af42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2283:b0:7a2:721b:adb6
 with SMTP id d2e1a72fcca58-7a77a9cb11amr747302b3a.28.1761855059275; Thu, 30
 Oct 2025 13:10:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:47 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-25-seanjc@google.com>
Subject: [PATCH v4 24/28] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d6f40a481487..037429964fd7 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2806,7 +2806,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2819,15 +2819,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.1.930.gacf6e81ea2-goog


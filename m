Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC933342C
	for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 23:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149389; cv=none; b=GKXyEutNGN1YzlsvqbKIE/IYeAtSh1d23UznzllOn4CerZd6TdiyIveElbYPBfYqYhhIKAsxjGlAdNrOmKEIRbmBKBoXsoqxicHD6FuH51BQYIZ0TJq9JNELDvFWw0L5JX/diwsyxn7KMoGfhZogwtXWZ1HWxet6jkr9ouEWQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149389; c=relaxed/simple;
	bh=nYT1y/hhQW/86aS4ZN4OJ957tRCJesbnqHhi2ZZK9B8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pPXqMd7i7bnVn4hfFx+aiDw+qYB9gExXP/BvDaoujqe8QbSoj5Z+jjggMQTfuIGlLUS31lEASeWUKt24Qluo40tRCPcnucRSOrhi1Re696cOhGDeeKBWM8jeoRamWgN81XUXAb7f3MJpx9ASZpw3TH42b/Av8/lqgznQ9+oqQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l1VpYjun; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l1VpYjun"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-358e5e33ddcso1443519a91.1
        for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 15:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772149385; x=1772754185; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5xV9Fp9Mp3wKt/HL2xKn2gAO+TqSS/NXayrdSUMZqB8=;
        b=l1VpYjunNOMIG8VRkck4ngrOi45pjGIoT22v3i8MVtKxhKHSbl3lb8oAMLs/gUUmV5
         kHILD7aVMdd9aju+WblWf4TgQ1NMJC9ufXkLLRJGmFKBm6AJ67lyMRZmZJzjdzG0C5p9
         5Q1oOOOIcc5Bl9Dv8oKDjzPWBJK2KqGE5R9e3suyXktv4b6eYYSmBebAXwFz3iIR+4TZ
         sY6opvU8CxBzeDrgRazDjoSJpIqiQNqSixFDFsoPMmBQ/aj9quEunT25CU4fmUhMeRvP
         kCrXkMSgDc+Wh4MeSr6ltHzbifGe9XHgQ4Z19G3Z48wDCWHyN+cOgoemZC0GThP7GzPX
         glxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149385; x=1772754185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xV9Fp9Mp3wKt/HL2xKn2gAO+TqSS/NXayrdSUMZqB8=;
        b=tKMLA8yN8Lf/O0qz4BItOMF9ogqecdqey/1KntdOfT8/+OnyS4m8fjI3hT96o5XM3B
         nIuZLBf6YWqVN/jmpX0p4w3U77j9aduLJOXzx+6L8aVpsc/o9bacG0b/Cet5Q5LcvXzc
         fY0bzk4Gvyo0gn/0Ye23V7r9eMNL3Sq8zwZWXOdF84kV2VQXrzTKE31aTgQPFGeG58qn
         ZY1nEurtqL0ZMXK250iVY5i7wdB6leFsalRmUOMO+zX/oKrLXDnf1qpba22UMh+ho8YH
         pHpwbjEnYDfWWs79hLKbhVZPLBn65nTt6o9PlLobXm8GVRZxMJMudOHN84tqXkFjdQdn
         8lXw==
X-Forwarded-Encrypted: i=1; AJvYcCWRS5T5GHqOfDIpolrIAhadQmbfGf5JhlL3PTeeK7sM3sPo/l7oJmAM8fp8d+mxt7CddjkqjxfSWbSC@lists.linux.dev
X-Gm-Message-State: AOJu0YzIe+hsC2MNqFWs27CGTkxzbZsVd8QXSelqpy4cmwEvC5DTBKLE
	uKe/1pIp8ogZSOo0dqJK/aFBcZWAMsTBxOwLXN6f/xG/hHU7tL6QbVHi61bekW2vhfblVsHdyNe
	dL6+W3w==
X-Received: from pjwo21.prod.google.com ([2002:a17:90a:d255:b0:356:213e:d56e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5710:b0:356:23be:7ecb
 with SMTP id 98e67ed59e1d1-35965c34bc7mr627146a91.12.1772149384979; Thu, 26
 Feb 2026 15:43:04 -0800 (PST)
Date: Thu, 26 Feb 2026 15:43:03 -0800
In-Reply-To: <aZ/5CDmCa8O5vrFZ@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com> <20260214012702.2368778-8-seanjc@google.com>
 <aZ/5CDmCa8O5vrFZ@intel.com>
Message-ID: <aaDah8QSFqWpNvqY@google.com>
Subject: Re: [PATCH v3 07/16] KVM: SVM: Move core EFER.SVME enablement to kernel
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 26, 2026, Chao Gao wrote:
> >-static inline void kvm_cpu_svm_disable(void)
> >-{
> >-	uint64_t efer;
> >-
> >-	wrmsrq(MSR_VM_HSAVE_PA, 0);
> >-	rdmsrq(MSR_EFER, efer);
> >-	if (efer & EFER_SVME) {
> >-		/*
> >-		 * Force GIF=1 prior to disabling SVM, e.g. to ensure INIT and
> >-		 * NMI aren't blocked.
> >-		 */
> >-		stgi();
> >-		wrmsrq(MSR_EFER, efer & ~EFER_SVME);
> >-	}
> >-}
> >-
> > static void svm_emergency_disable_virtualization_cpu(void)
> > {
> >-	virt_rebooting = true;
> >-
> >-	kvm_cpu_svm_disable();
> >+	wrmsrq(MSR_VM_HSAVE_PA, 0);
> > }
> > 
> > static void svm_disable_virtualization_cpu(void)
> >@@ -507,7 +489,7 @@ static void svm_disable_virtualization_cpu(void)
> > 	if (tsc_scaling)
> > 		__svm_write_tsc_multiplier(SVM_TSC_RATIO_DEFAULT);
> > 
> >-	kvm_cpu_svm_disable();
> >+	x86_svm_disable_virtualization_cpu();
> 
> There's a functional change here. The new x86_svm_disable_virtualization_cpu()
> doesn't reset MSR_VM_HSAVE_PA, but the old kvm_cpu_svm_disable() does.

Doh.  I'll squash this as fixup, assuming there are no other goofs:

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 5f033bf3ba83..fc08450cb4b7 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -490,6 +490,7 @@ static void svm_disable_virtualization_cpu(void)
                __svm_write_tsc_multiplier(SVM_TSC_RATIO_DEFAULT);
 
        x86_svm_disable_virtualization_cpu();
+       wrmsrq(MSR_VM_HSAVE_PA, 0);
 
        amd_pmu_disable_virt();
 }

Very nice catch!

P.S. This reminded me that there's a lurking wart with __sev_snp_init_locked()
where it forces MSR_VM_HSAVE_PA to '0' on all CPUs.  That's firmly a "hypervisor"
thing so it doesn't really fit here (and code wise it's also kludgy), just thought
I'd mention it in case someone has a brilliant idea and/or runs into problems with
it.  IIRC, we ran into a problem where __sev_snp_init_locked() clobbered KVM's
value, but I think the underlying problem was effectively fixed by commit
6f1d5a3513c2 ("KVM: SVM: Add support to initialize SEV/SNP functionality in KVM").


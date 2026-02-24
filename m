Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAB02D47F4
	for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 21:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771968630; cv=none; b=CuP5MomyIsO367xVnLp8a1urkBFyrpBSruADtUF7R3t46SJFgTymRhGUHUkumdGupL8YJVksD3MihyPQCDsmsfl97tZhqIp0Bpxeq5GJeCaZdDp+g47qBgjEPaqmmTq2+fNmfk68mohtMGHFG2t4irsmZUHYlk+dG/vCIoH6x4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771968630; c=relaxed/simple;
	bh=FXKeSoSMfzizdfAiGbgrzg+JYZn/1M0RS192UpKNA8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RPPlwu+P+wBBcHPMJ6Is1PKZVlTZNosA+6XOx58/+z7S3NMmrqxXjocAA1KwryyV4C9Fdz+laKANeyl7/qUiO4lrM66HZRH+0E1j53S5d9Ok12uFwZF7/eY1mThG18ekG436C1w+M6gP7mgzpthVDcQXNTMvOdc23yD3J6WUFDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EVFlhfyL; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EVFlhfyL"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso134640eec.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771968626; x=1772573426; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fp3gQv/wLfwDQnfgoRQPjUqkZeQgl8EZgadP4mI+PPw=;
        b=EVFlhfyLa3R1of8DIHKUFphpYC/OSVxj9i2DzFu62dugt6gQnJCw0UUupgeeYSB8fs
         tsUmzRI32fHPcerwzO0V5vvznOIujRPMUIuL32FtcmW3R8PeNN9M4jbczOpP8H4k0vx9
         3i9KEvT1ltxcpv8whm8RnbqLAuJpAzzJp2o3aIzhbR540WlbhOHkotOx/f9K4TOIVXpX
         l0pK35D3qUFrD3cGWviStXhwlPwBodlLkNgKOsk2qA1TL/kgLn/9MC50kPwARlwwH8QO
         KexkWcJGqhtFMzICzJSdQ8X9RkxQH7ZNXKqWuT77QJ4W38UCHDq7QdHD6jbV0lOxd5Yt
         Zyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771968626; x=1772573426;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fp3gQv/wLfwDQnfgoRQPjUqkZeQgl8EZgadP4mI+PPw=;
        b=R3NmtCHUk1mgtCG+8nw60gooqh9AAzMDdHhg2ePIjUKz+H2a6q40QS5t621jUIO1AV
         tc04NstKFpXgU99rEPNIKpZJR4fwm5xW9gqo4g7HKvT9+8+jZNBLhJJqqcbGyPPlvjTM
         rgOAcYABe51WvCsi61E7TgHBDIm5lwth79VZC1BR2ON3f2r7KtMmqwjyJM0ZdJrAk2wd
         jonGugcMxf+jH4zwHmccMEFQCvM3Ik2lR5ulafr3M9Iyhb9WtDBqpRU+MMLZi9evLqOQ
         Y9d3bsYgm2SLjgZNTAfHSMCdZsNU6tSvcW7Bw3/VdDbYASRYhoqv5wDXGaW1KwBTtYm1
         beAg==
X-Forwarded-Encrypted: i=1; AJvYcCW1E+cxUqr34QOK9shrfIXkqtH0lu05oYMcCnfcQxTmxVlfgSiu8Jpe9BX3BM2+FbPG7tI1hKLLMqbq@lists.linux.dev
X-Gm-Message-State: AOJu0YwX/9hcN/m1VwnUiAx7DtNBeDSdJbLK+FwOce5eRIPdEWdpE7gZ
	AtO+2j+5IS3tGw5E077I9b/ey70RUYvnoFLlct8AVYoEd7w4i5oILv8QDSXlCK1IeMxGriwzS5k
	cNRxwlY/d3lw+l0QPlzvBpA==
X-Received: from dlnn36.prod.google.com ([2002:a05:7022:61a4:b0:127:16bc:8eaa])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:209:b0:119:e569:f874 with SMTP id a92af1059eb24-1277f547694mr557374c88.17.1771968625917;
 Tue, 24 Feb 2026 13:30:25 -0800 (PST)
Date: Tue, 24 Feb 2026 13:29:39 -0800
In-Reply-To: <213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260224212939.2081828-1-changyuanl@google.com>
Subject: Re: [PATCH] KVM: TDX: Set SIGNIFCANT_INDEX flag for supported CPUIDs
From: Changyuan Lyu <changyuanl@google.com>
To: rick.p.edgecombe@intel.com
Cc: binbin.wu@intel.com, bp@alien8.de, changyuanl@google.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, isaku.yamahata@intel.com, 
	kas@kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com, 
	seanjc@google.com, tglx@kernel.org, x86@kernel.org, xiaoyao.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Rick!

On Tue, 24 Feb 2026 01:57:46 +0000, Edgecombe, Rick P wrote:
> On Mon, 2026-02-23 at 13:43 -0800, Changyuan Lyu wrote:
> > [...]
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 2d7a4d52ccfb4..0c524f9a94a6c 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -172,9 +172,15 @@ static void td_init_cpuid_entry2(struct
> > kvm_cpuid_entry2 *entry, unsigned char i
> >  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
> >  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
> >
> > -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> > +	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF) {
> >  		entry->index = 0;
> > +		entry->flags &= ~KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
>
> There are two callers of this. One is already zeroed, and the other has
> stack garbage in flags. But that second caller doesn't look at the
> flags so it is harmless. Maybe it would be simpler and clearer to just
> zero init the entry struct in that caller. Then you don't need to clear
> it here. Or alternatively set flags to zero above, and then add
> KVM_CPUID_FLAG_SIGNIFCANT_INDEX if needed. Rather than manipulating a
> single bit in a field of garbage, which seems weird.

Thanks for the suggestion. I agree that initializing entry->flags to 0 at
the start of td_init_cpuid_entry2() is much cleaner.

> > +	} else {
> > +		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> > +	}
> >
> > +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
> > +		     !!(entry->flags &
> > KVM_CPUID_FLAG_SIGNIFCANT_INDEX));
>
> It warns on leaf 0x23 for me. Is it intentional?

Leaf 0x23 is not in the list of cpuid_function_is_indexed.
Thanks Binbin for the explanation!

> This warning kind of begs the question of how how much consistency
> there should be between KVM_TDX_CAPABILITIES and
> KVM_GET_SUPPORTED_CPUID. There was quite a bit of debate on this and in
> the end we moved forward with a solution that did the bare minimum
> consistency checking.
>
> We actually have been looking at some potential TDX module changes to
> fix the deficiencies from not enforcing the consistency. But didn't
> consider this pattern. Can you explain more about the failure mode?

The main purpose of this patch was to make the KVM_TDX_GET_CPUID API
more intuitive from userspace VMM's perspective.
Since both KVM_TDX_CAPABILITIES and KVM_GET_SUPPORTED_CPUID return
struct kvm_cpuid_entry2, I expected the semantic of the flag in both APIs
to be the same, as I didn't find any special notes to the contrary in the
TDX documentation Documentation/virt/kvm/x86/intel-tdx.rst .

> >  	/*
> >  	 * The TDX module doesn't allow configuring the guest phys
> > addr bits
> >  	 * (EAX[23:16]).  However, KVM uses it as an interface to
> > the userspace
> > --

Regarding the WARN_ON_ONCE, I understand it touches on the larger
consistency and compatibility questions that require more discussion
as you and Sean mentioned. Since I am new to TDX and lack the full context
on those prior debates, I removed the WARN_ON_ONCE check and focus only on
the KVM_CPUID_FLAG_SIGNIFCANT_INDEX consistency fix, which was the core of
this patch.

Best,
Changyuan

-----------------------

From 18b967b718911c09872c3717d8ab083fa59c4a70 Mon Sep 17 00:00:00 2001
From: Changyuan Lyu <changyuanl@google.com>
Date: Fri, 20 Feb 2026 09:55:28 -0800
Subject: [PATCH] KVM: TDX: Set SIGNIFCANT_INDEX flag for supported CPUIDs

Set the KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag in the kvm_cpuid_entry2
structures returned by KVM_TDX_CAPABILITIES if the CPUID is indexed.
This ensures consistency with the CPUID entries returned by
KVM_GET_SUPPORTED_CPUID.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d7a4d52ccfb4..1c039eab2f3d8 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -167,6 +167,7 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i

 	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
 	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
+	entry->flags = 0;
 	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
 	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
 	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
@@ -174,6 +175,9 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i

 	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
 		entry->index = 0;
+	else
+		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+

 	/*
 	 * The TDX module doesn't allow configuring the guest phys addr bits
--
2.53.0.414.gf7e9f6c205-goog

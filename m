Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B3365A0B
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924903; cv=none; b=ssbztzyy1LzB7Rsi6fH9evLNE7/retubeEVfQP6fnPzZ7fLegYMJWNATt+90NVTyJMjwZREHH7Hqfz90bxw3g2r+Z4HGNS8/6sCCrgtI8BbnK07KItSLjvwlSh4Ai/yYyL57Tt+Ph6jsJdZNyCmqJOwrQ+qW7tw+dNmLxGEQU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924903; c=relaxed/simple;
	bh=L5c3o9vgdgjXHGOQSuIW9q3/2N3iJk6DLv8bljpS7DA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WA/uFBcUSOMLXBc8gc9cSCrHRqxKhYE7r7QvJYMm6NKaJrasRjhhZ3mplibSBETP8LOQJxWEbvyzsnTohfvACWpQcPWltmJCecEJ0y+Eg3MT+x0gyZsTHMg8WsM42Gr3tNqk6/hyFa3uPJa7Vhzk/b3Azv2H91yIyB+EzkWmmuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXkVQt3i; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXkVQt3i"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so1008229b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782924901; x=1783529701; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lbVYdv7/FNdOOvrw/bcfsmdKoQ369BNbAkiBiKDICVU=;
        b=GXkVQt3i7P9Urj7+HQiA5MkVnIdgTI2k7yECv3+szSUTq9veNbe3g9bEgm7KnsS+Kj
         pBpgNCVF3k670PbvWLO1VknqDPKYsO2Tv5e527M7n46HrItXrFAEPOa96+fPIbp+8ehi
         ESkisBZz9Foc0e29UL000/8aQKsDCJOaRm7w2aDy1vL4gu4X3catFJxXAFbxcBXAe3ar
         GXs111Q33SOsOe50zOfZ/beLFyZsH7mLr4rgQDXzGZYvhs94plcyOXehwLu0Tuwmp9LT
         FoEU98ySruIY+lMqlPhqJW15ZMs3XFDPkpK53BSo0g8ppCO7CcF6PmpfbPRhzfeIenBt
         cVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924901; x=1783529701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbVYdv7/FNdOOvrw/bcfsmdKoQ369BNbAkiBiKDICVU=;
        b=BUzI0IcZGgSFjTO/HRNxKOSxmUxSJ5YO/H2spEgiudR5+Ax/HljK3knCYDvUE95Kjm
         d0BfgZQwWcJc3T/nsp3v8oLm7JcXnIG+BYytlYUlm9ERZI57Hez7n5Jhb2/VuGUld2lf
         jBx06LAs45lqbPFyQjBd1eX7kgtlRIFNOdAzevyqq2nAe6SMtgRM/H75CiXnFuf7RK3f
         M9nKUCCNOYEbhYnBdeClZm/BOYd/jHNHQzWxyfrM8EED8/eb9HL39ZJUiV50gwfHjg0M
         7qdKFZRFWbXZWgMRelaoFnVVBAlszKvJtfHL/MC0EsEYHq/i7mJX75wP+ulVMOHGAb5o
         BniA==
X-Forwarded-Encrypted: i=1; AFNElJ8Yca+OVhn/BVaWYIeoh4beDKDHqcxniiwn5I5eXJvNhK3ziGlqcE9inCxiWwB+Auk1pw+zcH/c0CfD@lists.linux.dev
X-Gm-Message-State: AOJu0YzkWx5mQScNABShHBe4T5lh+wSs/WvPOp29mqnac16nvt9xxTKM
	iJfHRlRGEUOI9FCJSsK+/fM8CK2Sd+cxHZt6jxjOGFgYOPBuXPpS0y7OID56rBrDP7PKG4ojC4I
	m2KvM4w==
X-Received: from pgja21.prod.google.com ([2002:a63:cd55:0:b0:c82:7761:9936])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a49:b0:3b3:bf95:f7e3
 with SMTP id adf61e73a8af0-3bfed477967mr2785820637.43.1782924900819; Wed, 01
 Jul 2026 09:55:00 -0700 (PDT)
Date: Wed, 1 Jul 2026 09:55:00 -0700
In-Reply-To: <739e6834-40b3-405b-ada4-d31c38d8416a@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-6-9d2959357853@google.com> <739e6834-40b3-405b-ada4-d31c38d8416a@intel.com>
Message-ID: <akVGZOeR1ytfkamK@google.com>
Subject: Re: [PATCH v8 06/46] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Xiaoyao Li wrote:
> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> > From: Ackerley Tng <ackerleytng@google.com>
> > 
> > Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
> > on kvm_arch_has_private_mem being #defined in anticipation of decoupling
> > kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
> 
> Well, after this series, kvm_supported_mem_attributes() is renamed to
> kvm_supported_vm_mem_attributes(), and it's still under
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
> 
> > guest_memfd support for memory attributes will be unconditional to avoid
> > yet more macros (all architectures that support guest_memfd are expected to
> > use per-gmem attributes at some point), at which point enumerating support
> > KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
> > supported _somewhere_ would result in KVM over-reporting support on arm64.
> 
> I don't understand it. This patch only changes the behavior of
> kvm_supported_mem_attributes(), the usage of which is guarded by
> CONFIG_KVM_VM_MEMORY_ATTRIBUTESq. This is config is only visible to x86 due
> to patch 03. How does it affect arm64?

Hrm, yeah, this is messed up.  Ahh, I think Ackerley shuffled things around and
"broke" stuff in the process.  In v7[1] and earlier, the diff was this:

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 091f201251159..68142bc962953 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 }
 #endif
 
-#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
+#ifndef kvm_arch_has_private_mem
 static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 {
 	return false;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 306153abbafa5..abb9cfa3eb04d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2421,8 +2421,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
 static u64 kvm_supported_mem_attributes(struct kvm *kvm)
 {
+#ifdef kvm_arch_has_private_mem
 	if (!kvm || kvm_arch_has_private_mem(kvm))
 		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
+#endif
 
 	return 0;
 }

which makes a *lot* more sense given the changelog (and IMO for the ordering in
general).  In v8 here, Ackerley combined part of a change[2] (that I provided
off-list) with part of this commit, to create patch 4, "KVM: Decouple
kvm_has_arch_private_mem from CONFIG_KVM_VM_MEMORY_ATTRIBUTESthe".

Ackerley, the cover letter says:

  + Reshuffled the earlier commits that deal with preparing KVM to stop
    seeing VM memory attributes as the only source of attributes.

but there's no explanation for *why* the reshuffling was done.  Reorganizing
code like this at v8 of a series this size is a big "no-no" unless there's a
*really* good reason to do so.  In addition to the resulting confusion, changes
like this invalidate Fuad's Reviewed-by.  And since it's obviously quite difficult
to tease out exactly what changed, it's not realistic to re-review things without
doing a deep audit of the series, which no one wants to do for a series that is/was
so close to being fully ready.  And without such an audit, I can't accept the
patches, because I can't trust that what I am accepting is what I and others have
reviewed.

So, except where there is/was a *need* to shuffle things around relative to v7,
I think we should revert back to the v7 ordering for v9.  And where there is a
need to rework things, each and every one of those needs to be explicitly
documented, because "Reshuffled the earlier commits" is grossly insufficient.

[1] https://lore.kernel.org/all/20260522-gmem-inplace-conversion-v7-3-2f0fae496530@google.com
[2] https://github.com/sean-jc/linux/commit/8a475b1bcf89f1cf776ed9ce7d6bb587aab0d421

Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F53DD508
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840645; cv=none; b=dJW7rMOJQUBPhY38XAislJegkw5gPpS/FyCf+57+yrO6q2qVurDlk1lKTsjmHDCaSbi/4c7TCQvmh2TaZf+G4hqX3heUlU8tyKdrA6lGH3Xns1RJ8HUYNJmDUqtYP+ybhBlgrpGDbFco231Bx2fsJUHMxOdT3LbG/yD5M+EQU3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840645; c=relaxed/simple;
	bh=z6KmvGsEhliMX2kFxBWlW+oEtiV14/kK8zifG4u1OSc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kSsy6APeFKFpE/F6xqEHdWdORDbKZyKbc94R/pmheWEFqwpZtiiOBu/np28pmiyg9SIa8ATPsVw4M9iZ5PqfQrSiG5P/FWsobDtE+XisBPuIK0yZcs/ndOcoRtqxGwvTdKA2GiQaJb8EAu52FEMwlnXE23++tRyMGKcwBHGhaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fV8OS4w/; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fV8OS4w/"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84531eaf8a8so6928661b3a.1
        for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782840643; x=1783445443; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxXDGdZP36dVSNVXo6OGlh08WQ4jD0j+gPBa9WDdARQ=;
        b=fV8OS4w/Ry1M+wBT77Emw7N6gznw0de6y6tSLZbs1PKpVaQw6vRsjJs667Wmbd/poQ
         rg7ThSEAXkztWyzLPChNYOf8FrTKV1J+uA5z5DcVuT4L6ba2QCv798iY2OpAWddwXgIl
         NH4Q4QIpKFkx6GOKAtRgxEp00yYauJMJqFU3yL5JQT9Rb2mqmDVBWHsT66zj7YyNEKbN
         2GwTKs9HPZuHwuTu8H3JBLXuma7dUPdSi3Tw1bzcGanSkZ8I0LRzMU7+oNNMU4QU0GE+
         QAILkOjT4iYDT69BXoG6c6XiA9k8s0dgcsNYwHEliRE+IjYCsebuVdnNcuAH5QAITXm9
         e3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782840643; x=1783445443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxXDGdZP36dVSNVXo6OGlh08WQ4jD0j+gPBa9WDdARQ=;
        b=ic21nPOpqqr1upljJM9PY1GfAMZeFgBKuY2z/1qbye28VoP8PWxE7Dc9/VUW3g5HHB
         d8aX6YZhzEmhjL4LEj/OnZZ11VutiprGRP6+jOUWcv7HjzCYfQMsEbeBV+vcrer4fOj4
         J+tNB4TIoDZMn1ZfVWDrYUfi0+bm7zsWDFaGRZKhLYRZ41fDsH55okueG5uxhoN4gAl6
         n94vWJrAYoe1WgOshvBzYLJzii030csxQzB96LdpMr9fZCy0+Bn3GBBXX1CrF4+trxwf
         v8qevFiR+tyWg/d1DI9w+e+yKs9sdmRnlUNEpxyw75YvPdaqu4AdDnMpGE39Nkr8FDGd
         zmog==
X-Forwarded-Encrypted: i=1; AHgh+Rr7xN2hFRrD6aCTqg34D0+eH/5jaUScXwYy8NWn8a23FGnjw8eToHTbzrj229q8i2KdPkFUQLYH3Mt0@lists.linux.dev
X-Gm-Message-State: AOJu0YysA3Q5mMjoDJklnI2GD7lfKLWXnDhT8AdOel8FHMY0U1V+BZta
	ZnAJd5jC4WTgMuvZGTWKfDOd62v8HYVujpRvXYMh677wn7YO6OT+LS+hCEkn6LSzG1PhxgKDaM0
	vgRmgjQ==
X-Received: from pfbfb9.prod.google.com ([2002:a05:6a00:2d89:b0:847:84b8:2dcf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b84:b0:842:6004:3fcf
 with SMTP id d2e1a72fcca58-847adeaa420mr1564771b3a.29.1782840642918; Tue, 30
 Jun 2026 10:30:42 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:30:42 -0700
In-Reply-To: <a1b06afb-af6e-4666-8c7d-990e7fa150fa@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com> <a1b06afb-af6e-4666-8c7d-990e7fa150fa@intel.com>
Message-ID: <akP9Qv_IPVEh7GAB@google.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
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

On Tue, Jun 30, 2026, Xiaoyao Li wrote:
> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> > -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > -				     unsigned long mask, unsigned long attrs);
> > +bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > +					unsigned long mask, unsigned long attrs);
> >   bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> >   					struct kvm_gfn_range *range);
> >   bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> 
> We have
> 
>  - kvm_pre_set_memory_attributes()
>  - kvm_arch_pre_set_memory_attributes()
>  - kvm_arch_post_set_memory_attributes()

Yeah, that's probably for the best.

> left, do they need to be renamed as well?
> 
> then the interesting one is kvm_vm_set_mem_attributes(), which contains "vm"
> already while it means "vm ioctl". Do we need to rename it to
> kvm_vm_set_vm_mem_attributes()?

I say "no" on this last one, the fact that the function is scoped to a VM ioctl
is enough to communicate that it applies to per-VM attributes.

Actually, since it's a local helper, we could go with kvm_set_vm_mem_attributes()
to be consistent with the other functions.  That just leaves
kvm_vm_ioctl_set_mem_attributes(), which I think it appropriately scoped.

Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38C831E842
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856679; cv=pass; b=HJ1MBl8CupZLba7NAjQ6EmBJMekJQi/f495+tOWJigmVhPZYuz0jaL0lFTXcXJVwKhIcI6cqqY0Zsr+6XhuBut56BzNeS3CL2lIyP97013z8f0F6EgCIV82W4L9EwOig3KZDpJrmyrgOA8J3j0zsVDtG15D9LCPHKWBFrEloir8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856679; c=relaxed/simple;
	bh=pR0Zn2zvw6IcMAbbufKDgeBYie2BeloIDPjTlVVsmpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIK3qytOVcF2ghc4BbskLACjNRzq4oFKLsyemi5rv3E6vy+o3/VPTLSvARiyfja8LN9IJ3fkkT4cQgPOefeFp0zqyrl4KJ6FSaoeAwObTWOGJ4MGwZG5Q2q7Bu7IhTGAFRe3BArSV0xkaQOVPWel2dEOLTAKfgJ3O+e5vAU4qac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FuFyTIhR; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FuFyTIhR"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5177d1ff061so112871cf.1
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 01:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856677; cv=none;
        d=google.com; s=arc-20260327;
        b=aCxd7ZQE7bI481uQt/1yiWUmjILRDSivtG4WFXDpvC0ZaUJcXhB2++Csj7Dk4Y38FT
         ZA7feAw7mc3qtu/B7eZDcDAG6GpOk5XSmrkMie6ydO1ejY1MmISTqzXjvzxcmVXt47CZ
         Rfyxl6JRNF9IFknUAvkEM7HRSa+2QQ0YwkmHIqCXryyZ26pxZhhSKhvuwbMoKJ3QyD/q
         7jSZos53VHF/kWBAWBBDJkk4gZwLNDj4+PH07NuSmE7P5al3A6IPxGObfQGUcVdPp0oF
         SJLcM0WunYLAkzlqkXuKX0A2t0Z6BuHlzrzUIlXRKnQIpte1erclYi22zrttBLOHoeWt
         mHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iM+8nrvlghRqxLR5gEfhNSNnyjY3ZW8GVmgYtfXOYBs=;
        fh=WCZpeLXXyVlJuZGeI41W4f2AFgKAn1Ew/CI3AvSNF3A=;
        b=WYXucULL/4TJQcQX9JvdTBPA7PdD6dXGHPVACBJXAD7py2aTYw7S6xfMozC0bcff61
         SP0kONK6jyl32Gf5sGZCj5Buqr2ZUmZtq5oDju8w5BXJQG0V6ZdHe1VzGB8Rf5jJUKT9
         3cFtVNORD6/MN5uYLoL/p+PRF4tg6AjDMHe2e9MMB76VG3Q1BN0KuIXTLTbosrlJzr6y
         3ruQ9qGmcMbwVBR2Ol8ibAeKlsswP8/9WPOrxtibL4latiXpXQSfrr53VoG0TW1wnA4K
         4R3ZPJbYdKpNVKBWAn6Vr3LdQ7OxIQ4HnEtpujRmrKymnHHucxd8Trh3YS/Af7Y0u3aq
         QhIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781856677; x=1782461477; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iM+8nrvlghRqxLR5gEfhNSNnyjY3ZW8GVmgYtfXOYBs=;
        b=FuFyTIhRSMvh94YA3fb65Hl3SFNxxubaE4mlZT0/6ZSz88/1JnD3ySXDnfuFQNh6Ox
         ds2ZXMLivEYse9+Aawo4JbK7cbLWmutc1g0l16F6caauWpfaN4g3zJDJX30Go39V8F8E
         gWQhlefCVjwSqNSd/1DJypGxXTYOilcA6qHwilVeUGNWzUVSj8+T9GXjoHZzIn0DDszy
         3EVlUGxFZIptGgbdVm0TffeuUwCF1NhyIgUrnLtyQq7Qk4cC0AIgUYwdqC4hP2KZqZbm
         vXLzmS/JTXd/vfC39wEk8Uw0+sKLTxUq0wUjuBSPadhkfaSbLFkm293hohmnKzsJ4tGG
         NLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856677; x=1782461477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iM+8nrvlghRqxLR5gEfhNSNnyjY3ZW8GVmgYtfXOYBs=;
        b=aXZr2Wwgfq5OC0IhiC1UUua6T3LPr6nkSABfcHth5wKZMeaenba2ynV2ywy+CMvBCm
         X7HO6FP3j/CgfEm6SFraB+hmo4PJDHQJfqWAG6rXWx5fXIWzTwhGuHo26twjOUPIOF2Y
         RGgoTUt5E1i0Sr9vlBsqQ7G82PJugkukfNBCe4dIKi9MWaisePz2uw+Qp5/tP5XXfFFv
         08qXKXivug16JXBPiLusUe7TdoGCCD1usld868oNTdjsC2F0fGG30IPlyZMlR5+aChE6
         4Z5CvZaXUS5XaUdMxlCC/1tgp3d2Y5XFZ3x0ChDp8eLV2dVPZCxGRPyOdIhutmE3qHT6
         u1Qg==
X-Forwarded-Encrypted: i=1; AFNElJ+xyHVSjZjaSyGN84PunXJ1x0C74w8UA5zkFvK1PI1ACjw8t+dSlp39Fn3Ve9wS1SiitTj6xYATS8zY@lists.linux.dev
X-Gm-Message-State: AOJu0YwnRFvVO8nVGoDKx8QVFA4pG3SdbZ9994Fs4ZAuX3p1rd+WZJZz
	ZzYoBxoI9+zKHgxARFbXIx+Gxni1FGJRq23j8XIdbKaHj96e9wfcBkoZe/iPgQfzKjigyiB9cY+
	A+uHd0lV0HizRKVm/Ah9di3Mjp+AvOtQZkcJz4RPa
X-Gm-Gg: AfdE7ckq5Tnb9rwfL61PlQJOxHx8wne11fy9zUAZW+73jyt7XO2HkBPO9oGsOwAsIXQ
	v+yh0pKb6XJWA9c2xPHf3AftPu1COmq2EnMo4l/zXZ3KWTGcC34pkDeCqgRkLihjpz1/PvjbIKs
	jsCPetZBHJo1rbBpFz6L27FfRIg0e3NF9BhGM6g+YoaQCxIK+ZTe20qx/nfMzy7h30BAWUD/9Yp
	bUfxq3UmC8Ka4yUvWihsj1gSkAETD+wA8HMSZzbYj57ZgDW7EP19HrslvdYuDW8mbMogbGe7w==
X-Received: by 2002:a05:622a:191d:b0:517:38aa:c2b3 with SMTP id
 d75a77b69052e-519e48d02b3mr6024501cf.14.1781856676299; Fri, 19 Jun 2026
 01:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:10:39 +0100
X-Gm-Features: AVVi8CdHX5FmAYr_l4a3mgee9sp6dg3wXgxt_dR1E7cWLhRy0b4A0kukfNDJw2g
Message-ID: <CA+EHjTxT9tcPk4HtyPXs1eo0bUQvwf3=G7P8ZTfJhDpXNm=ntg@mail.gmail.com>
Subject: Re: [PATCH v8 04/46] KVM: Decouple kvm_has_arch_private_mem from CONFIG_KVM_VM_MEMORY_ATTRIBUTES
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> When memory attributes become trackable in guest_memfd, the concept of
> having private memory is no longer dependent on
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>
> With this, on x86, kvm_arch_has_private_mem() is defined if some CoCo
> platform support (or the testing CONFIG_KVM_SW_PROTECTED_VM) is compiled
> in.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/x86/include/asm/kvm_host.h | 4 +++-
>  include/linux/kvm_host.h        | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 8e8eb8a5e8a6b..1bde67cf6eb0e 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2394,7 +2394,9 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>                        int tdp_max_root_level, int tdp_huge_page_level);
>
>
> -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||     \
> +       defined(CONFIG_KVM_INTEL_TDX) ||        \
> +       defined(CONFIG_KVM_AMD_SEV)
>  #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
>  #endif
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 201d0f2143976..d370e834d619e 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +#ifndef kvm_arch_has_private_mem
>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>  {
>         return false;
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

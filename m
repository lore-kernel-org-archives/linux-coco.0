Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F733F8B2
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857210; cv=pass; b=udpTWwvh587//0AZ07G+aPM8wY57LXEySA9aIT1AhtJ9/q8QauEl7twGgtjBrpVo2Cavgx7X2pyarVP0LaLrjTMKC7N0JuP0R13X10x3LQ7UVj+fpDlh6I0A3TXhiTuvqul4fiN6cTMlLRP6CoZF9rbZY767M+FyPF5nZFx4IWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857210; c=relaxed/simple;
	bh=gFs6fwYYXQhT/SPNLDd9UFrO7xyIHwc9eHwWJt6MDzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICGh4OtGC06GfVCNxlsUoCeMsnEWhx5ZweuE6OxAYBrv0LLFTidbdVDzoXvTY3rXFUW2C4qpR7cHVPMGkg/aegv/vB8Bh2dt9+mftrou7LaSR3fd2dlM3R94PyTylLANySEwNBMPUYpmxthFifYeYG5T1B/9ug8VnRhWUbgEKns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kalqm+um; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kalqm+um"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51765531803so197031cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 01:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857207; cv=none;
        d=google.com; s=arc-20260327;
        b=N9xVZTpBAPUIUg3oZUSUiIe4F7TDTyc7k1dqrclXog/J42Mx9PZLXu4nWxTGCJN6oK
         Sbpyjnt4vlbvl5oXC6R1gGp3+5bCCj70ixLjCI11FrPIoyBbO8yNAYI4shBEjsDUgiFW
         q3qCyzHh8TtVUTEBVpRsqSkCr3jU09E/qH85CuHQ7Cfvvdz3+tvEWNZsGV6arfBACjPb
         FT0CfsO+RV3Ud29am7VQ+dQgHPZa7r39PczE7LR2VYnTKN3hP+jVHaFRQnYWI5oHWjtm
         XOz7035Cp7deq1rXxCictho2aEskkT40bcBz2j2Z5YQTmvrxjsyZjrzPT+HqGNyowgts
         o2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JBFThqra4oV9uqStWieBti5R0y/ujSHcNSXMNdIU7IE=;
        fh=o0vvGEi6lul54ou5GuFaId7iYhWsW3YvB3uE523M74w=;
        b=h61JUB32maPrh1IAjYgXEws+ciu0egOwrup/kUIzYm3yiDs6iw58xmuvDAFZdwtOAd
         SuFo4iDdxxzhtkCKPcfhB5G6qtTm9YP6JOo/Q0iGXS9QvH0Kl/Gfv8Cu0JgVxpRcYCKh
         QnrTQ5yzL143LetgvNKd/GWGaywYig1AV/mG/ml74hFgiGLrxDVEgYvvX48WXB3g0HG9
         0oUFV0EThiF7eyc6Gc56JuMuZQffIjg4IRnB0dQJZ2FUCzsCmB+wGfC0nnwpqr8Jk2of
         BBbVOIor6EgB3CIzedSoUUOCkcYMsttYrlG5KqCFcaHpquT9mFKzsiUKJUMbXM5VtO9R
         mj0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857207; x=1782462007; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBFThqra4oV9uqStWieBti5R0y/ujSHcNSXMNdIU7IE=;
        b=Kalqm+umDeTFsJARW+BV/lKnFejxaARwaTsJ6v+p4ibvEi97bTVVEHABzUqumtu5cV
         KNQGzTELCvnEn50rEFkX9zwC22LEK7W+A2Mh5I/lkl82a6vNB+6zi/DLZx/tC/gvF9Q6
         OrAHPnC1QKjPhv43BAvrWtU1+IUCM3KyUKSfIx0y+YeMuAoWgW7YL/qSB+EHG7yPRVkH
         CTINiZU1W+cCaE7uwj+CFqy4pYKXsUUL+CQjl009KeV5kZpdZQ2fCk2dbYjYoWMRxqLV
         VwdlxvHMMNVHKjuCXHOj5RAu3Fgx/LDkHQeGBIBbDLhCfwRuOhYAoxbbjdgkQJU4im4k
         Ww3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857207; x=1782462007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBFThqra4oV9uqStWieBti5R0y/ujSHcNSXMNdIU7IE=;
        b=BkZWD3ZxHD9krfbMXgo+RBAT5euJg+l6+zBzMCxHBx5e2TykQqdC4Z2/fXvmO0A4Bo
         n+VSlaNdVZD2VVmT60s61wGIkMvGg5kSG8uLsffu2/0JYmgIlm3VDJPYFO3RLj/vIOkP
         2M+faOrvquhHUu4PPDB+lgw1mhFYByROIdfCpmzd/Ckhw87Wwt66fZ043SnicxAXQJkd
         YkApRTiJxRXpesiYWupjDF0yxcv20gbMIY4Ind5X/8UaA6c1VSbDD+2optqVLVAFmBzg
         M0Hw5RFH1TE1CRktiIx4IqmvRavTWDKoIC9HRe2jfoNLvFVRAzm1GI4fXZL0y5QEhQT4
         NcLA==
X-Forwarded-Encrypted: i=1; AFNElJ9zKOILEixucFCD4esQz/IMZVO1jWbdDkSAJc0ZAeir+Sg8H/G97evtISfUAL0682ESNJu2y4rn8AIs@lists.linux.dev
X-Gm-Message-State: AOJu0YxECcJJ0+gKZS04/e2uyCoy8y3UoQailB5hwtS0J0VX9IXtL05o
	NUSILGF5IxRpVBT+5oW8bd7mtxoagyM7Dfji/RSxArEm0HwxvnUihvFdKaFO1h3EJ7u8bGowEqe
	4nQGvrFG12lvcBYVPV0mc6koG7tvhcjfz8vb25OWR
X-Gm-Gg: AfdE7cnpY7uiMLtu/74X015ZAYf1/1ioUbzL8O42MrCuzWCXgDg3Pnf1pJLbJRl7UiQ
	MfxyZzW9SncUkSUNidCtDcjSXlSu3WPseC60Kwml7ar2AceZo2b9MKhraROF/VdWeoh5fkHD+Er
	3tTXV5FHen+DiCeLms6//MhVc040O0Wb2E2ko3b61i6bcNA57K4podyWsbn/GF4mLrag92vKECu
	uRf3lie1kPqvFhx2HabdOehi90AEIeAqriajsdynZ53MZ5R9pR9rZI84iVLJbcjIm5Z++czABat
	DLPu7mLY
X-Received: by 2002:a05:622a:1489:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-519e4890222mr6131781cf.4.1781857205879; Fri, 19 Jun 2026
 01:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:19:29 +0100
X-Gm-Features: AVVi8CetDOqUGm8KE1EqJ4bopoK5ozlhUV0GoXpBkC9yvjqeaAph6uDxe3jzIzs
Message-ID: <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
Subject: Re: [PATCH v8 08/46] KVM: Provide generic interface for checking
 memory private/shared status
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
> Introduce a generic kvm_mem_is_private() interface using a static call to
> determine if a GFN is private. This allows the implementation for checking
> a GFN's private/shared status to be set at runtime.
>
> In preparation for choosing implementations between a guest_memfd lookup
> and the existing VM attribute lookup, rename the existing
> VM-attribute-based check to kvm_vm_mem_is_private to emphasize that it
> looks up VM attributes.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

(SoB fix plz)

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h | 12 +++++++++++-
>  virt/kvm/kvm_main.c      | 15 +++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index eb26d4ea8945a..3915da2a61778 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2546,7 +2546,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>  bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>                                          struct kvm_gfn_range *range);
>
> -static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> +static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>  }
> @@ -2557,6 +2557,16 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE,
>                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE);
>  }
> +#endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> +
> +#ifdef kvm_arch_has_private_mem
> +typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
> +DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
> +
> +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> +{
> +       return static_call(__kvm_mem_is_private)(kvm, gfn);
> +}
>  #else
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 6669f1477013c..8b238e461b854 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2627,6 +2627,20 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
> +#ifdef kvm_arch_has_private_mem
> +DEFINE_STATIC_CALL_RET0(__kvm_mem_is_private, kvm_mem_is_private_t);
> +EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
> +
> +static void kvm_init_memory_attributes(void)
> +{
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
> +#endif
> +}
> +#else
> +static void kvm_init_memory_attributes(void) { }
> +#endif
> +
>  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
>  {
>         return __gfn_to_memslot(kvm_memslots(kvm), gfn);
> @@ -6528,6 +6542,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>         kvm_preempt_ops.sched_in = kvm_sched_in;
>         kvm_preempt_ops.sched_out = kvm_sched_out;
>
> +       kvm_init_memory_attributes();
>         kvm_init_debug();
>
>         r = kvm_vfio_ops_init();
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

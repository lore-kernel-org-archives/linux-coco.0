Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305C3C1981
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310731; cv=pass; b=D+/foywWWK0qLqoD4KjTEXXcmOlcFtWSGW69kmTYl0XV4xDOVyMzDgjL34xvhinnqBIJ32u1QxhDXDsUn9kwQBl3dU6Il3N5BpogJHS9JYJ/fKcEO7eL8Qo5++VqdX8KXAQYuc+VagVls1fYwHmQ/Ek32kZw1WgAk8sT98DJ0Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310731; c=relaxed/simple;
	bh=S43KLHfWZf4rr+LSchiMooKQ2vnBu5Vtd0C00yl/idE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbTPXU1ryvwlb6LHhX+9IOU/grQw4pnJ5BS2eJ+eYuQclIdDMGJIxQrne67aGQYOCjXpuBxF201JizP8CCmeNrG9l4go4NQCoa4oryWp9AcWFIWW2FS7Jh853mvPIosNW70R1+KNiuqdxZFffekonxM/Mpz9v1NLeGw1tlNMzJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5+8kZKR; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5+8kZKR"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13986d61b4eso2706784c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 07:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782310728; cv=none;
        d=google.com; s=arc-20240605;
        b=Zttkbok5kFqR4BcVrrb/kWcBtu2uVoy90UeWbu+Z/XDs2v3oyqTgcx5Oy92GPGTN5J
         leuCO4vFX6jO7kHGdxp2gADGwleCYdtZDMVtTArmojESSNJzFmdNkyDAHsCNOaYjkub6
         Ny7qwLFfjYIWmATYl6Ag3VfPRBQheN8Mnh78m4vbVzFu6mKcMXz7H/aPeBvJTEKK4IA6
         IwCOiyUFg2GR73oKpzD2V0mnoLod04LLC6VhY/nMQxAs9vXg3YLedQ6QepR8wQWMYFGX
         BRKOmy6FqKkSlbYMbVVvOc3Pv7NqvQbJMqI244YP5Z7z6E4DdfkZl4Hk24Z3MISJGeXE
         HjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ucZ6vleVNv7XMe9m+p1ud+LWxJsaO5xEtX2/mrf+WGU=;
        fh=8OnMaF3bC5ijhuWO9GJXs27MHdfV5bLGehq0QuRIwRw=;
        b=D2iw+3wRdKlmdioYqPaoeqMSX7hHhpFl+yWW/djF/1XRolV20iRR3kP8b/iXF24DPo
         McU+ZtzV5VkN1RSCHQF/NHXZ6U7iu0i7+p3L+1FgF4GJRdJYa5Zz69JrGAv27a1xa6/X
         qeyKWQFZHOFgL8TAv25TxFg556LBkVzDALLbATLOwXXalacUZWVrHV9bmDnSsSZj/yeW
         E2h/PkgmUedv9nzUgwdUy8bV772fnOtfj5OsJuBMt3rQ0ypVyl8d/uw5LVb4mMde02WP
         Oatbsz58+MkhReKyhbhBzkO0vfxOpELB4vtRTna44kN1zCuVZuqstyiKvwyxP3cQS1xk
         l68w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782310728; x=1782915528; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucZ6vleVNv7XMe9m+p1ud+LWxJsaO5xEtX2/mrf+WGU=;
        b=P5+8kZKRv/YA3jNGCGCe9GUk1l5V7EsQr6UA3HXZrWlZD4NDe8lfHjBkTzOmM0394t
         YtqIYlLXnZffXofgUBvcm35HC83J0/ws1Y0BUVrwigItu3fVNTd7GFxC0mzM4ivsCzJT
         6GsYPbMYi1Gga+DFZamNCnn3FdOgKnvu0FrjZiM4sTEuv9jKa2VNfUGS6QxE26zwdgoh
         ISmyOyGtYbfElUJMMoP22awSxfTvOt8fh+Vwy/R4jR9okXiKtq4hBiwiIoFwAmFwz77A
         nCijQLABWaaMEij5MspRMcBFGH6G1kv4OIGu/nB/gfmQ2D0E4sU156hz5tzRvzwoksKa
         qsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310728; x=1782915528;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucZ6vleVNv7XMe9m+p1ud+LWxJsaO5xEtX2/mrf+WGU=;
        b=YSWGQ0mQjFVjlIBATJvoEti78ln5fj+86YawZwxDRHVdQzgFM6w2RXX8tbzgvR5hXH
         HYtCFnOuuXfeNuJhuIoYIZFNBPe24/5fwHoo/YvQ47a4wGGDIOe0/aNCFnb8FVz6hXiB
         J76jvS0tczJDDtofjE8c51DhszltNgXy8yRRwmJhPlyakF4fk8C4ZhDtAH8T+ADtkm6+
         +zjFs0DTaqiPhKjL8QryOrst7g33lnD15rnQQeXT8RapDLexNJtn9NztkbxKxsZUWUDG
         5HDeM5Kj/lk1nKeyUL0vN2xzv1FaZCf84guR+7vfiyK/ulNu0HlrQ5TTnlRI1DpsBlx5
         DxdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bCKj7PRi5CqiB+xgrvUtjEMSt/P1tcrPtXn0luMLsXPUnLiP+7cj/UawZ5O82GlGf/VAWvd6qpBpx@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf9s746pdUdkKLtxINgVEb/07GPCeVpnBgSuJUYsTotggJzlNe
	DD4abyOa+hqbgBOruJkKkxVZWFWxcK+gi12NiWDBlnTIBJHxorNVAiv4FZ3wH+nYjV+rpAdNfeY
	P8wdM7HPrVAQ2mfhW+8s4rl+7BlRdf+iTyhdJGa5P
X-Gm-Gg: AfdE7cn0A+2jNbwOfhXA3+qgCCcv/jj0cawqsyKRN3i6oKA5ixH2SPzS9huqex2vJsz
	h9G41w/vABlp78DkkBd9HcfKsy3FtapBBckqeq2ZEWUzuR1L78XmGZ5OtEvboli+J3d3hFIjqF9
	FZbrhZAEJq8L3tG4vnOHOoESS8lMn2Dud41ZyVUljxoq0Bd8uvUp/S9J1po4JPETcPWpmg6i77Y
	eK1u3yIlN2X6Xu/Zxsxs94AwE2QKGvwflj0GtnfJfV/mdl04j1z2t9rKiOL7577+X6uUE81AUiQ
	1bcIXBaal4JqKJ16qfJDBlG0/3HD
X-Received: by 2002:a05:7022:43a0:b0:12d:de3e:86a8 with SMTP id
 a92af1059eb24-139ad72bfe4mr15983384c88.38.1782310725876; Wed, 24 Jun 2026
 07:18:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:18:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:18:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <3ec15992-2a29-434b-8c99-8b86bfcf007e@arm.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
 <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
 <CA+EHjTxu32nQ+vPV7Zmcw76_-V4g2_g=P_UzRnnO2dP1PFO2ww@mail.gmail.com> <3ec15992-2a29-434b-8c99-8b86bfcf007e@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 07:18:44 -0700
X-Gm-Features: AVVi8CeUzt8nV1nzvS6dw32sjloWQ_ALAuG02W0rgNOvY8pSNnpach_kfV-0O1g
Message-ID: <CAEvNRgEKB0FhD=qhyX=0m2o+d02Jz6n6njdbFmjyiUpK3Up-4Q@mail.gmail.com>
Subject: Re: [PATCH v8 08/46] KVM: Provide generic interface for checking
 memory private/shared status
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>>>> @@ -2546,7 +2546,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>>>>   bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>>>>                                           struct kvm_gfn_range *range);
>>>>
>>>> -static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>>> +static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>
>> Should have read the Sashiko review first, but where is this used?
>> It's not used at all in this series...
>
> See below:
>
>>
>> /fuad
>>
>>>>   {
>>>>          return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>>>>   }
>>>> @@ -2557,6 +2557,16 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>>>>                                                    KVM_MEMORY_ATTRIBUTE_PRIVATE,
>>>>                                                    KVM_MEMORY_ATTRIBUTE_PRIVATE);
>>>>   }
>>>> +#endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>>>> +
>>>> +#ifdef kvm_arch_has_private_mem
>>>> +typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
>>>> +DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
>>>> +
>>>> +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>>> +{
>>>> +       return static_call(__kvm_mem_is_private)(kvm, gfn);
>>>> +}
>>>>   #else
>>>>   static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>>>   {
>>>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>>>> index 6669f1477013c..8b238e461b854 100644
>>>> --- a/virt/kvm/kvm_main.c
>>>> +++ b/virt/kvm/kvm_main.c
>>>> @@ -2627,6 +2627,20 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>>>>   }
>>>>   #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>>>>
>>>> +#ifdef kvm_arch_has_private_mem
>>>> +DEFINE_STATIC_CALL_RET0(__kvm_mem_is_private, kvm_mem_is_private_t);
>>>> +EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
>>>> +
>>>> +static void kvm_init_memory_attributes(void)
>>>> +{
>>>> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>>> +       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
>>>> +#endif
>>>> +}
>
>
> Here ^^ as the static call update ?
>
>
> Suzuki

Thanks Suzuki, it is used here. kvm_mem_is_private() was and still is
the function used to check if some gfn is private or shared. Hence, in
this patch, the usages of kvm_mem_is_private() were not
updated. Instead, kvm_mem_is_private() is now set up as a static call,
and the static call is hard-wired to kvm_vm_mem_is_private() in this
patch.

In the later wiring patch, all the places where attributes are looked up
are updated all at once: if conversion enabled, take gmem route, else
take VM route.

kvm_mem_is_private() is special in that the if-else is done at KVM load
time rather than runtime, and I believe that's for performance reasons
since this is checked quite often from the KVM fault handling code.

Buut I think perhaps Fuad was referring to kvm_mem_range_is_private(),
which is indeed not used anywhere. Binbin also asked about this, I think
we should drop kvm_mem_range_is_private(). My reply to Binbin is at [1].

[1] https://lore.kernel.org/all/CAEvNRgGbBcrX5Fw3vNTsTOBNC=Ypi=9-S07674yPxLU9i4akjA@mail.gmail.com/

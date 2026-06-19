Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CBA35F5F3
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857551; cv=pass; b=VxyDhfHt4m1iwERJAtT9noHBAIWzjSPwVC+puDL7w1tkN0WC/8dBbBKbGtbXLW//MtmYlS9Q0Udrx4OeGaL9F7uobN7tJdOoDeQvfQcqqLEWYGtwpHRjCMPVT84BYW/xo+rVS06/OZ4/LhIK2QrmK6r794JQi6viLA4ysONEVgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857551; c=relaxed/simple;
	bh=aURqg38Q2gAlcr/J29NBP9ZvAVEI/c5mS9i6CA7HUZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8/rcoowqStxCAetuW6YuycRk7P0Ihz+3moeU09O7q363krF2AaUGGpp5UJNRE1fl/jSFXI6RygdwhWoo4T1zjXNXsTB90wzlB3TxJezZbR3DYa0Zoo+hbRHQJB5sypDJ6s/i+tq0/+qFVikhVyGADIsOleqRqGjEa0vnCzAegg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtMasYk6; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtMasYk6"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-519ed52bcc6so102431cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857547; cv=none;
        d=google.com; s=arc-20260327;
        b=Ly9YU1R+vo9SrDcJuPZ41gAQIrLMoV9GKuJD4CyO0xO8TEEQATT3a46BvWosf8wIpc
         yik0N4v7DMFIi80K1cJZiaQ4VWlLqcAH41RdjaWMYlLzfP0ZI6SXRFiozkNaeBTKD6XM
         d0GgCUxFdl7nipwcKZZyj7bTdXqmElaus1yDUlzhBwy6rwExDUcWco1wfEeArbgKXKa6
         NSkvfI3yr2p+W7TsWLz0EDoCHXIjqbKTeOGtFufU96PNLvWp84Som+9h7qoZUp2YYK7h
         fPvfywZlk06lK5NoDxH3rIWjsbHL+lVnVE59c5sPfMFk7EM+57qnD/JEcPiFIUFjBcHa
         M/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        fh=mIpd+o67pNXYb482ng50acpq2LR2LmKdjmE2vhG/twk=;
        b=Fz7ghTBua8jma+3YNN1fMZy2oxtxwBUdXcS3sP7ifxdHpaid8BELAKWGDyCLG7pfoF
         AXqF0IZpCG215iGt/4hVb19J0gzMEFSgRc8STDnRU8k3mNGXV95PILSMQnm43FdM9drc
         Zqy6oZ+yW35wQcPWSm9QVJdRU9k803B3UeAEDmJpEqaBX5zLqkb0jf4yLIFNmeJ/FUi1
         qOz5haQ4pHmxF7HBQj4h3yC1a4IvmDxQHt6V8DVYmDQcJAOmCn8jKykizNHgJhwfZsuw
         CcT67oWtytdnLq48HXV2GKZZZZo10mUIlNF3fbkWqxJ8Gh9vzfEQm/8HvXqpUbY7yTSw
         h8EA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857547; x=1782462347; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        b=jtMasYk6ltTrnIKBUs2HoaezGNJ27Ntj99EDV1FuRLpJgNNgQREpuj6qJhsqx7HIBq
         5kLMjrIhX+CFs2adkg+coqPDCcWYDb6OMZmuyZSYn069sMfLP25Y8lCJdCl8L4yscn0g
         JaiaexS3TesNbKcLi0s4aemXpadQeXX+SgUFmx0eYf+La4ZDC9ChYm2epndYHCm8fTkE
         aoY2efrbD6ZfjMXBbdy/zivu4t/t1uyANFyQ7Dd9Pov+GAnWA5dKSHVMOaAO6GXmE0PH
         h8T5E0QZ4nR0uZpAjJSpC1b/vrWFOYHIlyoDrMmFAMvjXWZljyovnArZr6ecDsOV42DK
         mIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857547; x=1782462347;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        b=Gzv8YctvDc3VyjrAZusW8ZcumPhHLhDtyEg5TVOtEm8keQetjpvVZY3HPH61+QPA9e
         HF0R98tOM4wCw0xV/uKTv4Wxx2jTAO7IVm8z1nicAWy9RtVe9ijjFAQQG2TZlQFR0sgR
         jO60n/NUl8JvTRNxziHzMx5TNcjJFDBRxRwtGhhwfNegkO4y4YlPaEey4HEPQ8DRCbsk
         exLM+RMTV96y4k9EKIIAyEFXoxH1EIJThJ3x3Jhc8QR/m6j7HGMXhUpB51qGSrlFfJiO
         7QOyoUpD9f/UDGqUHhYfctZe+AeoXhljQ4YLIveS/BUxvLlt2TtyDaMczFRxAN0+qFhm
         1Aow==
X-Forwarded-Encrypted: i=1; AFNElJ+SbYQBL9hz9bTeikLV//36CXbH9cBdaNSZkYXoayAWwAXEdMGga8VV0aHFUPEmxwX77klZ6Eudpcxk@lists.linux.dev
X-Gm-Message-State: AOJu0YypgS22aYj2msRufG9mwk1frjp37WBqmONBOrpIdQNyZQH12BC3
	J4ogLnsdV38Ysk3EEc3OZFYJfbnlM2z0Tp1ryb6hBq/Uyj7yv0P0koKgRpI1CGSGQLH3nhXOcXb
	6/1tDDrslaSNS4Amwz+33F2KSdcEolJuicC63lLtk
X-Gm-Gg: AfdE7clodmFnwEXQOlHMrHRt/uAp8UDGOUJ8H1ZYlyyLxLWxHBXIK+bmFPpQsxgz+82
	0T3QrwlXLAJMmy3g644QdDB7VY7qDbVhgt414+AJXi4QtzHopuLSf5zo/2DP+jMgYL05HoZEj1A
	2Ek+K+yLfedF67I5z6RQ/HRk2b0nqQQ/mqKeqsw3vG3TN3mlLqMpRhL+cJDOKmVfRxUmQKbtF3C
	LVDOXZpDs2czhZEa8lhb5DO1kXBHjYqJHnYGNYE4a9hutEn32M6b+59XWigqYCbIGsMvAczGA==
X-Received: by 2002:a05:622a:1b88:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-519e891c801mr4739831cf.7.1781857546581; Fri, 19 Jun 2026
 01:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:25:09 +0100
X-Gm-Features: AVVi8CeyI3PAg86WrGg3AslQ1YuW7acL6Ym-NulDiNjx1M0Fc6iTcS7y2ypGj0E
Message-ID: <CA+EHjTzh+iThoVnLOGbRDgacKFcvbBxx9m_72bhfafE4J7a7jw@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Introduce function for KVM to check the private/shared status of guest
> memory at a given GFN.
>
> This will be used in a later patch.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h |  2 ++
>  virt/kvm/guest_memfd.c   | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3915da2a61778..27687fb9d5201 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2575,6 +2575,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn);
> +
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
>                      int *max_order);
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 8101f64e0366f..bca912db5be6e 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -510,6 +510,37 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
>         return 0;
>  }
>
> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
> +{
> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> +       struct inode *inode;
> +
> +       /*
> +        * If this gfn has no associated memslot, there's no chance of the gfn
> +        * being backed by private memory, since guest_memfd must be used for
> +        * private memory, and guest_memfd must be associated with some memslot.
> +        */
> +       if (!slot)
> +               return 0;
> +
> +       CLASS(gmem_get_file, file)(slot);
> +       if (!file)
> +               return 0;
> +
> +       inode = file_inode(file);
> +
> +       /*
> +        * Rely on the maple tree's internal RCU lock to ensure a
> +        * stable result. This result can become stale as soon as the
> +        * lock is dropped, so the caller _must_ still protect
> +        * consumption of private vs. shared by checking
> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> +        * against ongoing attribute updates.
> +        */
> +       return kvm_gmem_is_private_mem(inode, kvm_gmem_get_index(slot, gfn));
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_is_private);
> +
>  static struct file_operations kvm_gmem_fops = {
>         .mmap           = kvm_gmem_mmap,
>         .open           = generic_file_open,
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

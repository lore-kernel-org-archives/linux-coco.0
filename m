Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12B202F70
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368351; cv=none; b=GG1hnpLtiZabf7o7SFUBsd/R+sxva7WC5vYmgJhan5ROB9do0ZTm4qKUOIXH+g0f8HC+B9I8Pzh+5eW7SChB1uWRAjUCzZrNCsFfPNAjZe8oQOCa3iNXeJKP8Wxsc8WYMx7XupZLZ4e3FTM/8BrJLqVtFq7sMePer7c/XljrF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368351; c=relaxed/simple;
	bh=nCCsq+ltIsdaXwDBzz7XNCu5ikwtb6mcMp6nTD/8nUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JruFPY2zJrQhK3/ZhhxgkDOp4ZAbEd0JDhEj3C8vF8j/NycRu5yInZCHW0Aw30G3qzirkLv1VvurSUxT4EsKnhtNyD2QwwqbLVP9ue/ewk34hj6OXvz+gX4+XJ8v125oK56cH1lo8kFOUjNpfNPMiI8ZtYDvQnKsDHVpwX7X6fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N3H3aRSu; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3H3aRSu"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bdaf8567f3so41927585ad.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779368348; x=1779973148; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6A/WkImBLvFQtcCerZuF0HISLRf2xh2w4ZLFxLCX4+s=;
        b=N3H3aRSurflS0H7v5WW7Bmk4DxJqnSpxQlMWVtpKVHb/9Dv0DkrjSWcg6qESWtAvRF
         Du93Svb5OYs1fBgQXc1TgMeXXMZ+Hc/bQdOxK3bZ+7qKNwoklkg683+AFhGTtAuXA6Hz
         7Jj8oRxPwNzwxewqMNPmeCMeINl114/ZbBccsrT2SlnTIegLPJzgfuZ+8zXLxoOtg5Ay
         WAnbgd/78eUtqNy++rGKycKMJJpLczVm6gHphW6WFlfMOFT+bsWvxpi5ULwMkQognXOi
         zHTM/ItfrkEb9VCViyJHszJzxD+VZL8Rx4JiJDOP7vC+3AYzrggk8NfWAb1msx3OAjz3
         iuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368348; x=1779973148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6A/WkImBLvFQtcCerZuF0HISLRf2xh2w4ZLFxLCX4+s=;
        b=Mj/3hIdrN2JeIe3ual3yPZ01bB1TfC5xHfiKcDm8YjjBtLvLAtUQXIjbAzN2yAYYk0
         eu9ti+Um9mm5FnsCX4/PDeJwMr7ZHwNW6m9DumxqXczsHsmzcg7Vzx/b7Hlj4VPsg6bl
         K16QUxMZyH4eKaVAqx1lLoxtvDhWDEt7NBTufxj11qG3rC/RUgINDuZBL9jWNw64OmMz
         MQSy9+7WIFHjN4l9qn6ska8dPNnzUJFl9M6m2XYowkrDp6HqXxNWwDW5eOcYyFoL50w5
         9Cy6xUQUQUhHDvjgySA4PBC5CFdaKtwjKukEvmlz3OImtddVL8m/oQsZmO7mpSsl3VV9
         l6/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8iP4UBzf+NmaXs64sG6uWKl82dW6vlrMcZG6/gttP3uoKBjDBzpEk6zdAaDyt2mPPTLtqZeMALwr84@lists.linux.dev
X-Gm-Message-State: AOJu0YwArepcBcEgfSBiajAzHZN27TVUFLYup2F9y0h+GdXBdCpumV+w
	hcgiVEyJMFXi5tZKvY9Wr4BFi/mwg3cjWHQqAin+XmR/aNYHQe2nuN/P0mMijSm7rVZK3cYJ6VH
	kmWMbFQ==
X-Received: from plbl6.prod.google.com ([2002:a17:902:eb06:b0:2bd:7dc:3354])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74f:b0:2b0:4f16:22f7
 with SMTP id d9443c01a7336-2bea229c3e5mr27900055ad.16.1779368347626; Thu, 21
 May 2026 05:59:07 -0700 (PDT)
Date: Thu, 21 May 2026 05:59:06 -0700
In-Reply-To: <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com> <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com>
Message-ID: <ag8BmtzxTlcuA_zy@google.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, May 21, 2026, Fuad Tabba wrote:
> Hi Ackerley,
> 
> On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
> >
> > From: Ackerley Tng <ackerleytng@google.com>
> >
> > __kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
> > not specially handle -1ul. -1ul is used as a huge number, which legal
> > indices do not exceed, and hence the invalidation works as expected.
> >
> > Since a later patch is going to make use of the exact range, calculate the
> > size of the guest_memfd inode and use it as the end range for invalidating
> > SPTEs.
> >
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> 
> Want to look at what Sashiko has to say? Seems to be a real issue:
> 
> https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=16
> 
> If I understand correctly, the fix should simple: use
> check_add_overflow() to validate the offset and size parameters in
> kvm_gmem_bind()
> 
>    int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>              unsigned int fd, loff_t offset)
>    {
>        loff_t size = slot->npages << PAGE_SHIFT;
>    +    loff_t end;
>        unsigned long start, end_index;
>        struct gmem_file *f;
> ...
>    -    if (offset < 0 || !PAGE_ALIGNED(offset) ||
>    -        offset + size > i_size_read(inode))
>    +    if (offset < 0 || !PAGE_ALIGNED(offset) ||
>    +        check_add_overflow(offset, size, &end) ||

Eww, TIL I'm not a fan of check_add_overflow().  Burying an out-param in an
if-statement is nasty.

>    +        end > i_size_read(inode))

This is all rather silly.  @offset and and @slot->npages are fundamentally
unsigned values.   I don't see any reason to convert them to signed values, only
to convert them *back* to unsigned values (when stored in start/end, because xarrays
operate on "unsigned long" indices).

i_size_read() obviously has to return a positive value, so can't we just do this?

diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
index a35a55571a2d..9c6dbb54e800 100644
--- virt/kvm/guest_memfd.c
+++ virt/kvm/guest_memfd.c
@@ -640,9 +640,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 }
 
 int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
-                 unsigned int fd, loff_t offset)
+                 unsigned int fd, u64 offset)
 {
-       loff_t size = slot->npages << PAGE_SHIFT;
+       u64 size = slot->npages << PAGE_SHIFT;
        unsigned long start, end;
        struct gmem_file *f;
        struct inode *inode;
@@ -664,8 +664,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 
        inode = file_inode(file);
 
-       if (offset < 0 || !PAGE_ALIGNED(offset) ||
-           offset + size > i_size_read(inode))
+       if (!PAGE_ALIGNED(offset) || offset + size > i_size_read(inode))
                goto err;
 
        filemap_invalidate_lock(inode->i_mapping);
diff --git virt/kvm/kvm_mm.h virt/kvm/kvm_mm.h
index 9fcc5d5b7f8d..3cb5ef86d0d9 100644
--- virt/kvm/kvm_mm.h
+++ virt/kvm/kvm_mm.h
@@ -72,7 +72,7 @@ int kvm_gmem_init(struct module *module);
 void kvm_gmem_exit(void);
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
 int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
-                 unsigned int fd, loff_t offset);
+                 unsigned int fd, u64 offset);
 void kvm_gmem_unbind(struct kvm_memory_slot *slot);
 #else
 static inline int kvm_gmem_init(struct module *module)
@@ -80,9 +80,8 @@ static inline int kvm_gmem_init(struct module *module)
        return 0;
 }
 static inline void kvm_gmem_exit(void) {};
-static inline int kvm_gmem_bind(struct kvm *kvm,
-                                        struct kvm_memory_slot *slot,
-                                        unsigned int fd, loff_t offset)
+static inline int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
+                               unsigned int fd, u64 offset)
 {
        WARN_ON_ONCE(1);
        return -EIO;


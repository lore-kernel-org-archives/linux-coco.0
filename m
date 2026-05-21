Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9537B018
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348680; cv=pass; b=LOZBtUJIJ7s1NJPSj8AaPD6L63iaiN+2+y7LV9YM/feSYHXC4ydxyXsRCVX0TzYhh+r7QDs6rNuh9aoLdgQs1Qb95oUNx4EOKLlGcVEm58DWYpFRbEBzsb4LMR2BZEDtAqEcLPeWeLy7AdprVa62gyTzADRUO/7HyhNosjMASNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348680; c=relaxed/simple;
	bh=XHlZItdK9pHZDtShz/g2SubgxMlbGRtAoD9tOKGcWfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dG7bYnzVYXX1UwowHRku3OyyPb4MNUUufS4qkIZXzUjOdtCm/J2m3uTCaVe5docut3qhOHZHxMm4cZBJepH3vdM3BzAox3h61cIG33vd+Zf4bkFxtTgLe045qYRNbAHOyElYwna6DhWPFZAXoqLPM2X/K2COpg6iL+gSfzwFUQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eE6nUQ6j; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eE6nUQ6j"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50e61648f10so6771cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 00:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779348677; cv=none;
        d=google.com; s=arc-20240605;
        b=aRRQXTDgdwymZ2zSu12WRAgqLhrjiQ74HzFCJ+44mP1rrmIahHrXUVJjW2Zjh33xkz
         AwYtss3HWRny9mewejYuBcP3cNlQvXFdxWRR/OMW5u2Xc4oX7SYIPJlDvti1xdUS4zNZ
         ozA1RznNTmnG+wv5/+KIzF4KtViMM5aRqK3J85uMgAXhjcMqCZeTCQ/ajTnCCT05S56L
         +278H+L0pr0J1UccHg99nAn4RDXBtGV7cxzuZDO4FxHRIglG+/UKJEy+8R/q23XE1WJg
         njnxrfJaekba9h/gqF2kDsmuGHWNVdp/EIjaQqEt72GDTFOyCvhz8ksD0uhUESrvQOd2
         8f+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1nov9/2BtMfIFSe84psXHPo953z02mFT+vkGOoJChBc=;
        fh=MhvU4x75BjkSZ8BTVBfZjMUSAJdCWKz3JUzbTRHk0bE=;
        b=VkZc4GhbUYu56BGAX62jmI0cFhM94T/ucXfqVw7J3orRyC5C5M/u8mNt3KI/saPQ2P
         Wn1tTbyMS0eYhyEmkmrONw+R2dyEfQc6VhI57KA/RQOdFVk6lPzu3nL4e4RfqhkjyGbL
         5cSlI3YbCHAFVkAWYkfRW6PI5l0V3Gi/48ATZ4OWSVWNgLehVYTenhiaP40O1Litr/qG
         Lr4oPYhCJmDlMmurUbuBHB+egvIe/ltS/ofQW0/dwtz/iy+7+9BVgtE9/i0rCC9O7qSi
         lm7bh01dAt0NJx4LoS7le5D8Pm7Ct42id1m50BCgR4ImUC7xIMBiToHInDh6wgUl0OUO
         7iiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779348677; x=1779953477; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nov9/2BtMfIFSe84psXHPo953z02mFT+vkGOoJChBc=;
        b=eE6nUQ6jc88xtiuiej43AvlJuTnY0N1nQHGZniGW1iHGfPMhG1mIo0N/vU6Oxq1SSB
         JVXHzo2N7g54+vb7gbTq6X+maDs+HBWMlMjPUyzWhCDXYCu4DL7eYSO4arZgQx1fq/b8
         ZGQiHQmA1gSczBTLaHWi7C/f9SE1g8ntdb5cTX3yndK8ar7g9hlgFpgXVd3grcFZ7fH8
         I214R2G+/4i1TIuTaZvq8u6aYyjJRZfdMF/+6uRDfsAzImVBlf/f4e158d29FVa/oQg6
         SIPzDehHLN19thEEfyK6YFutnhU0vAWqLGB2ZPRkqCmJaaoeB/+Zi/lfEUqkYug3F0XS
         iInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348677; x=1779953477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nov9/2BtMfIFSe84psXHPo953z02mFT+vkGOoJChBc=;
        b=ls7cdpAyVrad+nbCXeVl6BuguBssqF+mC6Z4R/dwbI81CxvUaxTvbOmKLy4ch/gFTz
         e5jbLSTcZxSn4HRoUQS8j8egjRbnosba1wBxjbnMs2b6F5phywJfej1FLTuU9KuLDRQf
         Zb4lM95SeHaLw4hxsFBVFuIbXOC7MElJGjE2XbYu4K/P9nZKvp2baqGxdlqMfYbozW7X
         TTNbg0Jx8Z1nsfEHNZImPHhS7+O4iKEkicSeLE0CHcn8K00rYzk8BMwQEu9IjTXXHtRX
         qv6c+manWQpc7Sl45y43w/qZR5pO+0Xl/3vNWgfC79Upt1Lge/KrPBDFDNqIeE+F0bht
         Zmyw==
X-Forwarded-Encrypted: i=1; AFNElJ9z2RCK6yk676YPnm9GGpbaRKCvFBFd+VEDQbJ7RdZtZYt8eC9UgyXV5iAfIWsNn2rQmGAp/10/8Qiy@lists.linux.dev
X-Gm-Message-State: AOJu0YzgWuU11rMYDcR7herLPdGA/c/7v6sSnahF8AjXCCURLkBVI2BV
	Udnw4dmDQdawl5VpvKWRTkLBv468eQGNiDF+K2L7qnHFIxRtTWumCMn5bdExiK8gZtyl8mRUyes
	e2mizEUSila8Lz1i6UZOyaXaTa62+/pcnBuLlY0vz
X-Gm-Gg: Acq92OHXsqXY2zH+n0fNwsXZALdx8Jqqx+A1rKi8CjO9w5gURTwJSr1ckCy21zxm1/L
	i78htm0AkzzX/x74s/QUyMPAophU2zXteLSdPEGP2p/ujB1XE5wnVYa11CSGRyQYrNzOWSy71iO
	38xSkuavrbvv8GTxZa0HUoinUR3g0LvDrUn7xKXQ5rpwg0+5Ek05t3S+ECoOgeZKJX2F4X4Oq8c
	Dyc93EbdEvPwdV4H2iMtAvPSlRhK5ZG+/7Y2WB7OzVjlBaFJpLoFbIG7Moz+oJQFo6w0nAaZ+AL
	+UQaWERo3bcYEF+oJ0s=
X-Received: by 2002:a05:622a:9005:b0:516:4f62:85e6 with SMTP id
 d75a77b69052e-516c54d8a37mr5382941cf.17.1779348676536; Thu, 21 May 2026
 00:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:30:39 +0100
X-Gm-Features: AVHnY4JV7zINIc5-OFXxSXoQ_2kIaSiAQNVZEIUteRP4GKUxLGDjyOPiw4qGQa8
Message-ID: <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> __kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
> not specially handle -1ul. -1ul is used as a huge number, which legal
> indices do not exceed, and hence the invalidation works as expected.
>
> Since a later patch is going to make use of the exact range, calculate the
> size of the guest_memfd inode and use it as the end range for invalidating
> SPTEs.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Want to look at what Sashiko has to say? Seems to be a real issue:

https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=16

If I understand correctly, the fix should simple: use
check_add_overflow() to validate the offset and size parameters in
kvm_gmem_bind()

   int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
             unsigned int fd, loff_t offset)
   {
       loff_t size = slot->npages << PAGE_SHIFT;
   +    loff_t end;
       unsigned long start, end_index;
       struct gmem_file *f;
...
   -    if (offset < 0 || !PAGE_ALIGNED(offset) ||
   -        offset + size > i_size_read(inode))
   +    if (offset < 0 || !PAGE_ALIGNED(offset) ||
   +        check_add_overflow(offset, size, &end) ||
   +        end > i_size_read(inode))
           goto err;

What do you think?

/fuad

> ---
>  virt/kvm/guest_memfd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 050a8c092b1a3..9f6eebfb68f6b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -370,6 +370,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>         struct kvm_memory_slot *slot;
>         struct kvm *kvm = f->kvm;
>         unsigned long index;
> +       pgoff_t end;
>
>         /*
>          * Prevent concurrent attempts to *unbind* a memslot.  This is the last
> @@ -396,9 +397,10 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * Zap all SPTEs pointed at by this file.  Do not free the backing
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
> -       __kvm_gmem_invalidate_begin(f, 0, -1ul,
> +       end = i_size_read(inode) >> PAGE_SHIFT;
> +       __kvm_gmem_invalidate_begin(f, 0, end,
>                                     kvm_gmem_get_invalidate_filter(inode));
> -       __kvm_gmem_invalidate_end(f, 0, -1ul);
> +       __kvm_gmem_invalidate_end(f, 0, end);
>
>         list_del(&f->entry);
>
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A65244661
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285142; cv=pass; b=dbrYmBEALUaWurae9w3T/JobP+c3Z0MzKMFYvljC8U6mqB4W7D5ZZR2RRyiGSCf/i5lTZ+TahleWcGERfgXVCJwlj0r6IfULeIGF2t9r+UasRI/YaLJOqjSFH8UgqtjwSos561i5dqEr7Utr8+VfoMgYEAHQgglllO0y/4vKlms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285142; c=relaxed/simple;
	bh=w4JDDKhr2QiuCMCCR6/SASV1LBSfLF+z9c67ox8kPyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zxpnsqv5VJnST0G3EzAKWLC4FoWf91AkNWI/c9Cp8yz/z+sFvFWUKCg6ZR/l1LyaRQk/SCsA+hif9pb3zlaaFjEfizuvc1pqV/bFo9zlD1LcFRFtL31shOSn3VNkwRPTnrNswprOdVSxA/cGXipz7yer5gHk/XonuD72C0QLK5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CdWZrXeO; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CdWZrXeO"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-515548f390fso16131cf.0
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 06:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779285139; cv=none;
        d=google.com; s=arc-20240605;
        b=e0g6kqkzQCTJX4/hoShKqxzBpC85rqx+8G/c9vkWEu3okcFY5aLaH7uhe+oTlymaOq
         Wb0PSyyIa3CKFYC+JhneeYk5MFpGn2g5IGgrhdhNCvvLMatfRN+LcVsW+LCGMmfGvIvR
         AIYgiwXKswN7A5qjX5AeYbcFn5m+UsgmJNk8pIXNivz7NDmsPmrQvDUtQkmwl4KPYnZs
         I2a+y+1i7cZILn/GZjZL06f6myhaStb3wna6f0JZP9NuwsS3d+kub3z9UonObiopoUO5
         vjLH2gVHM98zFim2KBpaC9lWEcmD2TAeznKLftfuiNR7c/EpyK/uOtrc3OQYfMawvmAq
         S6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Worh2JLSPSAyI17eyly2xWvvXK0uXozd+nOzIiXznLs=;
        fh=ZAOI0/7tKZ1AVcEn9pNnLEK5jbJ3Y5nyvbL3NJPP1dY=;
        b=PBGNSlO/fSJkp1SVtFJFRQuKK1tdMOZOLsOmwL8FClP5delDpQqh/3xWPQA9WBizQf
         X2T/dRKg7gg7TPhoZ1HpiNImpIv/6UpclYFy+UhCI51EYd58FnW+eRUYhwiWwCWayNpy
         U/CTUIpET3s8sipcZc2NtzkNHmO5y+eEaJQnhk5qpAyfugDBk6e1C1RQLs85N1/hxNiC
         FtCcnq0e6zHLg0cvmWmJi24r/iMdp/wul5cfJHUXbqwxMYPvcyC2tmbWz2wR/EJe6qc0
         NRHsj86vweHvrNjbV3vwaYYlchuQZ8P+F8jSy6BBIhgs2lLd+cu6SqPMxmQNDKpQHScp
         5rtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779285139; x=1779889939; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Worh2JLSPSAyI17eyly2xWvvXK0uXozd+nOzIiXznLs=;
        b=CdWZrXeOGYsjSIXOrg8aISpckHlsacciPIpgkcRnyc6Tw5Lt9n9WkjI8KXS/EDj6uj
         1wb2iJNCruIWW3JicJFmR47prtht0rfuz9b/9sTGeeRjG/Orq/EBxO9LNurQadonnJ+0
         iekQ/lCzike+eEOyVbyNE3CrqPuF1m5Dc2TMCD1DcnvKUtgj8BJSmtSg8xISN7VCX6bX
         VuhU46LFy8Lc4kyq5LaBGL+h/KUTrbMgnQ1BkYqxAX1ykemVN/sI8DhdVnExLX1o/T2h
         WuHlaFAT896jTvGZguJuWPgUM8TOtJj5gbz/jrrNDBueJB0UhtKH9lDdJZokIjMIvYi8
         hoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285139; x=1779889939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Worh2JLSPSAyI17eyly2xWvvXK0uXozd+nOzIiXznLs=;
        b=PmKR04BXtGNK9CNH6lyIeDv/nlMxGL5LIYztD88J04iFBQKha6+oc6/pmsovmTrVDS
         fvDVSERDgW4uIQ8Py1jqpFmX9bjo2BwwENiGzFIQBuOJUgfPgwdJ/fuzm+xPItp8hsdW
         jfiFES0k4MfLscfbBqdikHH+EhkgITH9uYY2I9I0d8gtknkasnKX/PHG+5ckDHlIeTgQ
         sSWjTOvyrZnhMURdSUu8IC4ccgwLT9UxqdzkQfCPwYYmKwUJtMAvEe4QdKwXGZFSa+Du
         Ptt9/4LHP3xUgp88AVDyNdLG44jEllWt5APfE4t/EHNGT2a2DqiKoO/MaBFD1J6ezIjc
         rf9g==
X-Forwarded-Encrypted: i=1; AFNElJ82v5gQDbuAe6I01GZSw2+op6U0nuoJp0D7vnnDJfn53/mdozXQnBL8A+P8Y/37cAhQeehvJJ/c2pDH@lists.linux.dev
X-Gm-Message-State: AOJu0YxROxq5JzFNold46/vYoj6F9cdnkW6Gyvx+8Lv9LdRA8c3I6IBR
	bL95pHbbcXQtS8OQ67IuPj0q/IgFsoKlIigZ+zWXPrhYE/yXLPUViHbQnTiB+0qBsXYf53CWsk4
	ZrcPW92cVoxfFh5m7CNTp72S18kkFomAWY6eCmMfu
X-Gm-Gg: Acq92OE+vO51ffTAib+Gz92DjRDacOc/BVHIRIghURSnIhCklH0Nd1ynMlBTyLa0tW+
	X5TSDGD0quUFNW/rTZj5CO1WB5u7ZVS4oKqNkGpXh1U+lNZmI8rE1rWBceqK1D3PZxG/7S2T/1h
	SYvTiZQSIi4malfnHyDAYzC159TWq+lHzNT2+XXu1vO2uT+gDucwO9TDo2Qt/pXvuix/l7UswmW
	KpNFGmT2MVl6a95yXJi5H7rVceRB05lhf6yDVdqp/CmYwOhKFZ6lIz1dOgXVwOa+DgyM0TCjQAf
	BheIzQ01r38M6+t99bA=
X-Received: by 2002:a05:622a:5d4:b0:516:4197:361 with SMTP id
 d75a77b69052e-5167937f111mr19778701cf.4.1779285137735; Wed, 20 May 2026
 06:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-8-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-8-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:51:41 +0100
X-Gm-Features: AVHnY4J85RRb6CNplqSCM30M3DMf1Y3bV7iG1C3rTvm3LWaftfTfmZz57_1_-Dw
Message-ID: <CA+EHjTx+WbsKB66_0_1a3=vBkEdoeqJG9QOfZcUTuT8MYc=TtA@mail.gmail.com>
Subject: Re: [PATCH v6 08/43] KVM: guest_memfd: Only prepare folios for
 private pages
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

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> All-shared guest_memfd used to be only supported for non-CoCo VMs where
> preparation doesn't apply. INIT_SHARED is about to be supported for
> non-CoCo VMs in a later patch in this series.
>
> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
> guest_memfd in a later patch in this series.
>
> This means that the kvm fault handler may now call kvm_gmem_get_pfn() on a
> shared folio for a CoCo VM where preparation applies.
>
> Add a check to make sure that preparation is only performed for private
> folios.
>
> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
> conversion to shared.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 9d025f518c025..4f7c4824c3a45 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -888,6 +888,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      int *max_order)
>  {
>         pgoff_t index = kvm_gmem_get_index(slot, gfn);
> +       struct inode *inode;
>         struct folio *folio;
>         int r = 0;
>
> @@ -895,7 +896,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>         if (!file)
>                 return -EFAULT;
>
> -       filemap_invalidate_lock_shared(file_inode(file)->i_mapping);
> +       inode = file_inode(file);
> +       filemap_invalidate_lock_shared(inode->i_mapping);
>
>         folio = __kvm_gmem_get_pfn(file, slot, index, pfn, max_order);
>         if (IS_ERR(folio)) {
> @@ -908,7 +910,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                 folio_mark_uptodate(folio);
>         }
>
> -       r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
> +       if (kvm_gmem_is_private_mem(inode, index))
> +               r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>
>         folio_unlock(folio);
>
> @@ -918,7 +921,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                 folio_put(folio);
>
>  out:
> -       filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
> +       filemap_invalidate_unlock_shared(inode->i_mapping);
>         return r;
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

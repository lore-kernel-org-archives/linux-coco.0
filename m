Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616F453A36
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541803; cv=pass; b=KdRzJSXc1AolSYfV61gAUSpqu74agmifDTAuOFe2DW8gdbc0DIyO2XKzFCCTXkan7D9OdnQV55ek4iACBmxbr+vN56qJr31mhWHyYf72EuoBDpWv17s2/YKCcKX55En7lP+YnJw7oxybknlJX4UUoaxV1gZ4IU3ib4IFhSsFiuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541803; c=relaxed/simple;
	bh=KaA5tLZHEghQu61RuODWZrlhn1D0edYuT22vJ4+vjrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsHS6vn6A0HURRi3aYy6rX26LF4jspQO2q3mW6iRMG2Cap0RYAF4FTx8ieIUkJTZtdj8UL/lmVHvrcRufFFssUwhGJTxcXUqJTtF34mju2x0bovkr9ZMYyQl206RMa/BUFhCI443+675E+cFb5hermdJOi21jJJR0A77IHQQ2ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ffo8/i1R; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ffo8/i1R"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c10e86e52so229441cf.1
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 06:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541795; cv=none;
        d=google.com; s=arc-20260327;
        b=KxjUI644zNiZppEnBC7aJjUvnmJsHgfrrRNMpG7HMzpavJYRrRaSu4qDMutmsLzblr
         ade85TKB3zYvBDVEFhj/hWMe0A9L68wpXCauKb4F+007dEmn4WK7nziB8W1IHcBJfmCc
         7tOYz/oq7zQ7nxQN03ZViQElqzXrFRHEuEDpo1UKEZqshDN9kDUAdaXwlSQdmyUqWESN
         WTiwfzfZ4D/+xzF3Ge4sK6tHVSVj5cuzY4qPV41BFjzq6nlBcEClRwSJqWGl/KPYEAOb
         5wqUk9CAlvF/Pp226HB0hmzR7/IVh9Hncn6Hi9ytz/PXDwsF11n5BdtkNBT1Kj6f0goq
         Zxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O8ig8WOZx7XhZvybLzPJyMWD7j4qDk1RSS9jPUIQvDQ=;
        fh=nCtkFm23ErTDhmfSNK4NPgDfh4SKT/WaEUUGwJQx4/Y=;
        b=lAWkGuH31/nDAk7L13U2uj/JA4LUXuCa1Um8SgTn3K/QW06E+7Kg/W781Yje9BWhAk
         2mtufLRw3MnfWtr8iaaf8K+Oxv4d5vr96flOcAsdmC40bD0xplb9otuXG0AhwtKnSUdm
         eYHzzEHjD7tcoQPEKn8yehPGId2QRxqnJxjhZJkTgK7iTEXkd34RB8nVsWrbmaxnMi5M
         GTWrPhBrc2tAjwKSxl3ryJMxHiODLd8mkqQtb5HpTsHk/GI28onH7UkzrfPGqoN6K0Qz
         /ORyQ859JTOuyZ93pB2XICjXY6+DFMHYlUWFwFdf6AVDmHMitp+o7vDtCgTMOOLtS7zd
         7Ieg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786541795; x=1787146595; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8ig8WOZx7XhZvybLzPJyMWD7j4qDk1RSS9jPUIQvDQ=;
        b=ffo8/i1Rv3rb+Ha9xOKtsmKTONVS+df46M4YaDQUxxr6+ZXBSX4f+z2hWDWCKwT41K
         XnsWiuMGfcJwxVwYBSwaigCnXAbh5T2ZZzDdRQCFZ6Zt3jJG2SeZ5MKQpxLbxuMjVA5j
         F4/ruAjxndinwJ2jwG9IR631LEcBHaAOSDgeaHOHtfSWp4L5wSqiAWOiYB7af/Re5f8p
         YaafFOrn4r6PUdUkzhZgE8MlnO4MkTq7Z/Dpt+dqJ+QuiA4uMt3ysc9mD0y1ts5FG/9o
         G0hhYwnZNqJJqUuiTgxsqXmt5Q1vUBVbWFcAgV4PJds7k+iQiG2ci3X33yfzeVSzzXiJ
         AZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541795; x=1787146595;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O8ig8WOZx7XhZvybLzPJyMWD7j4qDk1RSS9jPUIQvDQ=;
        b=goXC4W5TxOJGynFd7yDsBVoTznRsv+vm4QoOam/7lFHFiZD0UMZTn11RxyZg5Evngp
         JmZ3IDbfkMzOWmmqUkhXTfpw5LMT038rAcZRbWn8l4CarfNSr4fT9jC0I7levF+V0TUI
         +0MJAeTZmNm8xhXa7PxOr039dZypvm98D6FGxompAOkqjlHwKcbgY9/LGN2M2tVqHhyv
         UpvJlQCuk//McoCFtL4prcxwwkgrUcvSLVy5fH9PCBm2PbmWAJBpVlra3c75ceSemokO
         uRUbd9prdDliEW2kJ1ErGq8iO+fmWllUDfu1trc9N3a9Wr8EG/pM78AchYJOvGTOdTSm
         w1Tw==
X-Forwarded-Encrypted: i=1; AHgh+RoZB55s68bWYQ+97r7BpD+JISvLHxtJFlkqV44k/24YinTR+ZyjjT6r57HF0HAqzWjsk38G1uww9QvI@lists.linux.dev
X-Gm-Message-State: AOJu0YzeMFYhDjc0XlH5X/DBFsEDeYnhwAzk8GmMZQG78P/bVoBM/DN7
	9UyG1J3jCfR4DnsdwLX0w7/6z3FZ1q5R2Us/yWwYcPlBqJ5WCxKLDQlJeNj6M+03WTT9eWuJzF6
	jAbQ7ZUraJAupDRUGKK+J1wruA1e1JGZl4OFzo7/p
X-Gm-Gg: AR+sD12HLhtmMWKa6vwhHGR3kaEQ3JGXBE9LZ0oD7YJivY04/gjyfOkrOcGGmvDohTO
	b+cLfCQjvoktm6iSS99lJrSCt7bbxkyf1Kov1rf31447+NB8RjYkuG6B0bly3NuJAYgc2ccWoQt
	LuGZSDDp9g8aYBU2y4vSVrLoiZtc/QkzTCumaVM1Zcwn5AD96IcSah7mKoOUpW9PH1AbKqXZQT9
	J+MwBOPOj/WsR2K2tUiidwDISf37qh5GJJ93Yw5+uPJ4dZnfN4xAd9tic62cYvdcEeg9aj8Lmnv
	oZ9Qy0GB454aSzh8qATE5xTZHHrMI++ox9At4bXMeiMzHw==
X-Received: by 2002:a05:622a:e198:10b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52d65464646mr13738681cf.1.1786541794243; Wed, 12 Aug 2026
 06:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Aug 2026 15:35:57 +0200
X-Gm-Features: AUfX_mzWYjCDwiui5b6BAKCYfBkQOYXMoJhicR-4oNYgSy_SG6-tlHfLwASmQvc
Message-ID: <CA+EHjTxPznVrL8t2T1AX0Qs6Ph8z-Z3e_z0ZLt3sgAOf37VFRw@mail.gmail.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Aug 2026 at 23:52, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Before conversion, a guest_memfd could be either all shared, or all
> private, configured at creation time using the INIT_SHARED flag. Hence,
> when zapping pages from stage 2 page tables, guest_memfd can filter which
> to zap based on the initial shared/private state.
>
> With conversion, guest_memfd tracks shared/private state on a per-page
> level, so a range can contain both private and shared pages. Zap both
> private and shared pages for simplicity.
>
> An alternative would be to iterate guest_memfd attributes and only zap both
> if shared and private pages exist within the range. Setting both the shared
> and private filters lets the zapping logic do that iteration instead.
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  virt/kvm/guest_memfd.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 75979c885e030..b1537226e5adf 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -136,14 +136,6 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>         return folio;
>  }
>
> -static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
> -{
> -       if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
> -               return KVM_FILTER_SHARED;
> -
> -       return KVM_FILTER_PRIVATE;
> -}
> -
>  static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
>                                         pgoff_t end,
>                                         enum kvm_gfn_range_filter attr_filter)
> @@ -186,15 +178,13 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
>  }
>
>  static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
> -                                     pgoff_t end)
> +                                     pgoff_t end,
> +                                     enum kvm_gfn_range_filter filter)
>  {
> -       enum kvm_gfn_range_filter attr_filter;
>         struct gmem_file *f;
>
> -       attr_filter = kvm_gmem_get_invalidate_filter(inode);
> -
>         kvm_gmem_for_each_file(f, inode)
> -               __kvm_gmem_invalidate_start(f, start, end, attr_filter);
> +               __kvm_gmem_invalidate_start(f, start, end, filter);
>  }
>
>  static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
> @@ -229,7 +219,8 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>          */
>         filemap_invalidate_lock(inode->i_mapping);
>
> -       kvm_gmem_invalidate_start(inode, start, end);
> +       kvm_gmem_invalidate_start(inode, start, end,
> +                                 KVM_FILTER_SHARED | KVM_FILTER_PRIVATE);
>
>         truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
>
> @@ -344,7 +335,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
>         __kvm_gmem_invalidate_start(f, 0, -1ul,
> -                                   kvm_gmem_get_invalidate_filter(inode));
> +                                   KVM_FILTER_SHARED | KVM_FILTER_PRIVATE);
>         __kvm_gmem_invalidate_end(f, 0, -1ul);
>
>         list_del(&f->entry);
> @@ -525,7 +516,8 @@ static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *fol
>         start = folio->index;
>         end = start + folio_nr_pages(folio);
>
> -       kvm_gmem_invalidate_start(mapping->host, start, end);
> +       kvm_gmem_invalidate_start(mapping->host, start, end,
> +                                 KVM_FILTER_SHARED | KVM_FILTER_PRIVATE);
>
>         /*
>          * Do not truncate the range, what action is taken in response to the
>
> --
> 2.55.0.654.g21b8a5bc05-goog
>
>

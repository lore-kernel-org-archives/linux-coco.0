Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC83CFF44
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658935; cv=none; b=niIigyBtNCZYQyyBdcOQSsi/k6fy5U/+YIpX7tGOAT8fJI7CbVOtfOdZV+SMNxp1BMrN9GwKnOEBQMbSG1SULDQUBwvW2rXYNRgyv0cfhfw5obfHv8uXg5wEjedxgQzGkcprzXd9nc02kjxWOhQ2htahadVKEkCJde9t/+yZQKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658935; c=relaxed/simple;
	bh=KiztK1JbpO5JZhhPbKHjeFsloeqjBsAvtQBBDIoVGKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AotEcsExjMbsJOaTzGYLSf7htY8ADDsa+2dBIhs+emdWjqTCk7k56eBAKZvrVCBQEJrKmdYgyU+6GsgEXZn9D9zTuDcxR2cw5E65nk6PTWMWb/RLgITPefYot5sUUTjl6yF/NhzPmWM4a6m4dmEu89DfCstVSjOjTEByKPOcVAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qh+AFGBZ; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qh+AFGBZ"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso185954a12.3
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 15:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786658930; x=1787263730; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/3XZWjnKAuEX+EJn/U2x2ZdOkAMPrJlBbo8McfTGik=;
        b=qh+AFGBZUHE1H21XTv+rseE+dqOsQU3oizlVMARb2XaeX9d3y7MLr5VbpxL9u7kxPW
         jLfJHdjjjyOYWVMUrm5FeARo29p5w1DK1xzA8Rr62uk6G+E8Hgot7wN3GbVWbvUb3EAz
         RJ54q02AA+8xspy58HvG98CNFKDujmWhERxGJ7+8RwpGgfyGffwIow6ysZ2YkaCpqy7S
         yEH7FlpQPAvZUoV9qEkRtXrZ9A0AoO+R6gsvXayVy17lOtesiw3P/ZFPAFAO43/nDaD6
         XStMquZ5bO4z9T8unk5qfgJhFd5XeesVbFPfuwoaZgu3799Pr5td+VcJp6K4JlUL1u/B
         +fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658930; x=1787263730;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/3XZWjnKAuEX+EJn/U2x2ZdOkAMPrJlBbo8McfTGik=;
        b=igwnXe0yiUli1RRaTG1GWGJkisNWhH5EUp1EEomx5RkoC1XkFW/sb2kKvVkQGBVNoz
         k0KKcalQTRzTqbJVj8SH8582S8ajgxeXRtta58BbSQVjm7YrIZKV7R/rIc6Y/XheQXWS
         u43G/Jaor9Ke/sVSc7elMIoLJ6frpPmsYpBXuXxdOP43I/em+W3/yWED0qohcgWYX+i8
         hY0eaoL2+suD07uBvt3Yh2+Hy2YTNWSiEEbVGLvnVGvmhqjsJsb4X0C6LnmKzwyuoUNg
         Ls8PTvGvmukFuL76yWUX7fuZZR+ScF/mc1KnuqXiXfxdLQ65IJN5zTNa1Y8vwMzQuDYJ
         6HhA==
X-Forwarded-Encrypted: i=1; AHgh+RrTxs7tNaYRLDrVaY03iIhku1dHhLY2Bvh7gL1myoh1QiMpHraxkz+6/5bNBgIsp3vUi8gEkI31AMlJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzccYUAOA7SHkgsOMlRQLF/PTgjgtY3Ywo0uBXF9bRgdYUpvDEb
	jXM8bXKkWxy8F/6IzFyXZINvzR/8RH4paAHPSFbEQQVXt3A3JygF25z6xzTHug3lwRPaXwwiBYF
	6v8f6XQ==
X-Received: from pgcd20.prod.google.com ([2002:a05:6a02:4c54:b0:c9e:41e5:2eec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a21:b0:3b5:489c:7bb5
 with SMTP id adf61e73a8af0-3cc71d1e1c7mr839682637.28.1786658929498; Thu, 13
 Aug 2026 15:08:49 -0700 (PDT)
Date: Thu, 13 Aug 2026 15:08:48 -0700
In-Reply-To: <CAEvNRgGpCVCGVjc9jCt9Yr+XypF=71h6eBahkXNkrXhfrtGY+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com>
 <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com> <an3o4h-E8mj6CUaM@google.com>
 <CAEvNRgGpCVCGVjc9jCt9Yr+XypF=71h6eBahkXNkrXhfrtGY+g@mail.gmail.com>
Message-ID: <an5AcEG9mqDgnBYk@google.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 13, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Aug 13, 2026, Binbin Wu wrote:
> >> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
> >> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
> >> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end)
> >> > +{
> >> > +	struct folio_batch fbatch;
> >> > +	pgoff_t next = start;
> >> > +	int i;
> >> > +
> >> > +	folio_batch_init(&fbatch);
> >> > +	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
> >> > +		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> >> > +			struct folio *folio = fbatch.folios[i];
> >> > +			pgoff_t start_index, end_index;
> >> > +			kvm_pfn_t start_pfn;
> >> > +			kvm_pfn_t nr_pages;
> >> > +
> >> > +			start_index = max(start, folio->index);
> >> > +			end_index = min(end, folio_next_index(folio));
> >> > +			/*
> >> > +			 * end_index is either in folio or points to
> >> > +			 * the first page of the next folio. Hence,
> >> > +			 * all pages in range [start_index, end_index)
> >> > +			 * are contiguous.
> >> > +			 */
> >> > +			start_pfn = folio_file_pfn(folio, start_index);
> >> > +			nr_pages = end_index - start_index;
> >> > +
> >> > +			kvm_arch_gmem_make_shared(start_pfn, nr_pages);
> >> > +		}
> >> > +
> >> > +		folio_batch_release(&fbatch);
> >> > +		cond_resched();
> >> > +	}
> >> > +}
> >> > +#else
> >> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end) {}
> >> > +#endif
> >> > +
> >> >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> >> >  				     size_t nr_pages, uint64_t attrs,
> >> >  				     pgoff_t *err_index)
> >> > @@ -599,7 +636,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> >> >
> >> >  	filter = to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;
> >> >  	kvm_gmem_invalidate_start(inode, start, end, filter);
> >> > +
> >> > +	if (!to_private)
> 
> Should I make this condition
> 
> 	if (!to_private && kvm_x86_ops.gmem_make_shared)
> 
> instead?
> 
> Will that help?

No, because that's bleeding x86 details into common code, which defeats the purpose
of arch hooks.  That's why I think it's worth analyzing the cost: if it's in the
noise, leave it alone.  If it's meaningful, figure out a not-too-gross way to skip
the entire thing if kvm_arch_gmem_make_shared() is a glorified nop in the end.

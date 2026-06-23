Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DA363C6B
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178639; cv=none; b=M9xKQQFpuCeXE+9lUKUkyt1O+V247LmVkTYhA1tXXpQpj1b1nyUl1AAGmbu19lXoof+iOwj2frIi2UcDuB5P8mGY2npWuF96Qzj0Lcoy+MrQXGmE1D9RQryS3NZvoPOeqoOAIbr15n964vGKPQPy9GtFjkwSagf0ExFz3S7kZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178639; c=relaxed/simple;
	bh=5DxnOpKxfSLreEefJhlh19ZNtNNDhg7LneuBINRCFH0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g5gp3B9THZh6HxxagdJBLsTBGYWCxpPx4X/tPOeCYT7pEu8A359XhW/cYdK2NF6XiMdwG0cUOnGlggwxmx0PU+2GeBLOj/2KgEzPzS64pGSk6loIZ3BT58z0GX/HdN9MZm2H4gizr5HmNtHPqow5tmetNJvnHIj23QMkL/XWlJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q6zf7nPZ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q6zf7nPZ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf1dece2ecso55379675ad.1
        for <linux-coco@lists.linux.dev>; Mon, 22 Jun 2026 18:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782178638; x=1782783438; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AP9gehEakYRCrViEtM0iQf/Z+UhqMaziDYgqcj7Zu0I=;
        b=Q6zf7nPZuLB4Apz5rygYt8W+VMI+56UdfB9ktDOVJBER6jKg8zpeQNO33QdORYlAIq
         dXrYcpjeSBiJ5BkQCnyJZuITL57h4RIeIRP9bKcOmJgDFGGwCH97DBxGXGdAlTglSWjH
         U88EivsZOAg/iEnKwDP3WSTIbIygZWH5pj+UwJijxwMCrY+3qGSLXEj31faxoFhenPY+
         9W2fKTAD51jueXj85l9auCxalhM6DGGIbWNvWkUpplQ1IhF/MsC3yD+7G/3Pq6EDs3Yh
         PtNRWGrFHgN4fDvGKhAGjpZV5idmoibuIvbqIOCoM+XWbA6+u4HsHJBKO6lVjy3QHHBc
         DXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782178638; x=1782783438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AP9gehEakYRCrViEtM0iQf/Z+UhqMaziDYgqcj7Zu0I=;
        b=MHUnf6A76J2WOHDRf0KzCw5SFEgkTfArQVWskE7JCKzslkA57mwlk+CU8PXjPHsFcx
         oXRzJH4fzHzm23sQow2Ay9ifYgUVnT7Oe/AoA6JIt6VgUcGUntIyKtFUe7L4ira/K3LA
         1N4+u8No9ElZ+p9ihS5ozQ+xZKTmZW8I9A7YwDTebKZPxtsbw+YpdS++3RMlrmYJPOkY
         BZSz5C54nOn+IO4FnI1jWGWAtUl4CeCm6UdVbM8J/Fpn+/IHOt0E+5TFuikv9F8Yht4u
         Ff6nRSinwS9X+8bffWXnpmqGUxIEYvbOYk1YbzfQ1HMWwfnR6Nbl74qf3abZN2Bh8rkI
         ErwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOVRzSDHhIX0wBSyfFiGTw35876oY4o2PO50G/YgTGciOzwxy7qz9A9iH/uANg2PWNcBBf/sk68hc7@lists.linux.dev
X-Gm-Message-State: AOJu0YyKThDbxeHsSKrESc2g2gI+x5rt4dbAOs+hXtK15E16bFrS4lmE
	l0GLIRIMsqFII29RyJ1V09HUOuHVLo7uh7qV4BFOZvB0fpP7GJja4Zc76I7xMRzT4xrHPFO1IUj
	y29O67A==
X-Received: from plox10.prod.google.com ([2002:a17:902:8eca:b0:2bf:27ab:9cf4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a68:b0:2c7:9ba7:a39f
 with SMTP id d9443c01a7336-2c7c99de6e3mr2076175ad.17.1782178637132; Mon, 22
 Jun 2026 18:37:17 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:37:16 -0700
In-Reply-To: <aceb07e1-77bc-49b6-a932-5fd9b5a21727@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-1-9d2959357853@google.com> <aceb07e1-77bc-49b6-a932-5fd9b5a21727@linux.intel.com>
Message-ID: <ajnjTJdQKD1Kz3tf@google.com>
Subject: Re: [PATCH v8 01/46] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 22, 2026, Binbin Wu wrote:
> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> 
> [...]
> 
> >  
> > +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
> > +{
> > +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
> > +	void *entry = mtree_load(mt, index);
> > +
> > +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
> 
> If the entry is unexpectedly missing, returning 0 means the attribute would
> be treated as shared.  And then in kvm_gmem_fault_user_mapping(), it would
> allow the userspace to fault in the folio.
> 
> Should gmem deny such edge case?

After several bugs this year where a WARN_ON_ONCE() fired, but was entirely
insufficient to prevent true badness, I'm definitely senstive to making the "bad"
behavior as harmless as possible.

However, in this case I think we're just hosed.  If KVM treats the memory as
private, KVM will incorrectly do prepare(), incorrectly allow populate(), and
will caused missed invalidations (though I suppose __kvm_gmem_set_attributes()
"only" lies to userspace in that case).

That said, assuming SHARED is definitely odd for cases where guest_memfd *can't*
hold shared memory.  Ditto for assuming PRIVATE.  What if we instead fall back to
the "init" state, e.g.?

static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
{
	struct maple_tree *mt = &GMEM_I(inode)->attributes;
	void *entry = mtree_load(mt, index);

	if (WARN_ON_ONCE(!entry)) {
		bool shared = GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED;

		return shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;
	}

	return xa_to_value(entry);
}

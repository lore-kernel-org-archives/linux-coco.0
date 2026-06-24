Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8035CB91
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320486; cv=none; b=DxhuBE9P0a249Uvf+7OLkDGU07YXQtq/Vr5Jrul8vIrXkKmr0ezifYZKbsuJ7nWRbBft6u+ewzA3VPs/McGA88H+kos/saTOWas1PYWTzUcF8t0jQkVpc52DbPW5WE5K1VKmIce4SkXABb84UQ/H2Y66tfvuDpoDItxNxFKrux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320486; c=relaxed/simple;
	bh=hXT+eybuvhiG4/K2l6t7f2dd3GljuDBbH8uGde2JbnE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EZNShwR+28yU7VqaRhZ803opLcDz0zdhXcR43cKVMUn+MUzn+fsq94o4WeH04hHHij53HVTpZM/UtktA47ZaAjad+PlaYvLgR956v/TkzoyTLcOweOyj2v62l8R5vY19Q+UOQSWWth0Zz5KOlpwlZgSH5yf/THtdNsp25vluLOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bm1UPTi+; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bm1UPTi+"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8453a81b846so1747466b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782320485; x=1782925285; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISY2wbCcsFGmwP11+MNFOlIY+gG7N5avT6t+DVDnEh8=;
        b=Bm1UPTi+yoPwe2/k3R3xZRisq9hrldelNW3F1QejwBEB5OaHU/ilw/70e4LPbde3JF
         RmhkURqG9jwcbydGRw5TE6RjwJhmPL1SVe/0fM4tPh7Bp4LdAE3a60H+Yf9fYWSk9sTH
         KTl2ZOYkDdMckjw5uVQ6Di7auETuiNPRpS9H4a7PC3Lm4pQep6MxGrlRhlXAeVuzOkCD
         PQLa9vNp5g/Oe1/K0qkMuwdi4LT0a1NjZ3v1nWKr9tn7516Iu5i+brUCwtm7cRwafl3w
         3V7iLB3ig0nq3UoL75rq10ns+e1fXlRSx30LpkPNL1/Dyxvn7GYjyPqfKZUL1woVm8a3
         2cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782320485; x=1782925285;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISY2wbCcsFGmwP11+MNFOlIY+gG7N5avT6t+DVDnEh8=;
        b=TTg4zUfkNVCtXwYe+XlHjgYtoxvt5NJsFkFWahGI+wvX3sgdoT3J/vS8HJeA55Xj8M
         XCMjV4Tuz/CJsoEqeH0i4StvJI06nZtLeuxrMng9nw/aqjircY1QN8oP08ZdYIAimSXb
         x5nR135+EWbtTt2IMg7BxUrgDXchH8FSRZY6QiuqK1z1vNdtizzz58q+6B3y9uewtniv
         84c1sToCxF/bIMmDHtJNylCfTiSP/ISMH+SMCYxothz+k87cvoqy0M5vXAUn4FLzl7y9
         DZhYsMISfOs7GpnuD4KAZcT99gJ7/p2xWniMnxtvrL2N8aj4DaDDhm17cVS8odAjykor
         X2Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9lTiodYCR2SKwzAnJiva4Jddhhz6PR0TcKtMNNBmPypPfDecx61i7SMp8f6PPy8bHiexwVUQX6gYda@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcu35LqOxK8GAHjLWvdTtkCi3yLYZUJOiC/GJXiJ7e9u4VWr83
	EIQKyDoPMRmLpdbzx2LbXIMxAMlBArfoP3newMFnFfQvbsb3WQ8NcuqtKebHGwVioYFFfEub6ET
	tiYjTNA==
X-Received: from pfnp26.prod.google.com ([2002:aa7:861a:0:b0:83a:68c:e1c6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88ca:0:b0:827:2a07:231d
 with SMTP id d2e1a72fcca58-845a26d1fe1mr5396846b3a.17.1782320483693; Wed, 24
 Jun 2026 10:01:23 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:01:23 -0700
In-Reply-To: <6fc7f450-6d0a-494d-b295-297e4703148d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com> <6fc7f450-6d0a-494d-b295-297e4703148d@linux.intel.com>
Message-ID: <ajwNYwsDc2_Vx_kp@google.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
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

On Tue, Jun 23, 2026, Binbin Wu wrote:
> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> > @@ -606,12 +608,20 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
> >  	next = start;
> >  	while (safe && filemap_get_folios(mapping, &next, last, &fbatch)) {
> >  
> > -		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> > +		for (i = 0; i < folio_batch_count(&fbatch);) {
> >  			struct folio *folio = fbatch.folios[i];
> >  
> > -			if (folio_ref_count(folio) !=
> > -			    folio_nr_pages(folio) + filemap_get_folios_refcount) {
> > -				safe = false;
> > +			safe = (folio_ref_count(folio) ==
> > +				folio_nr_pages(folio) +
> > +				filemap_get_folios_refcount);
> > +
> > +			if (safe) {
> > +				++i;
> > +			} else if (folio_may_be_lru_cached(folio) &&
> > +				   !lru_drained) {
> > +				lru_add_drain_all();
> 
> It seems unprivileged userspace is able to trigger lru_add_drain_all() repeatedly
> by invoking KVM_SET_MEMORY_ATTRIBUTES2 in a loop, which could lead to DoS risk?

FIW, if there's a risk, then AFAICT fadvise() and memfd's F_ADD_SEALS already
have the same risk.

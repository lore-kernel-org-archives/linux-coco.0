Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7940D586
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782259769; cv=pass; b=LiuwAUUctW/IHoNZE60iaxfjxH3ym89pu1QezxRJVCEic2aNVOzs5b6p1MCHc2ug0dYU6kUfZi07u00djX4KLdPlhUgQz53q524jukoU+1SVW7BerIztIFlso1Ua3DZw3N60NJuxLK3CPEVCNjABM/UX6pNJGdTE2K6/fh1IZlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782259769; c=relaxed/simple;
	bh=rQfqkBaw/xkmyQgEiFlC2Kezzoeugio7gq7U/cPAgVE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPB1FMLW8v3gHs7goyyVcQ28Nv8DCrjR+4qU5FdNxYyOf94yV9FWYS5+3LTNl4/NQKVEmGlW6L094l/xa1omDqC+4Czc6pAQLt4isNDhI+eeTXK2M9Z+Jha+YLxIlQCRH+UHXT/TR8I7RxPiHYT0M9OWXVcy8iK5s7/q22e4qPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C1okM/3Q; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C1okM/3Q"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-139b5e604b9so540340c88.0
        for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 17:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782259768; cv=none;
        d=google.com; s=arc-20240605;
        b=dNxkGdLlKbO0ddOGYUwuhHxk0Inzvdwkdh5XsixjM7O7C0TVclA7MNlvebUTsAVLgw
         x+ZgGQw5C/Qj55wIfBD0wGvLhTow3mYU1Dt1nQjI40Ph1wm2C6mAY6bFsYjIdMdQqX9w
         D8UH/KbbZC6c8JG5pVRCbkhyXfbsRho7XgDRneGqgKbzcRr9Fcl+XFlgZeLS8BfOgPl3
         Q/CSfMteBTmT8ndHBclTZmXgqPwUOXQ1bquvFNCzs3AloL5aDWdwz53nCi5cBoKI0XMr
         LuamIXoENdqlnYF93MitQxmV2h3z2RKw//aoCW6hmCfEUgR9c6aRsJhNfpAyO/CMd0Hg
         f9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        fh=2WQWgsWzoLP6pu3UIAZ4WGRKCwA5MaXdxGxsq5ZWKDo=;
        b=OYkzOPo6sY50HqG/4ytWVsgjRLWdUhY8Ij3SkcLWbuu/UC+sJDdHS3dMwnUZSKKTVr
         gQi6VhqPygEw+6F41kV1LhV9aoifBga5iIZMtTQ5zSfOVWlNX9/IyjqdPJtTQuBagr2O
         lbAGFoY2P5Wlo1kw8/6pDC6C3AFfrNT6/3/Z1tV1G2JVFx93s4b7kM7ZAgzxZQraLKbU
         8IAoOSsBkE6dGAhCnPVUI2OiAFjSHbljk7A5OhP6GgtNo0RURfRD4KBF3OBHfF39x4Y2
         jYmysRhJuvJOV4PwGYle2jr5hGPQLvdMYLt4uIO1ZJ/AyhL8y6WGkZFos1BH63ozdY8v
         Etkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782259768; x=1782864568; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        b=C1okM/3QxqwuIUh6OQdmXUFG44NWISU606yVMfOXsV7ceks/CBeUoVwPdKKRVYEiRm
         NR3jdNXfPG6GM9ZEbIFACWGuc2sA6kVOcCzR1/ZykNUx9Ew5C22AkxNHlqdlNvOBhwTr
         prU34mWia0zYuS7VSi9dDgFCe/pwKNkhLVprYBz8UGX7oKMDuq6Otd5QQcQDzN6+8Ckb
         qMP+oEYHjo0WtizvpO4zqfwk7deK5VJg4RcleTqaPpSxIKJnbXhrUeLMLglzgUuKcpIw
         kfE2v67Ev0xYFrCgSq8BOW0H+U9cYAhAwGvyymNv/tKH+m0DPOzaDng7TweAhRCa5IB5
         cIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782259768; x=1782864568;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        b=b9VyXJQ1vZ3R2BRoH8u+NZ/YVQPu/46q9sby/x67cIF3D0AlT/vLmpT6aysUVFHtss
         HO2Xw/IJc+jRBaY8vx7QvhssWVT3pPvetHfmEeBOYMFlZAs/bcCHU3Kf007llytWBxAD
         rj96V325WAkV/Y0fZ94NurYfa5Aqu5RdacmaLuulQ7+bmH+6V7T2rD1BSrZCDvcUe1Mm
         +01wUudCgw2S0XIfmYevZCxdMQUskpUV2f+Kwj1+X63TpfHxNk4JwAw8CMhL798ijhtj
         VnsQxjW/qii2QEsDleuoWIxfx2ATrdZxSsWdCJWNZH5Ye2K11sJH8Ld77ZHKqsYy59vx
         leXA==
X-Forwarded-Encrypted: i=1; AFNElJ84VkUZjG5Wu6e+9yqsKw9M3mErP00ellQF+9lnUlCn44KxwER6pZUzxXtCwCfFtYBk7a6dMre3I+6l@lists.linux.dev
X-Gm-Message-State: AOJu0YxLcfc68lSQwWN1MdLjapJIhN+GyXkP2n33Odtz+A1yHoWjQXGc
	LDT+tUQjz0reK3ZYk9f5VvZJSldZCO3FxHNwf69K0CFg+wE0VwunHKWeA2OJAk2Rf0Wuw/Tcvlx
	AUr3kcQUw2moXJbpVoy8W0TV6OTYlCfj5r4nn/1Ec
X-Gm-Gg: AfdE7cnBxOf/xpiTZUOuShkGOE7fyJUUGssOQBK8itiJFRTgSJ44Qq3R6Oo46/Eo4vJ
	ndK31dQJynx4yWBDmr2TFDjGzZTnl6Waivz6elWJlY6g0uDcGboQaDG61MwVexRb28Px2CKDk3/
	g9dwuhqyZE8CjLroQIHvKN8S4v0echLg8dVyFYYXEhyUkk8+X3pFfJ2e+3GNeqIYXpDIh4krmsx
	iBKHRTMuXnhaWGD3gw7f4zYQRSwM47LZmwYfu7VtsAOB17AvSofcn4SCe3jXsx80vjm/KIOQKIz
	2JTakPPF353DslMluRjLShE04OlGi5R95eNNT8awqsWI+h4RAkgPB9tT+QY=
X-Received: by 2002:a05:7022:45a4:b0:127:3f2a:af21 with SMTP id
 a92af1059eb24-139c5cff378mr4117596c88.15.1782259766886; Tue, 23 Jun 2026
 17:09:26 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:09:25 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:09:25 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajnjTJdQKD1Kz3tf@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-1-9d2959357853@google.com>
 <aceb07e1-77bc-49b6-a932-5fd9b5a21727@linux.intel.com> <ajnjTJdQKD1Kz3tf@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:09:25 -0700
X-Gm-Features: AVVi8Cdk7fD1H5RbfHSz0rAk7YN_q01NbBdLx3di9F5nnt4X6vdgAPFTH7tGEuQ
Message-ID: <CAEvNRgFU4H5FrjQvLMQm9DOQ9ujiHfFfsV6zVKNVi-rzC_zSxA@mail.gmail.com>
Subject: Re: [PATCH v8 01/46] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Sean Christopherson <seanjc@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
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

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Jun 22, 2026, Binbin Wu wrote:
>> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>>
>> [...]
>>
>> >
>> > +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
>> > +{
>> > +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
>> > +	void *entry = mtree_load(mt, index);
>> > +
>> > +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
>>
>> If the entry is unexpectedly missing, returning 0 means the attribute would
>> be treated as shared.  And then in kvm_gmem_fault_user_mapping(), it would
>> allow the userspace to fault in the folio.
>>
>> Should gmem deny such edge case?
>
> After several bugs this year where a WARN_ON_ONCE() fired, but was entirely
> insufficient to prevent true badness, I'm definitely senstive to making the "bad"
> behavior as harmless as possible.
>

I guess both are indeed awkward.

> However, in this case I think we're just hosed.  If KVM treats the memory as
> private, KVM will incorrectly do prepare(), incorrectly allow populate(), and
> will caused missed invalidations (though I suppose __kvm_gmem_set_attributes()
> "only" lies to userspace in that case).
>
> That said, assuming SHARED is definitely odd for cases where guest_memfd *can't*
> hold shared memory.  Ditto for assuming PRIVATE.  What if we instead fall back to
> the "init" state, e.g.?
>
> static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
> {
> 	struct maple_tree *mt = &GMEM_I(inode)->attributes;
> 	void *entry = mtree_load(mt, index);
>
> 	if (WARN_ON_ONCE(!entry)) {
> 		bool shared = GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED;
>
> 		return shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;

I was wondering if we should not only return the init state but also set
the init state, but that would involve performing a conversion to the
init state... Too complicated for an edge case.

> 	}
>
> 	return xa_to_value(entry);
> }

Thanks Binbin and Sean!

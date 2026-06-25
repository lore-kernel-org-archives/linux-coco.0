Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6D2773F0
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402030; cv=none; b=ReM9OV/WSUEQ9lZEnJKGEvt0L6+xcZhi1Y1IWy5d2OnSxvedKQUoQjYHSw3B0TyAl04QJYcjs7C4ZC/AQn1tL6/PtCEr/2TKrtxLAnSGlXu4+OD3OcWtAgPpZXo6c2Wnkb1XhaG+ACb77wofgbg8kV5PhpiU6ygi+po5yc6bLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402030; c=relaxed/simple;
	bh=wnycnk35ivpQHERfilV0c1wBVrlSSxbqgktgJps4HzY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FPIo3XzGqVzfVlmXJ8eABd4bPxmUHMvahYLcQKP0AR0NH2w1HOHDg4EXSaqWcGecSlLoSgWNpzBclL09S6bs/L/oWtY43iBOwSwJFdP6dlMHisOIYXyXIKbl2sR19oqN1E9wZUgK7t6iDuZKZO9hPvY34jHZPy6lPqvBt1Jzce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G0jmfOTD; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0jmfOTD"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88fc985a65so1415889a12.2
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782402028; x=1783006828; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Itjo2jMjkwhBM0k9+OlfOfXdIDoAWufeDNJNDd1hXfc=;
        b=G0jmfOTDjpNn0i83VVufcVpKe19teMWzTPNBUF1HptzjkNOuWZFck4ETqcJZ7drtTu
         RvyqGLKJk11LgvDJXVXM2TRv2IiFsjBHOld4my1+NjrgfLJXwiS7RKha8sUQOv6r2Bre
         S1t6+WyG5WlnHCNuPhHq3WtgEJ5lE8SJym+Nnha8vfneW9H9eXgqfrmXfWl0jpdQfWZe
         C8BkrDWCai5EUW14acjsUhuszevRCoKtoXWlYIbgpG5sFWTVCImowhYL04VJcTB7P5jm
         babx7EwTUifmLucE5FQmWRmgmDTfMtUJjnXz9+XV4qvbml7fR4UMDEQ62OhyqaQ7g8nj
         jNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402028; x=1783006828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Itjo2jMjkwhBM0k9+OlfOfXdIDoAWufeDNJNDd1hXfc=;
        b=OInWriv7n7fgM4pM2LRr4Eb82+G81vgAoCOjmxPoS5xjREx8lolNqh6q0E+qskXCWx
         sF3/eijYDHa8wzTPDFRTRiRleeYcvvm2ms907v8ixxfUaeHnJFwCmZcrAJ6iNEnkx0b1
         fao+Csy5EjBt8XB7CvwgOMNw4vBSFLkGkj5aseGDae/c1llTyOg7lupxmNmEbwAIOopj
         ZIKLUChFFeUbjbRCzhUeRUhWZwV2OJ090esk9dyfFWm9JVdbAa/GdVG1YLmYfurA7jdU
         /bAUoGAZ7lD37U6UskEH7Zx8mMWnm2rveJWoZ6t/rIprT731S/x4Z2qBB6r5B1F4vqff
         /Mcg==
X-Forwarded-Encrypted: i=1; AFNElJ+IJJP4uC1QzqZfZIhLgWifbZvLrvJ3BfrTTVG6uxTYdggmZanLf9BL/6YaS6kHZpaxZ1tdI1uMHrX5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5OFsu2wZ5lMGVahguzmMy91V5upkBq01lk/5O+N5GmhyfcfFt
	P9fN2wkwApnuUTn3AxNNuaSIsVALEj0F2kDykcmih5CoeasGP8VHe6IN06e7R1vTs/+uJpyyNEI
	WvdmQDQ==
X-Received: from pgbdk2.prod.google.com ([2002:a05:6a02:c82:b0:c85:9dd2:d11e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cc97:b0:3b4:5c6f:cf30
 with SMTP id adf61e73a8af0-3bd4b25b347mr3615613637.38.1782402027934; Thu, 25
 Jun 2026 08:40:27 -0700 (PDT)
Date: Thu, 25 Jun 2026 08:40:27 -0700
In-Reply-To: <6ed7d12a-c3a1-4572-8385-754e6d5b8b44@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
 <ajwMYCSrPlxg-Fok@google.com> <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
 <ajx3vmNPRf-M9kR6@google.com> <6ed7d12a-c3a1-4572-8385-754e6d5b8b44@kernel.org>
Message-ID: <aj1L626RI3Ty_hh3@google.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
From: Sean Christopherson <seanjc@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
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

On Thu, Jun 25, 2026, David Hildenbrand (Arm) wrote:
> On 6/25/26 02:35, Sean Christopherson wrote:
> > One thought I had, to avoid the IPIs that draining all per-CPU caches requires,
> > was to disallow putting guest_memfd pages in folio batches, e.g. by hacking
> > something into folio_may_be_lru_cached().  But due to taking a per-lru lock,
> > that would penalize the relatively hot path and definitely common operation of
> > faulting in guest memory.  On the other hand, memory conversion is already a
> > relatively slow operation and is relatively uncommon compared to page faults,
> > (and likely very uncommon for real world setups).  I.e. having to drain all
> > caches if conversion isn't safe penalizes a relatively slow, relatively uncommon
> > path.
> 
> Yeah, the lru_add_drain_all is rather messy.
> 
> We have similar code in
> 
> collect_longterm_unpinnable_folios(), where we first try a lru_add_drain(), to
> then escalate to a lru_add_drain_all().
> 
> Maybe we could factor that (suboptimal code) out to not have to reinvent the
> same thing multiple times?

As discussed in the guest_memfd call, we should do this straightaway, i.e. instead
of merging this series as-is, so that we don't export lru_add_drain_all() only to
drop the export a kernel or two later, and can instead export the helper to drain
any batches for a folio (or set of folios/pages).


Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA7A351C17
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347721; cv=none; b=isCfohZGrnrP7voQ4N90duadHvsRfgO4dGrbBet9tKQCA4fbr9zHCmc1q48/6kRgQ6LcYogtayyf0xXXPhL/ZDGF2113cXW1U4yIyf4v1rOvkxNc/A37jaBrbl5CASm/pqzQoRDfyQdafZxfpDg/od6N+4J36tcKzxmqATYYV44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347721; c=relaxed/simple;
	bh=f4AREVsRHfiF4PAbuxnn5TgCeRNzuQ0Pw+TvIFB8YS0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pcxMvlW7m1kPoELGVO9mN74Zr7eUC9S2yLIhTZFBMHcTMI5RXYYjWskdalylPg0dezf/rfTNVyrjuNSgg+sS6PDUtIxfjcG7SRBKXK3hcgboaFfwv/bQ+E0zLBKf8Hg9QqoO+jFuHPwVed+nCLISlyXGgsZlSWIH1YdYoAmXLTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SeHqsedZ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SeHqsedZ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c7f0d806f2so7364245ad.2
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 17:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782347712; x=1782952512; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNahi9jo3ln3x9OacQs1ORbpzN2GfmnsobY71bssZU8=;
        b=SeHqsedZlSKiTRQXc31CN7ButwJ3V98hnqfIUNiZ0y+kmrO5vsLVxf0tTQk+PajZOy
         IHYBE92HIsEk0Ox66OIGjoov+uF9m4ieB9RMhM3KY/NPH4SQCdXUVmeH05IzDqhtkjiS
         0fuu/BW3JGjAioK6E6F+9t0KATUg4Y/rZguObbS59X1uQ05ZFbxM6if57ruKNSW8HTsV
         /2QkrmT1P/AgmORyJGcRUhuM17l7ZMqv6ZqVwJD/YIbizOmi5StO1YoOH2H2dtfXHeMz
         NiGy1sQW8Jn+z8EAi/467EkI9zvegoBIkRXvXlywzyxdH2CEcKY7z0FoEg49SV8Go/rP
         h0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782347712; x=1782952512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNahi9jo3ln3x9OacQs1ORbpzN2GfmnsobY71bssZU8=;
        b=lgFzD5CauKbsaGRO0Un0jvAy0IDaU7n+fLSef3ra3ai4+5c4RrBeaprX1vyROc7IoI
         CaQCmTUu2s7bsPk7xMQE26cHB03/zQi184Kj3mjJrV0T3JJcwFES/d7KGB5HEM26vj/c
         b8kH71L0DTzwM2gjDNDqwgncBs3MIS7OkEKNMiskYUP/cP9EBxV9XXg0L9NkXnqF7gJi
         HBmYyC6PEBh/ujRyrS3TRAztGq7rapH0yL9GK12VgqlbPA2GrMZBcXkjyOtFCl6wM9Vd
         fUch8ddmxamGIHEMIM705eRWTA94GTTLGh3vOw3+A9UavHjEj0//6pyO8oWKOxH+2FQf
         JPtw==
X-Forwarded-Encrypted: i=1; AHgh+RquNacjlF6ITvQOXUd4ByE+m6Llv8PrJwWQ6QaC59farThKv/g/eBhYryddtiSFWrctTqF/gAVLJHJ1@lists.linux.dev
X-Gm-Message-State: AOJu0YzWuXtdQ5ZR7SSlMTJYzNoqZVce8JtzWaFgfJnBNsIOyHefXbTD
	jO7VHDAsRJJxNAHR4Vwm1+qP+6rIf/lSV74lw3wsyw2hlSFpkgItZvprzFgEqvH6ZmnONQx6VBl
	QXW6EHg==
X-Received: from plly17.prod.google.com ([2002:a17:902:7c91:b0:2c6:bce1:2477])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce81:b0:2c0:cf44:3b3d
 with SMTP id d9443c01a7336-2c7fc7579b0mr4179365ad.26.1782347710976; Wed, 24
 Jun 2026 17:35:10 -0700 (PDT)
Date: Wed, 24 Jun 2026 17:35:10 -0700
In-Reply-To: <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
 <ajwMYCSrPlxg-Fok@google.com> <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
Message-ID: <ajx3vmNPRf-M9kR6@google.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
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

On Wed, Jun 24, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Jun 18, 2026, Ackerley Tng wrote:
> >> When checking if a guest_memfd folio is safe for conversion, its refcount
> >> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> >> temporarily increases its refcount.
> >
> > Under what circumstances does this happen,
> 
> It happened 100% of the time in selftests. Perhaps it's because in the
> selftests the pages are almost always freshly allocated and so the
> lru_add fbatch isn't full yet? (and that the host isn't super busy so
> lru_add fbatch doesn't get drained yet).

I chatted with Ackerley about this.  What I wanted to understand is why guest_memfd
pages were getting put onto per-CPU batches for lru_add(), given that guest_memfd
pages are unevictable.  The answer (assuming I read the code right), is that
lruvec_add_folio() updates stats and other per-lru metadata for the unevictable
lru, and does so under a per-lru lock.  I.e. we don't want to skip that stuff
entirely.

One thought I had, to avoid the IPIs that draining all per-CPU caches requires,
was to disallow putting guest_memfd pages in folio batches, e.g. by hacking
something into folio_may_be_lru_cached().  But due to taking a per-lru lock,
that would penalize the relatively hot path and definitely common operation of
faulting in guest memory.  On the other hand, memory conversion is already a
relatively slow operation and is relatively uncommon compared to page faults,
(and likely very uncommon for real world setups).  I.e. having to drain all
caches if conversion isn't safe penalizes a relatively slow, relatively uncommon
path.

If we're concerned about noisy neighbor problems, or outright abuse, I think a
simple (per process?) ratelimit would suffice.  But it's not clear to me that we
even need that, because there are already many flows in the kernel that allow
blasting IPIs without too much effort.

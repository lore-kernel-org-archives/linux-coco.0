Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E101F1534
	for <linux-coco@lists.linux.dev>; Fri, 26 Jun 2026 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782500803; cv=none; b=U/BchWCiqc4DP7YnYtkzruzvpzhy3WxsgvbWx62lE9wt36Jdzs71y87VVXhafzNi2PTbAfG97xTrfZU5ZGek5hJeKbUOJkBY4nwubwMJ1vKqIAicVL6F1HdhkDhHt4mDln5EwysPRICbezxSdopke1+U26RLWM0uFKpcW38Nej8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782500803; c=relaxed/simple;
	bh=yPh5VyRHofHYz39WBgZG1T4p4iniLMrobeV7zGwnRA0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b76em3ZhJROWC4pMAoqf8aa5ugE6NZn+9GnWUNx43i4O/x4Tc2+Zrp3H9PN7Dbo68h1zgf/xCmFEdVH6Y8GGqewBoU+VBYWoEzFYMqCzG5Q9kzfrjmAXkGJwmE1Fpq8a0T2Fn1OYJxY8vZ+V8PtHP71XZGfA4E09pT9XfYAxuXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R+L+Mfk1; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R+L+Mfk1"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso689728a12.1
        for <linux-coco@lists.linux.dev>; Fri, 26 Jun 2026 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782500802; x=1783105602; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNIeHjjlzgODJP9uSdZfrjN2ZSrm2/bid/6mJJUT1aA=;
        b=R+L+Mfk1SosnaRV48GVOu2JNVeioNTOD6vk7Gd6OhNsCP59KdEF/LqgYwnbLEicxze
         cvuBAblLfKVvFdTR0MfGne12pqm4qyKXZe7cDSx/Y1hb16oDo+VGGClaP6ZVw6zShd3x
         fYQfnED6l2HdChrOuOqQo4ESyh12SRUMTxjD6x/NZ/uu0WQlaZZNhpfxDqrGkuqXFkA9
         ezgkp+XjFILhhmZYw6C4dOyb6Z/Gk3ojyxxZIL86MA2dy5KXwvjRzTXy/AZ9OwTveiFc
         C1d1xKunZ/bm25hgP0B/gYHOhFDOOSBMYuKWW7XBjPAfZ0MJQAmbrvn+xvl+0wwqyXkm
         qHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782500802; x=1783105602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNIeHjjlzgODJP9uSdZfrjN2ZSrm2/bid/6mJJUT1aA=;
        b=kj7xEXyC8uXWjQOws6j3uWODuQMTO+Ang0R3zyjtu8Tv6BLhNlQmgjE6EegIAGDrpV
         5NLHDiiR9vDlopizIJ8+phKejooUN4Jq7RqoSbkuLiOwQeThudt4EJDE094e9dRuygT7
         H2bLAyDLbz2b04faM4MuTPQymyyNU90xhZYLxrSZyNjIb+St6pkbg8hmhuZ1zpb8UUW2
         brf49vaCzdsve3YkFyYAAbFeiPLyDstqfpsZ5kxs7zdVmW4DfO0/BH2kHTLC+VVqLvYM
         EpfPOZhdCTE2XAOWFfbcDI9NFDe9+gVlKOtEhPreKkjtLuhp6ePxpJgW98NISCLZ4eYq
         MWRA==
X-Forwarded-Encrypted: i=1; AFNElJ9doClZ9Q305Dqvebx7OnwdgT2TU1A4VkWZow6gRR635BFeDFZ39kIIncE81tezCVb3lbP3toma1Ur1@lists.linux.dev
X-Gm-Message-State: AOJu0YxtHCj61TcYhQ5BwkmFQSKE3g0R2PeDVmFcZPz6OAU5DhqCjZBi
	PWWZi/IJ3BFDFkIwjyx1AHCF+KkE79SoNWyyAzpwZpwo1lafNXvSX59lV6SDnzYWNIPdtfuH9q9
	ib4xoVA==
X-Received: from pgbcu10.prod.google.com ([2002:a05:6a02:218a:b0:c79:7778:c050])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b40b:b0:3b4:87c0:d7f
 with SMTP id adf61e73a8af0-3bf69cca854mr1600938637.32.1782500801179; Fri, 26
 Jun 2026 12:06:41 -0700 (PDT)
Date: Fri, 26 Jun 2026 12:06:40 -0700
In-Reply-To: <aj3H2sxymOYTWTnE@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com> <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
 <ajx5Vrz9ma--hrGH@google.com> <ajyJhZcgfYFtGfS2@yzhao56-desk.sh.intel.com>
 <aj0Jf30PS2f7x1nt@yzhao56-desk.sh.intel.com> <aj087H1UWSFxbShR@google.com> <aj3H2sxymOYTWTnE@yzhao56-desk.sh.intel.com>
Message-ID: <aj7NwCRwWEfLK-gQ@google.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default\
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 26, 2026, Yan Zhao wrote:
> On Thu, Jun 25, 2026 at 07:36:28AM -0700, Sean Christopherson wrote:
> > On Thu, Jun 25, 2026, Yan Zhao wrote:
> > And I'm not remotely convinced that prepending allow_ to the param will help
> > end users diagnose "unexpected" memory consumption, in quotes because anyone that
> > is deploying a stack that utilizes out-of-place conversion absolutely needs to
> > understand and plan for the additional memory consumption.  I.e. if the memory
> > consumption is "unexpected" to the end user, they likely have far bigger problems.
> My first impression of gmem_in_place_conversion=true was that it enforces gmem
> in-place conversion. However, it actually only enforces per-gmem private/shared
> attribute.
> My worry was that people might think it's a kernel bug if userspace can still
> have shared memory from other sources after they configured
> gmem_in_place_conversion=true.

Ah, I see where you're coming from.  FWIW, truly enforcing in-place conversion
is flat out impossible.  E.g. userspace can simply replace the memslot, at which
point the memory effectively reverts to shared.

> However, I have no strong opinion if you think gmem_in_place_conversion is good,
> and with the above documentation. :)

Ya, I think this largely a documentation problem.  I agree that a param name
like gmem_private_memory_attributes would be more precise, but I think it'd be
far less informative for the vast majority of users that only care whether or
not KVM can do in-place conversion, and don't care about how that is done.

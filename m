Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F4371D1E
	for <linux-coco@lists.linux.dev>; Thu,  4 Jun 2026 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604432; cv=none; b=opmMdjAtCr+bpuQmAZWnpMnh/5/8MnrJALOQfU2exHDgvwuhaJecHA1XDQlEmG++PFiK6OqY8Y4xb1ZNlyJKPPV6cWIBApvy8SMc1jIdoT9RhYLyF80oHbqSgZJyXkMtJFDswFaBHvY/dm5goaowVCHi271nrz0c8GTYRKQqJgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604432; c=relaxed/simple;
	bh=uDuzNTF1ZSyLMYiOoa+3kMLHWZaw1Jm0DeWS6NCT25U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tui3OdB3EGsqXsnMzRhEx2E7JG4jcfBSpYK8NWCg+TY1+zCpME39NlfDRGg29srTc3QMb8GtWeEBjIK7Yu3d6KQqkb84uJm8WuA1qG4gTYB7adRTeYByGoBZ/H62NQCYQYTv9MqDmI4fXCa9BRim7cAl8YQ/aoONKugjY2Fy8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mudhfrzf; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mudhfrzf"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36b9d265308so900535a91.2
        for <linux-coco@lists.linux.dev>; Thu, 04 Jun 2026 13:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780604430; x=1781209230; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgeZ0o5WGa6wb92jyP428hFVqKsbxK2JJNVhO+w+THo=;
        b=mudhfrzfSdJBAMpusk6MYbkhYp25N0nhlts2x07yaZYHYh8XcJuWYtPuIFV02dvNgG
         oYkB+wjgBKOULh8FvDkY06g723ECZjnLaUCrCC3Q9oXS8YTPD9kDHchLTg6JrWwpww54
         yZTlr/YCzo1KvU9cbYbt3iLJ0XnxmJAxfLAwXoPeARrPgQX0SHg4EEzXOI4pxZX/pxNJ
         rWZWbsCA5LRVI7z53smXYsSCJXbhTIgH0swnmpOBxgRZXgE3FN2P+RL6q3dU5x3xPS9m
         OwAnIyDbgPlFCFMrf82SRaARlD6xXB/qn1JRGqt76NDpHmMU6TCAqRUlT5LjilA6zPLn
         agog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604430; x=1781209230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgeZ0o5WGa6wb92jyP428hFVqKsbxK2JJNVhO+w+THo=;
        b=FasyN+wV4WlKAE1tsUHab7MZw9MYFsHrhe/vR/jCQpIy6MXZNuVt35bXYJFlmC+42G
         SZry2Xk46gtEQBBDZvPCCXZkhmI5INhRNiMdizBsG2zqofZw7L13Zq4HxWe2J09REFD5
         Eij874cW2ObbjXaU5t7Nya/q3iGtZxQRVVf/4oZ4l+/cfH8Qs2aj4Snrmc3diMbzUwFT
         gqt6ZJqaDsbKlcIkNxfpIZaxtC6vtfbHetuGGi8CHjO7aCftWG9l/QMFcbH3OVCDD0aB
         U8suUWuOfPXFXG6AibHxmf0Twl5//jN/LLrcLeKBKCb0+o9CtKU331pQ70db0YgmnQGo
         CIgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lrDqtQhIIvR2pPmPXTpcZAJ6fGnziMOG5xBoyCWo0A3DcgBb0uHOtK0FGX7Sju8otG1IGv6OGBuIl@lists.linux.dev
X-Gm-Message-State: AOJu0YygnHKLc5pB+OyERRBIbVidDDIHvOnMpdCq+R85a3uZK0+o7Q6N
	H5g2XHpOyyZHPcqs25AJyjoWAgkSh1SQbZP2t1qe+xanAOY2/bA+/KDeuyEoBXr4JRjypIuMNuS
	ktGIQww==
X-Received: from pjao2.prod.google.com ([2002:a17:90a:1682:b0:365:d2b3:f703])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b04:b0:36a:5d1f:7b6
 with SMTP id 98e67ed59e1d1-370ee5444e7mr546764a91.2.1780604429941; Thu, 04
 Jun 2026 13:20:29 -0700 (PDT)
Date: Thu, 4 Jun 2026 13:20:29 -0700
In-Reply-To: <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com> <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com>
Message-ID: <aiHeDZEPkAcWcSkn@google.com>
Subject: Re: [PATCH v7 00/42] guest_memfd: In-place conversion support
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 03, 2026, Ackerley Tng wrote:
> Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
> writes:
> 
> > This is v7 of guest_memfd in-place conversion support.
> >
> 
> Here's the outstanding items after going over everyone's comments
> including Sashiko's:
> 
> + KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
>     + Need to move page clearing into __kvm_gmem_get_pfn to resolve
>       leak where populate can put initialized kernel memory into TDX
>       guest
>     + See suggested fix at [1]

That fix works for me.  The initial guest image will typically be a tiny subset
of guest memory, so unnecessarily zeroing a few pages isn't a performance concern.

> + KVM: guest_memfd: Only prepare folios for private pages,
>     + s/non-CoCo/CoCo in commit message "INIT_SHARED is about to be
>       supported for non-CoCo VMs in a later patch in this series
>     + Use Suggested-by: Michael Roth <michael.roth@amd.com>
> + KVM: selftests: Test that shared/private status is consistent across
>   processes
>     + Improve test reliability using pthread_mutex
>     + I have a fixup patch offline.
> 	
> I would like feedback on these:
> 	
> + KVM: selftests: Test conversion with elevated page refcount
>     + Askar pointed out that soon vmsplice may not pin pages. Should I
>       pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
>       take a dependency on CONFIG_GUP_TEST.

I'm not exactly excited about taking a dependency on CONFIG_GUP_TEST either, but
it probably is the least awful choice.  E.g. KVM also pins pages is certain flows,
but we're _also_ actively working to remove the need to pin.

Hmm, maybe IORING_REGISTER_PBUF_RING?  AFAICT, it's almost literally a "pin user
memory" syscall.

> + KVM: selftests: Add script to exercise private_mem_conversions_test
>     + Would like to know what people think of a wrapper script before
>       I address Sashiko's comments.

NAK to a wrapper script.  This sounds like a perfect fit for Vipin's selftest
runner (which I'm like 4 months overdue for reviewing, testing, and merging).
If the runner _can't_ do what you want, then I'd rather improve the runner.

[*] https://lore.kernel.org/all/20260331194202.1722082-1-vipinsh@google.com

> 
> [1] https://lore.kernel.org/all/CAEvNRgEVC=fFuKVgZYvWyZD7t_zvUZihFG8hrACjvtkD5cwugw@mail.gmail.com/
> [2] https://lore.kernel.org/all/baa8838f623102931e755cf34c86314b305af49c.1747264138.git.ackerleytng@google.com/
> 
> >
> > [...snip...]
> >

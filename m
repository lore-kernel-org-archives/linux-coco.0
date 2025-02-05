Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879E1FECB9
	for <linux-coco@lists.linux.dev>; Wed,  5 Feb 2025 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738793603; cv=none; b=hJBztBzjiCUo+7PhUF4vNWjNbINLsCgZMPNqtrT+9zIIb1Hy4DQBXy3uxssxon3UE59med32dNjoWFsQqnry+w2vStbK478i2YeKkgi8koZs3U7HWhN2SGTUIn9DbErf752wKbBXjc9U2j4yWsITspHzWHcVOaaX0OT5laIAGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738793603; c=relaxed/simple;
	bh=q7L8AfCkoiRYk6XD0LRMspwgS/hS3OT1u+Pk97yLlzY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YgEb+1IkUgZqqKIh8Xu+ViNSfrkxQ6w0i5j7V/t4wVwlAdHQrFmvlzfMN7acEu3LW/3vuj209L+Rqf7A2leztewH/3KQWrGSsAUpBChaiOlfo/NIzCReECkR6QG7MxUDK+6VFEcJrK1onDvzvBwtSYrHsG4/4B92d4Q2DUKRUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hdFLoNMD; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hdFLoNMD"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9cf77911eso453202a91.1
        for <linux-coco@lists.linux.dev>; Wed, 05 Feb 2025 14:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738793601; x=1739398401; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVdg6lU59UKb0/TD/si7cIrxJXLN5wRx2BqZWD8EZQ0=;
        b=hdFLoNMDTSJYVQV4cDmGtSGqDiWQbcxeoUgksLrhhHqlRlugOjiNsVDYfM6IlxKghJ
         aMDjQ2vuhnrfn7fkKzHDmmMwCq2yPuqpTZe9wcb3NWeRkYbL4+6bYQdp0M9beT5+ZSik
         pCeAkH+3ZuWr3+9SFpBKGChU1L2I116C44fCdEkwLccwIAmcyhWM8dyhWwXh3/TpVLB6
         4Guan4sJbo6kCtE1ffUjEpLVGUUU8PE/ycK2WEmXjWKkScRDA4AQ0F4SjKuXt5jyPLxA
         CQuTMKBGP99o0i7EolB6kelfLJMnIs3mXzfVajlLgxYHpdrBX7kg9d1BY5oZgyqBTwIa
         xXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738793601; x=1739398401;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVdg6lU59UKb0/TD/si7cIrxJXLN5wRx2BqZWD8EZQ0=;
        b=AOW/UAhbdMM6ECo68VOuQKO94DcnfRdFP74qC4SRMbV6/ftQxn+5+5glo6/XtDl3pn
         64m3ZNHZ8Pqj9+nHLdXMNs1ySqgMabrZ8HoUdSddCsM8hH2Q7+x1phO9VexA7pETow1i
         XOM1HMMRAPz8S072bOZoErPTXGYY00eBiWdWPylT95KHsXIgCNGM2ZdNkihtsIL1W/lE
         sxLNDLpKxrM4piHUn07uawptaKORRTBczdb7RKU73NduCMnTj6aR29xaLw0eSDkNnTXZ
         2Rue+dJyvCeyH+urkvTzFS92VJBqbnxbwORQ25opxnkiF2HgGxZmHEoFjx4SVeWxK1rV
         Ga/g==
X-Forwarded-Encrypted: i=1; AJvYcCXIWSb7IkgBeEcoJi79r/S1KnF8rDqGT6klfIRamCGs83AMhCRzrwTdBtS7KP1FSEBcolPNZ1BsVOxG@lists.linux.dev
X-Gm-Message-State: AOJu0YyrYfOHur/jKucTeVJd6RpmUVxhn91VI0JdUwWjGZl89Gpewwfs
	kUx+VwsxO5L3knYOLWPbwEEvKGzA3FI4XEoRyZ8GQDhESxwubEPlqvZcF3JMrzoGOKUDv1QF9dc
	H3g==
X-Google-Smtp-Source: AGHT+IEzBJXIxqY+Exe441l1aJjABmGJq/OUJpRwmw6f4+fEJCNQJEg3bbzDZBjxuP/ajdzYJPIfpzBr2jA=
X-Received: from pjbsi5.prod.google.com ([2002:a17:90b:5285:b0:2ea:4a74:ac2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e707:b0:2f9:9c3a:ed3
 with SMTP id 98e67ed59e1d1-2f9ffb7ba78mr1633015a91.16.1738793601045; Wed, 05
 Feb 2025 14:13:21 -0800 (PST)
Date: Wed, 5 Feb 2025 14:13:19 -0800
In-Reply-To: <20250201021718.699411-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
Message-ID: <Z6Pif2CFE0o1eOnj@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jan 31, 2025, Sean Christopherson wrote:
> +static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
> +				     unsigned int *crystal_khz)
> +{
> +	unsigned int denominator, numerator;
> +
> +	if (cpuid_get_tsc_info(tsc_khz, &denominator, &numerator))

As pointed out by Dan, this is broken.  It should be crystal_khz, not tsc_khz.
I fixed the bug in my test build but clobbered it before posting.

> +		return -ENOENT;
> +
> +	if (!*crystal_khz)
> +		return -ENOENT;
> +
> +	*tsc_khz = *crystal_khz * numerator / denominator;
> +	return 0;
> +}

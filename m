Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D24375F88
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 22:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314647; cv=pass; b=hwJxxn8lWSZ6eLxePu6Hgi0lULIwPKfzGIZOPp7GBTPHJn8Jx5oXs9BzudtTeUXbmf3/rOULgOSDENx429fuj+LXylctGrhL67MnGixGOMMTSicxuRJRvJPI2LOp63ai6myq93UpiJRPAgqhGnhdNE6CvpNpUu8RFe/hz+3Axqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314647; c=relaxed/simple;
	bh=o95rfOHFgJHNn7OjrZb3oTyna54O2JGL22GSkfMr7TI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KT0uX4lBfqNcg6vniuTBMvtrok3gYKZuK5TdJaLSRxSyLrDopS0L+Mq2THqq7+81qz95AFFiUfRyMn15ep62svujZoKDH8hAFGNHw+HmXh35gw+eOgw0QYk0xQvy4NK71efci5DFew/csoa/aM8IV6kqA/jUQoF7hvh8fqnmOOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PfFhmveB; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PfFhmveB"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575eaa32c7cso1820930e0c.0
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 15:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779314645; cv=none;
        d=google.com; s=arc-20240605;
        b=O4Dm5EagEDsBIXAg+52AYrqvFFTRVw7lheA02c8gQe4LPuNPlcladM0buvCoFi0k0z
         VREQFo9FpFFrWV0mNDo/1wmStKpa4NM5wfPWnjwWKhvDedraf2jToA9EjmzMRGhwUaSd
         hFIgDCr7Qn6NOmaaLQe6gp9meZdwgPH6NQviqmSold5YmZqFdA6Pd5pfkMXWBOuHVZgX
         YeJKcEd5kVodXHjHQHJYG9o8X5dS8DLQTW+FlEW6Q+lpBx1INaXSeVSWj4zCqXiCyyoj
         h6WdSaKuR8mArI20+PqnGZ/n5SFwcE5MaWKzestS2NoNrm0buockK76Y2h0nRdchtVsx
         u0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=9JThRUESw7nrWZ9dm2cNUbYGQDtPpp53TQuS0A6S/n8=;
        fh=jdho5rfir6SQrob3btT1hDhic5DVEZ7+sLjheUOGt64=;
        b=FSOHHD4bA5WU5vkZAqUU/VqkZG5aB/SLAQf40wdpbFnZE2jcCz3SrGQaHQLJzSRP0Z
         NunUVuc7O9UK4nv2bneY9xreliEAjuhXxwPq5fDYKrFMnHCEFTwny6/hEWnMerettYaV
         L7qrn2lvTGGQrGxqOPR/58mZp5v+Ml5TuRrrpJVY3dHefxcnuW86n32Zu21ezSYv6Cp5
         Pft/ahMb/FjFmLkCbJXKnpmZYm7/9bNPF1kzqXJB4QC/TTmZhiPilgfLpK9iyiBmsd+Y
         p3tjOwye2vLFopqsHJOIUuEu7u31YmYQIVLnEx1LPra2IlLSAF6LzMmspG/57j2mYov9
         sBQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779314645; x=1779919445; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JThRUESw7nrWZ9dm2cNUbYGQDtPpp53TQuS0A6S/n8=;
        b=PfFhmveBwojmK10Ivhu8KqWfHc6zfrHZJZoA740ZLWdko5hIWzS9Ha6DtzLzGg+Cnp
         BejA9OyBtDpeZwSYuqH7tSFZDs7mzGVCrFdvAY5kxJBK836SOc8szAJ5fOHDOgd0tyHZ
         S/eYNWrcL1XmQYX7POjMP791liphBP2fJyWrAlkYWFR/alcyX8p5DoJkep4hdtW5daG3
         54oQfYlU2jSc48Ob8Xt8Gy074XET/4P3LH1L92Ed7KErgxch7FmRFJD2yXJwRwK+i3Ut
         /V2IkhkRoLOaAMkqMIOTAU1cXsYkLrUhIr0hDMwEccQMgK5hvpwfPBdpLxszh0dEVEmD
         8LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314645; x=1779919445;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JThRUESw7nrWZ9dm2cNUbYGQDtPpp53TQuS0A6S/n8=;
        b=m9FDIlGpw5Fwkc7MIhBYXFLi61TEmtit6H8iC0q/cKzqCNgs+/Cy6dlfnnrMmunAi+
         9B5MW1y+OAvefLOWOFZvUQKKiaTEFY38hrxRHevHn1rgbdiwaV3+kpaJ/KjSAwyx5GtJ
         sY69wzdAczRg67oCKndkwwQBsl4jQvuIAmGWtsgQxSsYA3ZUU6vmfRrowBg/KslwXXy6
         Ov3SC02VU6wsgK7F7Q07f1OF7KIRChYU96nncpHv1xl8zGmzjbjMwfLm09/Ir0vF5mjX
         jljUwyPpCG73oKE/5vxpDaWDFBAA3sSjpWpYdvT376lwQNxH1l9Gg6Y7OkVUl4G0tVsy
         KcDA==
X-Forwarded-Encrypted: i=1; AFNElJ8hIsxtXYgZH9Fzk9nUUN2TXO1xYqridpxydnfox4/Kq1oV7CIX10yzWa2BRmQkykU5KNPaYKQJWESr@lists.linux.dev
X-Gm-Message-State: AOJu0YyoB7dfvYExB5lhOOAnBJVI1SqIFrLaZVhO/+MRpGkUA1+kCf/r
	o1OBLnb1vOzECKAHDae3Z9EF8Db3/DunEPag2TPL+0bhc/FLnd22rSJDqEOZMwiliGb8/H3KJJm
	OiBT7brBDfPYDR8gJfWuN7ABtoMAuHc+2aS5v0B8Q
X-Gm-Gg: Acq92OEXtxn4edek1RcXFYubg5HnXkBVHP6S2rbecawvWVy7CYKKKl8SPKr0UXf8fsT
	CB54vdhOeyoI9kIIHhi0IUT/u1HOuZDwwE0T0O23QvdnJZSV5xm9tBPlh67BhtiNYcZr0uPXeGi
	d+6fcQGyq5sOqyFIPVc0yBaHqbEo8I+vAz83VbZIkfiNsnolgtc3vaFmnSuostT5+zgZxAqmrsG
	bE31Fej2XWr/bXLESbDjTqMyzG2t1gLePh6W7DY5UK41dSvAE4o8LgeheHlYUsBXwAEGsc2M7xP
	JIorUu1fSOh9dFo2EI+/uL0ptAvZf37+kA/H8jdcqzAdCQyoDDW4JCWetIyMzTWbBt7HTxrzXFR
	X2IMo
X-Received: by 2002:a05:6122:c87:b0:575:a6f4:46b4 with SMTP id
 71dfb90a1353d-5842700dc5fmr95996e0c.9.1779314644642; Wed, 20 May 2026
 15:04:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 15:04:03 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 15:04:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 20 May 2026 15:04:03 -0700
X-Gm-Features: AVHnY4Kk5AWPmehPTXT0rrzakigDAOdp5MPH9_MZKvxVyYhTvoPj0_nMCwFjLrY
Message-ID: <CAEvNRgGfWNG_NgC7v70BsZ3CJUu2Nh0KQQBwDdDrcu26=cB92w@mail.gmail.com>
Subject: Re: [PATCH v6 20/43] KVM: guest_memfd: Enable INIT_SHARED on
 guest_memfd for x86 Coco VMs
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Sean Christopherson <seanjc@google.com>
>
> Now that guest_memfd supports tracking private vs. shared within gmem
> itself, allow userspace to specify INIT_SHARED on a guest_memfd instance
> for x86 Confidential Computing (CoCo) VMs, so long as per-VM attributes
> are disabled, i.e. when it's actually possible for a guest_memfd instance
> to contain shared memory.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  arch/x86/kvm/x86.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 1560de1e95be0..6609957ecfea3 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -14172,14 +14172,13 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
>  }
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> -/*
> - * KVM doesn't yet support initializing guest_memfd memory as shared for VMs
> - * with private memory (the private vs. shared tracking needs to be moved into
> - * guest_memfd).
> - */
>  bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
>  {
> -	return !kvm_arch_has_private_mem(kvm);
> +	/*
> +	 * INIT_SHARED isn't supported if the memory attributes are per-VM,
> +	 * in which case guest_memfd can _only_ be used for private memory.
> +	 */
> +	return !vm_memory_attributes || !kvm_arch_has_private_mem(kvm);

Adding a note here from PUCK on 2026-05-20:

Michael pointed out that it's odd that when vm_memory_attributes is
available, guest_memfd still can only be used for private memory.

It is a little odd, but we don't want to investigate the complexities of
supporting it, and Sean says this is working as intended, in line with
deprecating vm_memory_attributes=true.

>  }
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
>
> --
> 2.54.0.563.g4f69b47b94-goog

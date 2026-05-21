Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA7C346FA7
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353646; cv=pass; b=gwCuNLYUyQplC+uu6aZ3wwY8OSVGG7lmUMMqnlFdTUJCKnNX9bNK4h0TRJ/nKLmnP0TIE4F2mD5XuiVI9umNBG1A2YhFCeJ0nayDEjefRdzouyb5Rs54mxuP9ZpSVtm16viTBG0qxx1BEcks3Lh8nEYya7WKF91YYxgmSbG3FOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353646; c=relaxed/simple;
	bh=BlROpg/oMQ6qyw2CniwdkMcN/+oY12kcabYx5q1tsm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPPTwBDNOaFPKyXn23PhpaQNWzPsjIar/3M189Rvd9PZg0uUI6FUVVfqRPBPF0JbFbO9emSc6I/5NpkF0kbNuEX7K4AVlNo2HBgkeZXL5wRznsPMdukzg25IM17wc48HshJ4rHYPXms9y5Lb8E+Z8jH4ZiDMz7b073UVRrol7bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VMiDXDG9; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VMiDXDG9"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d864c23bdso10271cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 01:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779353644; cv=none;
        d=google.com; s=arc-20240605;
        b=blVCNawDVyhmy93t9QGgJDKHh/QG3quMihU9XEv/BMjsxAmN1W4Hn8G3UcGCzzsAXS
         OCZHw61GYuXjOh24H/PCRgXl591GZOzHtrTWiv+YrVJHZgGwR7ss0Veebif1q7RHlN0K
         od+6gJ6CKZB3TdEbDBU9BiABzaBvPuma/VVMhcAhpAEMQx76XSxsH3iMNryHRpMqX//Y
         qMc28pZ8yz1Kgmk3Q+1Orsz9KxT/T3lH/JI03T4Cg4ovzFhQRU0DQnyXZ0zw4y2xQA9v
         LnVwThPbN/guF2qbAG+Yey6t+gLCU1rhTMvJCSUPpB62dPPjNS0q04Ua83bMuVeRrlSO
         CaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iMVZurvnpW2R3v2VYKC4plSUzv3+qTXQO7hckbnpapU=;
        fh=PFMvbp+dB2v+4mBFu9yARqBbFSfTJ/1oDR9pE1fNPr8=;
        b=jCLNKCK6GG0HacPlPs3PQzY7JS7wZdPX+7wpXec4s+YI4Ryhz3VSR6vWeOw0gb6pQy
         k+bvX7qQlDJO/DcJLtDG3aQUHJ64QDTd2HUneOsTPagwy3LEM64xwZfWjCcI0M5QPUFM
         YeRmVK4J9awsgzJR8mwO87YUs4O7g0OtH3QPo90+ja3If8p9lhxNythnkKZdjJOLQtH1
         3FFWtyoIHP8vteQf1+XLodzxQI6y4jKqY5ZZNOOBZsmFt+UDk73Xi0qz5WxHlysDbv1L
         8pLfof8BYHDF44LucMMIww96GSjpj3aK5jZ4M8lz+flcuc7cHmns4qQWWvY7bo7OTdyb
         N3rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779353644; x=1779958444; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMVZurvnpW2R3v2VYKC4plSUzv3+qTXQO7hckbnpapU=;
        b=VMiDXDG9DFuaZNB5Kb5PFRHPUXC2dVxv3J7hGZPxmukxMdFgbloOr85hixp957qpwa
         CPpK/vE5NL5E/FH+cQQOjKmGqRE42hp9G1RZdCMvwnUhqGXqZcAMwC3/jQZ4njKb8iYj
         P2LqfuHXdsrV9WjY+C91r9BekbD4nF12WbU/WiwoB2jlkMiw+p6loiCBT0nvigKr+6BT
         VVbpkvAbESk4PgWvSQXA0f2rTCJ2LUW2kSFMjJs4McZMlB4yOqrh7Txp4oJmrNQwTjSM
         AOJ7hYIA+9P4vWCsy94c8IbYMqi6EItRKRd5+/bQO6NqYLAC89zfnuu5Im/p3BJzxffV
         SU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353644; x=1779958444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMVZurvnpW2R3v2VYKC4plSUzv3+qTXQO7hckbnpapU=;
        b=CFtJNjtCVGqRG+ZtWOuOt3wow7j1nBB26gT7yqjPHFQhg4KxcxKK0A7e1uVOnWytnC
         E6+apUAJceXij3Ac7rDc4pSH7c6k8bl3Y+oun16Jy/taBvYwGUsNC/LnkuU1S3AiInxA
         gLNYn/9WzLBuODNhv+WKZdWqKWoOL1uPhchkv5/SM/JgiY/e3sEB1FFKqZ1p1z/iyx6P
         Wp7TL+WQ+csPvWwqGPQBXjTrpuEycoquqtlmyDMU4T9VwKDr4bwyusbG7G3PVrmIc9Da
         W5KoMZ9F1zVGxhM3FRddqlmHaLTkF+lUu+uZvP6hCwIZ57VkVGrjbY/kXdiUbZEsgV/l
         cqXg==
X-Forwarded-Encrypted: i=1; AFNElJ89xLLEnF4+9BwuF+8r5DTQ2eqPL/zylUcnxat4fFIDEWqbdtNi7m0tzbUOvxZznsafvlxc2jjsOQ8t@lists.linux.dev
X-Gm-Message-State: AOJu0Yz19074Yu9wTxBiV99yhuN6BYOqADmMzcWsrYZGDRREJ4nDSpCb
	zNLV6/naFu78jajWejs2ekaMEmP3z6PsPMBfRBYFPbYRKEWSKfO09iuIJDHO6w/F0ZJ39DYi85A
	W2abH+1adee/Lk2JsvlOESlQVF5s/IEI6fxztPNyt
X-Gm-Gg: Acq92OEHCWbnuHHJFmm+N2gmI7i2POdSxJHadvD2y/fGo7oRqzDBGUkWOB9gEkPMK4f
	pPFWIm6ENQrb7mjVGfAK69d7TIrQTR/G/o+w9yr8hFsA+tnl6sPv/XIXs6zjs+Q82tLxKfCyCdJ
	W1hYM6RbMZNTZRKLkd8XkJrJKHIhTV5qMHH4hmdsTEhMDcy0Q0bhFxpHviJJK4N57IbVf7fmrFh
	NzXql6cMuOT3iZ7vy+EWdE2Ln0oEFkkyCZD7JuNh9K2i1SmFc6wwzh5DMZaiX9zQzCQ+5f2G3pB
	1e/aZRmydMK94OGUCjE=
X-Received: by 2002:a05:622a:2682:b0:516:cc18:4760 with SMTP id
 d75a77b69052e-516cc1848a3mr1318811cf.21.1779353643586; Thu, 21 May 2026
 01:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 09:54:00 +0100
X-Gm-Features: AVHnY4JjgkDwC5Px9qxOcGZwEfL7vQEDZaLkFA7McDQJ3moR9Atjhj_tt-FGzFY
Message-ID: <CA+EHjTwkX_K4S4CHNFvoP=vDUnzW9MyLxBFZzDrR3tM6yuKNTA@mail.gmail.com>
Subject: Re: [PATCH v6 20/43] KVM: guest_memfd: Enable INIT_SHARED on
 guest_memfd for x86 Coco VMs
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
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

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


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
> -       return !kvm_arch_has_private_mem(kvm);
> +       /*
> +        * INIT_SHARED isn't supported if the memory attributes are per-VM,
> +        * in which case guest_memfd can _only_ be used for private memory.
> +        */
> +       return !vm_memory_attributes || !kvm_arch_has_private_mem(kvm);
>  }
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

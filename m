Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6034C40244F
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374416; cv=pass; b=fzjPDf38AWRlj7OlpzLX4RWEc1A5roZk6j4/9nRTlmi2ffXHmdqaBRGorSzfr9P/RknBSogClDWQ4XpMcVkWQbb8qtVGudJv8l9XXwf44pXEm6YwytYIMQllyUPlMp7Z66QqVkA8aFZWDJPcNPOhQQu5MlfZJ7AncpRZdirGKek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374416; c=relaxed/simple;
	bh=RPARozcT6UfC6sMpVhy6r4Aiv8XaW0DBJyjeK/ufCb4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTc4T18CPVFJSFNIQvD0O9AqwrJ0xjGCpfKFBrZ8UEHZ9aXagh7ZiPQVPwCnvEKBkbWkkzquJHPibFxJOCGEzhrezxA01qq7JbV0Qc8gSlVwK8tpMxLNdPRmtJeRgRW1GK4ieXWOG7vAIwwFYSnarflb4FtGu8jSOZuBjfsuER8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cMTs6rvW; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cMTs6rvW"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-63201e0d6b8so5530712137.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374412; cv=none;
        d=google.com; s=arc-20240605;
        b=WCposiGUmg9q7Fo1zfH6deK64Jio3W1MGjoUf3MNOiJGoxcGTRN8RhXJkOPrp1NGKV
         AW0trmgx2NYaxleuu+zswDCZyqlxQyvYB51BjfvW+uQgYnMPEEkPmX0buo2j2xCL9Kt6
         ee/haobBToyRI52AfhEUMUsx4xvMi1CxRxedbbRUJbOIgZbkw+E78JhWEgaw2I0eXeS1
         PbWdXfdOVW+Eplyh4mHAiFLxpply/PQnwYDuP2r8+l3ZyrwNnJFrWthXqCQxdMiZ0298
         CLnKZOr+KNuWxoCqs++nWGOtKMxvZOLJNPm+/qdlmqn73Jmv0dRIrqR/WBXLYjbC4bTI
         MRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        fh=7Mu4elZtROXoyu7C0u8hi6WesF4PE/aXvqnvLGw0MX4=;
        b=GtPzkI253/jjsJOH0ZjHqHIj6+NbcYqZwrkXsDPq4CVFjtqbBUbEtw+Pk07IgLswzz
         q2CzhPv9rNdeDT1NLO8cpdsQVSp35w6siHlWBWbg21+ZofAoMiYHfmG7ak63WNMO5R0Y
         GHIYKxv5KGEKEu7vrNymk/PocN4w0cgzchwm8k8b3rW60+EsZU3YbtvwEwasTxCyQuWp
         89r52a1qXEeXB8qLA2YFpGiAcN1TYSNbo5Umv5MrCZ0uAwKDfnEQNAIyZIrQg2ecoVjI
         ZV/OOOzjRER4XP85yREIfar2f8ak+mWhyn78koF9jGnMg9m75jS5HrG8msXs/r7l89AW
         HSSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374412; x=1779979212; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        b=cMTs6rvWXK2UidfB00m+m1rrWGEzkcV+kydgStTt4RT8AlAqEbpPcpcE1Z2akabxPK
         X5ajKLtuRLs5myzt261RD9vswlH/n+W2gW2zRvAol9BI2I1z+qqgAg8jlxZXqICWk56B
         KEogmgaIQ0nsK4qKDrOilrBY/jzP8f/dammpUYaYkqdFZOQ/tEf/sG7RIynlO0bfyhti
         do7GxrRAAAnj744qNSloloMgJlDJPAX9AFp+z7l4IZvZBWDUeIMGOugAMcHviPVzY8Ui
         IC/0A10VFe+7YfqQvxJzloArjwCMTlbLEW1TdD+Ve9K66ZdFuGxj4i0EOWkPgCWJuoCE
         /mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374412; x=1779979212;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        b=b0TgIM0EI+XAbUL1kBkJkqyGYRHmRkfw0WSx5Nm8aZXciJslC2PbaptnoiFFQFxFCA
         x3h7/ivhK8hYj0Ln4eDTELtFMHz1mfBNtRgxBDZGB/2WTqSX43a1bEXUuVmMBECApWAR
         LusaJ8CWAYlSjjjmMex+QJTeip2fGSnm75TIzn7+aNPovCbRfV7VLPF04q+mMm7AOoE6
         LdfTaCz4x0qADkFeB6NtG7/1g9wvR71arqGIDo3FfhlM3KvXeo5T7593cSg8lVyNbiDj
         7DWFa2bU1kYv8EPK4BxcGbjcUdGyS2bXcifQmkpNNBYwXue2LFZBrlO3Xg01TbUK4k3e
         wRjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PskqtSFe7appjZ5T8e6NYDq8/G49sporJxOmvxiTwqY0XuqlhxPeQbg8uRt5bEL/ikqQJLzTCy4EZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyQVXo9ZAD13HFfze0yBJeZXWsz/Dn+4r3inGDz92K56RAZZm6v
	41PUC/ujCK1lPu+NYBZTbAsu1sRK/H3aUWjN7dQAKKcRIm0w1feWdK9VygOKWan6l22/4VWCIle
	0Ww4cNoWKThbVhHbe0k8H4u1r7hYs9E2ASDbxykOn
X-Gm-Gg: Acq92OHFj0to6GKN4rDnqpxXEUsKu3BddvuHvgWAbje6t93GJpSxsDibNhWUj6dmiiF
	u7nwpueZC/4QE0YqCW1DzoB3PrsY3w/8FBarNzZqBgcYPHuks4m36wDqUK5hfiXsRNuniJnQYlD
	RRcpA8ellRNc5zKJMbedKsKBjVV8gRVEa99nKkorwRH1yxAzyoZUIaijBSEBaCbE1MNj3kYT8U1
	yqi0o1b5nuik9Iko/DtSl1UtF6SijnrgUlvcDmjC4h7ReJ2tkAbU62MGPHGME0Gy8e96a+D+kA0
	6J/kawwEmjwPe9+Gy64Tu5Cy6QLE32XSQo4jRhZaMHeZDX3sTQ==
X-Received: by 2002:a05:6102:52f:b0:634:248f:bc04 with SMTP id
 ada2fe7eead31-673cbd0ce21mr1147276137.10.1779374411627; Thu, 21 May 2026
 07:40:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:40:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:40:10 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag8BmtzxTlcuA_zy@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
 <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com> <ag8BmtzxTlcuA_zy@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:40:10 -0700
X-Gm-Features: AVHnY4KEEzPCaNbBUek3sDUc3FN_Enrlvw5CRgr6BoNKh9-pt1QUYC334HSuCXU
Message-ID: <CAEvNRgGDL=_XO3z=h2RLqb_gZFe9QtxwiMFJHCzQY3HEoaUfHg@mail.gmail.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -640,9 +640,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  }
>
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -                 unsigned int fd, loff_t offset)
> +                 unsigned int fd, u64 offset)
>  {
> -       loff_t size = slot->npages << PAGE_SHIFT;
> +       u64 size = slot->npages << PAGE_SHIFT;
>         unsigned long start, end;
>         struct gmem_file *f;
>         struct inode *inode;
>

My mental model was:

+ offsets => loff_t
+ indices => pgoff_t
+ sizes => size_t

But looks like loff_t is more suitable for places where return values
(possibly negative) matter.

Good to go with u64!

> [...snip...]
>

Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CBC37104A
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309336; cv=pass; b=K3XiXrkUw1Ni4ofY+nQMnbubKOJMotGPGFYgG3HEgyFJO3lJJx8+qMlHY9Ecol0wH53eGIROclmC2TtUgpJsypAL5xHh3yrd7oS8NnZbxPCaET9FdtuYPn0B2Z5FavK8zxDCMqvfeOMseKLQQY5AsYORuryxv2epg0j4VvIfvH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309336; c=relaxed/simple;
	bh=UfnbwtuocpefoEJwGQVdq2On9IxQDWbOXLMcN0R2rQ4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzqZmb7oPYXbuv1mc1JTaLj/rGLGHGvu0y+b/P6McoUNJd2YwLfim9KySuIaeEmI8ynZ8Wj1p+acXZjGf737hSKSlRf7GzYhoXpjHjMPN7uG13VDDxrrK4EglJiavTvhn5gN+Ppzt/e9/hXc4pAkttDP4LtsfvvL0TluDAEEU1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mt1J9hUl; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mt1J9hUl"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-393d6025f99so59635841fa.0
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779309331; cv=none;
        d=google.com; s=arc-20240605;
        b=Ez45xf7u5IS9TqWGtGU7KvSEur92uFbq58k+yKbQ/FxL27kGrkV45CdrFMWmjJMZvy
         IMCTpc9F63mjd/+F1fzRW/1FckvXkUJpzvyEHRr8NKt5gPKjSDYENkuCNncaR7ESbZww
         5x5tt3qmgLuEeznImiS+no1eEL2tnjauDYYo6281jI+b62ULbrqLayKjL48SJyWDbMfY
         dTQ/1/kLLpFTVvPS7Qv00phEpm8e0e+H2xymhJeofFpsWi39cPrjicUqHrNI2Jc2HrlR
         NnVA0vn/3rBO2N4dVPWKmPE8cFl20pk3y8jQMBtx8g6RR/pwR/GpbqWmyRAzOa3p5Chy
         hY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y7Uhb594XOL1gZOtZrSL5VavWJB1z/5+87hhs5G/QCo=;
        fh=r/DsIRdzBUiAM3RCgYpDegWPnYxAaLqkCNdgpctIhQQ=;
        b=I4OgvgGG6y7AjXU8OL1bkE+E5yqdrbEJyUfL9m+eMFt888+mipSlpHlj6w7+CKRKKJ
         2B4ddBBrffG27LRoXbSMNBjmd9LOab2PEe80b/qKG6VvjjxBq29JNF9RuvFyaLsR3Rtf
         ighVbnTSnDg7LRZU8qLtBKWXXXRBGKXppfkpzwtVQsxFcZ9O+9/OunV8LmWERfpm/+W0
         La416VeV92yKDfweZZAxa3NmfGZkPN8967YVR4Iscv47lsHyQTaCyoYKxZ61VAokuSkZ
         JYKr7WATIzKsjCnPc/UCfhhLzciv1kjDPSNMfs8iO0aCTX15KbH9cIZ2iEg+N5tariHf
         7xPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779309331; x=1779914131; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7Uhb594XOL1gZOtZrSL5VavWJB1z/5+87hhs5G/QCo=;
        b=Mt1J9hUlptW99DwhTwJ5mUXGdAEmFCFa6qprBBwy75E7Og9agl8P2JxykV7T9uD6fH
         E9bqto6RxORb4heBKxbsCHtShx7LsWyzZ23M2AwtkHqdidiLc5M/eHfuWxwz7HFsqlkE
         iJU7rsCHWOd3JFs41qiyxx5TQVQzY/zvziII+v5TeXtIbHGbLLVMQ2FbOcEB+eiJfB+D
         V1TFuz3SkMe23Mo4GfAWrTUyKP0rRfG6Ej59avqPg4NNh+R7d7Q+kpDbf2kEQcSocCiM
         nriaex8oEZkAsSgzYqIyVyMBUlJ7X5vlNrXrk2SpLm5ZIgZjNQ3xH6JaMB8Gmlae9z/X
         OEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779309331; x=1779914131;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7Uhb594XOL1gZOtZrSL5VavWJB1z/5+87hhs5G/QCo=;
        b=cNOUHdqYnM9W48aG7/Vf9nirih4aIvIagBqOU865HCNBl2Va3nlZo/zx5uwZxP1h1w
         TlYRg9yXAgwhswHViMRT8Pun8A9lhskyMD3DlxiXZA96qCeuDWeg1HOkfFaC9HPXZ0XL
         uBF7O+K2cG4YKHQHw0SXpqi9B/GPYl6mKz0V/EpeLcG1RZRYW4u9Uf0Bz4FF0zxpzDRM
         yvgvA9idKfXiaowqm4AIbue0rKXnHY/tvMrdWgBkejoS9pnVEDiy0AFBpRPz81BaDtmM
         NxZDf9k5H2WmQYWIU0pC81j/bsxO6QXtwP6S0HcycEfyZ2klNnkGUQH+KuchUANXG8uA
         rGfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Qv2YKT1eZtOsQvqy16Dx6Vv6zXVJyfCiFk0xaNx5zpnlLKbPItYS1cAR9z66g2zZnZJiXpSFRo7gY@lists.linux.dev
X-Gm-Message-State: AOJu0YyonzGS5x5Zv5Yzr4SwmFBMQnTrH2/WOQPlc0vdqR7FhPNuX5Uf
	RIxrcm4uLjIpCqQiLeuqoTx4fLSZ24KGk203+EO3n7fKUazJJ4R20W2OpRZUyPiJk7at/jR5vGm
	MGhroZu66Ct3KMNUNbpwo6KdeN1L7bhiPCAUm8ygc
X-Gm-Gg: Acq92OEj4FAHTPdhBnX4PJQzaQPew1WpJ22DVNpxeC+bWxSFMxKLB8B6Vf/oVg1Hg1u
	xv7qYxLdea84kyB4JKWtoUxONKgxzk+hiUXaIjE7xjSJndB7p6EvwoRqG7tLiugvZJSJx4+nC/x
	avbrT2O1byl+w39mOEJHqg6aquvRWLLSdBbvZqLzdfCmq8ECuP9VrQXSccjU60J/hGO0hS7xHSQ
	NJvV9geznIgsTuKfowMNi4E9YxQ1jREbqVgYPJDJsmCn3owgAn87qhtnGA+atIiXLM/2f5f19lX
	8DGBKYCGf0hGfq4pIl1i9CIXVGC1YlHtxo5643MIYxAn//kx8vjlhOINnn9LSyo3TiSnUEvSwVF
	c/SAx
X-Received: by 2002:ac2:5b03:0:b0:5a8:8818:819c with SMTP id
 2adb3069b0e04-5aa2ba8d0a4mr6125e87.16.1779309331108; Wed, 20 May 2026
 13:35:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:35:27 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:35:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTwOfJ=nCRoX3m5uDt=CcF_zrqGsZVBBmo4MscmPqrBxOA@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-12-91ab5a8b19a4@google.com> <CA+EHjTwOfJ=nCRoX3m5uDt=CcF_zrqGsZVBBmo4MscmPqrBxOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 20 May 2026 13:35:27 -0700
X-Gm-Features: AVHnY4JCI2WxkpGpEfiZH45uIXCVj4Nb0JRb9mme96xXqvKAS-EEsMTVSDBkz1s
Message-ID: <CAEvNRgFqPSLKKKb9etgfqdt0y81Agu5RwRipuGw=j2y7W2Y0-w@mail.gmail.com>
Subject: Re: [PATCH v6 12/43] KVM: guest_memfd: Call arch invalidate hooks on conversion
To: Fuad Tabba <tabba@google.com>
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

Fuad Tabba <tabba@google.com> writes:

> On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> When memory in guest_memfd is converted from private to shared, the
>> platform-specific state associated with the guest-private pages must be
>> invalidated or cleaned up.
>>
>> Iterate over the folios in the affected range and call the
>> kvm_arch_gmem_invalidate() hook for each PFN range. This allows
>> architectures to perform necessary teardown, such as updating hardware
>> metadata or encryption states, before the pages are transitioned to the
>> shared state.
>>
>> Invoke this helper after indicating to KVM's mmu code that an invalidation
>> is in progress to stop in-flight page faults from succeeding.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> Minor nit below, but lgtm.
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
>
> Cheers,
> /fuad
>
>> ---
>>  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 9d82642a025e9..baf4b88dead1f 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -603,6 +603,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>>         return safe;
>>  }
>>
>> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
>> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
>> +{
>> +       struct folio_batch fbatch;
>> +       pgoff_t next = start;
>> +       int i;
>> +
>> +       folio_batch_init(&fbatch);
>> +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
>> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> +                       struct folio *folio = fbatch.folios[i];
>> +                       pgoff_t start_index, end_index;
>> +                       kvm_pfn_t start_pfn, end_pfn;
>> +
>> +                       start_index = max(start, folio->index);
>> +                       end_index = min(end, folio_next_index(folio));
>> +                       /*
>> +                        * end_index is either in folio or points to
>> +                        * the first page of the next folio. Hence,
>> +                        * all pages in range [start_index, end_index)
>> +                        * are contiguous.
>> +                        */
>> +                       start_pfn = folio_file_pfn(folio, start_index);
>> +                       end_pfn = start_pfn + end_index - start_index;
>> +
>> +                       kvm_arch_gmem_invalidate(start_pfn, end_pfn);
>> +               }
>> +
>> +               folio_batch_release(&fbatch);
>> +               cond_resched();
>> +       }
>> +}
>> +#else
>> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
>> +#endif
>> +
>>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>>                                      size_t nr_pages, uint64_t attrs,
>>                                      pgoff_t *err_index)
>> @@ -643,7 +679,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>>          */
>>
>>         kvm_gmem_invalidate_begin(inode, start, end);
>> +
>> +       if (!to_private)
>> +               kvm_gmem_invalidate(inode, start, end);
>> +
>>         mas_store_prealloc(&mas, xa_mk_value(attrs));
>> +
>
> Why the unrelated extra space?
>

Hmm this space provides vertical space between invalidate_{begin,end}
and the STUFF it wraps, like

  invalidate_begin

  STUFF

  invalidate_end

More STUFF is going to go here in future patch series, such as splitting
private pages in TDX.

>>         kvm_gmem_invalidate_end(inode, start, end);
>>  out:
>>         filemap_invalidate_unlock(mapping);
>>
>> --
>> 2.54.0.563.g4f69b47b94-goog
>>
>>

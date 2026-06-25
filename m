Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3897B2E4257
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370843; cv=pass; b=CyaAlTnTugral72uMTg+GLK/5ffhRc3gQzaJHHkfnDgN1F6aMoio6FPNhpXXXP637EETdcMIklvtTTpASuEE9zO97sNlzeUJo2CicWq72JQIo6SCJ7sVTUMHb5snS65xoRNxRYvuesJcJe6o1uN+iu9CUHgL0N4nLwY4OG+4oZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370843; c=relaxed/simple;
	bh=7JJoQZtiGk7coUfKOMj2B/mrqYm3H457ckdZcSJc6Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHqomrMuYgRz00ka6RhAqPZ3/SUog3mWe7OPpxsmVu6rZo/9eCO/f9ZyuiV8T6PPIjhBGNgACcH8A5DHco2hYl78iqVovXH7sjYKFhKR8G+hBkw7Pqrab8ujkee89qWh5aS+GKRHmh1gRlenxJIaqho9+y/LdbdBkJWvb4FOuYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mPSYj2eU; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mPSYj2eU"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-519ed52bcc6so181201cf.0
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782370841; cv=none;
        d=google.com; s=arc-20260327;
        b=CmAcbR8EaGNoV6ETiLh1zTO21WffyJy2Asjt/lRneCWEwkbexlwAaunIyvYkU9Kdog
         sk1XXEMPU+pTYsD1PuuWoIBU+o6X1Z8j1e2rrMba5OuvKoYY077XLwFbVI1hHzx8oxrE
         /h3vB3yIMLEp+1hOwwFGyz67n6BriZ7xryVqnEdDKVqYLZjBecOL+fbJb4jlFIuYYul7
         p4flHTwwfXZDpSLOxTdEk7Vh5mrmIT/FpFVI+8Ws0/2KxAN/yJxp7YF8iwJhI35A8KFF
         bgo0xNqBQXAet+gB/TU6cICTSB1w3dTAVHLJxLwXQejwudaT9beHUbbc6my1r454WEqx
         egng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7itwZj77OJzx0Nbk553L+ihvDTrBn0KieHsapLPAjLw=;
        fh=QX9ORYanMC/K1UpyKav7TAOqi1oJLy6z+1h4Y4OzHgg=;
        b=suozWhOm+DDrc34BmbRK2xHrZ5kZuYbqGCo89CSCdCpR/RnV9fXoatMiLmdrfr5RPm
         oWQSOoVmP4Z9jmt4D/3hTErEX8OrfIR8M63OZJaeE7xQ/nYLlSoA1e+qXg+JacHyYRgr
         Tv99p4lmVccR7N3QP8aHMj/DxJts1hYcydZEc0L+N0M2maE8htSlz0nSh5MK82IkP9dW
         UX3MJBI2ucz4c98xtmaToKvoXywbbjG7e2PYpSvBvZ2XKNluDilIJzMMUmMgjZdWoxiP
         vniam+NcOLuTONnsL3Qno6rztxQz6JytxsVdSyTOy7bu5au4D0HC4mla94I3pMHXaVW3
         kgiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782370841; x=1782975641; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7itwZj77OJzx0Nbk553L+ihvDTrBn0KieHsapLPAjLw=;
        b=mPSYj2eUV5zWpIYFb+BAFy9cc08KTXQsaEXbbBXBMt74z8LupNd+k0IoEpFKkEEjK6
         /uPmptqn0tU2PgHmWbTDYYoYUogbAIsizuGx7XhPDUPfCjAMcnHkoUeG2uZ+Ji/bvVY6
         grn0h39CfSaLSs4KZuZ9oZfM6/uwj6u1ajeVk0lju1Q1I7xkyh8QgwaE+iIk649bg6L1
         WicO0ZM3H9h73cDBrXf4+BjYO5oDTSuUu3y21mQ73BjW1xcmaN5mniXqkzSlh0TL68Zd
         zO9VwN82S8Z1VkrFyPGQMY1pmAUI2oAjYF2/R/6qNDNgAxuRUAY/aPdHHLqKYZ74B7dz
         muag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782370841; x=1782975641;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7itwZj77OJzx0Nbk553L+ihvDTrBn0KieHsapLPAjLw=;
        b=YncCOhalD1LILW98LuxPbs3pQqw2VphBJ3udjmHsLJQ04JG8jCjmxO1qgCDOVEXgFH
         L9BdzXntT9bPEAu91xEaOCDDB1WHuvi6SpJD/Btu+FdfNMwUV7RbvKNvKKCoczUjHpK/
         naD22iua8pyN10jeIQ6h+6bDgZv4fcLHCdjnRvUbAWn3fUrLjeyN0a+CjJYtGyJcPHn5
         tMNSLECej84loZTo5o7iNYxhtk/YzBw1hj0mttYD/b627rW+jN4anDOfCc9jyvmDCV3t
         8QHwjyntIQZXCf0ibEf98TQjH+WP05vArcDAiIb6VgewkFjHXJbwwSHEiJCQcXyZzFuX
         llvA==
X-Forwarded-Encrypted: i=1; AFNElJ8NZ35d3c9H+Mpnl7PhGhBpuVp95BqQ0hB3NwIBvtirKxZ6ZsZf85wt3ipCtEktoIfcPQ1+pXuudkpn@lists.linux.dev
X-Gm-Message-State: AOJu0Yx07pRANrVqCvRvhp9/hz/1HbbGYhPavqliSVruTeG1Cg+JiBye
	LRPgO1OgEmKfpyxCb464I5OYj6w8RGoWyigSZcjLeEbLtL/HUnI2dy2fuf/iZCFi3kXDEP2fhum
	Pcs7bDta12fBR1JdXrUpGcz+YwHhWI7PM1y2zu4fQ
X-Gm-Gg: AfdE7ckDc/xV0CJcukD/Ya7AmoYaOjgQvtGXLkfOkXp5tUYllHvk8yocmokbx3LgFuD
	bpX5DyywYkBgkem4nshnWQS0V0KvfkLsh5W74aLuH6ZOMbBS38ZZVyMk8nQYnX3ncrhPOFuIZgv
	yUzrbf+63S4M98Msd4pnBLm3EfFVrI56WncaOFIDjM+aCz83QsX+nJrMARimJWTBOqL+WRMzyTA
	rsuFhpjSkmrk5kuw4pkaXmIdct/YYTyX5T6N1JbP0MiwOxT4jMEhsa90vqTsUXze6RAmeaCe36o
	LkMjZKty
X-Received: by 2002:a05:622a:53c4:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-51a6e9b5655mr7053121cf.2.1782370840588; Thu, 25 Jun 2026
 00:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-34-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-34-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:00:03 +0100
X-Gm-Features: AVVi8Ce3XGRWH9AR3rw80vlHynjgwNotwUVdlcJvIAaDUMJb2MBvPhhdMigDY2U
Message-ID: <CA+EHjTzR9r97Brau5KMmUf7UZvevmhpCKhTEt-9wT=0YXFLpFA@mail.gmail.com>
Subject: Re: [PATCH v8 34/46] KVM: selftests: Test conversion before allocation
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Add two test cases to the guest_memfd conversions selftest to cover
> the scenario where a conversion is requested before any memory has been
> allocated in the guest_memfd region.
>
> The KVM_SET_MEMORY_ATTRIBUTES2 ioctl can be called on a memory region at
> any time. If the guest had not yet faulted in any pages for that region,
> the kernel must record the conversion request and apply the requested state
> when the pages are eventually allocated.
>
> The new tests cover both conversion directions.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../selftests/kvm/x86/guest_memfd_conversions_test.c       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 8e17d5c08aeb8..b43ac196330f1 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -265,6 +265,20 @@ GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4)
>  #undef combine
>  }
>
> +/*
> + * Test that even if there are no folios yet, conversion requests are recorded
> + * in guest_memfd.
> + */
> +GMEM_CONVERSION_TEST_INIT_SHARED(before_allocation_shared)
> +{
> +       test_convert_to_private(t, 0, 0, 'A');
> +}
> +
> +GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
> +{
> +       test_convert_to_shared(t, 0, 0, 'A', 'B');
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

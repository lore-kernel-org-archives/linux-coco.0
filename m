Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6CE373BEC
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340218; cv=pass; b=ECgDSVhuGpmLIaBFXHM9qKIoHRpe89FtZ8S9vN8DGjRDZxKSur/0P1GxeFEdHJZ1+aVpso0cuhuIp9WrATimAvy35v2nD1CyjzCpkM6nxrKVeJ8xjU4lDUqKkDw8GSriGEaDg0uRtpEYn1aB4gyilKmGgQZwlBoTHUaIze6WrIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340218; c=relaxed/simple;
	bh=Cryz59YAm4hKcZvNvNbTkH+hut/Wk5VenNHAj/cSfOQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pcy10fHaGBXzGuUHYJl8QHNRgJBl0QUXZ43niHb5x2m4RF2L0NYWo0tg/iirobYlm1T2uDG2VdEGPyzJAI871jzyZU+UZrExzs+HWDqhZkclW1hI85iIYCNE5vZRQ5y56t6kP1dEaTfqLIeOCX0iL+rf37hAhrzdU4A6k2Eb5yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4GfrLjJ; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4GfrLjJ"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-139b5e604b9so1870879c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 15:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782340216; cv=none;
        d=google.com; s=arc-20240605;
        b=GruMYTvEq5EyXFQhsrkJX8EmNCY6ez9mnSxOe7ujoDX43t6rsWZusTL5UrC6gGfyDr
         5k+rhXUYvyzFqGHIg9CflkewzzoZTiUW4lExPcOFfWlzU5aJzA7+2O6kVs1qxOxNsDd9
         3yCrHeEsK/69SlzQXBX54rBrDrMk0Trt/K/zHwuWVhf2LOk4A5Brx577UzsOIBVpIycl
         rrULTB3RJbXOtJhF9eCvN/mCpSzlIYsG2+G0Amc21Gbak2lWGJAVFyocJuNuBz7zZyfW
         LKNIHXplh9ZZuB3bw2JNk8KVt4a5hYM+Fi2ZIf8NhYu+7zu2zUaz/KtNKurhw/kYecij
         H+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=oVosxF/7uHKl1pdZQ4oI0wtR65vPmKvzzWf+IZ9YyQw=;
        fh=AxGMb+0sMLRlQE90rLZv3kHCs+i5gDVq5CoYXELUDck=;
        b=VVTS08ZLox5j4Gbx3mOCrXazpvypkSBMRqgnQ4fqMPMhCrQ5nt05jZMmIra8doEc+M
         /Df5JcOqrPkPuzg0Wbt08AjK7VNlcoK9xLDd2k2QPNoQ2ca0U4EsgIAw3Ds2lFd91/L9
         WlOlSdzUgobXCo9sjtUTkZn2++NZd3/DjD7e9+4DcfpdwAxGjX7d2xJG/JV3EM2YEytW
         nmXtDOjBfwGzgV0BjX7soW4RB+EnhVToQ5OiPE1Rz6Up6fqVQeRLkBLiWeDWgVhwhyKo
         wOegfCjv1YR12ZNqo4wv2IN7joLTcFWHspJLqpYAvNwfkrvMc6H75TI2M5yyWzYlKuaC
         1okQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782340216; x=1782945016; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVosxF/7uHKl1pdZQ4oI0wtR65vPmKvzzWf+IZ9YyQw=;
        b=d4GfrLjJA4oVQ0Qe9ypvJyKHxgJ15TYNEcSwzmpAFHHyRgu5dK2R1I8t9OB/dBxG7v
         Wg6l17DPTImMlQJnHioE9gvGaslk8xQQavKHWPshG9ZtQuicgU9bZpCKypr4OoMA4NvF
         9UT6ezLSbU0ic8NfbTYS1M4MlkMTjI7Jt5TB6KzEVYN2qhA4MuEupC1kdtHr7r1cvPz5
         1tKAfvH/peqAmiAB19jKpOunsVo+3Vu1ydo4duoBYM99F/06i4BPQtcTw8GUypgZkVp5
         0b9EFXb/AM8UkC8jvxo5iVtO95oOBC3N8AEzafkh0PwcJIrM75ARCqFpJ09F/UCuoVJV
         InvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340216; x=1782945016;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVosxF/7uHKl1pdZQ4oI0wtR65vPmKvzzWf+IZ9YyQw=;
        b=cAs4RXM1Cl4IcCrWk6+xDiRx2lDNOujDK2YVP1dW9uK/svXpuHCY4qmpcK3yys4Zro
         D3s7jgE8YwdGPIBQ/D0eKyqOzYjNKBXr56CVa70Tza98lvSQ+mAa9XYOpCVEHW6qOhCm
         YnroLWsGZzX4FlRPEmxi9RukgDhLXtZvUBDIkhYrMmAMfp3ChUUZo5Nw40qy10U1dKLd
         U72cm2WU9KMwySZvneyqV+/JD+64Kz3S03q6PqdxjhxD+BzC88BKhPETbMNgAJo3yeNJ
         oEqQj0p57nvNaCjoLluWelyyIIjda5gs7VH2g8d1GsPmXdzc8gwHYWSQlAieCUTEcZVd
         CZaA==
X-Forwarded-Encrypted: i=1; AFNElJ9wKgifA81f5AovqXPYIYXHurQpvJS0KvN7ed92RAuJDUv5jw4HG1eMOLk4MquavC9Ojea6HevSBet/@lists.linux.dev
X-Gm-Message-State: AOJu0YxuzFTFpP86iF/PDQ34s44zpaSwBShHu2T2AtotvGZNpvQJG4aU
	ozzJUnFM0P0P9Rkp8lloU9NwmbiXaicmz5TYZaiDJfXlzU3FrbgBVxtiRjLMWq48QfSZq9j/J24
	owPzvKfv/m5Oze67ohXz5iNfZvevByFacKMus53Gl
X-Gm-Gg: AfdE7claIjRvqbKPUXQHmjy04PEXs8CujTUGarZaqUC1qcObptWvBX1cffAD1omZM7y
	LINXuviHWjtF2ULMndEY0xhZg0iAm/Wbtc2qOK5ov262Ru4NUu1Av3skXNxlurlRDw3cAstlprt
	/dre/7CbwQilFuJklH8yLmn2aLRNnvML3FUo5ZbIT3St+QoJXikj/DQ21EKBkNVjwEP9P3q3ozt
	BW26s8YODq8iJ5sE9EVYB1947Npjg2KnPK3oXbrGMXfDwWnJQXo5iHu9xIMZMbjA14urLcCESQS
	VK+22We3D72NemNjXXMrUa8vQB8YFUsi1L2OXDfmWmG2LuIjJu1ACwrVOc8=
X-Received: by 2002:a05:7022:fe06:b0:132:5d42:55ba with SMTP id
 a92af1059eb24-139c5d0503fmr6919345c88.16.1782340212554; Wed, 24 Jun 2026
 15:30:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:30:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:30:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajpKK/SyRh8LExrY@yzhao56-desk.sh.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com> <ajpKK/SyRh8LExrY@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:30:11 -0700
X-Gm-Features: AVVi8CdqNo4bRyAdjZ4VoxTkK6AK5USFMYju6TEGtZz_v5HiC3fCw0ntlVpZrZ8
Message-ID: <CAEvNRgE=-cdbiToHEu-FCks2XSh3inVDdW3r+h9VYYbE4REttw@mail.gmail.com>
Subject: Re: [PATCH v8 21/46] KVM: guest_memfd: Zero page while getting pfn
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
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

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Thu, Jun 18, 2026 at 05:31:58PM -0700, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Move the folio initialization logic from kvm_gmem_get_pfn() into
>> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
>> kvm_gmem_populate().
>>
>> With in-place conversion, the existing data in a guest_memfd page can be
>> populated into guest memory through platform-specific ioctls.
>>
>> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
>> might contain uninitialized host memory, which would leak to the guest if
>> the populate completes.
>>
>> guest_memfd pages are zeroed at most once in the page's entire lifetime
>> with guest_memfd, and that is tracked using the uptodate flag.
>>
>> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
>> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
>> can get a page, write to the page and then set page uptodate without
>> zeroing.
>>
>> This aligns with the concept of zeroing before first use - the other place
>> where zeroing happens is in kvm_gmem_fault_user_mapping().
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 90bc1a26512b6..86c9f5b0863cb 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1137,6 +1137,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>>  		return ERR_PTR(-EHWPOISON);
>>  	}
>>
>> +	if (!folio_test_uptodate(folio)) {
>> +		clear_highpage(folio_page(folio, 0));
>> +		folio_mark_uptodate(folio);
>> +	}
> Note:
> In the __kvm_gmem_populate() path, this folio_mark_uptodate() call makes the
> later one after post_populate() pointless.
>
> __kvm_gmem_populate
>     |1.__kvm_gmem_get_pfn
>     |     |->folio = kvm_gmem_get_folio()
>     |     |  if (!folio_test_uptodate(folio))
>     |     |     folio_mark_uptodate(folio);
>     |2. ret = post_populate()
>     |3. if (!ret)
>     |       folio_mark_uptodate(folio);
>

Good point! I'll remove the folio_mark_uptodate() in the populate path
then. Thanks!

>>
>> [...snip...]
>>

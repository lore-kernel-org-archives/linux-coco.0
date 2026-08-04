Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB346D088
	for <linux-coco@lists.linux.dev>; Tue,  4 Aug 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857998; cv=pass; b=epWURMlHJjF6QNe001+Dr03l8HYiz5tvJ9StFl3BWMXwmCt27KsNgaA4OXa70w0dUIuJFUBbO1e2qHLE7Y3Lrq7zV81Av5Zte4oy6TXWBEFHCHqVdoGspndlErDccAWAPcgxbrSp4XIpvcwo5xr0CcTYf4JF1hrK4S0//wWl6/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857998; c=relaxed/simple;
	bh=3oWNFp8mlmM3sK5SQC2KqwSAdHvsMlVK7v6l4lJqdEI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUeyGOAoG0nKqCw/WsxTdPi5QdsupZ/8ItI4hEc7xdTd8MMyAOJ46zuNvNzbiTrQ/ecbRwvIGIVf1+qqF6nWooPWzOCzp037gS/joAeirP6PhYM86Cb3cq8720yZlPTgk7+7kbjaoGroO68onEKT0hCKSS7aaqRcUwRvTRT/Tcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fM1A8CRR; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fM1A8CRR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3722991a91.1
        for <linux-coco@lists.linux.dev>; Tue, 04 Aug 2026 08:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785857989; cv=none;
        d=google.com; s=arc-20260327;
        b=FC8qL8EIh9TlsqjKJEw5jChM5lH099JOk1MITtZO1iVzKrEXJ6PtA+JOoW3wlZlXRh
         BPF9ZB7zfx+N457siIkWBRBefF8zcvtPnfEZ+geZs4eZUCpaqWOSel38wq8xtTaefAur
         opKJ1hejrnrT9DkrkMLNw3gNdU05rsXKlhrBwIE3ingf9Zwz56cVWybKzpiZpXi6kgxC
         lIHIHmuYlrhdnh9xsHYg/Mrd3qcwGRiYFzBUxyoCD+YMnfR7+SXqYNKFCj4mP84vEQ2B
         DMd972WleT36np2oUQjYis4I3CMmymAo/L50zNr2xI3nbBbB3O4iC/QPgYCxEai4iiEb
         Osgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        fh=EGSSCuLlwJNz7NEZQpsX6kBDx0BAL75Etoozta6wLOk=;
        b=AFz9qUOTlzbYKFtBPhf1agGn0BkT7hLKP1Ve4IjMjoN28HYfpKG99LqW+UVs9aC+jL
         /t4IPE8/Aw1/n2XW5QC0P8H+umoaIVy9PMYXFJiBDiLs7C9cFw2/ttyghcCgwQMX27oA
         Jqq1zarwRqrcbSTVMHZpAZ2eNMWUDxSSCFyE29a30BcuAb9faVUnWsr6/SEY74SOYf3q
         OpMosxpViM8w/YTVaOLf1emqor9ZaYY4WxwcYgSqnN9i1EjHgs34CjCEkVTqikyNjxQ4
         VbDcP2rBSzEyzyyqqGyfSyivxaTHMQKpJ77LIci0+wqhL1ucEfHw/7BCrcskpQqbM65j
         DoWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785857989; x=1786462789; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        b=fM1A8CRRfhDZxkMsGonrm3Nn3rOOqTY0lQEOvaiJJzz5GaumuJ36dBNy0p5BxE+sEc
         wg91vncPshmLSBrWW02SOlvmiLsnZ1YwMMDwhiipHajpFb1R5+/LEIndTGBO7s0ACTOi
         1Xzw6HCt7jYo/OR0166Vqzv/I1zpchZwsXy0k5xiGao8xtespveHmR4JnuVSiPsdE8p2
         YOeEpHgMxl5fH+VDk4XnQ8tIElljIQ9GIFcXPoqbW1HLGpbVXPbwkulcvtoc8s2Rxm4Q
         t6f6bzni5P1KkdiXNlK2IY8HSiR+Iu10C1WIQdtREbEmnp3WsFqMEqQDH/X0utGIxzFt
         SW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857989; x=1786462789;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        b=MUWB8u8PndG35dK1+TVUJDhm+hvHIIteeMgwlbToQA/aHTO57h1E3x+8Axp4ffyI5c
         oTp6Ms6NVNpLkwYwNsZVc3pUB38No6O93bOAqUiB8Y7Vjq8aqfAYRhZH+VksFe8x3CiR
         u8qqjGsZj39UFsDFfTsljdAw2pqDBXYQw0x713vC/GOegDoRplE9k3a8cJinDjxGQKna
         JpFXGL5RRVwvIoEsfgmPuPeyOHOZ3/05zUbnWYIGBDctiRIXtDS7gGkbu/qA6f7mbFsP
         1Wsi6ZvhSasPuQrvlfm+cZdyLe/Ti4oZS4kYotkO0Vf3GyYtxvgDYvWNi7CxJUgYGvJP
         k5iA==
X-Forwarded-Encrypted: i=1; AHgh+Rre15z4LP2JP551fD9eeEYjBSCPGeyxMdDRZJMMRfoY/e7z9Nhv8Le+Tb7mHUIije79o7j6ptdJEz4l@lists.linux.dev
X-Gm-Message-State: AOJu0YyIV+zX2grUbdiQ3Q8/n/14irFHK1IqujN/xjDfwdeSUpKodRoy
	ffhEAm4sO/4QTlV2j7wJlnJheDUjBbDiaoGM2plwj3ideHe1kPG28zVG99MAZIzruQocVpjZWtT
	rAempecuwyXHMyZMiKTvP0XLu/UjmQzfEe6LLaNR1
X-Gm-Gg: AR+sD10ZiKgQ/2xUYgp36qrHVVYjnusK0i/jQnqTE9QORmwu/KTxUmzCEnAA8WGG5Ul
	WKK/CnSpyAwdWJqRixW+VIwDdBnH/F6d4usBl8Bj69y0mMwiXR+eL7OPG9/3o3poZJi8D4+DBGi
	FYF6PFwwWUa7HuJAwAIQ20OuxRQEVphj41XHExut6DmUxh5xiQc3ZPoSmNrNr283htWYIaSqlu2
	A7EB3zyqhzZM6E8XJdSn7w8dyuntW8k92lKgU+b9d+ujXA0XDHSZ6ydIc2x8eZRUaqmha3zfF31
	hvnbSvGZVQT8XUQ3AyViTjBv+mwRRpocvF3nLkF+zmF15/v1cbqfDNu59a/Qhu8fdT+kB0M/rYa
	9CODScBOItjQ=
X-Received: by 2002:a17:90b:1c8e:b0:38f:1a80:d1e7 with SMTP id
 98e67ed59e1d1-3903c596de7mr90484a91.13.1785857988201; Tue, 04 Aug 2026
 08:39:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:39:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:39:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7f23d149-b7f0-465a-a9c0-5c7484e289d2@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-20-35f9aec2aed2@google.com> <7f23d149-b7f0-465a-a9c0-5c7484e289d2@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 08:39:47 -0700
X-Gm-Features: AUfX_my5tJzuKxcHX_DSDai20MF8F8MLGyTCXlBPRZTIfOOy8MGvwUJsA-dI9HA
Message-ID: <CAEvNRgErZqaLPpBveBd2VxdrS_8mjMbArL_=AhzMdikXmUU5VA@mail.gmail.com>
Subject: Re: [PATCH v9 20/41] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

>
> [...snip...]
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index ea2752989f8bd..df67a6188aa99 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1137,10 +1137,12 @@ static bool kvm_range_is_private(struct file *file, pgoff_t index,
>>   {
>>   	struct inode *inode = file_inode(file);
>>
>> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>   	if (!gmem_in_place_conversion)
>>   		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +#endif
>>
>>   	return kvm_gmem_range_has_attributes(inode, index, nr_pages,
>>   					     KVM_MEMORY_ATTRIBUTE_PRIVATE);
>
> With my suggestion[1] on patch 7, this diff block can be dropped.
>
> [1]
> https://lore.kernel.org/all/dd4201f2-3660-46ad-958f-c70feb1ab1c3@intel.com/
>
> The code looks good to me,
>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>

I think your earlier suggestion on only defining the module_param when
CONFIG_KVM_VM_MEMORY_ATTRIBUTES is selected still applies, since it
removes an avenue for a user to turn off gmem_in_place_conversion if
the other option (VM memory attributes) isn't available.

  +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
  +module_param(gmem_in_place_conversion, bool, 0444);
  +#endif

Given that we're now dropping the diff block as you suggested, do you
agree that we should keep this #ifdef?

>>
>> [...snip...]
>>

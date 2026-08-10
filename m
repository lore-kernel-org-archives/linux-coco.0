Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DB43F926D
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786405295; cv=pass; b=Zg7+c+NvvQm2NdyX4TMQI9QqmIGQggCJBnYbgq5jJHS6bFVpnpX731zO5HWczGJ4hzMmH1/9Q55TZKLbMim3z3SPQrF8Dr1ZVvLIh0OgtSzS1OI29oL6yfazCsTZ7kVaMxQJgMWG51uaMD3AzInziQIXN2dSlrkBe/HZRjBvyXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786405295; c=relaxed/simple;
	bh=Q7a7K8y6K91AYZoCZj24dpjtc+/Iv04y0vXjPDlyobw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhKQPYjaPZaXcYL4Ky5F1VIrmUtqzXllXmEgE5NE3hlvhouDXRyp+2Ozg2DL16Wijhx9VDsJTTNiPoBuowutEisPnpxVdeDUYtZe0KEHGD46LPq9hMCJ2yWqDtLNJPoKdNqlCdcVz0TofnIRa0DUjagBFlUa3nEcvtgXRS+wzS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v6gK7jLW; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v6gK7jLW"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2677600a91.3
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 16:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786405293; cv=none;
        d=google.com; s=arc-20260327;
        b=o00IZAQQftOnGWUt9MpNKUcfuPuSOheq/B9TWoGp60sNVbZMSDJSdzLptYOxmEc2Ux
         7Xdk/92JnkusxtgsSmu5BSEnqr8I9CYmdPTdMUVxStH1zg7wPre/X/dVjwoLRkiKovB8
         mbNMOiDqMnf/KakCdx375gzR06V0sWOQZaOLF669xHLG4pi/4mp5urzkbnmpRjxkksEo
         fNgenQlYxsBdPdARkU8NTrnmr27mOtw6HriukrVS+Bse7HBEEBMFrFR/wL9P7rogbgoj
         n/hnrh5q9lQhM2d52mgrsc2fS/Fzgxg/57+tS8zx7CF4ZGA9ZNUt3FbH/XkvPUCWBzsW
         iLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        fh=KKBBR/Fs+4S+vKqNeSXJjJuIXAfJ/J0Nj2z3ItgTl0o=;
        b=coG8RnwaxOIwZPjz98dLRFBZIDgM4pnPUX2M3yLB9YzGtmhjwPD3xAEX0fbYep0GeE
         0UhMKz1p33szBucTQZPAyub5Vs/nt5bJkMY7cI6QvVWO/MF7WSEZfCm78RhOn7/joUoS
         KdB1m9ElaOA/GJCv24TFCR9OKGwAzufmmN4L7abYUnzkDYYddH1r9GrVVzUnKZvmXsAu
         Oi2jOUiFqssZq2J1Z4wdyz21DmqqOZZHWcdo4hGk6gDMGFWFBc3S9g1gfLMk0zBZPLIA
         7i0uBOIe+xwTtVT4PObY5eCxrrTwlCXAqWx20Bs1cAu5KhnkXlsEqsyCsSXnzBXgdqXs
         NoMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786405293; x=1787010093; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        b=v6gK7jLWb9Nrxp7+fMY/CXnIb/aukeT87a/QYNeOfIaSjZCVaFk3VCfctTDQaYMXpd
         j8yD4dmaDNZxSPpq0k1rIMy4d6AgjBF3WBeiZempacW057ftgaqz4p4iqos/ECYi01lZ
         tzbY9ECAoI6YbVEm94WcEV5y3HSw3RQoBhs0HNx63c6e7PQnovi2AcBjGM8Hvk9X20Qs
         TRELrRrjV40YEEFwAFgA6su9w+J/bafda3Ke2lLeC8FYnbk93DjhfK12kSg5sEtgtTtH
         ZC+tyecTV2H08eZ4T0H23CyDhPICO1yLbVLrXL6STL6QoTjhj9ulUPhPHfHn2o48Zz4s
         eU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786405293; x=1787010093;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        b=mWo7c389pU0cWBZlfRkJZo17ZQGoE8hXi1esnE2TB9srhzF+rzGMtN61Icc8pgtSdp
         +ZKgtAXAvf08e1war+DWKa8aidtgByuDV43Ic/6vRVJV6fklku38pa9G5LfQjpjyZwHx
         ocMwrgUG0SR0CAlQT6E8ZhlOWmwNZDWhCdnD2kylOuHsHhf6Z5bfVEooy6qMf+gErrfa
         mDmTRdc32SQ8bMnVljEvzw+bahZRxIAvoC6PJynnpEOmAj4qhSBr2ACF79jBp4zGpZ5z
         DMEgWn0SEjFar+apxgDigun5lYh4X//ZTDwDreUrD9lOyaJYbXm+CN+sjdIh4ySRQie6
         iwkA==
X-Forwarded-Encrypted: i=1; AHgh+RqK04Yx+8QAW/AfokAcGnp9Vba8wPdiUkyJ4Cbg9MaBumeR1Dru69YY8iw66VOLNCF9nscPPSppybWZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw50Qlewyjz3VVlUxcCfA5oAhLY05DKi+/EeBNb+j9+GpdVj05J
	F6skqYZP8sUSsdEUwIw5e0l4W17U3zGZ3g+yjTFcGyb43IUaRRe8sx6fW0N00ionRCeKqqh+K9u
	AOYbtKBroGFk8ed4czEjYWSHlZU78fTjuRQb51RBT
X-Gm-Gg: AR+sD138Js1hN9qqrNXTszAZ08fMXjkQ71/u6p/WFN5MCEYxLjBmmnhxHaG3KvdWuKi
	CjAHzoJ07L5bxniyN47g4j57ZszRaKzuydh2j5KkofNWFKmQUK9NB6rp9xxaN/cCFc4O1xGfGVO
	3Hkbqevc5qSTVV/NlZcM6KuC34Esm1eHEUdbzMvjjb3vshUj+5L35YkV2zcY1PDxX8P9Q9pm5b7
	vCEojuJpY9HhcvSh0t7arVoNCi0+6z9ccaXyFevUrBZlcphwLwpscj820eSUgtCBOSTztrRlh3+
	mXEsJigfp4bAsw8IyxX1KhDzXDq6gKhG6Ge4bcagSWtGsmcusQ79S+4qhFUwijKsxbI6YMGuYN8
	NYLZRAl2N+86Cj9tcyaegiNoJ7j5To8jVE3o=
X-Received: by 2002:a17:90b:268f:b0:38d:c74d:29c5 with SMTP id
 98e67ed59e1d1-392cca64db7mr5320468a91.19.1786405292124; Mon, 10 Aug 2026
 16:41:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 16:41:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 16:41:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <dd9ebd52-7171-4353-8c83-9363019d55b8@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-16-2fc18ee6d3ba@google.com> <dd9ebd52-7171-4353-8c83-9363019d55b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 16:41:31 -0700
X-Gm-Features: AUfX_mw6OlaGLLkL3HyJwIpviYhrAvoZYVarJDuu-bVxocdCtMCbumdkufhLAM8
Message-ID: <CAEvNRgGSK9tO_-TvQvXoMwVwGygh5WjjBUOY-zLOA5yP2DwS1g@mail.gmail.com>
Subject: Re: [PATCH v10 16/41] KVM: guest_memfd: Zero page while getting pfn
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
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
>> Don't mark the page uptodate again after populating, since the page would
>> already be marked uptodate before the post_populate() call.
>
> The downside is that __kvm_gmem_populate() will now zero+write. I assume we
> don't care about possible performance impacts?
>

Would we rather zero in kvm_gmem_populate() only if !uptodate &&
gmem_in_place_conversion && src_addr == 0? That could work too.

Previously, without in-place conversion, populate never reads memory
from guest_memfd so there was no danger of leaking uninitialized memory.

> Worth spelling that out.
>
>>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Tested-by: Shivank Garg <shivankg@amd.com>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 030af0855f8b0..41950c8105b5d 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1079,6 +1079,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>>  		return ERR_PTR(-EHWPOISON);
>>  	}
>>
>> +	if (!folio_test_uptodate(folio)) {
>> +		clear_highpage(folio_page(folio, 0));
>> +		folio_mark_uptodate(folio);
>> +	}
>> +
>>  	*pfn = folio_file_pfn(folio, index);
>>  	if (max_order)
>>  		*max_order = 0;
>> @@ -1108,11 +1113,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  		goto out;
>>  	}
>>
>> -	if (!folio_test_uptodate(folio)) {
>> -		clear_highpage(folio_page(folio, 0));
>> -		folio_mark_uptodate(folio);
>> -	}
>> -
>>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>>  	if (kvm_gmem_is_private_mem(file_inode(file), index))
>>  		r = kvm_arch_gmem_make_private(kvm, gfn, *pfn,
>> @@ -1159,8 +1159,6 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	}
>>
>>  	ret = post_populate(kvm, gfn, pfn, src_page, opaque);
>> -	if (!ret)
>> -		folio_mark_uptodate(folio);
>
> In case post-populate failed, do we want to re-zero the pages?
>

I believe we can't re-zero the pages. When SNP fails to populate it
could be because SNP didn't like the CPUIDs userspace set up, and after
the error userspace is expected to check what SNP likes, then
retry.

IIUC zeroing will destroy the message SNP wanted to leave for userspace.

Michael should be able to explain more here :)

Btw Michael may I also get your reviews on this series?

> --
> Cheers,
>
> David

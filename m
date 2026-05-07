Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307153F1679
	for <linux-coco@lists.linux.dev>; Thu,  7 May 2026 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172976; cv=pass; b=L/4mlSbLTRlcRFTOKSQYphQkATTR1X0Fs79UPggjRIlnY+I8pVnSCOXSPIUnfCiUJo9xmaCmGUHjkzbGFiMQRtBqsDAZfski/3eQZXE5t8Y/+OsEcpmNJBrHfjixwZZJHgt1mGSK4FkSMbIgpGONacMczXPemkAVE2VjqKMVqn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172976; c=relaxed/simple;
	bh=yU58Xq2jlsKwRvWVzMF/35DqD9SuerVG6YnTfgrQsdg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMYkESBYgFBafI1ivfFRiYWEI9356qfoWS61LXUXkEuBoIRAy4YOKFqD4cOMhi+/Db1hJ2dbS0JteRXvQVJgM3LfGrDliny43kQz9dKl54ALMLmGHkMnKIhD2g2Db9/bFBxfAlzrUCRSxUOd4i1PbstD1TRdwoffKSEWLOWQy/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bhnFNNIH; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bhnFNNIH"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9568159ee07so631864241.1
        for <linux-coco@lists.linux.dev>; Thu, 07 May 2026 09:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778172973; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFn190LPpZLEhO+M+d9ixKOEcyk7TU++kVoDkDnyYavmYwFX34Kvtj32oCyScgStRW
         wBtCYY+WlwyVIQuQ+/N66TSst0xLL01n3WF/SNzOinq6NnuZHwhE/iBvYlTPM6n1eiEG
         4hv06SwCf8U+NVUZQfrKjDbN+slDs8kip6LdV4uBLrxMTrnWxqYgj4wEcerNL4gHMpv2
         edCmv9Tz3aPzIX8YRs0au7zo4NjK/hXbM7r6dXimaSN1HhII5LWkCCtNFsnK4R4QwuBY
         hLUAYY14x9gsBrW9N7G9U+O8xLYdzHA/SaOfbVErl81Tu36anVg+rjei6ottZOMu3vrR
         gYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fxKJNK3JYOXtq/6RpdHSxauIPnnYNnrQjQPiGKEVycA=;
        fh=jMaDLux9kqo07OZyJzQGTbBFJ+KKE2tn0LSDZeghiBU=;
        b=MbLEj4zEICxAROzFp7qV6RISJ0jSdwYTOuWcLcHwKbZeN2kpQBgd2BI854zOyTU2Qf
         nxpk3Ns5rXzn8eT3Fp4DjmaetCsbbufZjmpzbCibUhDg1o0ivSbsgWEmYMH5oM9RDXEu
         qwUTIBrvEVodBweMUL6iWzZWqY4H+WtEjXhdKFDfMqe5W+f202nspGI+ehphNu2hFgXE
         6mSl8qfgpE0zO3uRLc1KDC+/fcg4TVxPqUx/qb8/XFiOipeK4QO+V4SiGPV+7pqEZeRL
         0HwHDww9dOp5DJeqgGjwVNKbYlsEK9srXRRGMvp51qu1eeIWP77mAi0zjuFF8YRsI9dC
         wj3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778172973; x=1778777773; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxKJNK3JYOXtq/6RpdHSxauIPnnYNnrQjQPiGKEVycA=;
        b=bhnFNNIHQByf65/5PiFAOKyNuNpTqUxylQjLtJMYP7e7rNCMexNR322ZBgxEefdAR3
         nr0+Un+32ZHXByiu1LoG1WvjJRq4OC0lCnqR1bfIY3+SLLWuwD/yXPM/JHjWBnUlhtwD
         9UjSFM8wqyL0vU4nvewF7WbLpyVdRtFQWUAoXA8huofuzbqHC/e7ECRA+DRpD3KcCcgV
         tuYluARO8oTnF41Xow1KQzVTKDfUWM/FKNaHbpPyLr7oQYMf1KWr+vJGSEFq4HDvwzIe
         eRxqlTpUxifv9pz5BlbOjw6JQg4H9Zsz6RW1kXUmaEkdMKSkEEfVvBS1UDj37Ok6TU8M
         6DPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778172973; x=1778777773;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxKJNK3JYOXtq/6RpdHSxauIPnnYNnrQjQPiGKEVycA=;
        b=oGSePuJvAvRE6wwHkax0C/cVfT+zzAPZkz8XfCqwhPX8fR4C9kCU2qtykx2ir4QsR0
         as4OCLYilRZfxGsMw9GNUUGhuRa1wTjP/DqXsrVBgS9qY/QSb+q8pOkqNNTBGNBbbawa
         49ue742rYo1lOm3/WMGur4KWfxNxz9fUnIHTG6TYHNYPOQeCv4WHWXQOX8nEoZ+Pv7YW
         BW9L9VDLUGSLQWxDiJ+NX1mH98EgtQsSuSGXnJGiC5z9Ygg/WNEXYKJyDIn9D5xMOrNX
         E72yA9QzVscJ8e0hkDadNP3T+8AdSqgJ5kUCOLe8j8kv9NdWwmzO3M1CWPlIW861Pl38
         LB/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qjsZ9nt68Jz4kQ8DDDflv8Bg07MA0Ct11QzVjnwpa3bueatGDkGEVzRg0rYNLzMgLbaTmhkRuZmPi@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ3DB6zYXCn9FYFxMjfZFdSKLYqCtDpwJn1i+F+YFaUDuKv4tq
	8bBPLtqTJ3bsBpFJAGoW5iO3042giIvetJgPweU4royO5EuhDfllgqyLswNYNIm1cL5ZC9XhJAK
	GZpMk43aq8louH7YTZna0vRfjU8ub9/5p5kjvYjiZ
X-Gm-Gg: AeBDiev5fipk5ptv4zYF2dvvGg7C85kRVYo3MNUAdmVYUPrikvqDsZQrm9ozg+5zGco
	gkEgEpoh96zOA2ZIFp9tTf5YFegl3jBTQ05yPyx7N/j1gwfrEIWAk3i0WquBb6x6pidXaFvI/U0
	hziT3x/0gvSbyVqlnhAMLSalMj1nwF8zXh2QXRXWvEg1xoDCXUQHSNR/aCs2ueEKM6nuQhPf/or
	UFBGSy29xgpGLU47Bg5Q7heA2qY5AIpiv8b9oqEUY0/Nv0gkVd9TfW7FXrCToxe4W+YFW1GZr/y
	WFiCqWN1uNl/2Zudvlb601pC6RT3hC3U8p65hIpPs0pKXV3dPW2SK6g4vrUHv/G9d/KzA3HwDAx
	uUcZq
X-Received: by 2002:a05:6102:3f52:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-630f8e78530mr5085650137.3.1778172972306; Thu, 07 May 2026
 09:56:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 09:56:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 09:56:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <n5ce32wumzeiqqyqutom4apy2kqfetbvusc6j4k2xarsska5mw@klp5bmy7qhfm>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <20260428-gmem-inplace-conversion-v5-10-d8608ccfca22@google.com> <n5ce32wumzeiqqyqutom4apy2kqfetbvusc6j4k2xarsska5mw@klp5bmy7qhfm>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 7 May 2026 09:56:11 -0700
X-Gm-Features: AVHnY4IiEmQejwyUzKbSGtsBzFH7WMpl699YC0dogi8imsP9-pFhPzVdvXeVDZc
Message-ID: <CAEvNRgF9+Gr7UVEq-E2SQEb_XOQQMOXy9F_A2tA=DbNV_fJ0EQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 10/53] KVM: guest_memfd: Add basic support for KVM_SET_MEMORY_ATTRIBUTES2
To: "Liam R. Howlett" <liam@infradead.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

"Liam R. Howlett" <liam@infradead.org> writes:

> On 26/04/28 04:25PM, Ackerley Tng via B4 Relay wrote:
>>
>> [...snip...]
>>
>> +/*
>> + * Preallocate memory for attributes to be stored on a maple tree, pointed to
>> + * by mas.  Adjacent ranges with attributes identical to the new attributes
>> + * will be merged.  Also sets mas's bounds up for storing attributes.
>> + *
>> + * This maintains the invariant that ranges with the same attributes will
>> + * always be merged.
>> + */
>> +static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
>> +				    pgoff_t start, size_t nr_pages)
>> +{
>> +	pgoff_t end = start + nr_pages;
>> +	pgoff_t last = end - 1;
>> +	void *entry;
>> +
>> +	/* Try extending range. entry is NULL on overflow/wrap-around. */
>> +	mas_set_range(mas, end, end);
>> +	entry = mas_find(mas, end);

Thank you for your reviews!

>
> Please read the documentation as I believe you have a bug here.  What
> happens if there is another range stored higher than end + 1?
>

The invariant in this maple tree is that contiguous ranges with the same
attribute are stored as a single range.

The goal of this first part is to get the entry at the index just after
the requested range, and see what the attribute there is. If that
attribute is what we're about to set, extend the requested range for
storing to the end of that range.

If there is another range higher than end + 1, with the invariant
maintained, that attribute has to be different than the attribute stored
at end. Hence, we only want to extend this requested range up till end.

> Do you have testing of these functions somewhere?
>

GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4) tests setting
attributes in ranges. If test_page is 2,

1. [0, 4) starts off shared (4 is the number of pages in the guest_memfd)
2. [2, 3) is converted to private
    => so the ranges should now be [0, 2), [2, 3), [3, 4)
3. [2, 3) is converted back to shared
    => so the ranges should now be [0, 4)

I verified this by inserting some trace_printk()s and inspecting manually.

>> +	if (entry && xa_to_value(entry) == attributes)
>> +		last = mas->last;
>> +
>> +	if (start > 0) {
>> +		mas_set_range(mas, start - 1, start - 1);
>> +		entry = mas_find(mas, start - 1);
>> +		if (entry && xa_to_value(entry) == attributes)
>> +			start = mas->index;
>> +	}
>> +
>> +	mas_set_range(mas, start, last);
>> +	return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
>> +}
>> +
>>
>> [...snip...]
>>

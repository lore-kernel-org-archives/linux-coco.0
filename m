Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C33E2746
	for <linux-coco@lists.linux.dev>; Sun, 16 Aug 2026 23:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786922002; cv=pass; b=C/bgq9DJCxcCugkBoMGV3pa20KzncqPnD/v0aj0qoiIFbT209QdsWiJ6WK0cC/OvyadzJGLqMV5EPxM/q4rpZAeVleRNb3COaXJlQI2/Wv2wd3bItv5Z9SumBetrYBTb5U6RO6OdEBIuQAngHWdgFR5s9bGlpJUEaE//wahzdFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786922002; c=relaxed/simple;
	bh=4Q3/0/Vme3NViO+zbdqCGLReJBPhZGfXLLeXqh+3fvo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cD3qq//+I6pOWPRuDOt3n7fVteraaKqebe86+lFjOrjCgaIMmMO4y8Q6QkKtBKfintTSVnjOoc/PAj5bQvNuVPIUKH7jnCOAFZpHGbfdJP4nNZcL3LTKU6iYdHD33tZ1aSTM26EQjNaZ2aGu5aHptNYq5YpdB2a3b4CB55U8yiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dOrmu861; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dOrmu861"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3407784a91.2
        for <linux-coco@lists.linux.dev>; Sun, 16 Aug 2026 16:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786922000; cv=none;
        d=google.com; s=arc-20260327;
        b=Fah/+43MRBcR+3+ck6i8M9IsilLYSd8cQbxbJV+DZD7ajFOAJ9atDoFYpUnp+odif4
         mo06nA04pBUvV5239hszwL6J30NGr5qckUgQUbyDIc8Xcc9gmQ+5ZGyZKaZ/WUBbPAsN
         eHKUrIvPHtAyeWy7Dq4Fre7Z9wHRfVSah5vUntT/0tu31pdoKT+BIdqxfo9geDcpDlRQ
         xkWt1l79yKTLywl/TJIRm+eVVOpbfKT7equ/wqePNbw9TX5EASfNg8pfjFXPD7nsinEL
         C3XqwAytqBBj6xxO4Cugvy9Xm1IVYVW/+DRHP4BQbT4+JEsOXmFDice5CfcxelkpWQI1
         iqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=12JghCh0XcebURQOPBtQP8z7apq3lmuNj5BeBckCdP0=;
        fh=jXLL+J06T/nwqnRZymTsY+nTeJos3sAOuacviG02/9s=;
        b=X7OhUNpEcE0JwZujOh3vKgMZuwqOqyOIVIzSp31YAnmNCj5J/Ecm1L3msaG1nMZYmT
         xjImGjsO9zdiGjMfP5QQwy8k5e0taPmqkQRkK2hlLOwUJ+q/JND7PatoMCkUGiz4pT0Z
         498lf1Z//cSjMg68KczI4EIo6y01CyORtTIYI2hhI4lfYs12UShiUzippr3F2wKZpwB/
         DhfcoiWkyxGW1NFMH3+8nmBzlkvxP4Ls3EPnNihmDLKY462ULW2gkKAKOX/LZvGMNFtD
         SckhrcLRkrMNlZYONnyR4DJ9IEbNKGKrXDHqouUm4+Sy0WNKL+8Vj6UqmF1sKPhQ1X7w
         XtbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786922000; x=1787526800; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12JghCh0XcebURQOPBtQP8z7apq3lmuNj5BeBckCdP0=;
        b=dOrmu861D3TqgwcMK4k/F6x+WE5LcX0M4gbWbTY2lDJM9mGYpU83BDpYN46ivnQdZg
         E0WuT5Vb0p+hr2/5VhBh4GN6VDlXE9oFkcwaCdPB1oAy7tSSRVIuXG6nZSANFmD/eIeF
         OTKvvzYX9QmcpkLH4sBYkzosNaeQlSbRky/U/2mhSSM0WLxdSevwnLSLWJD746jZ4x28
         Bhsy19zx8BQyTUOdZOLkRHdUUVVNdrOCZaN5Ue0cw1cfUoti45pyMYp2ooZ2WoeDQoHC
         RQMm9ygqCw9rhFdXkXO2yfe+kxaQi1V9ZCCQOPw1PcoV9LuS7fo/6/x5wbEaS/qMgTFC
         kwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922000; x=1787526800;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12JghCh0XcebURQOPBtQP8z7apq3lmuNj5BeBckCdP0=;
        b=VzR1ZN+cf8oFPV8+qc8ef9/s/qHQSfqIn3jbCj+vi/pCWl2KoO3lghBqCo+Yw3VTQD
         t1lYuhIazsrHaN3SPntWpBjgYf23bFlMC12nKChtO4x9SQSICh8e0uQ1+bS438lObRl9
         2/xuAPhV/ax1WKrVgX34fvsQTF/oRixNCRls2U1yrnsc4acVNyOkFHzowzYLCdMeNPNd
         C2g+jE45Wq+KaytIf5b2FmOWTnxUjyFNUANsGrF9lmZj5sdiDr8kY4s0DcOIbL7k4VWD
         yAn6QQbN0AIAY/Vl16Snwjes89TuvqXXsTSxX9Ft9DRjGkQMJ5RFS/1r71gnCILGnyqG
         FfLg==
X-Forwarded-Encrypted: i=1; AHgh+RoxunWYG/RjuFcfLLXqtRl265Vu1Jzi6bwVsa4ysVfw4Vmot0zI87Rzht/UcTWQPcti6vNUvBNPIGhq@lists.linux.dev
X-Gm-Message-State: AOJu0YyVJUeX/hbeHl1XEGwWPjFBEQOTQXbPeVHgo8Ho28DcQScVY5Gb
	exhC5NRW+puckovuLSR4LTsoWQKEHxuH1Av6BFpdoV8vilfInV0/JtIBvtF6m1Ut8pJ41KbAV/L
	NvTi5QhGjzqQgVzoU9guyP+iKBR3+0us56eN3wAFC
X-Gm-Gg: AR+sD11Mm33/XxEW6KECSmfR9UYE+BhGN0T1CJRL3Ng6R0e8EVQWkkGokYnUsx6aL9e
	jj5ID53t1NnIdmOEPKaOhm1EGmAioSO5/u38JywoiYYG/bDXNaasGt4hOrGJDlmwNUnugDEsts+
	oSoljVprXJeEwhtB6L+EWM2BwLW2yultfwShnm6K+S4LHHT4H8YnuDW9orOLSszp2+FIR16+Ruf
	2M4s13zhMVN7dXbX5vvAdZ8d2sHDlkUbkFwENUKaYjWe9NJASUbOIzybSHb5yVrM5P1pMC6Az0P
	1Gr9jxg/GFeYuQo5GQzjty7wA4u1K8LTjXC8T41/+4xGWnZvTO2QZQDMg4DSo1frXS76iIlD7rO
	/lA==
X-Received: by 2002:a17:90b:4a4b:b0:38e:bfe:81e9 with SMTP id
 98e67ed59e1d1-3933b6ea12fmr20468357a91.1.1786921998920; Sun, 16 Aug 2026
 16:13:18 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:13:17 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:13:17 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <4c638fc5-5a74-43d0-b5bf-d7ef893cb994@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com>
 <eb1b5763-37bc-4cb3-890c-1e619e5a8ae4@kernel.org> <CAEvNRgHyRdt7rp=5e5FMbTT=fXNfB=np7VWd_GdmJcPOQgps4g@mail.gmail.com>
 <anpQJvFw9s-XP3pW@google.com> <4c638fc5-5a74-43d0-b5bf-d7ef893cb994@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 16:13:17 -0700
X-Gm-Features: AcwNN1X3sou7ibuklgbqVQOQa1awc-4sUeU5l1gDhhG2qaPtSC5Jq-Du8Zaqh3M
Message-ID: <CAEvNRgGzqYQLC9ThxcHCQ7KJm7rRMvqzGoznCz1d4dxAkiLkxQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: "David Hildenbrand (Arm)" <david@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

>> helps the reader understand what's being checked without having to look at the
>> details, and also helps communicate the ordering dependency without needing a
>> comment.
>>
>> There are definitely times where the usage of a function bleeds into its name,
>> but usually that's because the name and the usage are on and the same.  E.g.
>> get_user() describes both the usage and the "what".  And it's easy/possible to
>> go too far in the opposite direction, e.g. by giving a play-by-play of what a
>> function is doing, but that's why we have bikshedding sessions :-)
>
> Note that the problem I have with kvm_gmem_is_safe_for_conversion() that it is
> all about *conversion to private*, not *conversion to shared*. In that sense,
> the function name is just confusing.
>
>>
>>> Perhaps a little ahead of its time,
>>
>> Ya.
>>
>>> but later with restructuring for huge pages, we also need no additional
>>> refcounts other than gmem's own so that restructuring is safe, hence this
>>> function name was meant to extend there as well.
>>
>> Given that I've read that at least five times and still don't understand the
>> nuance, I think it's safe (ha!) to say we'll need to revisit and review those
>> changes no matter what. :-)
>>
>>
>>> In this case "unexpected" (especially since the next patch adds checks
>>> for maybe dma pinned and unmapping), begs the question "unexpected in
>>> what way"?
>>
>> Ya, that's why I like "outstanding", it succinctly captures that one or more
>> references have been "loaned" but not yet "repaid".
>>
>>>>
>>>> I'd rather add a comment than have this filemap_get_folios_refcount.
>>
>> +1, the local variable just made me scratch my head.
>>
>>>>
>>>> /*
>>>>  * We expect one reference per folio-page in the pagecache and one
>>>>  * reference from filemap_get_folios().
>>
>> Nit, please no pronouns in KVM code.
>
> Whatever floats KVM's boat :)
>
>>
>>>>  */
>>>> if (folio_ref_count(folio) != folio_nr_pages(folio) + 1)
>>>>
>>>
>>> This comment explains what's "unexpected". I can do this and switch it
>>> to kvm_gmem_mem_has_unexpected_refs() unless people have other
>>> suggestions.
>>>
>>> I wish there was a folio_pagecache_refs(folio) that
>>> folio_expected_ref_count() can share with this, and also
>>> folio_swapcache_refs(), to solidify the definition of refcounts taken by
>>> the pagecache.
>>
>> ...
>>
>>>>
>>>> I'd add a comment here for the "why are we unmapping".
>>>>
>>>
>>> Does this sound right:
>>>
>>> Unmap here to ensure that userspace page tables have no mappings, which
>>> also ensures refcounts from those mappings are dropped.
>>
>> How about:
>>
>> 		/*
>> 		 * Forcefully unmap the pages from all userspace page tables,
>> 		 * and then verify there are no outstanding references, e.g.
>> 		 * acquired via GUP or similar.  Tell userspace to try again if
>> 		 * there are oustanding references and hope that whatever has
>> 		 * pinned the page will put its reference "soon".
>> 		 */
>> 		unmap_mapping_pages(mapping, start, nr_pages, false);
>>
>>                 if (!kvm_gmem_is_safe_for_conversion(inode, start, nr_pages,
>>                                                      err_index)) {
>>                         mas_destroy(&mas);
>>                         r = -EAGAIN;
>>                         goto out;
>>                 }
>
>
> Sounds good besides the function still not being clear about *which* kind of
> conversion.
>

Circling back to this since Binbin also had a comment about the comment!

I'll drop the use of the const local variable and do

    if (folio_ref_count(folio) != folio_nr_pages(folio) + 1)

, and add a comment rephrased without the pronouns:

    No references outstanding if guest_memfd sees 1 reference per
    folio-page in the pagecache and 1 reference from
    filemap_get_folios()

, and then also take the comment and rename the function from
kvm_gmem_is_safe_for_conversion to kvm_gmem_has_outstanding_references.

	if (to_private) {
		/*
		 * Forcefully unmap the pages from all userspace page tables,
		 * and then verify there are no outstanding references, e.g.
		 * acquired via GUP or similar.	 Tell userspace to try again if
		 * there are oustanding references and hope that whatever has
		 * pinned the page will put its reference "soon".
		 */
		 unmap_mapping_pages(mapping, start, nr_pages, false);

		 if (kvm_gmem_has_outstanding_references(inode, start, nr_pages,
							 err_index)) {
			mas_destroy(&mas);
			r = -EAGAIN;
			goto out;
		 }
	}

I think renaming the function from kvm_gmem_is_safe_for_conversion to
kvm_gmem_has_outstanding_references should be better since it doesn't
really make a statement on what kind of conversion the outstanding
references are for.

>
> --
> Cheers,
>
> David

Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D53CAA41
	for <linux-coco@lists.linux.dev>; Sun, 16 Aug 2026 23:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786921339; cv=pass; b=Sz63fejo/pKqPDQY928Kz7v1I0XcLtQcX7ZJNQHG2HaG/asON9MwMqjbg7MdC5DBw5aXXM/KOuQ0axrh6x/CBq51nbQRgQih7ybtGdz1hgZzCUmZwMYaBvX//72Fs1hJLqv8nihNxJCav1E9iY1irt+ln3z3FZaVU4CxdVHbGnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786921339; c=relaxed/simple;
	bh=TfZcEuGOfr1J68VSYUvGJF5oR+xbrzPMOaOCm+qrrgM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZhBU3R2BBBUgxt2p5r3PqZs/Nqm3GwnqzUGhC+ENND3hxSAg+zo21bqo6aerkp0Y3wJ3sQwM8aXEcMaG6LYl5MSUrBJLvPXvABQ0VBH4ftv2HyDSGu9hggqurA4nl0wL7olsR5WIb7k8wSObaqpE0YbZiagvKRdcgm0dSoKlFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZOQpl9hj; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZOQpl9hj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2222732a91.2
        for <linux-coco@lists.linux.dev>; Sun, 16 Aug 2026 16:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786921338; cv=none;
        d=google.com; s=arc-20260327;
        b=h/1SHqwKmGNv0+SpFSGirXuk6ZFMVmN/izINMcT+kl0an0FsuC7nWnK1n01gKJtJDw
         fS6HMNj/HpRwdSIAh1BNP95vApoO676BxAqDRDMUUB1MtTwiYxVieiotKSuJ+Wt4d0Hb
         o/B8n9lm3/GgwOM/FVOfWH4cuRpjMXk4YvRuZo4Le+gCf2j/8yTPU7b7TCx3ZwFwIUcz
         ZVRrywFn7FO1yVvPR4kyqjku4VMSr7EHn9Gwt4DBySCTnSP5DZ7MwWTYziyZoDGdjXgj
         ND6dBE3hw97uRcUUmLQ6PuAuFK1F33aO1YrNuWTaToMH65fUCd4eXJPGbw5c7YFLKP46
         RPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        fh=LDM75hiT/WeKs021nd7atISrqw0XsxvswViI9sN7Luo=;
        b=Q6n3uKS9jJYf6soVKstjmY3yL4TD7w2h1XdeKAqb2Og5FvrUAjw2IpkDgivnvAaBzZ
         BINKhvrz67at7EKxeQ8veLOqTBuUTta6uJ4OXsA8dd1PL7UOxoSfsOFaKO5SBM2/rSP7
         ojoRIKkm3jn4IHHMYP+Z10cG1b9zbV4izKISVio5ocPHxJw6xqWenVBWqRgbQi1ciuar
         gjZbxLcPWhBcn9p/cVYBn27GY8aJ91W6D98j6DJdCHpoD+HgtSgCyNrGRNpJeUTE7Y/Q
         7AULMYCI/FTIbemGuTkRSXfQt1gpmWZdAdtIqyymEOVeWannTpoob+FMnjoLBYHiHM8H
         tLgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786921338; x=1787526138; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        b=ZOQpl9hjczS7peRbsLD1Y9gFKRnNOBc8kO07RV22FRSdyBCQIujLaT/AL5ex/mh869
         NWjmRav2IiOpH+9ff9/plOWaFOdZNX34ZKqZR3/YdT/Rpb2W46HCuFk5dSbQTgf8mtnq
         eU3WLSeH7UZC08qc4oLPEPQaa6eAFmwXNdRX4VLOahSEXiBsIZ/a9Nx1Axb8SeKlbk6V
         D6d6iOmZXrWijic5sgB335OcuvKQeIHQeosYEt42GAkmKbuzaGUsOofCkFhpa37peu9K
         Px9iOtH3aVh3klMYMfH+f59gjvDTGD4kaIvA+pCHSkrhY0ZQA/5hvXLWbrroVmcKR8R+
         qBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786921338; x=1787526138;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        b=Wg1x+Pg3DXAjm0gwa2XlsCBb4QI0YIEqCIgW1MpJWtOeYpsfJ6XTU7xvV6fK10wt/S
         OYIeAo6QRo1MBo4dMF5Egh9CKyxki3J/1JrzSVDPsbigApwGWeoQc1nXEk0x4QT6ejDr
         QZTwMXGf+dJ0LNSGrIQGLOuHbeSBDudaJXw+fcb0occYXF338t6g037ykUsrx+uuq+lu
         YrT/MGRnlpu8LN6wLLrH0PUMuUL7U+1qy8dlRi5TXPd0kDVQs7HgDMFtr4X7XAm9QpEi
         GWxP27jLffEFCgyBA4bxago0pwPr6tZ4zRUVls/BuKLSL86AEztmYjnhwJbJuyuUVKod
         xSDA==
X-Forwarded-Encrypted: i=1; AHgh+RqjC6SvnkO/Bd0zH5As4obJmwJwf5k0neCwSxEfq+wA12SVM96qw8iYWojGeDE9cWTp5SSF94p+lBOr@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Nf1FvNBsVDLDHxWfc3wP/GbiEba/b5FkJp3HhwGWnT7Kvtaf
	YZ0ND8RRCcMqve26TERj/pgYebL5q/XwwXrj8MDMrpuQzJQXXhFdpT5H+47p6tZrl9Ht9ms2dXw
	qvGX5nT20PuBX5VqnDZqUfdOJaovXTBO9dVEkVlrd
X-Gm-Gg: AR+sD10VpBtpKjMebyVGpcTvZ/36tNiQrlLrZ16JSTTd9dYbyuoEbh8DHFfjApJxRFC
	68tprHdOEdq8o+qx4jCOcvYx4+ZO4cov9O+sdqlu2OFehc1yW8r+WWN+4EoEPdFDxa+uXykbHY2
	gzA2r1hFjbbCFDjTJRWNIMR5Rva5IpKXio7ZyRTVBlFZoOtHvwvCP7yx7hXFudy76LQWjpTwynL
	1+1ljszyVep8SWdjLypiq8n9qVoHj69mZu+yZVx00KRrLpInXwC1KI5Osn3HqrpQIoTahs6ESIi
	0erWv/YHCFHsy2onOmoWVI5HE9c1XAT6Be2fA8HXBMp1H3/PapWpE9N0J8IELT4bPXjSgXD4nRO
	fGQ==
X-Received: by 2002:a17:90a:e7c8:b0:38d:adae:4866 with SMTP id
 98e67ed59e1d1-3933bd2066dmr20117316a91.21.1786921336732; Sun, 16 Aug 2026
 16:02:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:02:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:02:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <beecf36b-b0eb-4691-918f-fd39f46d5d8f@linux.intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com> <beecf36b-b0eb-4691-918f-fd39f46d5d8f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 16:02:15 -0700
X-Gm-Features: AcwNN1Va1JdlpRRtXfl-rgaiOwbgkg6rBN2xjp1zNZlzVot1c-IWzDKRKQ6t494
Message-ID: <CAEvNRgGtnQfhCkrWah3jNeivbHCQqRSQEXs=uqJhBmS+GVntrA@mail.gmail.com>
Subject: Re: [PATCH v10 15/41] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

>
> [...snip...]
>
>> +static bool __folio_safe_for_conversion(struct folio *folio,
>> +					enum lru_cache_drained *drained)
>> +{
>> +	const int filemap_get_folios_refcount = 1;
>> +
>
> Nit:
> After adding the helper, the use of filemap_get_folios_refcount seems
> less obvious. It introduces unnecessary tight coupling with the caller,
> though it has only one caller currently.
>
> Is it better to pass the value as extra_refs, similar to what
> lru_cache_drain_for_folio() does?
>
>

David also suggested [1] something similar, please see
https://lore.kernel.org/all/4c638fc5-5a74-43d0-b5bf-d7ef893cb994@kernel.org/,

Please add on to that thread if you disagree with the suggestions!

>> +	if (folio_maybe_dma_pinned(folio) || folio_mapped(folio))
>> +		return false;
>> +
>> +	lru_cache_drain_for_folio(folio, filemap_get_folios_refcount,
>> +				  drained);
>> +
>> +	return folio_ref_count(folio) ==
>> +	       folio_nr_pages(folio) + filemap_get_folios_refcount;
>> +}
>> +
>>
>> [...snip...]
>>

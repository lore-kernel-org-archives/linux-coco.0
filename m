Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B9432BC8
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654921; cv=pass; b=QXRglUxoi6Pq6ZDy7xHB3F4rAfreU+CdVWPzGNWBbEYwG5sK0+jWHxycDYblhUSRL/vUB7WTY0qcjo51idYbYObComJZZetXsEL3Rw2F89bvlU6VP4KYl5c8uvicQwn9QuGGOqkcYg3ABFfgs+pJMxyqluLcu7+yY9AS5ptck4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654921; c=relaxed/simple;
	bh=4zrSQCT5vVjl4UEAlv+oAw5eKuOMF43JfK53dz2A/cQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhMv93l4jNhnnstX3hxVxXcxqWmbZ8CPFqFcuKwlpAJ0qjC60841POqxYs/QURNhV9ry6VB+TGlHZiE+1DSl/VQ6fwUGDSN78Gn5tsiqMxbj2pMmN3vekgWEBf1xeOppF3vG/be2Xno2aM5AdpUFpfHLZdiv1e5hXz78LfnJBe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AKXOMblA; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AKXOMblA"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso287255a91.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 14:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786654917; cv=none;
        d=google.com; s=arc-20260327;
        b=T3Kk0A/9z+1AbofOmR03utHPt5CxsN/1vPz5Rm6Lb9YjqnXCW72hbqdSWpJLGCoHok
         Olh8YVa/Pz0TQY8me+dRvGApaDpXP7+kdX5uPN0vzKDMNdZmuW2rPcLt0iU3/Q3gKd1S
         iTqsUpkor7ZS3Ol6L0Ib2MAQ7j19EldFBAe72SQOXB9F6XdAjtB8UsEAUUzvyqp9cuL4
         UA2BOfMcp7VVFBdAojnVIsMpy5Sf8hScvpqcIBvIDUOPXFSUpMj8G0PJ0QNOnlIpcime
         eXYd6+e8OAlNA7sPuw0sHqOsFAAWNH9AJgLcbtZSjBz/kdvpRbejRT1BPscFe3uIFNXP
         Y9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=ScWN871Op0fwwgzG1qLzviyqH/P4Azji6iscDLhHJjo=;
        fh=IFir9me5esLWNkp7ZZ49mpcfFmjexSr8vWEGnTzMNyc=;
        b=U1KCGA3VwRqNb5WYgpsdODqf0d8xq8dBDmxY8Hfw983Y64b289HdwuzZ6CP5hIrgE5
         O8TIrXYQXfhdmKXuCX1EYEB+RHJF6pjGzq5hXsbb/0wMiXQb6DN6BBrvTSv0Tpxt5uYo
         Rr1vanUctgGiRSjGwu4vhtb9WhVk0GQiX0K5v1UIe5xfP07FRX6myfg71MurCVbDruCO
         6w9IpsxmzW3usVCmdYNqgrWU+eEGHevgiLGI0onUSB50ppRnqNsehpeT3Y6ItLhL5RWY
         ck43+cBr8/bTpp/oun5edBtNA1mYVU3DTmvoCt8PqDGQ/IK6DZpZIZWbogR8GcMjTkGB
         QgVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786654917; x=1787259717; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ScWN871Op0fwwgzG1qLzviyqH/P4Azji6iscDLhHJjo=;
        b=AKXOMblANai6/29CVb/zgLhfGpa8B0o3rNzhzWZj5O0qRjQJyuGSY5uPlFnE9gQDRu
         p2yeQr04d04J2HdaXJoRmqhafTVBO7t3P166UzaYgjWmDFaWQXVd1I61+UZ+md7HWy2Q
         JAtd14YHDpHLxsJJrEegGryMfW1g4KtG9iFUGDS6haVrHDP+FTjMYTypMsh10LWfEwdl
         LogwZKpHC3wm2iNdcrZu6sA6j12RMUg7LHEYJZU8m//ANbXNbgITsInLmPyjPmRmZrZF
         iG2jvvs6J+GbP6hHnI90YciheHw/GfXqNW7cSUaGmlJUf4a8/cyW3k8Nn0CRcan6zmfe
         WZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786654917; x=1787259717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScWN871Op0fwwgzG1qLzviyqH/P4Azji6iscDLhHJjo=;
        b=MruGPTZZMGrqG0cRCemH9ziOZLToC9BThh3uDwEq/Y+v4FR1g3cNLBY55f83HDc8A3
         4DH0JDoEQojEFbsu/D4flQ+MLaozOwRCgbdv5NxO+t0Xc8M/9yd/Ah5B+lw7OirBZNh6
         CyzFyQq8oBbjgfrPG3KypxuWu9g0WQreHRgBevkC+RQ004sntAK42yCcHoqC0L4SjeBE
         k28UAifuh0KLdjYCFpoPoGq26Faz5h+bmwPv6M2//v4t1c4rXHRAnDCiYmStKP1izG+G
         hiBribddQ5yhL1K39yfiHmHZfsLnlGLdsoHzfhKO3dmoqHpoQWkpw2c3Obo9P+L2jV32
         J+Dw==
X-Forwarded-Encrypted: i=1; AHgh+RpRbNigoCPGO693JQkfM6hYgRH1XhlnmskyTdgAewhW6zNpw0TGDlaciIC4AzLfWZQI43bm8VH7t8U1@lists.linux.dev
X-Gm-Message-State: AOJu0YzfRvJsqm45+z6JzMNKhFwxAr2TG5DRACFUrr7YfHgO8U53YA32
	3zDuJrjw8vTbMFOwldqqJLewMSWTyBml8fzSYnBaawS+zTCFYy7gnu/jrcKrnwCQHLScIKWoF6m
	0Q41UyRgjOFoRpBsYuDHL8aI3xUOqeVO6hPbGIoMM
X-Gm-Gg: AR+sD10psy4/4Be/nq6krSzz/6KTHO6Tia9SuiF9J9snBFmws3ZpinuwhzvTfaBos9D
	o71pYkmn5Ldg/JGiOjusNY7MwbLIkXL3Q1Hdms6qnPbkNHOsuAGNN8aGM0x4yYob7yB4EoLcZqL
	PZXN5JbY7nDQ4YkUXp01SszhRjAwroNWEqBjPU7b23edOROfmEVmGgoERMsmJ+/55/LgWg9ybYZ
	pNsJaqEyD+Xz4T0wMRYdUVJX9TcXxz/WVI7+TBNuISlkZBfG7W3kEhh+FSmoW/26pHK174NAJzt
	GYDZUAMqLaL1zmh3HfLih4qV+VFwMvmWppDmnpJ70kIITgrySneW6RJV7OM6n2IJ8Wpvv+AC/GI
	okwcc18WUv7ZOmUWirdKgAiHEx6yCGw==
X-Received: by 2002:a17:90b:3147:b0:38f:1a2e:6e56 with SMTP id
 98e67ed59e1d1-3933b8825fdmr709898a91.9.1786654916555; Thu, 13 Aug 2026
 14:01:56 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:01:55 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:01:55 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <an3o4h-E8mj6CUaM@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com>
 <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com> <an3o4h-E8mj6CUaM@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 14:01:55 -0700
X-Gm-Features: AUfX_mxCp5gPchMRxL80fZacuO-M5ybDdte9e0UhxtiZjcdkxnSatGLDZOBypz0
Message-ID: <CAEvNRgGpCVCGVjc9jCt9Yr+XypF=71h6eBahkXNkrXhfrtGY+g@mail.gmail.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
To: Sean Christopherson <seanjc@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
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
	linux-coco@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 13, 2026, Binbin Wu wrote:
>> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
>> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, =
pgoff_t end)
>> > +{
>> > +	struct folio_batch fbatch;
>> > +	pgoff_t next =3D start;
>> > +	int i;
>> > +
>> > +	folio_batch_init(&fbatch);
>> > +	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)=
) {
>> > +		for (i =3D 0; i < folio_batch_count(&fbatch); ++i) {
>> > +			struct folio *folio =3D fbatch.folios[i];
>> > +			pgoff_t start_index, end_index;
>> > +			kvm_pfn_t start_pfn;
>> > +			kvm_pfn_t nr_pages;
>> > +
>> > +			start_index =3D max(start, folio->index);
>> > +			end_index =3D min(end, folio_next_index(folio));
>> > +			/*
>> > +			 * end_index is either in folio or points to
>> > +			 * the first page of the next folio. Hence,
>> > +			 * all pages in range [start_index, end_index)
>> > +			 * are contiguous.
>> > +			 */
>> > +			start_pfn =3D folio_file_pfn(folio, start_index);
>> > +			nr_pages =3D end_index - start_index;
>> > +
>> > +			kvm_arch_gmem_make_shared(start_pfn, nr_pages);
>> > +		}
>> > +
>> > +		folio_batch_release(&fbatch);
>> > +		cond_resched();
>> > +	}
>> > +}
>> > +#else
>> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, =
pgoff_t end) {}
>> > +#endif
>> > +
>> >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t sta=
rt,
>> >  				     size_t nr_pages, uint64_t attrs,
>> >  				     pgoff_t *err_index)
>> > @@ -599,7 +636,12 @@ static int __kvm_gmem_set_attributes(struct inode=
 *inode, pgoff_t start,
>> >
>> >  	filter =3D to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;
>> >  	kvm_gmem_invalidate_start(inode, start, end, filter);
>> > +
>> > +	if (!to_private)

Should I make this condition

	if (!to_private && kvm_x86_ops.gmem_make_shared)

instead?

Will that help?

>> > +		kvm_gmem_make_shared(inode, start, end);
>>
>> If both KVM_AMD_SEV and KVM_INTEL_TDX are enabled, HAVE_KVM_ARCH_GMEM_CO=
NVERT
>> will be enabled and the logic in kvm_gmem_make_shared() introduces unnec=
essary
>> overhead for TDX.
>> Not sure about CSPs, but in a standard distribution kernel, it's very li=
kely
>> that both are enabled, right=EF=BC=9F
>
> Yep.
>
>> Should kvm_gmem_make_shared() do some optimization or the overhead is re=
lative
>> small in the conversion to shared path so that the optimization is not w=
orth it?
>
> I assume it's relatively small, but it's probably a good idea to gets num=
bers so
> that we can make a semi-informed decision.  E.g. if processing 1GiB work =
of 4KiB
> folios is <100 cycles, I think we generally don't care.  But if it's more=
 like
> tens of microseconds, then I think we do care enough to optimize the walk=
ing for
> TDX.

Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D7486E4D
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636524; cv=none; b=WZwVqEBV7bp/Yh2CZJ83uNd0WcVUb/55EENLz3jcsbTtVwn/hHZ3UiIAag5Kz9p2bykPY8hNMDojVNPERf1e4jPmRRhNj0cZFrPtB18/mgU4Nlip3fPslc5DWtJ/oa8pXfv1VMIXWbbSBE+NKtFwh0jguMnfPvFncZhtWQYnKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636524; c=relaxed/simple;
	bh=KjvD0FYtibQe8DPB7+KaUJitoRzCPmTVRI1ZUYReScM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nezSsXToLGhSt258PalT3xtfqXOrLkXMW85/hKUXsiHLWzItkhqUpNEQFJfLm3DTYmyazX8SNkmA8nUrbPLefdHdTNcv8iMXJJu1xKtJ75GpNNZ5OX8iklXZZV7rYPylvicV8PtLONaYDB/ihRHbrfft1BdA1+X3kggoqULetTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gkx4Wopm; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gkx4Wopm"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1663039a91.2
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786636515; x=1787241315; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NWd+efJbNRhMQi4tFuFF6oho5IzekPVE1UiVHSpD6zk=;
        b=Gkx4WopmrxWQByFJUb9iPph6z2ikin5qxwL0bRgmTk7cQLkh3ENUoTOv0rqlTmCaNG
         4JzNKVMj8NA8Unu2nKHF8QZ9cUOxe7lnC7wVuSgxclLPSIUqWkeA4ukroeOl2QVfZ0wr
         kknkdB2S3fSG4LT3QZwyZ2fuJI/AZKPWCKEwL35IczhqIppFtscj/L7CtN3rzhRF4dNs
         66WmT2nbWgF1CCpEYAPmusPtFGacjlI/maZb6/A/Gci9UDYuEu/GK2Tmnj6H370XeiYQ
         q5nNcGEIzBjEW2h8eKRAeb1pnw7PJEfPzho1nh11EZhR3kp6QpBxVTuSYGgr18n4yBg1
         ij/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636515; x=1787241315;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWd+efJbNRhMQi4tFuFF6oho5IzekPVE1UiVHSpD6zk=;
        b=CR2Rz1r8bDz881mXfsNFmPa2OBzTyPFZGUKkNlk1xenfKgnBoT2zljmCz0IhIsdI6Q
         4sALUgMVwDYuJDg5uClK0/xtfZQ0xAOrwK8wkJ8fLMFRff+c/Wld/0rrWkPbUfluv6lu
         mCV8o817mXFNLODmai5I6maGEPrS09g5VtNMH2DRFt9uUc19OQyfNo5bdH/jxzroeSek
         2Dg//0sUhwyuM4qS8Hmppt1LmHbbT+BWN58uX5a5qbxZYpc8gdOi6IqNgGxcsKFZvP0m
         EFSIVqZ57grT7dAOlNiXKPIekVq1XCPR2sbXA4ctu2qDtKPY05ojFjKAlbi1ot3Tlv4M
         6HNg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9tXOxgytmys5S5q+uhfjuL2ipUbdJyEDK5uW5Zg/Qw9sYKOAw6B0RA1ZcchYGyupYHhWJ/R50qZBM@lists.linux.dev
X-Gm-Message-State: AOJu0YzLx5sputGL05r2ZdzPnSj2YjAsVOTJuJWzO9GnwoiD5l7712Bh
	t6j0eg6pJNmJsv4F/LF9ctYzaLSOEJSr3ZpHbDVW2lFJZOjgHVdT2VJurMRtisR0JY29lZruG2N
	1aGZ04Q==
X-Received: from pjbmr22.prod.google.com ([2002:a17:90b:2396:b0:381:1d7f:b8db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8d:b0:36a:8240:2477
 with SMTP id 98e67ed59e1d1-3931e31a6f4mr7349226a91.19.1786636514937; Thu, 13
 Aug 2026 08:55:14 -0700 (PDT)
Date: Thu, 13 Aug 2026 08:55:14 -0700
In-Reply-To: <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com> <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com>
Message-ID: <an3o4h-E8mj6CUaM@google.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026, Binbin Wu wrote:
> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, p=
goff_t end)
> > +{
> > +	struct folio_batch fbatch;
> > +	pgoff_t next =3D start;
> > +	int i;
> > +
> > +	folio_batch_init(&fbatch);
> > +	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch))=
 {
> > +		for (i =3D 0; i < folio_batch_count(&fbatch); ++i) {
> > +			struct folio *folio =3D fbatch.folios[i];
> > +			pgoff_t start_index, end_index;
> > +			kvm_pfn_t start_pfn;
> > +			kvm_pfn_t nr_pages;
> > +
> > +			start_index =3D max(start, folio->index);
> > +			end_index =3D min(end, folio_next_index(folio));
> > +			/*
> > +			 * end_index is either in folio or points to
> > +			 * the first page of the next folio. Hence,
> > +			 * all pages in range [start_index, end_index)
> > +			 * are contiguous.
> > +			 */
> > +			start_pfn =3D folio_file_pfn(folio, start_index);
> > +			nr_pages =3D end_index - start_index;
> > +
> > +			kvm_arch_gmem_make_shared(start_pfn, nr_pages);
> > +		}
> > +
> > +		folio_batch_release(&fbatch);
> > +		cond_resched();
> > +	}
> > +}
> > +#else
> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, p=
goff_t end) {}
> > +#endif
> > +
> >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t star=
t,
> >  				     size_t nr_pages, uint64_t attrs,
> >  				     pgoff_t *err_index)
> > @@ -599,7 +636,12 @@ static int __kvm_gmem_set_attributes(struct inode =
*inode, pgoff_t start,
> > =20
> >  	filter =3D to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;
> >  	kvm_gmem_invalidate_start(inode, start, end, filter);
> > +
> > +	if (!to_private)
> > +		kvm_gmem_make_shared(inode, start, end);
>=20
> If both KVM_AMD_SEV and KVM_INTEL_TDX are enabled, HAVE_KVM_ARCH_GMEM_CON=
VERT
> will be enabled and the logic in kvm_gmem_make_shared() introduces unnece=
ssary
> overhead for TDX.
> Not sure about CSPs, but in a standard distribution kernel, it's very lik=
ely
> that both are enabled, right=EF=BC=9F

Yep.

> Should kvm_gmem_make_shared() do some optimization or the overhead is rel=
ative
> small in the conversion to shared path so that the optimization is not wo=
rth it?

I assume it's relatively small, but it's probably a good idea to gets numbe=
rs so
that we can make a semi-informed decision.  E.g. if processing 1GiB work of=
 4KiB
folios is <100 cycles, I think we generally don't care.  But if it's more l=
ike
tens of microseconds, then I think we do care enough to optimize the walkin=
g for
TDX.

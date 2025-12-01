Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB762628D
	for <linux-coco@lists.linux.dev>; Mon,  1 Dec 2025 01:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764553673; cv=none; b=Otwih8lSQMwGprwUCiG+BHa/zAltNwzMLrtBezibd5Vl0GtMmQ15w+brmLqivKhickUmxZ+ZRCCDjqCVZgGc5jdsGz08/4BGwQE8ifqpieOgD1El8J6ChF0CeMAhNbx3MMz8BfUs7HR8BW686btkuyGlD+m/M/dHd0lrsr7Dne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764553673; c=relaxed/simple;
	bh=WkMG6KInPajZw+SCHLY6xyyqfgd7/gSlU2Diz+y04ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qht9IK5rLG4TAai6J6bKqwLAZlqXJO0qFxkaK/xO7Jeq+f4awxhUgxZtnkkiKVZUyYSxtn8zGq2ciM+i5WIKZs3gfFq8Vq9DLB/XM80udfwtgJ2z6EPxup5hI8KlDCLjwBWexVJh6Fws63WjMnoSRHeJG10ELqur4Z2xadXn07g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XFvvhP/Z; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XFvvhP/Z"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29852dafa7dso623785ad.1
        for <linux-coco@lists.linux.dev>; Sun, 30 Nov 2025 17:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764553671; x=1765158471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RubrtJY1nBr7co+TN5Cf36o/x/R4Bh4y+nkU3tUAkHg=;
        b=XFvvhP/Zr4hKeWkEldk5KHtP7wlAmL2OLfEVM1U7FdoOpOfHoiRBnR0dMwPf8hnVFZ
         hv2qT2JdJ14QQqCfE1WyVagcwIHGXPsIqizeKyLKUDAuxHadZuHoCP5m631G0O/qmQoG
         7vmtn5hoZq7gkmqAKqTTow6SWdmgKOz0u5RcImOWUkM5hTkSq3eASfMRBXjCOoFVSNsN
         b5r4f9ZI59whU9Cz/ioBbUl5ltOioXXYwFfbc+wtEWq9wdtb8EpmiOMRJSqxkpGIrymo
         2Oo58/GvODokPKWNb9DtrUsXNjahKTo3BS6iUG5WsSg48uytc9gYAwta9IqOEea3u1Q5
         J69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764553671; x=1765158471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RubrtJY1nBr7co+TN5Cf36o/x/R4Bh4y+nkU3tUAkHg=;
        b=agWeN8JcoEv3xdS9BBcLatCwdQXjFhZCtUYpQhlqGY6jFyBcap6AsuUmmnwLBeft2l
         Pr/KdyS0ygH9ELH0/8EOuftc9wv++SQ2WPOOTnYMu3xflNaXURNJ0K43MdXEhRas8oSb
         d7p2voso3UbDUx1xWhfJntk5rkVBDnjXsAvOjE4dwgL6xVIhif8CP3lYM8QIRFzrl40S
         DCCQHj0o55FrBuic4kbQIN2KYRFG9QAgDmIMgvFULUke8k6CixHgRI7hhH7Q+i/Cp/7H
         YB7jFvgS3iOS0w4vuEIyBSISdCPTIz3Up3dtfoRkbrpDXe45KbFnt4WctFPVsa7NM1cV
         ZZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCWEREcXc/cTsCM62kulgI1y09gxw4oXZyMIVcMI0/H7zdXTXiHmCzZ2d9QfRGqTD/znH9cga9d3nUEY@lists.linux.dev
X-Gm-Message-State: AOJu0YxKBJuueE3w7ZbX4Pnny9CA10ZKAzlr9Cui4Bo23zFE1JRtbf/n
	8Cfid3oIXzW9sTxd5aj4mkCaPr6tqkAblYzQF3EMFCzyK7MrDWvWgYFtbTbhotwSN0ooAEthPLF
	HhjPagAwGD48IKnvhF4JGYoptq0tW8FJdDJwvUuOv
X-Gm-Gg: ASbGncsyFjamM2vryG9hHhhYwU1lx7gwIM+Cg1gpuZWcL9GtVb56F1KOFTmT+1OUnxw
	UXvRUgCCa03ATV6FkqijleuxgS2MwiEDhwm0NYpj9i6D5bCFfm9tafUq1du65I7NjS9sQeVpccj
	7FK4jPj1LlOHiZdX8UhdxJgo/GUA/2rj942AYMo47yk32t1DwLCSMkgg9f5hnXrVQL0I9DxC4st
	Vd08QNFrYkUdrioRE5m2aVlirSrba72xtXsAcXPzbUbs7JqSR7jHMnnsxj6wGbzLfQ1nKR0xSAn
	4OgvWEw73oKnDlaNctWGdWggFvAa
X-Google-Smtp-Source: AGHT+IGVKWbjRmm9tgU6uLDNVHu5xkhvGzmzSejdcqRBFvmWHeadfJ39slfnN2SFI/bj9haEVWPhElX75HTn7j06Rtw=
X-Received: by 2002:a05:7022:4a:b0:11a:fcc8:c311 with SMTP id
 a92af1059eb24-11dc9c5d1ffmr422435c88.5.1764553670544; Sun, 30 Nov 2025
 17:47:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251113230759.1562024-1-michael.roth@amd.com>
 <20251113230759.1562024-4-michael.roth@amd.com> <aR7bVKzM7rH/FSVh@yzhao56-desk.sh.intel.com>
 <20251121130144.u7eeaafonhcqf2bd@amd.com> <aSQmAuxGK7+MUfRW@yzhao56-desk.sh.intel.com>
In-Reply-To: <aSQmAuxGK7+MUfRW@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sun, 30 Nov 2025 17:47:37 -0800
X-Gm-Features: AWmQ_bndv783uhaZZ_oV6Xm0iV6cY4XqsD5JvxFNZOjPYdlSyliY7wOlOHpUWNk
Message-ID: <CAGtprH9_yo4P+oTaGzhHkC3gSdFPTYkvwHkwN66gQhQXX9fhRQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: guest_memfd: GUP source pages prior to
 populating guest memory
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:34=E2=80=AFAM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> > > > +                 if (src_offset) {
> > > > +                         src_vaddr =3D kmap_local_pfn(page_to_pfn(=
src_pages[i + 1]));
> > > > +
> > > > +                         memcpy(dst_vaddr + PAGE_SIZE - src_offset=
, src_vaddr, src_offset);
> > > > +                         kunmap_local(src_vaddr);
> > > IIUC, src_offset is the src's offset from the first page. e.g.,
> > > src could be 0x7fea82684100, with src_offset=3D0x100, while npages co=
uld be 512.
> > >
> > > Then it looks like the two memcpy() calls here only work when npages =
=3D=3D 1 ?
> >
> > src_offset ends up being the offset into the pair of src pages that we
> > are using to fully populate a single dest page with each iteration. So
> > if we start at src_offset, read a page worth of data, then we are now a=
t
> > src_offset in the next src page and the loop continues that way even if
> > npages > 1.
> >
> > If src_offset is 0 we never have to bother with straddling 2 src pages =
so
> > the 2nd memcpy is skipped on every iteration.
> >
> > That's the intent at least. Is there a flaw in the code/reasoning that =
I
> > missed?
> Oh, I got you. SNP expects a single src_offset applies for each src page.
>
> So if npages =3D 2, there're 4 memcpy() calls.
>
> src:  |---------|---------|---------|  (VA contiguous)
>           ^         ^         ^
>           |         |         |
> dst:      |---------|---------|   (PA contiguous)
>
>
> I previously incorrectly thought kvm_gmem_populate() should pass in src_o=
ffset
> as 0 for the 2nd src page.
>
> Would you consider checking if params.uaddr is PAGE_ALIGNED() in
> snp_launch_update() to simplify the design?
>

IIUC, this ship has sailed, as asserting this would break existing
userspace which can pass unaligned userspace buffers.

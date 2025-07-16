Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742C17A31B
	for <linux-coco@lists.linux.dev>; Wed, 16 Jul 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752671057; cv=none; b=Rm3EdYMJhZvIBuy38t3QzN9cnYCTVW2cXk2VrdoWxTpNvTsQgD8/bYJIV0BOtHVj3NcsExDNrLHHb41lPd+waJr3RRJ2m1VUJHyJEUPUkohOPJo0MoHkosDQzAtQNwwWjt7URM2Gll/vHJPjSWfPCKl1T1jox/NWaqKrZ1xVyFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752671057; c=relaxed/simple;
	bh=8dZCYt6w2wIjaNRKHHb72EVPPX9qA4w+IQejlPvMmwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGOiLSGNzGTDsZ1oWXOV1zhE3E6ZXUfR4m30ROKG+dc2vTvICSyXg7C+w4en7LLwVqw2z4Tl2CMSOpjHOscwFZSOoZDHsvODKp+4EOdKDTljzNf7loBf+H1WqNxoYV4FnEarb3eOxDrU/VWlrjLmyej2JT0si8AP7SevKelXO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hgOshfqK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hgOshfqK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2357c61cda7so127155ad.1
        for <linux-coco@lists.linux.dev>; Wed, 16 Jul 2025 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752671056; x=1753275856; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLAVZJBXA44yj6VwhHi0/bIpO+wiOkRvcyjNUHb7iac=;
        b=hgOshfqKtiPMxQIkVOnJdmyb9EsTi9g3791mX9Nva+5k+X3aVQ1XCFHusLB0ypWm7+
         NLmnu1yWNHZvgOKH6w7F1LuFmn3i3+Ji6qusX00mVbKXKTJTthKoc+6Nkg2PbO3Jqb6O
         dHB+KAgOWboZ5ga5rbkotHD4iisbMDiSWgp3m6mKXuZ/BBLyk9BuIHCF6CKsEmK2Uzq6
         GjSFPGknBWTaJafctbDUHs0ojuyE+x36HxXtkiRzKYzsNViX6XXDENQ/mvX/Y9F16+ju
         HnFZ5Qus1FRKsUVtewewWB2wPFlMgjYnMiJMrd0sB7SBoUGib5uQM3KIqw1QElbYTeIF
         Uxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752671056; x=1753275856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLAVZJBXA44yj6VwhHi0/bIpO+wiOkRvcyjNUHb7iac=;
        b=dIaOtTp9RPcDjLzQGZ5ihXe17rKq8bat5jTbQGpjlA/H3U9wvNRlp0mLQbGVK8HKJ/
         n7tBy8SNI2YkHJCRVrreGKImLXeN6U0WocUCehYXwFvUxkQ8BQuzhl0ufgmGyLkQeN/u
         byiecbafeDSZ+vRXNHdBZFRJXg9Mzbwb4Fmvts6uR0S7IgD7IbARAxW2c229U2u91pxf
         fJixjg3vfCysL5NmbDOprwyzrHSnWBoHRYdkv4AXZRfQh0tBJyhcAib4L+3NLtw9U7t8
         VWoEFse2eAE6IwMWz6fmuHwtn2qMMTmf9goCBQ2UR6iuKU4VWhWpZ0gsPYEp1lcCxjkW
         vnpg==
X-Forwarded-Encrypted: i=1; AJvYcCV0GdPtYn1n53zcqygvRPpgVszRonBL1cLHu0pOq89nC+QsUCCwHAPe4uJZvEPOOAlAEOOeGrUTcH/w@lists.linux.dev
X-Gm-Message-State: AOJu0YzsFkYDHhFkjmzj8LT9Jc1Mna96cxdlVdDSkSCc5LbI5motyWiY
	p4GeSBU93JUbPv7CS+rizH31h7yVt+AMlE1aI45URnA+FoLja0VmQAqj6QFqtd9zpqRdsVNHpcP
	ptRVLj0e/hcCC6d8eajU1fYQSGUwhUk1v0gBbiM8U
X-Gm-Gg: ASbGncslTt4kzFRBHcdcjwYbfcP9qZ8Q8PESI5XQFHPx8bb6jJpdjAyFh7m4IZ/HrbL
	HWIqtoDJh9UdptKAb25/imRzqoepzadXlobbv5fI3JDAlKrzM6ZHMXwECJZVaNtp3S6nBV5EPgr
	seF058+LEeYxUc9HzNp5rtz+qjH0K0o45Qh+AUjt7qf2s5iMXJmUF1laqoN3YAY5QmqVsjZXfDz
	PF5GUnAo+9v5biTEYrb0tQO4hzXTfRr4KqgplAh
X-Google-Smtp-Source: AGHT+IFbLmFCf84DLgEZTrPnlX/z0jXT7rSCFSdJKQ9nbT3+zWzNNW5RpYO5vzltezW/SP2qsLvtJkBHsbSo1JZDMwI=
X-Received: by 2002:a17:902:f644:b0:234:a734:4ab9 with SMTP id
 d9443c01a7336-23e2644e3e6mr2258645ad.20.1752671055278; Wed, 16 Jul 2025
 06:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250613005400.3694904-1-michael.roth@amd.com>
 <20250613005400.3694904-4-michael.roth@amd.com> <CAGtprH9gtG0s9ZCRJXx_EkRzLnBcZdbjQcOYVP_g9PzKcbkVwA@mail.gmail.com>
 <20250715224825.gfeo5jdqjlvtn66l@amd.com>
In-Reply-To: <20250715224825.gfeo5jdqjlvtn66l@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 16 Jul 2025 06:04:03 -0700
X-Gm-Features: Ac12FXw7GwQzMGCZjvuciUapFIHKHiW0DMmU5GVoQ0ZpnRjLUR7h_Expq8imx0o
Message-ID: <CAGtprH9Ucr-i_T7pdCFRq63GQY6nWy8668gFoG7NSGdLuzpzRg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 3/5] KVM: guest_memfd: Call arch invalidation hooks
 when converting to shared
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, tabba@google.com, 
	ackerleytng@google.com, ira.weiny@intel.com, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, joro@8bytes.org, 
	pratikrajesh.sampat@amd.com, liam.merwick@oracle.com, yan.y.zhao@intel.com, 
	aik@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 3:56=E2=80=AFPM Michael Roth <michael.roth@amd.com>=
 wrote:
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index b77cdccd340e..f27e1f3962bb 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -203,6 +203,28 @@ static int kvm_gmem_shareability_apply(struct in=
ode *inode,
> > >         struct maple_tree *mt;
> > >
> > >         mt =3D &kvm_gmem_private(inode)->shareability;
> > > +
> > > +       /*
> > > +        * If a folio has been allocated then it was possibly in a pr=
ivate
> > > +        * state prior to conversion. Ensure arch invalidations are i=
ssued
> > > +        * to return the folio to a normal/shared state as defined by=
 the
> > > +        * architecture before tracking it as shared in gmem.
> > > +        */
> > > +       if (m =3D=3D SHAREABILITY_ALL) {
> > > +               pgoff_t idx;
> > > +
> > > +               for (idx =3D work->start; idx < work->start + work->n=
r_pages; idx++) {
> >
> > It is redundant to enter this loop for VM variants that don't need
> > this loop e.g. for pKVM/TDX. I think KVM can dictate a set of rules
> > (based on VM type) that guest_memfd will follow for memory management
> > when it's created, e.g. something like:
> > 1) needs pfn invalidation
> > 2) needs zeroing on shared faults
> > 3) needs zeroing on allocation
>
> Makes sense. Maybe internal/reserved GUEST_MEMFD_FLAG_*'s that can be pas=
sed
> to kvm_gmem_create()?

Yeah, a set of internal flags in addition to what is passed by user
space looks good to me. i.e. Something like:

-int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd
*args, u64 kvm_flags)

>
> -Mike

Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D115445B
	for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715614796; cv=none; b=jQtkgL5lWN7+fCMgQlHiGmTDbYngiV9VOruzsga7tb6wSBDlNVqd3nJXcgGVZ0Xx1NyLmDjvSBb2m6QpgX/QOUUCmuH0KXP9ver1nNa2BJpulr8jI755b1QATVeEtL27eHGi1K7CkHkkkcl3Oe8v9bmjIzJc6w1IZp0UR5n+cPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715614796; c=relaxed/simple;
	bh=t5/GGoZIm8krsLcMNp3AnUd/RW9fbbrJCuKFgYYH7e8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n9d7Fu36W964LBSLXtgrk6qf2PeCE7IYq7X+Dtsegh8RrzcuRfZ1lQ/abI2qVdvOAGyoVp91+nI3m75uN2j1rfFOkNEIZnnqtXbx2POgscOzNS4r/tJH25l1Xtuyws4kD3awyC1Wa07I0E5wF5zgQcM5Veja1UCM2HVhzb3PTjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gjKGzFNn; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gjKGzFNn"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc693399655so7389464276.1
        for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715614794; x=1716219594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3Z5PYvhEmOWZdAv2mF8wgraFReVMHPpsbJyP0PVGQk=;
        b=gjKGzFNndXjL6cPLhzKB2I+zvZCgjBv6ynB5mR3LwCCKbd1Rsx/AOY3suPgsOK+cXB
         3vsGS81kWayNDkWj/RXamvB/+cd0h5fz2xArV1aSrKpIf1rx/ej/KDMZJWlf1aQXekFi
         wkEwdfhby3SVFzTYLkMZTBxnN1aDZhMRr8twehJqg1acjF9WsSot/NaO4I1pa26Wv74s
         CdC1hFGd47jaWG+AWuO4opnmIE16Ci0GITyPbYzUnSPD4w7JSgs4mfnJ1Q/e2o9RtaDx
         WPI8HbbT/XzqqYWWUU1vxvH/oIMmySsulV5czY7X2Ne0qC+Zj4RTCdJrJoJW6yht8WaA
         2TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715614794; x=1716219594;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n3Z5PYvhEmOWZdAv2mF8wgraFReVMHPpsbJyP0PVGQk=;
        b=N7qauJzQ1Hty/bB0S6QHH6ZmLcjTebpgO36L23ProY/99IPRNWtJ3dE5W9Y0mNWDAe
         lnfuxcFrV7yBk7bLnFduWJqRI8L0tZ1G528SbQhU9upRDesnB3vARK2MLJVPCYaHi1A0
         SMkBhKHtEORXWsPWDyRwErDCN2vCEu3an0peHsazzdt6inptnuU12e7L/SpZ5EXkLSKv
         RpAfBZ8PBvpjMLJBt6fbQVQgUHw/xxbgdQNltvdYPUDKBNq7U4pLPy7IWR+0BkrFM1SK
         6DdIQmtlAmh4VpNnlLZdK+3XMeLT6mtCWUDtPiUrNnblJZ9u6ROActUSAqug3ksbg9BL
         gD0A==
X-Forwarded-Encrypted: i=1; AJvYcCWZx840zG0uNMNdpI/b1Z0tUtmUJ6fYB4L3+jMvp8W3ADoJwoMfP82G6z1e96tNmeG3yOBwXlMewO8jlxjLetCYc77S4GAC4UmNbg==
X-Gm-Message-State: AOJu0Yxp0vp6djnS6MWR+9Wiww2SKokYkJKpW7WuIHHacGXmq/+qUSWc
	NgUV4YDK0x8hzr1gnD7p4uUz/UVkeytMXk73zwFxVqbggDjE8xE84+2dac6u7WPZnnv4UMwb1Py
	iFA==
X-Google-Smtp-Source: AGHT+IHuwIc8fyCnlatjoe9Q2CYS4eVJOdzUScq69lTq3aH08Ut4sGUdSzstpLDLmLZVgoWu5DLZoOTvNRM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:fe0f:0:b0:de4:7be7:1c2d with SMTP id
 3f1490d57ef6-dee4f31fb93mr2560099276.11.1715614794264; Mon, 13 May 2024
 08:39:54 -0700 (PDT)
Date: Mon, 13 May 2024 08:39:52 -0700
In-Reply-To: <58f39f23-0314-4e34-a8c7-30c3a1ae4777@amazon.co.uk>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
 <ZeudRmZz7M6fWPVM@google.com> <ZexEkGkNe_7UY7w6@kernel.org> <58f39f23-0314-4e34-a8c7-30c3a1ae4777@amazon.co.uk>
Message-ID: <ZkI0SCMARCB9bAfc@google.com>
Subject: Re: Unmapping KVM Guest Memory from Host Kernel
From: Sean Christopherson <seanjc@google.com>
To: Patrick Roy <roypat@amazon.co.uk>
Cc: Mike Rapoport <rppt@kernel.org>, James Gowans <jgowans@amazon.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, Derek Manwaring <derekmn@amazon.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Nikita Kalyazin <kalyazin@amazon.co.uk>, "lstoakes@gmail.com" <lstoakes@gmail.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"mst@redhat.com" <mst@redhat.com>, "somlo@cmu.edu" <somlo@cmu.edu>, Alexander Graf <graf@amazon.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024, Patrick Roy wrote:

> For non-CoCo VMs, where memory is not encrypted, and the threat model ass=
umes a
> trusted host userspace, we would like to avoid changing the VM model so
> completely. If we adopt CoCo=E2=80=99s approaches where KVM / Userspace t=
ouches guest
> memory we would get all the complexity, yet none of the encryption.
> Particularly the complexity on the MMIO path seems nasty, but x86 does no=
t

Uber nit, modern AMD CPUs do provide the byte stream, though there is at le=
ast
one related erratum.  Intel CPUs don't provide the byte stream or pre-decod=
e in
any way.

> pre-decode instructions on MMIO exits (which are just EPT_VIOLATIONs) lik=
e it
> does for PIO exits, so I also don=E2=80=99t really see a way around it in=
 the
> guest_memfd model.

...

> Sean, you mentioned that you envision guest_memfd also supporting non-CoC=
o VMs.
> Do you have some thoughts about how to make the above cases work in the
> guest_memfd context?

Yes.  The hand-wavy plan is to allow selectively mmap()ing guest_memfd().  =
There
is a long thread[*] discussing how exactly we want to do that.  The TL;DR i=
s that
the basic functionality is also straightforward; the bulk of the discussion=
 is
around gup(), reclaim, page migration, etc.

[*] https://lore.kernel.org/all/ZdfoR3nCEP3HTtm1@casper.infradead.org

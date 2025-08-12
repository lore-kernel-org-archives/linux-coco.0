Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A95291C1F
	for <linux-coco@lists.linux.dev>; Tue, 12 Aug 2025 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755024310; cv=none; b=me7m8muvLevOPCwVTpM4yQcyxiMiuaATERIHk1GLxFOCQQ6ccAroEt5EiIx8TWLy2bhn7eRAD4TMQB6SXvGzhu+U+3PZamjtbwI8XpzvnpEoOjc6QPa5EXeLx1LbhGwjz7Qpg0nvUinGOUekwdum8aJn+NwONFpza+KxZlKhtAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755024310; c=relaxed/simple;
	bh=k8eJflyHaGW1cyd3IMxkAyfMV4XfphhmHbTGJPhMO2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fznPo0Lbf+HymCg8HmsrH1nbuy7ZK/E7qYlSz6FxpjgNswnym3Ph+JKe87bqNlAg7tlhfnaerIJgFAOuQitw9cyIN+bendCEN/yGK8ID1WtcHdvpdyFpO22MgjVVUSMSzwsKngf5I0BtlgUm+zApHihfneclhwtBEm41OM0Z9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkmfirCg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkmfirCg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-242d3be5bdfso24065ad.1
        for <linux-coco@lists.linux.dev>; Tue, 12 Aug 2025 11:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755024308; x=1755629108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aZrrKJF+13GgKsgM/uEfcdmhk0fl5dHjrt4Kw7aLp4=;
        b=IkmfirCgtYVVjrWxE4eKnkJ4gWjCZWH0HyFZNDOYq/LOskbCgz5dDVu3hS6bKKqF5g
         mxhNE3JIpv+pMvB/QooHRstFXA2A9F0X37orh6zVH5BY2hZtvUslLtFESnly5kvz3x7X
         os1FT8ErJLHKcw3tgWD0XAFQW23+HI81ra5nZX05wTY+WvOcv4AKd5bQUdpfzGHXE3C6
         2v0Rya3pe9P/+wT/VWanSF3g+j5wy4I43NM+xejrRrOIhAGslKMj+nqGJi32sQlqki7p
         GQM5J+Er4ZPYBRl1WxudWihlICwXl/jX2xo5tmsfECRxF30HWf+E04psrZgZdmkgBRwo
         hP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755024308; x=1755629108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aZrrKJF+13GgKsgM/uEfcdmhk0fl5dHjrt4Kw7aLp4=;
        b=Fo2y/frb0sTxwNyJswDFS9Lw8/F9ySi9u8YeUAIA/gbm03zMm9d5/5lRp5aYn4mVnC
         K1Mxo5Hk4EjHWchrwChC3RhyStYpMsAxZ89O3Q741d0tTTFcVrVvIAcBhd/Ei1jenErl
         y1ZerTS3S+HAr+1bGrvXRdjr1P4+PqC5NiP72+STFVdSDIJFU+XXtFwfvHldkrkUAMXr
         xza65L23NVNxV/QGuUhM3lAtd+r9E0BzNUFCvQTeRTx/4fmwWUWgarDXHhdm9YnEFNB0
         v51hY6kBogtiRhbKeX2RPJB+tO+dGNfKFgzwaLcLRrElg2BGjZrZ29s0SYwNdPFxKp8Q
         LKZA==
X-Forwarded-Encrypted: i=1; AJvYcCWUyDlFum0i9+xmlhX6VcpCxGw6TIfGLN0iUA5wikbzHiws0YM+4EFI+vBLD4UPv7FmQBQHPX71TxJo@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0P7OE/9MEbjuhUnWTd1WEOzw07IW79XHlW1OZ3Zyy3DY5T48+
	wc6/1znaGKQnvfTey9kvjNMjMxiuAXwjI6kUfeCs9vv7pn5TazHOV/suhScVl3k5n/RyHySMF9p
	SjSC1uS2K3AWLxXKB1VtZXJ8mDiYwor7pVcH9FY7C
X-Gm-Gg: ASbGncvanfSR3/gW6LDG197VRapNIVeenjcQKpPATWv0SDpQGFyz8D47ElM9Bfm9fyF
	v8HCpCJlHnuzeK7IccAQjYbPonPLNiunTvQi5aOjGFdBN01i56hihpkfgJx8MZyoz/s3rxSCos2
	mr/9zqufSSmdaDmHPnwgdzOKBZTi+lV3cDaUQ4Z7kPBaWlGgwxOwSxPbIzL14dQSdBOwxeagxBh
	4O1nRgiYp1cIMs5ejHry0I4weNrJMlnrLnMm7p0
X-Google-Smtp-Source: AGHT+IHVug2DiOO6Cvt5RmH+7vn9igq9WsESN/7t7V6c6ibS0iTghQrPWcgQ6kZA+3YKuzfUdLeF0Upsie8W0FD4eRM=
X-Received: by 2002:a17:903:2281:b0:23d:eb0f:f49 with SMTP id
 d9443c01a7336-2430d22e961mr364945ad.14.1755024308013; Tue, 12 Aug 2025
 11:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <d432b8b7cfc413001c743805787990fe0860e780.camel@intel.com>
 <sjhioktjzegjmyuaisde7ui7lsrhnolx6yjmikhhwlxxfba5bh@ss6igliiimas>
 <c2a62badf190717a251d269a6905872b01e8e340.camel@intel.com>
 <aJqgosNUjrCfH_WN@google.com> <CAGtprH9TX4s6jQTq0YbiohXs9jyHGOFvQTZD9ph8nELhxb3tgA@mail.gmail.com>
 <itbtox4nck665paycb5kpu3k54bfzxavtvgrxwj26xlhqfarsu@tjlm2ddtuzp3>
 <57755acf553c79d0b337736eb4d6295e61be722f.camel@intel.com> <aJtolM_59M5xVxcY@google.com>
In-Reply-To: <aJtolM_59M5xVxcY@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 12 Aug 2025 11:44:56 -0700
X-Gm-Features: Ac12FXy4GUu5ZIRJXl7eGstfP5q8QDTUxveWfrkMVz1y6ccW3owwq_zd_PQQxe0
Message-ID: <CAGtprH_0YWHF5HWzs3Yx+Z7Na2OsCxqG7mJPLREVfoNv9qE6mg@mail.gmail.com>
Subject: Re: [PATCHv2 00/12] TDX: Enable Dynamic PAMT
To: Sean Christopherson <seanjc@google.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	Chao Gao <chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	Kai Huang <kai.huang@intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 9:15=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Aug 12, 2025, Rick P Edgecombe wrote:
> > On Tue, 2025-08-12 at 09:04 +0100, kas@kernel.org wrote:
> > > > > E.g. for things like TDCS pages and to some extent non-leaf S-EPT
> > > > > pages, on-demand PAMT management seems reasonable.  But for PAMTs=
 that
> > > > > are used to track guest-assigned memory, which is the vaaast majo=
rity
> > > > > of PAMT memory, why not hook guest_memfd?
> > > >
> > > > This seems fine for 4K page backing. But when TDX VMs have huge pag=
e
> > > > backing, the vast majority of private memory memory wouldn't need P=
AMT
> > > > allocation for 4K granularity.
> > > >
> > > > IIUC guest_memfd allocation happening at 2M granularity doesn't
> > > > necessarily translate to 2M mapping in guest EPT entries. If the DP=
AMT
> > > > support is to be properly utilized for huge page backings, there is=
 a
> > > > value in not attaching PAMT allocation with guest_memfd allocation.
>
> I don't disagree, but the host needs to plan for the worst, especially si=
nce the
> guest can effectively dictate the max page size of S-EPT mappings.  AFAIK=
, there
> are no plans to support memory overcommit for TDX guests, so unless a dep=
loyment
> wants to roll the dice and hope TDX guests will use hugepages for N% of t=
heir
> memory, the host will want to reserve 0.4% of guest memory for PAMTs to e=
nsure
> it doesn't unintentionally DoS the guest with an OOM condition.

Reasonable guest VMs (e.g. Linux) will generally map things mostly at
hugepage granularity, I don't think there is a reason here to be more
conservative and just increase the cost for the well behaved guests.
That being said, The scenario of an unreasonable guest could be
covered in future by modifying how PAMT allocation is
accounted/charged.

Guests are generally free to use the lazy pvalidate/accept features so
the host can't guarantee the needed PAMT memory to be always there
anyways.

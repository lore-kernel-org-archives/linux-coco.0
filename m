Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B910785
	for <linux-coco@lists.linux.dev>; Wed,  7 May 2025 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746580556; cv=none; b=TIuT11xxXlm1FAgbAbUut9B/UrYza6ueFcL/UZ61pbj33JDrrPRE6/82IdFqv7QqMf8kGYgF3xwui8HOkW5iu53I51VYXJ92GFgnhwToNmPvSX30xfbyTp4VSejzs8MwbGarcLJgMrJ+tiN2qmeAMVNOjs7KDiNETBffnj/xsK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746580556; c=relaxed/simple;
	bh=PJGXADhPgftHf4790J6bTo3LvncDFYONRNlduMuQnLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzCiiBrxjM8+jH4IXYPvCrn2nckAQosDuA/cMTGYaoHT3qB0mcr6cTQTK+ECj/K6bU/Rb11rDYMpyCZvGqXmJ/fKssQkX4QNOIhVZx2R3mqiBu/C7wsm13ngd5AtZbFm/5GkqEEbgC6QVYOgF1cD9TGOe9WIpTIzMTKCdKwob6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WcU7+JX+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WcU7+JX+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e39fbad5fso53625ad.1
        for <linux-coco@lists.linux.dev>; Tue, 06 May 2025 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746580553; x=1747185353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI9dvuYFSW41PetZu8+C11r8U9aYDixgfsHjUdZoR8Q=;
        b=WcU7+JX+dQNFGYBZtKGO4fg9cDFC/Mib2sMGBsbaOl9mbZJKFaMGhuFx74Z+qcOgzT
         Q6sendD+1hWdM7XkGvkoZ0HnGrKwQXpLyEoY+5Mg6y/xS1NGdqhvsJpNUfD11J4ZvCB7
         PdteFX5/TktMeQXmQqPPn1kmTY46uGkwbtS7oP7W5u++urGkOLFw/epjhMn7R4DpkEhG
         EgpX2TZb1shr2MmVh2+eAStK67OM18V1N/uNBCPNHaAmLx7aBxbYRdal2iEQMrBE76m8
         ChMooMD/KhW3L9N8H8+9eW1TIUhObO1Qv0awoxOfE3BohP6Mvf+kDVSaguscvSIOrKwX
         MF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746580553; x=1747185353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oI9dvuYFSW41PetZu8+C11r8U9aYDixgfsHjUdZoR8Q=;
        b=edEPSJwqqyLdWI/iR61Psd+9xzTCKtt6dGAqt4/4Umipc6Rtx3ut8NRGsIBKrroayj
         HLPD4EF5ihdiQjgWdE9Ajzk6FzUhK50qdM4o1uJSFKykMTXpQpwaKnkLEzyR9o4f0dbY
         7bHtbemtgdpCj/Ez1TZ0En5RKzofvw6Mn4LBDCZ/BEF2uUIETyRze7hr2p+LmFSl+gNY
         m/zaae8Xz9FqPQZwVQsI9Lr9IT+KtzM3tM1jWm3RgAeaH7sEkLaNWdv4w2zMYUXnYsrl
         P1+02MqxZaK54fr38obQXdm4Bet405jQDYb31wxxtBXerwv7znat3kluEcKbOunncx1b
         F7pw==
X-Forwarded-Encrypted: i=1; AJvYcCXZK3H+OBOqGeKiiy+xPxkBAy1xIhjPlceRHkr4nLkJZn/7D4iQd5dd3QzROc+Nk+yQAmSGOwNFWPJf@lists.linux.dev
X-Gm-Message-State: AOJu0YxeTT4h9nYYsMT3NHI+54WY09KNvRQWxiwsotjmcgL3jdDrslUl
	5BTxIo1fEEQu5XMBoS5xBTdEef6YOIuBNeQRKy8pKNKDGXUhSqGu68fOc7XTAScFEyOPLzKKQKV
	dLxn9yq6W+yda2qyjZPJClRdlX5STuShZHN0C
X-Gm-Gg: ASbGncsdIlFUmlEr8sYZiSaBofTTh41cm/4sFBqieA/iFEUPnafRRJGAdyMkcEPsc9d
	nYZG77tDpqg1F3YRbBKIUItjx56zLkKDiaNXXpU4hIsrIqThTxzSgTUkbOMX8naIWqFJup5qD/H
	YAeJHXsqryhrPFIX+Kv5MOhHA29PaB5IychG3HPdE9wyU8gKlBhPg=
X-Google-Smtp-Source: AGHT+IF64r1XV/UTd8/0ODGcdklsJP9ZXTT9L0J+KnSI3mOMSiLbsNkGeaQ+3WDmuLUAtwcZxubdXugCorUmCh9N7IU=
X-Received: by 2002:a17:903:198d:b0:216:6ecd:8950 with SMTP id
 d9443c01a7336-22e62a2f82dmr714135ad.19.1746580552732; Tue, 06 May 2025
 18:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
 <20250502130828.4071412-6-kirill.shutemov@linux.intel.com>
 <55c1c173bfb13d897eaaabcc04f38d010608a7e3.camel@intel.com> <aBqxBmHtpSipnULS@yzhao56-desk.sh.intel.com>
In-Reply-To: <aBqxBmHtpSipnULS@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 6 May 2025 18:15:40 -0700
X-Gm-Features: ATxdqUFj6OOGJl4u4NDEeHbj2QFi6gwUbyBFBzHWdPZhV4mq2dQvBXHS3gCPlyY
Message-ID: <CAGtprH9GvBd0QLksKGan0V-RPsbJVPrsZ9PE=PPgHx11x4z1aA@mail.gmail.com>
Subject: Re: [RFC, PATCH 05/12] KVM: TDX: Add tdx_pamt_get()/put() helpers
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Huang, Kai" <kai.huang@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "seanjc@google.com" <seanjc@google.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:04=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wrot=
e:
>
> On Mon, May 05, 2025 at 08:44:26PM +0800, Huang, Kai wrote:
> > On Fri, 2025-05-02 at 16:08 +0300, Kirill A. Shutemov wrote:
> > > +static int tdx_pamt_add(atomic_t *pamt_refcount, unsigned long hpa,
> > > +                   struct list_head *pamt_pages)
> > > +{
> > > +   u64 err;
> > > +
> > > +   hpa =3D ALIGN_DOWN(hpa, SZ_2M);
> > > +
> > > +   spin_lock(&pamt_lock);
> >
> > Just curious, Can the lock be per-2M-range?
> Me too.
> Could we introduce smaller locks each covering a 2M range?
>
> And could we deposit 2 pamt pages per-2M hpa range no matter if it's fina=
lly
> mapped as a huge page or not?
>

Are you suggesting to keep 2 PAMT pages allocated for each private 2M
page even if it's mapped as a hugepage? It will lead to wastage of
memory of 4 MB per 1GB of guest memory range. For large VM sizes that
will amount to high values.

Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85922E3B0D
	for <linux-coco@lists.linux.dev>; Thu, 21 Aug 2025 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806025; cv=none; b=dPfxyisP080FwIneHJiF80WaqMYA3IJTFmKnjCqK2Lbs19M3hy3Qq34EqbN5RLQoVxpqdRQ7u32edta3DgwUa1s5V04o+BHmXcb/WNuLq4RB77pQqad2tMCOVcxT78tBtsfDrGK0V13Ksv6Tzy17+h0cHWi4fma8NZitkEeFEtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806025; c=relaxed/simple;
	bh=iAzHJhTmGhA4UuOIN7oR+yPBuRcwVJMXTKi+RzPVVg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLHv1jD7HDMHLWY4e9XuCpOiPnWJkCBFiKVATwYq6XOf7ADvfPtd6c4M6hHXVXmeGfPV7FZjsDmayjXH1bDHhFOD4SI+5Bf5eIPPvIoROe/OnH4WeZHDTT1A7ft9FWc4VzOadhlQvBdSmkOF6PV9fWzD+iliY5ascDWU4x3VMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4IQ6Z4lt; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4IQ6Z4lt"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b29b714f8cso11221cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 Aug 2025 12:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755806022; x=1756410822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQE488gFqLXE2ANKpcc7rXfMjRx7ZR+eoJCvQepJ5Ko=;
        b=4IQ6Z4lt7RycMwgs/RdGxLmRDlEZUFstAvs9HmNYGXKAH+ywcV0o+IUHwj2P0aRH1+
         v6fGydL+HoQ9sv0b6RKeesxCePohT5m0YtgrBy4NFsTmkB4H8dx8QdXyakvVuLR9Sncq
         Uq/+Tfpc75ulNfKaUbhTGL2vNts0cO7/2la0NXQlGQK8XXuMjhNZP203FqivYqDVmG3w
         smhsEAlNlDMV4E7qUxm64qM0/4xha7gvXk4QldQTRbTxuc+pGOvY3kTzscAgQQRlcbgq
         GTSAsACcDdzCm5E9AU6pDEOrJ3KD6e/7iTv2ROkmbo6p7O9hDHX6LscMXgps33Bp3N1T
         LvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806022; x=1756410822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQE488gFqLXE2ANKpcc7rXfMjRx7ZR+eoJCvQepJ5Ko=;
        b=S7cgVZzX78ZQXqNFAOyikbmZvLFAH/Byq7cUYI1NGPKhXaKP5C6UOHpz9yK2NVni6+
         Kih7u/QD2+bRfvjFWWiSVcu8kLIsl1K7z5lr9LC9CXkDAt9ZkcaI3u32CA3dUuifIFM1
         mHBJM7PKJIOmW4qQUx6cAYHVxvDJMFVJSC91ic7Q6w2c5T81B4/qJ7H0FAAd7BsEGPur
         HDmcK7ege3Qx2ikpy1cokB47c4LF0/ayBC/9kO1rVh3LtBhOo6ds+nraaGbSFhCgSQ85
         S8LSjx6lz+9LGpMMv34g59Z5yjIMeeC7fKSTaWOv2YACPbItJXdAiO2i5s05cUC4+onQ
         c94g==
X-Forwarded-Encrypted: i=1; AJvYcCVuaeqA68PZ1P/SUiEg9EGwZD3Z06egv1TDhDfhLWCgkdWEkJJRViNdNxgLCHe1PoBCkfmyTORLdebG@lists.linux.dev
X-Gm-Message-State: AOJu0YzfpjgNp7LN/VCYhakVb84pjLAWXV6i2TvBByzkQveN+sNt9v8V
	DWAKMbgNS0vnB3QlPApUB3f+otcWR8mdtGsqL73y8dWyXQsajDVu7qE/xIY91sMidrHY3V83au7
	C458jpkbRlex02EGGOjdwCwnb9xAi5QAq26dC6m4QnmShhYjD6Iw0KYJYz50=
X-Gm-Gg: ASbGnctRgJT6wwMd7ihOPD/wWtsRTJFfqST/8eyZ/DDb1mWn5j5fSkI1h77ScPDBYHk
	lH0Pe28qrnLkTJDVk4PSP78+yg4S7skyUvQQBrIZYjmPe21Z4+q0XLpdketmUFc+P7IKwJq+U7Q
	hZrfQ0yOJSMmXlGKNQfJ6P5hznEOOfkz+BEKmzm+u/srpjainRXa/Eibauv3BoVKVom0N1cAmzy
	oAk2Oi5FLIsBqvIfugQ5iQ6OLpu73CCQ7xOwCN0XxMl6t7yqQmLN+YU8w==
X-Google-Smtp-Source: AGHT+IEtV+EElbszmKzsagGUV+5RJ5kFfylNWl8hAeezTkODuvWCFFOJDiHSg2jtvhjUFiOXg0YM9g3Uq8HKa8NejXs=
X-Received: by 2002:a05:622a:34f:b0:4b1:1ba4:e2 with SMTP id
 d75a77b69052e-4b2aaddba89mr1071241cf.14.1755806022171; Thu, 21 Aug 2025
 12:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <20250609191340.2051741-9-kirill.shutemov@linux.intel.com>
 <CAAhR5DGGWss4jovHETYmBeK1gze04LR9c8Dcd2oMpCC3SnMDgQ@mail.gmail.com> <0a1cf08ba04b026a6c48a390a756dc2a990b3620.camel@intel.com>
In-Reply-To: <0a1cf08ba04b026a6c48a390a756dc2a990b3620.camel@intel.com>
From: Sagi Shahar <sagis@google.com>
Date: Thu, 21 Aug 2025 14:53:31 -0500
X-Gm-Features: Ac12FXxoVffod8mw688ECGptg6wu19qXj9q41MZieGo6yWj9z8AWlvpolLHUTos
Message-ID: <CAAhR5DEy5z4QsHQjvxv+uDOP=5fC47sK8NTcU5iRSgV5ReCOZQ@mail.gmail.com>
Subject: Re: [PATCHv2 08/12] KVM: TDX: Handle PAMT allocation in fault path
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"Huang, Kai" <kai.huang@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 2:35=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Thu, 2025-08-21 at 14:21 -0500, Sagi Shahar wrote:
> > >   int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
> > >                                enum pg_level level, kvm_pfn_t pfn)
> > >   {
> > > +       struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
> > >          struct kvm_tdx *kvm_tdx =3D to_kvm_tdx(kvm);
> > >          struct page *page =3D pfn_to_page(pfn);
> > > +       int ret;
> > > +
> > > +       ret =3D tdx_pamt_get(page, level, tdx_alloc_pamt_page_atomic,=
 vcpu);
> > > +       if (ret)
> > > +               return ret;
> >
> > tdx_pamt_get() can return non-zero value in case of success e.g.
> > returning 1 in case tdx_pamt_add() lost the race.
>
> No?
>
> +static int tdx_pamt_get(struct page *page, enum pg_level level)
> +{
> +       unsigned long hpa =3D page_to_phys(page);
> +       atomic_t *pamt_refcount;
> +       LIST_HEAD(pamt_pages);
> +       int ret;
> +
> +       if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
> +               return 0;
> +
> +       if (level !=3D PG_LEVEL_4K)
> +               return 0;
> +
> +       pamt_refcount =3D tdx_get_pamt_refcount(hpa);
> +       WARN_ON_ONCE(atomic_read(pamt_refcount) < 0);
> +
> +       if (atomic_inc_not_zero(pamt_refcount))
> +               return 0;
> +
> +       if (tdx_alloc_pamt_pages(&pamt_pages))
> +               return -ENOMEM;
> +
> +       ret =3D tdx_pamt_add(pamt_refcount, hpa, &pamt_pages);
> +       if (ret)
> +               tdx_free_pamt_pages(&pamt_pages);
> +
> +       return ret >=3D 0 ? 0 : ret;
> +}
>
> > Shouldn't we check
> > for (ret < 0) here and below cases?
>
> I think you are thinking of tdx_pamt_add().

My bad.

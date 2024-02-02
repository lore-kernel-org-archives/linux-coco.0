Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A0F9C8
	for <linux-coco@lists.linux.dev>; Fri,  2 Feb 2024 05:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706850557; cv=none; b=AMCNjtzZA03Uo4vAEC3krzP2FRg3MbbX7yLImLlNAMiHbbBBzYwGzpn+gLFMH4F0uj590lw7RxJXCBrZp0xXdhDE1HqXuoA6OjCkSP/nlBdhYNUvynuMGCPY7GSCeqW7lPRZ+9qzx8/qdlqtj7hlOv8CKqJwdgu+Jx644dn4LjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706850557; c=relaxed/simple;
	bh=IwSPoXQuyxe1M4mU3zWrlMIYo0JqJj3p+K+iNyeCeec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hz2LPPrWY6+QX4aVL60cpjJZvA6eq0Gb2VfsGv80xUNIOShCjL+uD1vXq1BOVyKPcWCxzcFElew5UNKS2hdedR0MsMg+1yMnmAH6XdKOsHAtwnx4v1OJi6j6OSKRjaDi+sK+GFjhGZWGRNaAIxB/T15KbgziaN0Xp13FyoXGLlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V4LKNBBs; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4LKNBBs"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so247957366b.2
        for <linux-coco@lists.linux.dev>; Thu, 01 Feb 2024 21:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706850554; x=1707455354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtiSDr91nHjFx+mbNBiaNG8pmkuLga0XeArA/qq1CH0=;
        b=V4LKNBBsR4RAt1ZAvkQriAFXb1aCOYjcUzXPidstjpMe4Uqt6a8u1RBBVP0Nr0qkwG
         t6tmsko2MB2dbRPWCDPWYVJjourhnO+BlzwoKx9FQfEjrnUVqmFQkB4UqCUdMXPwTaNL
         dICxapXxhw641yYPSxHj3fGjpPoB6Mg1ab/3Dlfo0bBC9X6jQge4DkC8MPG1+dZ5iQe8
         6Mpv3Tw3IHnCz20ru3kchHbydtlKpcoqGnbde3DISrc6kjogiogJznFkfsvQ7RuCglbb
         IARe5OyFmJ6ISifJGLT/qCxeDM2Lx58OZep/ynzCj6hNN7KjTKTuubakytBJ08vDQP1O
         pfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706850554; x=1707455354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtiSDr91nHjFx+mbNBiaNG8pmkuLga0XeArA/qq1CH0=;
        b=b688JDrnq4LulNNiwJc7SwzO8ssikN1Bi3bLKG+PgRu7XqkOuNZN/af7X6FEox45VQ
         75NciQ24Aj71O2l290nBqxmDICXqVIpbKoIzT2nMYdoWCnx/U/8xvT9Ty1EQMSmwcNId
         Wn40nvXBOn6YDipYqCycNbYUcNYymgnDAf347e9CBL81U60H75TAsQceMcDJKiAiOEdM
         DF4YJfvlVn+reyiKtwuIMSlTwH7/iEuGUTvPrea6yGef7394ttlP4gpU+atYG747RwfN
         wRLwxClIOD1UiKJM0o895dEOyOYWBMcOOZGt75tbfetvB3P6TJTMpW2NgwVbpibCCBEg
         bXBQ==
X-Gm-Message-State: AOJu0YyKqsQlilG/voCFla26lvUTiWx6emPJoPsI/IsIamBhnvlohkuw
	UP9QXS7KxtmpXp5aP+dMhMr9Fuazib5wYKqyRYu6Qgzt9sXa00yqe1IxVQ0Z1qZVQTv2t83v9sd
	ka1aZ75obkZBhrHZYp+Ctr80lIfVUt06CB7Ws
X-Google-Smtp-Source: AGHT+IFAhP4nbEq6f4+/HS+4EkFhW0QtP4rSe2IhTkJPqr2Q/GBWsEgKmLELHG5FfY19HZmO1FSjSEU7RWGS2yriM+s=
X-Received: by 2002:a17:906:4890:b0:a35:4a82:2046 with SMTP id
 v16-20020a170906489000b00a354a822046mr2819813ejq.24.1706850553602; Thu, 01
 Feb 2024 21:09:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112055251.36101-1-vannapurve@google.com> <20240112055251.36101-6-vannapurve@google.com>
 <6709a57c-48a0-4ddd-b64e-a1e34ae2b763@intel.com> <CAGtprH_ANUVU+Dh1KOq0vpT7BGbCEvD2ab9B=sxjzHYsKxFGeA@mail.gmail.com>
 <1d9d3372-825a-417a-8811-ffa501c83936@linux.microsoft.com>
In-Reply-To: <1d9d3372-825a-417a-8811-ffa501c83936@linux.microsoft.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 2 Feb 2024 10:38:58 +0530
Message-ID: <CAGtprH8r0kYYqGoumsVeZq42cX8CN3cchkuRYhQULqtb-1nKww@mail.gmail.com>
Subject: Re: [RFC V1 5/5] x86: CVMs: Ensure that memory conversions happen at
 2M alignment
To: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, rientjes@google.com, seanjc@google.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, peterx@redhat.com, vkuznets@redhat.com, 
	dmatlack@google.com, pgonda@google.com, michael.roth@amd.com, 
	kirill@shutemov.name, thomas.lendacky@amd.com, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, andrew.jones@linux.dev, corbet@lwn.net, hch@lst.de, 
	m.szyprowski@samsung.com, rostedt@goodmis.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 5:32=E2=80=AFPM Jeremi Piotrowski
<jpiotrowski@linux.microsoft.com> wrote:
>
> On 01/02/2024 04:46, Vishal Annapurve wrote:
> > On Wed, Jan 31, 2024 at 10:03=E2=80=AFPM Dave Hansen <dave.hansen@intel=
.com> wrote:
> >>
> >> On 1/11/24 21:52, Vishal Annapurve wrote:
> >>> @@ -2133,8 +2133,10 @@ static int __set_memory_enc_pgtable(unsigned l=
ong addr, int numpages, bool enc)
> >>>       int ret;
> >>>
> >>>       /* Should not be working on unaligned addresses */
> >>> -     if (WARN_ONCE(addr & ~PAGE_MASK, "misaligned address: %#lx\n", =
addr))
> >>> -             addr &=3D PAGE_MASK;
> >>> +     if (WARN_ONCE(addr & ~HPAGE_MASK, "misaligned address: %#lx\n",=
 addr)
> >>> +             || WARN_ONCE((numpages << PAGE_SHIFT) & ~HPAGE_MASK,
> >>> +                     "misaligned numpages: %#lx\n", numpages))
> >>> +             return -EINVAL;
> >>
> >> This series is talking about swiotlb and DMA, then this applies a
> >> restriction to what I *thought* was a much more generic function:
> >> __set_memory_enc_pgtable().  What prevents this function from getting
> >> used on 4k mappings?
> >>
> >>
> >
> > The end goal here is to limit the conversion granularity to hugepage
> > sizes. SWIOTLB allocations are the major source of unaligned
> > allocations(and so the conversions) that need to be fixed before
> > achieving this goal.
> >
> > This change will ensure that conversion fails for unaligned ranges, as
> > I don't foresee the need for 4K aligned conversions apart from DMA
> > allocations.
>
> Hi Vishal,
>
> This assumption is wrong. set_memory_decrypted is called from various
> parts of the kernel: kexec, sev-guest, kvmclock, hyperv code. These conve=
rsions
> are for non-DMA allocations that need to be done at 4KB granularity
> because the data structures in question are page sized.
>
> Thanks,
> Jeremi

Thanks Jeremi for pointing out these usecases.

My brief analysis for these call sites:
1) machine_kexec_64.c, realmode/init.c, kvm/mmu/mmu.c - shared memory
allocation/conversion happens when host side memory encryption
(CC_ATTR_HOST_MEM_ENCRYPT) is enabled.
2) kernel/kvmclock.c -  Shared memory allocation can be made to align
2M even if the memory needed is lesser.
3) drivers/virt/coco/sev-guest/sev-guest.c,
drivers/virt/coco/tdx-guest/tdx-guest.c - Shared memory allocation can
be made to align 2M even if the memory needed is lesser.

I admit I haven't analyzed hyperv code in context of these changes,
but will take a better look to see if the calls for memory conversion
here can fit the category of "Shared memory allocation can be made to
align 2M even if the memory needed is lesser".

Agree that this patch should be modified to look something like
(subject to more changes on the call sites):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index e9b448d1b1b7..8c608d6913c4 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2132,10 +2132,15 @@ static int __set_memory_enc_pgtable(unsigned
long addr, int numpages, bool enc)
        struct cpa_data cpa;
        int ret;

        /* Should not be working on unaligned addresses */
        if (WARN_ONCE(addr & ~PAGE_MASK, "misaligned address: %#lx\n", addr=
))
                addr &=3D PAGE_MASK;

+       if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
+               (WARN_ONCE(addr & ~HPAGE_MASK, "misaligned address:
%#lx\n", addr)
+                       || WARN_ONCE((numpages << PAGE_SHIFT) & ~HPAGE_MASK=
,
+                               "misaligned numpages: %#lx\n", numpages)))
+               return -EINVAL;
+
        memset(&cpa, 0, sizeof(cpa));
        cpa.vaddr =3D &addr;
        cpa.numpages =3D numpages;

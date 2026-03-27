Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E538F245
	for <linux-coco@lists.linux.dev>; Fri, 27 Mar 2026 19:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640628; cv=pass; b=J2TOx59VzF5Hwds/7QX2BRI6i8MUlrnF6HdgN0NfAqNh6RaGq5VGcNkid6RpdUrN+6S243wZtz9ZIVUOwT2421rnCHvzezfRobaghOiruClPuVheUBXMUFxMGJPWKCGYwWmxGCCzrY5yGwwyS5V6Mxe6xz2UpEidS4L+8+72AAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640628; c=relaxed/simple;
	bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNwZKlkttSnURbMyG0gx77btlr8Zm8Jgr8xcbYY4/hyMl7kHu5mjxLksIbLTr31H4BuTlAVK1zWnsNg7PCnI21L+tGRxalOCfK3Sql+s8nKvvrIhUQ1yTGSxHEIjeoIP3tG80d1mTb6XrTzbiaE7Vcpz9cxQApkOyg9O/Y1brII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cMzWvZhO; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cMzWvZhO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48569636800so17495e9.0
        for <linux-coco@lists.linux.dev>; Fri, 27 Mar 2026 12:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774640621; cv=none;
        d=google.com; s=arc-20240605;
        b=KoDguLwiDrtJTLWt9Nnt9iWgh+9JMwpGJmzTCEKLG4Mp1D4E187TBgYAR+DCxAGTmy
         sqO1bdbpyxzIfq8hBZgusapDJjmjqPcKrs9PT6TLo10cmy2T0fVNp/cH9ExyDNJ7kVCb
         RuSkyImAceyBvls/XeJtYiyRJMxKwABgNshAvpVoaU5e11MlzOIcuR7M+i7b9AMLOeAb
         gInIqVi6Bw+Gd/SPtKmzikoGQZec7CidVsgMo4mw+Sw0L0NGT6SMYNCuMGeurIfw48Qu
         AxYFEF5rwcGEejvrRebHAawuHe4Mg/Q/xm0Vr3z0YdkLhZty99L93lpC2cqZCJYox9S4
         Adig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
        fh=sJUdJwGxWly05aS8WZK/SSi0BgDuwyD1/iDfdltzX5E=;
        b=IqBvuqTAR/Yn+N1GmWiJJ8XN0Sx0WGuyPulW3JTjebrZpa2lCMVglzYDIK0yltnZnB
         QLvsFNp2OUUy/PO7RtU3wG8W14jDS4xo1hIOgqM7YtMHxA01hRwdfrFtS66PlaRvNiaC
         14MpU+mLWNQJq3cuZrIlZQuu6mk68d0Avz8WToyLD+sfmN1S9vJayNbKpv2+LR3G/3F0
         ePL7NlHRp1oD5NRqkgjlMDRNKqxDuNxGkON7bHAwqUhaAnstzkO/9ue7Wyqm15JWfrfO
         QvacoL9mOyHldnduAuOHF2Avdp6TixsfQyzFO5pnge4QGVlnCu+2CEaITGmnD0fHr1LN
         8FlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774640621; x=1775245421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
        b=cMzWvZhO2iRjI/GiO69hMhoeJDpc4OAcBCYZ3GkrwwjeG5g+OGki+YzfI9n296Awsx
         JtwOen95Zomh2HFhpOdLKosjaMAgIWunQHqvVtZgSjnU45moO6FPTYBUk5gAfDhmlJ2A
         mCey8ZktUbIs4lrleCY7UsdPeAMbmL3rcjPFtL5WPCLmzaALWn9+VzFxS6pSYxuiRnEz
         PR3O2ENw3Mn6S3PuH1+2HnOA8p8Tx8FX8akP74//iYqCyEhypMShKvSfGVkHEzcu/uv5
         rsCanj7Qo+yUkil2tKCIWJT342d+ZzhTQXEMIklroQB5aEy/oov9r0dXJ6udkL2OuGR0
         SCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640621; x=1775245421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bp8Rzg51lEDwzJFZ6phUlxNkzebzC2DJpAPYxDIaxlM=;
        b=XJkaKAYpuS/QpuAuoX+Exf9Loijf8Trv9LPrIk5A8ss4PpVIveebLsxjHPgqqY1ivK
         u89YOhvXPDW0xa59Am8H4AfOPqwaSw9di6zbZy9KczB28B0p8NaIaptJjjkNB8bNfrye
         CEXAcwZJDuRPIMy0GywjWblPZuM4Kn6rUzraYHpacgTuTIvNSelYZgEZ9dsC416qtDZt
         UeANl1ibbBYDVkJVYVA/yyer4SKDSgzoZNjM+JJbgd1SqY+PAkzaJ5g4WCug9W10CMyv
         oZwqnY4nb6uc0ll2eAzppWLyIxlIOlSzlUd0UzKcLvLGtqQZ5iMGYeaWtFiOI8mQ5mhK
         qlHg==
X-Forwarded-Encrypted: i=1; AJvYcCWfHbI6Q8PbIR3rS5KgR9ZmMWspSw9dvl4vIlfIHVNutDji6u3hY53zaCsOdvbVzqkPdgryUnGadUjG@lists.linux.dev
X-Gm-Message-State: AOJu0YyivkEfdr+ggzV9DEndSPMY/C2y8SNpMhbBZEg73Zi5UrRyZ3vH
	DAXaMeI/gv2d8bo5A98uxzlIaMKLnU2FmUDa0pCZDsoM935XNBPNCOfpPO4cdI5DzHdgyhYvmhz
	Lw/i3/2RRLF8HNRZhrydBQ+RYNAb4KVJm+mo2UFzH
X-Gm-Gg: ATEYQzxcaDpObw2oOvHL7G5PnJl3OBHpUb3SpxwSYJHoP4OdzCUvGHbniPr8oMYYGiv
	m53wOKbGx8c+M3xU9HB02h/ZB1eYJt5pyE44MpXcEj3z4VuW2u4LOgFqudeUI4GkyC1pTGRcYsh
	w3/iQLTexJqizH/u9pwB+yMMJBQXPs6r2fFWf/Ci2VXSRrHDPbA8yuQ6WH+j7JkSx/rnE6gxiNX
	L8mp32mISVBmV8dkAz0oCRlTFJmMInzOdGcjsh/pgCII/NV/kvJiRrf+MnmaWZQCiiBZrXAch74
	TlAykXnD7qKqc12oKfE8W5ICTTPVqUmmcqjkp12t1kMn8pNu4Knwxgmo7fnwLwkIMitk
X-Received: by 2002:a05:600c:474a:b0:47e:de1d:ce99 with SMTP id
 5b1f17b1804b1-4872fb2db92mr169905e9.12.1774640620548; Fri, 27 Mar 2026
 12:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20260325192400eucas1p2ae38ff4c2b3ab35a7047cfd680d9fda3@eucas1p2.samsung.com>
 <20260325192352.437608-1-jiri@resnulli.us> <f2047cd7-91a8-4f6a-b6b9-0e4f143f6854@samsung.com>
 <20260327121021.GB246076@ziepe.ca>
In-Reply-To: <20260327121021.GB246076@ziepe.ca>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 27 Mar 2026 12:43:28 -0700
X-Gm-Features: AQROBzCEcKgPP9gV3lvkFItmqoWSRLzeH8nf-BLcIkZAnZ3bjMQA_OWXnQtSUH4
Message-ID: <CABdmKX0HYg_HQAb44QGcO-frCTu+0h=uqS70CTcYtRs-Y=y21g@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jiri Pirko <jiri@resnulli.us>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, robin.murphy@arm.com, leon@kernel.org, 
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 5:10=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Mar 27, 2026 at 10:38:10AM +0100, Marek Szyprowski wrote:
> > On 25.03.2026 20:23, Jiri Pirko wrote:
> > > From: Jiri Pirko <jiri@nvidia.com>
> > >
> > > Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel T=
DX,
> > > run with private/encrypted memory which creates a challenge
> > > for devices that do not support DMA to it (no TDISP support).
> > >
> > > For kernel-only DMA operations, swiotlb bounce buffering provides a
> > > transparent solution by copying data through shared memory.
> > > However, the only way to get this memory into userspace is via the DM=
A
> > > API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> > > the use of the memory to a single DMA device, and is incompatible wit=
h
> > > pin_user_pages().
> > >
> > > These limitations are particularly problematic for the RDMA subsystem
> > > which makes heavy use of pin_user_pages() and expects flexible memory
> > > usage between many different DMA devices.
> > >
> > > This patch series enables userspace to explicitly request shared
> > > (decrypted) memory allocations from new dma-buf system_cc_shared heap=
.
> > > Userspace can mmap this memory and pass the dma-buf fd to other
> > > existing importers such as RDMA or DRM devices to access the
> > > memory. The DMA API is improved to allow the dma heap exporter to DMA
> > > map the shared memory to each importing device.
> > >
> > > Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0=
d
> >
> > I would like to merge this to dma-mapping-next, but I feel a bit
> > uncomfortable with my lack of knowledge about CoCo and friends. Could
> > those who know a bit more about it provide some Reviewed-by tags?
>
> I'm confident in the CC stuff, I was hoping to see someone from dmabuf
> heap land ack that the uAPI design is OK.. TJ?
>
> Jason

Hi, yes LGTM. From a uAPI perspective it's just another dma-buf heap.

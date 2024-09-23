Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7E6F303
	for <linux-coco@lists.linux.dev>; Mon, 23 Sep 2024 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727124854; cv=none; b=CEiwmEE2BSO+C/q5jDCuDAA9CCkzM5DgD5R+57yV2pRIAbydRyvLtFnKKYVAqTi8vl8L+01XVgSglYkexbgNCY/3+ZAGiM3EAWkJfhnv1YOZiOfFyppEavTCwQsdgvR/Ltvqsike/H5QpjSt84oq41Q5iV7dWyy3fvRS00zdXZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727124854; c=relaxed/simple;
	bh=XLApyLRmdHoyHKpjQM4VOM57+06FvSf6NmgpBpZY/nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/mpa695wUiki/FJldCSHnnBItYG6c699yDMz9GiuWyqRjixUNWps5cemMqOs8iAMwbmYxEf74p5rmbOsuG5WdCEzq1NDv9D0gcwYBqwwosOOMEzOMSdd9wfuqiFnKhs/5Gsb0rrDl2Ln4wbSuoCIyEvm/2rWBD5HQJ3cB6RI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0mGq5sUQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0mGq5sUQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c2460e885dso6497a12.0
        for <linux-coco@lists.linux.dev>; Mon, 23 Sep 2024 13:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727124850; x=1727729650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLApyLRmdHoyHKpjQM4VOM57+06FvSf6NmgpBpZY/nU=;
        b=0mGq5sUQNIqQAT3oj0CsxEOO5wLTEDK8AwspL1qAo5cNoO6wSqni0mGh/Ja9OOaCA/
         iVomOURXuO3mrC5WGwRSq/UyUsu2v+wOI33mMFFaLVpc3wQHinFuOQBucBrJiuRoP7x+
         oQ5eF/C2NJ54whExNiPkxiLz9ndX+4jAT++lJpkx1hR1OJ04zWp2Ry9hndO3vlS87v+8
         0Wwq+2Vml42BvZywGz7DKaAYUpwYFG8vzMeyBdQgiVbJJ4Le/USZfZhw4bDVNlIQYTsW
         FYhCt1EMUObEEF2VRWrbwAUPH5puzFjJNiAo6sqzJj8KtVaMzRVgQVzZvFW3aaEOH5hQ
         j/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727124850; x=1727729650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLApyLRmdHoyHKpjQM4VOM57+06FvSf6NmgpBpZY/nU=;
        b=XsNoVGlVV9fkrzUbt/lFbDhj52KZGjU/zYlWp7NgVKM+wurxpqWFA7SYqb1c3l8f86
         Sz3nbsdUzlJPACKtRIqVQrQKRE0lnX5EcviiatpolIq8Ls1b+bT1TV0UvDFhOC2s7a/e
         RXRBXXXprvVfLbHvzTtiwEQsmvsiBcITmXw8HepJ3FBknpruVhbItblGRandzM94MPlT
         6ySua0uH6T+YogRDsf7VNewDMcike8FqOOZuLtApsgiEyTC3lPGpWIgX/vn6OU8XlNYp
         xauUqE2SK7lTZnBXrLKlWaBBQeKAkIZDNkPTioEgYoT0FaCTl1Bo76AhFkUb3cvsnfbt
         eYNg==
X-Forwarded-Encrypted: i=1; AJvYcCWq4JAi3MW4rd2EPCDKND9QT3/ygSAvTa/kadqvz0EopmlGHd81ujZO1j6cYlpOLk2lZ8gaOnB4xRv0@lists.linux.dev
X-Gm-Message-State: AOJu0YzCjzFyhjnMvNDJD5CLweEns9BvaZvS4NBu03t+bX4j/577Altn
	rM8xAEoyP/etfhVat2BbAmlXdAt15vV7R015XvgNujRImtoHcp4BuZrWW9B1mpQPeRvsX3C4wxd
	94DNKQo+FVYwYkRboyfwC1qwTd2Sma/znnXrw
X-Google-Smtp-Source: AGHT+IEQZynjnkg/b3hzUvG23ISTmBjr2jvIEVxUaxjrNwfQDw8PUcEwuxPMrUQiyHwol3qPWXHpgPsdvJWCzN4O1nM=
X-Received: by 2002:a05:6402:518f:b0:5c2:2d47:2868 with SMTP id
 4fb4d7f45d1cf-5c5cec01239mr107220a12.6.1727124850203; Mon, 23 Sep 2024
 13:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823132137.336874-1-aik@amd.com> <20240823132137.336874-13-aik@amd.com>
 <ZudMoBkGCi/dTKVo@nvidia.com> <CAGtprH8C4MQwVTFPBMbFWyW4BrK8-mDqjJn-UUFbFhw4w23f3A@mail.gmail.com>
 <BN9PR11MB527608E3B8B354502F22DFCA8C6F2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CAGtprH-bj_+1k-jwEVS9PcAmCOvo72Vec3VVKvL1te7T8R1ooQ@mail.gmail.com> <BL1PR11MB5271327169B23A60D66965F38C6F2@BL1PR11MB5271.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5271327169B23A60D66965F38C6F2@BL1PR11MB5271.namprd11.prod.outlook.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 23 Sep 2024 22:53:57 +0200
Message-ID: <CAGtprH-bcZDwndi6E7-qZPO6Qz57g-sanjmvM-Af8hjUN6SowQ@mail.gmail.com>
Subject: Re: [RFC PATCH 12/21] KVM: IOMMUFD: MEMFD: Map private pages
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alexey Kardashevskiy <aik@amd.com>, kvm list <kvm@vger.kernel.org>, 
	iommu@lists.linux.dev, linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Alex Williamson <alex.williamson@redhat.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	pratikrajesh.sampat@amd.com, michael.day@amd.com, david.kaplan@amd.com, 
	dhaval.giani@amd.com, Santosh Shukla <santosh.shukla@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Alexander Graf <agraf@suse.de>, Nikunj A Dadhania <nikunj@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024, 10:24=E2=80=AFAM Tian, Kevin <kevin.tian@intel.com> w=
rote:
>
> > From: Vishal Annapurve <vannapurve@google.com>
> > Sent: Monday, September 23, 2024 2:34 PM
> >
> > On Mon, Sep 23, 2024 at 7:36=E2=80=AFAM Tian, Kevin <kevin.tian@intel.c=
om> wrote:
> > >
> > > > From: Vishal Annapurve <vannapurve@google.com>
> > > > Sent: Saturday, September 21, 2024 5:11 AM
> > > >
> > > > On Sun, Sep 15, 2024 at 11:08=E2=80=AFPM Jason Gunthorpe <jgg@nvidi=
a.com>
> > wrote:
> > > > >
> > > > > On Fri, Aug 23, 2024 at 11:21:26PM +1000, Alexey Kardashevskiy wr=
ote:
> > > > > > IOMMUFD calls get_user_pages() for every mapping which will
> > allocate
> > > > > > shared memory instead of using private memory managed by the
> > KVM
> > > > and
> > > > > > MEMFD.
> > > > >
> > > > > Please check this series, it is much more how I would expect this=
 to
> > > > > work. Use the guest memfd directly and forget about kvm in the
> > iommufd
> > > > code:
> > > > >
> > > > > https://lore.kernel.org/r/1726319158-283074-1-git-send-email-
> > > > steven.sistare@oracle.com
> > > > >
> > > > > I would imagine you'd detect the guest memfd when accepting the F=
D
> > and
> > > > > then having some different path in the pinning logic to pin and g=
et
> > > > > the physical ranges out.
> > > >
> > > > According to the discussion at KVM microconference around hugepage
> > > > support for guest_memfd [1], it's imperative that guest private mem=
ory
> > > > is not long term pinned. Ideal way to implement this integration wo=
uld
> > > > be to support a notifier that can be invoked by guest_memfd when
> > > > memory ranges get truncated so that IOMMU can unmap the
> > corresponding
> > > > ranges. Such a notifier should also get called during memory
> > > > conversion, it would be interesting to discuss how conversion flow
> > > > would work in this case.
> > > >
> > > > [1] https://lpc.events/event/18/contributions/1764/ (checkout the
> > > > slide 12 from attached presentation)
> > > >
> > >
> > > Most devices don't support I/O page fault hence can only DMA to long
> > > term pinned buffers. The notifier might be helpful for in-kernel conv=
ersion
> > > but as a basic requirement there needs a way for IOMMUFD to call into
> > > guest memfd to request long term pinning for a given range. That is
> > > how I interpreted "different path" in Jason's comment.
> >
> > Policy that is being aimed here:
> > 1) guest_memfd will pin the pages backing guest memory for all users.
> > 2) kvm_gmem_get_pfn users will get a locked folio with elevated
> > refcount when asking for the pfn/page from guest_memfd. Users will
> > drop the refcount and release the folio lock when they are done
> > using/installing (e.g. in KVM EPT/IOMMU PT entries) it. This folio
> > lock is supposed to be held for short durations.
> > 3) Users can assume the pfn is around until they are notified by
> > guest_memfd on truncation or memory conversion.
> >
> > Step 3 above is already followed by KVM EPT setup logic for CoCo VMs.
> > TDX VMs especially need to have secure EPT entries always mapped (once
> > faulted-in) while the guest memory ranges are private.
>
> 'faulted-in' doesn't work for device DMAs (w/o IOPF).

faulted-in can be replaced with mapped-in for the context of IOMMU operatio=
ns.

>
> and above is based on the assumption that CoCo VM will always
> map/pin the private memory pages until a conversion happens.

Host physical memory is pinned by the host software stack. If you are
talking about arch specific logic in KVM, then the expectation again
is that guest_memfd will give pinned memory to it's users.

>
> Conversion is initiated by the guest so ideally the guest is responsible
> for not leaving any in-fly DMAs to the page which is being converted.
> From this angle it is fine for IOMMUFD to receive a notification from
> guest memfd when such a conversion happens.
>
> But I'm not sure whether the TDX way is architectural or just an
> implementation choice which could be changed later, or whether it
> applies to other arch.

All private memory accesses from TDX VMs go via Secure EPT. If host
removes secure EPT entries without guest intervention then linux guest
has a logic to generate a panic when it encounters EPT violation on
private memory accesses [1].

>
> If that behavior cannot be guaranteed, then we may still need a way
> for IOMMUFD to request long term pin.

[1] https://elixir.bootlin.com/linux/v6.11/source/arch/x86/coco/tdx/tdx.c#L=
677

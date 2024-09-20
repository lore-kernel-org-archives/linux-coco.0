Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47113F42A
	for <linux-coco@lists.linux.dev>; Fri, 20 Sep 2024 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726866647; cv=none; b=IEza5bK+dNizjD47t94zs08t+XNBFR/zWAcAA2gZAqALsafqdWmbFbQRDQjrUnXjrEdDzgu31DWiIEDaMrMBquCAFfzbB0LKKT48gfjxin/tLBG1FqGyfNgGKR+3t767QjH+IvPexsG4+5EGHDhc7Fwaxd5OnDgX7tn4vK1ZjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726866647; c=relaxed/simple;
	bh=m+NtI7KFoRn8JqPaP71PrQB5dB7g9pqRx96cGl1zNOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSHL5pf7nIWgklfHdu68BHk9gybIeCJfD9I2rd5PPexMioyDq4OIo/1ibFhj5mVNotQVmLuK+MNXtbbq2jVstsBJ1fxaHPKtH1nLbFxLeWrDIOfMSTvusO3htSseR6tph8uDApphJTOdFsaq7B1IuHICpOr0eadA4N+FROnX8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QKhMr/+A; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QKhMr/+A"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-536552fcc07so3071e87.1
        for <linux-coco@lists.linux.dev>; Fri, 20 Sep 2024 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726866644; x=1727471444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+NtI7KFoRn8JqPaP71PrQB5dB7g9pqRx96cGl1zNOQ=;
        b=QKhMr/+AsN4yXPZunqB9QBa+nw3LhrQObsoKBktSpu+5PzVT4k+c3gXWQbv/bIyA/m
         GFNWY7WXb8t6zxGOvn+bYk7DC/LO7re/cIBHt9m3oRCBeWVRymqP4fh2YNa1nlO+fhxV
         jkAKS4hstZO+wYPSZ2chEk7IQbDAw3cA8+wsyv7WCnqPoPKmLkTe6AhbisZuV9jH10yf
         0q9xZ7qLg/VKmkQIhKSjSULtUcCDm41Vm5DExBUeDuA1WetbTC2Mj44vVqPFMW+WFOrA
         aSuN0mL8+bo7Sq71xaZRoR6o+R8aV4Zm7gcPsLdcJ+lAXDj9ECxUJkFy2m3dIQEPw4lx
         T2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726866644; x=1727471444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+NtI7KFoRn8JqPaP71PrQB5dB7g9pqRx96cGl1zNOQ=;
        b=sA7AqqichfD893Ymnn7/2Q3Pe/59PFg/7/neBM9YmP9/NoLi9SOyEzCz3OGUMARJNf
         vVSv7UF7pRKeLFZ0Z1vIbTlxaep5BUwJf6pXUd5YOcpICy/2TEh8qmvGPrnZUsXjMSna
         p5tTwBwg6qoOGXQRznoFVtrrXE91uvf/gPr1BPb6maxdl2+SkbTvgN/wFInQy+YgprGX
         Mr8ohSTgmWCErlKb0itbUc1hLe8Oc1Dkdtb7uN9/hELwJrLOJ8BOlkAn0fHJlLZWpXuT
         V2xonDL0L4slUu3F+8OavbeUdXr/J3mj85T/T5q3AxQpufETv6Z4Hqn3XacJ0gjslLfC
         6V8A==
X-Forwarded-Encrypted: i=1; AJvYcCVlvxyDdCpQUJmH7OnNJgnfKQ1odZlRgUZ9id90wGCOOp1ycEklykMAlmxG1pXupwsY62PGXZ9hV2tC@lists.linux.dev
X-Gm-Message-State: AOJu0YzdLTDheD+Rk7TFMNXooU67wbZ0yCyQeFbGqaTiPb6RrXP163ee
	mxlvE/xVRvn+qE+cXTWB+7lr+wnUPdauzILOi3foonI8sIKc3xfgWFBTK0dvgQe32gfR812WW+K
	s3rAE9yi9iVSDpqWpXLU+4ZHSERKt1c9Wrp5R
X-Google-Smtp-Source: AGHT+IHbQ1owfwv0bwXyOysxmcbe5slLoFbMmljycd2jsECKG87UWxrZhXYcSekvu/JQPuY2zRUCE12merz5Ttxczic=
X-Received: by 2002:a05:6512:3f0f:b0:535:6a42:90f2 with SMTP id
 2adb3069b0e04-5374fd2163fmr105932e87.6.1726866643470; Fri, 20 Sep 2024
 14:10:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823132137.336874-1-aik@amd.com> <20240823132137.336874-13-aik@amd.com>
 <ZudMoBkGCi/dTKVo@nvidia.com>
In-Reply-To: <ZudMoBkGCi/dTKVo@nvidia.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 20 Sep 2024 23:10:30 +0200
Message-ID: <CAGtprH8C4MQwVTFPBMbFWyW4BrK8-mDqjJn-UUFbFhw4w23f3A@mail.gmail.com>
Subject: Re: [RFC PATCH 12/21] KVM: IOMMUFD: MEMFD: Map private pages
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Dan Williams <dan.j.williams@intel.com>, 
	pratikrajesh.sampat@amd.com, michael.day@amd.com, david.kaplan@amd.com, 
	dhaval.giani@amd.com, Santosh Shukla <santosh.shukla@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Alexander Graf <agraf@suse.de>, Nikunj A Dadhania <nikunj@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 11:08=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> On Fri, Aug 23, 2024 at 11:21:26PM +1000, Alexey Kardashevskiy wrote:
> > IOMMUFD calls get_user_pages() for every mapping which will allocate
> > shared memory instead of using private memory managed by the KVM and
> > MEMFD.
>
> Please check this series, it is much more how I would expect this to
> work. Use the guest memfd directly and forget about kvm in the iommufd co=
de:
>
> https://lore.kernel.org/r/1726319158-283074-1-git-send-email-steven.sista=
re@oracle.com
>
> I would imagine you'd detect the guest memfd when accepting the FD and
> then having some different path in the pinning logic to pin and get
> the physical ranges out.

According to the discussion at KVM microconference around hugepage
support for guest_memfd [1], it's imperative that guest private memory
is not long term pinned. Ideal way to implement this integration would
be to support a notifier that can be invoked by guest_memfd when
memory ranges get truncated so that IOMMU can unmap the corresponding
ranges. Such a notifier should also get called during memory
conversion, it would be interesting to discuss how conversion flow
would work in this case.

[1] https://lpc.events/event/18/contributions/1764/ (checkout the
slide 12 from attached presentation)

>
> Probably we would also need some CAP interaction with the iommu driver
> to understand if it can accept private pages to even allow this in the
> first place.
>
> Thanks,
> Jason
>

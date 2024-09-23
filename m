Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D51759F
	for <linux-coco@lists.linux.dev>; Mon, 23 Sep 2024 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727073261; cv=none; b=UiR0hK/5E2FKsBMk91Ytbko2XqWEDJYpX6+wY2BV10UXuv64G0Qd+EdmtgBOdx12+JCR1l7Ejg6PsGnyeQdkA45dU1dvK858pP1DL2Gcmc7vPdWPQxL29AEVyAPcsfGIzG/18ykqohHBPfkjkDsHr35I6XZVHze8ymt0WR+5764=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727073261; c=relaxed/simple;
	bh=Xud0Bj40lmgGEoTZDAPWyWJLudpfWg/JlILBKYnl8wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4M1LLPtOZ3n5SHZ5FCqDfSv58XIAx53RSgyX88vrlaEfJBZ+KrohunGG9pj66AFU3UJdqhWlA8yqRjL0dvtRiZyaFKaN/u7oT+qS5cnw18azXk+b4oqGi6JYWAOlsTTGrJ1H1zbU43O0mEMH0YdHUOrS5s+YiG5IPQ2F98Xbok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FH7GaMqm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FH7GaMqm"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53661d95508so11411e87.1
        for <linux-coco@lists.linux.dev>; Sun, 22 Sep 2024 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727073256; x=1727678056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xud0Bj40lmgGEoTZDAPWyWJLudpfWg/JlILBKYnl8wU=;
        b=FH7GaMqmMCpryGSwZtEsiwGOvPH2nVPIpacmYwdPzGCNIDemQmgT8EKhe2SS0gK/7z
         u1FVoiRUOjw+gUs1N+WWqO+5DZBPpeVGAHXG3FOqnra2SlGHbPuua6IbiJaVg1R99Vze
         esSKkjp5fVlDPBg9r7jciKb0b5pSjojtX+WmTjoPG0pJKuUbB7NGn1qy3q7kSLjfzuXQ
         2DqqSDZM0nQiJYagCMNzI2/cqOJv4L5/OKz1f5TMylwk8qzRN6WR6fWev3UvBxwntVm1
         qkUExOH4lW1d4f9A8I9KkLvLrt+mgTe+u3VKvyPKkqWATJ6OwXaO7BlxINQ3AHlZ/sLa
         6aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727073256; x=1727678056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xud0Bj40lmgGEoTZDAPWyWJLudpfWg/JlILBKYnl8wU=;
        b=neV2IE7MuROJ578gFTPVBecc2kXFAbQ154qnVA3JAA+8otiNIXELKpT94OuakdkIic
         crBQnVQ+sNqH7gbPwdyU0jeqgKtD4Z9BndO7/oOshIwhFmHTSubaIcVBHmbvmZ/YASH0
         JkxHYhxwFmvrwuohubcoZ37zDaCt0KoTxdk2oQHVm0yoSgiZKObmMcfEU5gAB3FE+zeN
         ltmBujNWY3tELjXvrMo0EsUfJOx8e2Ia97zanUrG5gwnBaWLAvOIlMBUR+Dz9IN+hGpz
         nNRbuYE+Yj8iusBENoacoppaCC5fntpRmoB1Wm7mw0vTWmzJXCY5blcZAXBcEo5Hbq/I
         cP/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJizgsVcyvYf5S26zqU9c2UVTttP1LuGgtvfRsrTk8Mbybgw+JYaSXIZjCqS7HUrzZST/0aItO4eCU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9LBumXc4I+2E31KEyMaKf28FhvzzGXC2HTGVod2CTvfvsrnf7
	taemc7hylKYZJi+43OEBXfpF7+3vz2fCCtXf9ZHGY8Xf7dWdv6HvVz3hukpKW7OH3560PvAkHY5
	EY/Tw04XMDzYsCYyOkN69uTa3KN8x5tQM6VcI
X-Google-Smtp-Source: AGHT+IHgv+WaPXBGFfSh9JnGkKaZC4QUllbsOmespG23ynT9oxBxJviTj2hcvIQ9UBIe6mOnZUKQNkHqaXIlGoHHDO0=
X-Received: by 2002:a05:6512:3c97:b0:52e:934c:1cc0 with SMTP id
 2adb3069b0e04-5379961b0d2mr217481e87.7.1727073256077; Sun, 22 Sep 2024
 23:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823132137.336874-1-aik@amd.com> <20240823132137.336874-13-aik@amd.com>
 <ZudMoBkGCi/dTKVo@nvidia.com> <CAGtprH8C4MQwVTFPBMbFWyW4BrK8-mDqjJn-UUFbFhw4w23f3A@mail.gmail.com>
 <BN9PR11MB527608E3B8B354502F22DFCA8C6F2@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB527608E3B8B354502F22DFCA8C6F2@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 23 Sep 2024 08:34:03 +0200
Message-ID: <CAGtprH-bj_+1k-jwEVS9PcAmCOvo72Vec3VVKvL1te7T8R1ooQ@mail.gmail.com>
Subject: Re: [RFC PATCH 12/21] KVM: IOMMUFD: MEMFD: Map private pages
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alexey Kardashevskiy <aik@amd.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Alex Williamson <alex.williamson@redhat.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "michael.day@amd.com" <michael.day@amd.com>, 
	"david.kaplan@amd.com" <david.kaplan@amd.com>, "dhaval.giani@amd.com" <dhaval.giani@amd.com>, 
	Santosh Shukla <santosh.shukla@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Alexander Graf <agraf@suse.de>, Nikunj A Dadhania <nikunj@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 7:36=E2=80=AFAM Tian, Kevin <kevin.tian@intel.com> =
wrote:
>
> > From: Vishal Annapurve <vannapurve@google.com>
> > Sent: Saturday, September 21, 2024 5:11 AM
> >
> > On Sun, Sep 15, 2024 at 11:08=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.co=
m> wrote:
> > >
> > > On Fri, Aug 23, 2024 at 11:21:26PM +1000, Alexey Kardashevskiy wrote:
> > > > IOMMUFD calls get_user_pages() for every mapping which will allocat=
e
> > > > shared memory instead of using private memory managed by the KVM
> > and
> > > > MEMFD.
> > >
> > > Please check this series, it is much more how I would expect this to
> > > work. Use the guest memfd directly and forget about kvm in the iommuf=
d
> > code:
> > >
> > > https://lore.kernel.org/r/1726319158-283074-1-git-send-email-
> > steven.sistare@oracle.com
> > >
> > > I would imagine you'd detect the guest memfd when accepting the FD an=
d
> > > then having some different path in the pinning logic to pin and get
> > > the physical ranges out.
> >
> > According to the discussion at KVM microconference around hugepage
> > support for guest_memfd [1], it's imperative that guest private memory
> > is not long term pinned. Ideal way to implement this integration would
> > be to support a notifier that can be invoked by guest_memfd when
> > memory ranges get truncated so that IOMMU can unmap the corresponding
> > ranges. Such a notifier should also get called during memory
> > conversion, it would be interesting to discuss how conversion flow
> > would work in this case.
> >
> > [1] https://lpc.events/event/18/contributions/1764/ (checkout the
> > slide 12 from attached presentation)
> >
>
> Most devices don't support I/O page fault hence can only DMA to long
> term pinned buffers. The notifier might be helpful for in-kernel conversi=
on
> but as a basic requirement there needs a way for IOMMUFD to call into
> guest memfd to request long term pinning for a given range. That is
> how I interpreted "different path" in Jason's comment.

Policy that is being aimed here:
1) guest_memfd will pin the pages backing guest memory for all users.
2) kvm_gmem_get_pfn users will get a locked folio with elevated
refcount when asking for the pfn/page from guest_memfd. Users will
drop the refcount and release the folio lock when they are done
using/installing (e.g. in KVM EPT/IOMMU PT entries) it. This folio
lock is supposed to be held for short durations.
3) Users can assume the pfn is around until they are notified by
guest_memfd on truncation or memory conversion.

Step 3 above is already followed by KVM EPT setup logic for CoCo VMs.
TDX VMs especially need to have secure EPT entries always mapped (once
faulted-in) while the guest memory ranges are private.

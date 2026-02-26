Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0A329E43
	for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772093997; cv=pass; b=QtTUEF3wjm1wi+e9tjevMMwg+/yEzcgzLbWp/M2c7nRLzHm/3/EvEN5BOF/76t0uP/TkpzWn0pmBftiVY4ndLdiExtpXPILGOk9t4t2YBooFIZBfTLY//DKDaXXLXVG1m4GbGeEgESvWNs4Urvt9DLehDE2ckdqqi/b/pr4JoCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772093997; c=relaxed/simple;
	bh=cdBxMl2hAVhNIc25QWUuK78SdurupBpgKnwJrav1VP0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVEWV0KE7PCiMQX85/iqSM9+EkZjPPe4cLioGKKUhEtE8XAwB77nzWbs9gvewwE4jXjiKdEyhelPkrU1dQ4+O+KA8itBLVsD9r3qOdpCzlhZiju8QEd9bMmFjoNuU1F0RlQ1EfrjoPrt5OB953J21DwLTZsRjTAsujk9zg9NIzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KfzXzVfH; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KfzXzVfH"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ff07cb35f2so278329137.3
        for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 00:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772093994; cv=none;
        d=google.com; s=arc-20240605;
        b=Yqb3CIf536vY2AEh8NVsoJJV62YU+Y/ZtnEJGa/HPWOXYyLgK4g0RY16a31TcHd1u6
         LNfT9pKZ1GjhJ+K/L4fZ2vo1ObLdbxvqgtvsfuYxMQkyM0yHG1rnwCPrIfCz5idGanHL
         SYoTBOenvhEHKslrFajY+/z3g49zz6YWXk7CcWSS0CVZy3jfjm2p8zuvacLB2txWJ8qM
         wuEIDjY9IlWy1mw2zpC7bcPS4f7T7lnRNERGL7pkpfGVLD+KlD2uCeS92AMWLaMbda55
         MnlteqB7mtFU370HabsSjh40dM7VrZj9fNWMFhDqBLoz/5U+CQdhKXn+S8nyP3NCs3jt
         Ybdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DtFIIVRotBA0wMwfgLQC8UuujLTYkQfIRNv/mVGEs6o=;
        fh=y6cEzNsfEbiWeeDP2Wiwj2bGcGTO9W1nNmfLbJF4dfc=;
        b=IDdypRGQQrlaVh1EY1VuRugnUj537d4lTM72dXd7rsfvBFweIjJSKM/0gdqfJweeuh
         I0ntfUOEqnf4GqYp3+p2PaPKADtdykAvUJ7PzZYGTrMkeZERq3IFxApj2+0r2XaOHcSJ
         kssniVPyVX23SDTAaPLgZT4RN1ablesVfMTn/48R/F6N+u3bw3FZHivexNp36pXkA9uh
         OD/w1CPvxw/r2e1PivIXPY8F4lJn7mf1WQX1TmiQdszil8fzGVPTc+gFewCl8q5PMdiQ
         Z+H4ToKCT5iXhF+PmeP0YXTX8qVmjYqgtZfqCPTTKGApZGWEiL1nkdoDZZPfNBI4gTWK
         lKgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772093994; x=1772698794; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtFIIVRotBA0wMwfgLQC8UuujLTYkQfIRNv/mVGEs6o=;
        b=KfzXzVfHg5DbiAeymzlmCzmF4AwWyNA3ZJ2uiEngMJ368ObZQkIWTywX3/Wa2/qPOy
         BKaXs22FTS15o48mW5QoYqxpuxrPG8R6w1cZhQ00ej3Vd7Keajq572Wl5pwtd0RJhNOH
         Ev9MMAj6p7YEXXyeXXpf3KALmycSL/FMz6zFGSVJhC1rxgn7rRmylbDQ4jelmaJBjT0Q
         qBY7JIG6NqvJG6a2qQCDiuzug6JU75psOEeu1n7jDiI5POawEzPmTnHTPsge+MOSKL31
         c+j73WlYIv1YNEOgDUh/eyVPD83VI/ehHwvdtiYB6YdgSaf2/fA5g/g4byrNkORAp88T
         Me6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772093994; x=1772698794;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtFIIVRotBA0wMwfgLQC8UuujLTYkQfIRNv/mVGEs6o=;
        b=cpGHehmdceE2AzLHI6mnH+0MncfDvnR4tsM4bukE9zg+iXGjSWgxyhwBc5a0RQ3mIV
         aV6I69E7u6qlL9CmM+R4Ibyons9kTx6/cdkEnxzQpwEb0/Hl0qzql4d1/Cz6LvS6YE/V
         ODGTIJ9tmSsCTh/gtdmblKqa+fS4sMW1Vd9iiKr+lGbeA98S5yyPSiX7H+R2/EKBw7E6
         szkeQJO47xrvSjbJ7Rlk8W1R7rDh+QKT8imNWhcKnRg4OMQN29ORs8zpRmFPfaapyBTu
         2TIhik7YVLRgy4nU45IGcMJ1K9aqhuNKlAQmHPwtGAYlPCJbOc3o9N07/aE9bZIAnBE7
         VGRw==
X-Forwarded-Encrypted: i=1; AJvYcCWlU3F75k4516LHtnUXTCdEX5fzO9ZJlpFf1Eg+X6q2OttuZzOI1KwBWbFM9kUoWvbyWGxnJDg5xFUO@lists.linux.dev
X-Gm-Message-State: AOJu0YzpchpSh6QaWllNEEjGN5wr3ZyEbkzo+UHQ2DImZeTJcUL1w0Ti
	i+2iqIqmJ/OXVFZeP5lzTLmvgxcIZQtzIlM4ABg09bjBcHolwWIiTkh9Y5OtcXy+6nEuLvtIzIL
	VuawVeo3EW3fmNtbe2yRgrnS3xTJYhOB9mLzBuJ1d
X-Gm-Gg: ATEYQzzIhCCaklAk+qL4uddgp7RaMD8x9Malf0YlKfvj2/iK+kl/mx4ZpzyEja7fwES
	HkkKqaU9FH4Ti2/UUAQBMmt89tdnIbzPX8dpybi3lliSOD3zw224EzAaVsRzGJOYPEahAYA6D61
	MvV9DZ6J9SLXtkKxHKoyhkf6UH+JURYGOvkEkRjH5+83c+jtPF4AYdLyoeA+EvxLB3B36My0Yqe
	0tpBp1Mmq+NHSn8iARE/S960hVx2QWMuxiHiuDfMTRZDz5c6Dn3ZcakYcXCvqSdMCNk9lPu+lPs
	s4tbCray+XbuNW/siocUK3lZisT+iEIKMZ/cVVLjTXCVZwLDQxNGk3toSLkSe8BTTrE1YQ==
X-Received: by 2002:a05:6102:3586:b0:5f5:3dbd:700b with SMTP id
 ada2fe7eead31-5ff209d60admr700294137.7.1772093993676; Thu, 26 Feb 2026
 00:19:53 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Feb 2026 00:19:52 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Feb 2026 00:19:52 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aZ7-tTpobKiCFT5L@google.com>
References: <20260225075211.3353194-1-aik@amd.com> <aZ7-tTpobKiCFT5L@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 26 Feb 2026 00:19:52 -0800
X-Gm-Features: AaiRm521_jXlXSJX-4uKdrVOZ3AmqJAuqV9X1wXlubDjr97NXoS5-0me4TVgZLc
Message-ID: <CAEvNRgEiod74cRoVQVC5LUbWDZf6Wwz1ssjQN0fveN=RBAjsTw@mail.gmail.com>
Subject: Re: [RFC PATCH kernel] iommufd: Allow mapping from KVM's guest_memfd
To: Sean Christopherson <seanjc@google.com>, Alexey Kardashevskiy <aik@amd.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Steve Sistare <steven.sistare@oracle.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev, linux-coco@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, Santosh Shukla <santosh.shukla@amd.com>, 
	"Pratik R . Sampat" <prsampat@amd.com>, Fuad Tabba <tabba@google.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, michael.roth@amd.com, vannapurve@google.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Feb 25, 2026, Alexey Kardashevskiy wrote:
>> For the new guest_memfd type, no additional reference is taken as
>> pinning is guaranteed by the KVM guest_memfd library.
>>
>> There is no KVM-GMEMFD->IOMMUFD direct notification mechanism as
>> the assumption is that:
>> 1) page stage change events will be handled by VMM which is going
>> to call IOMMUFD to remap pages;
>> 2) shrinking GMEMFD equals to VM memory unplug and VMM is going to
>> handle it.
>
> The VMM is outside of the kernel's effective TCB.  Assuming the VMM will always
> do the right thing is a non-starter.

I think looking up the guest_memfd file from the userspace address
(uptr) is a good start, and in order not to assume much of the userspace
VMM, we could register the mapping with guest_memfd, so that when
there's a conversion or truncation, guest_memfd will invalidate the
registered mapping in addition to the rest of the mappings being
invalidated.

At LPC (2025) [1][2], people pointed out that needing to force unmapping during
page state changes (aka conversions) are a TDX-only issue. It seems like
on SNP and ARM, the faults generated due to the host accessing guest
private memory can be caught and handled, so it's not super terrible if
there's no unmapping during conversions. Perhaps Alexey and Aneesh can
explain more :)

Will said pKVM actually would rather not unmap from the IOMMU on
conversions.

I didn't think of this before LPC but forcing unmapping during
truncation (aka shrinking guest_memfd) is probably necessary for overall
system stability and correctness, so notifying and having guest_memfd
track where its pages were mapped in the IOMMU is necessary. Whether or
not to unmap during conversions could be a arch-specific thing, but all
architectures would want the memory unmapped if the memory is removed
from guest_memfd ownership.

[1] Slides: https://lpc.events/event/19/contributions/2184/attachments/1752/3816/2025-12-12-lpc-coco-mc-optimizing-guest-memfd-conversions.pdf
[2] Notes: https://github.com/joergroedel/coco-microconference/blob/main/2025/optimizing_guest_memfd_shared_private_conversions.md

Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A7231845
	for <linux-coco@lists.linux.dev>; Tue, 17 Feb 2026 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350474; cv=none; b=OS6ESeNt7uZ3C44qifoXiTYkmEod3wdLUB4hfHWOpAI149e5v2+ARBFtoHI3ClPQ7G15xoc+q2xd8W91zC+BZVzvyTxXWFlZuYiDKjV3vyDACawsEBQSZFPwnXPcOomHi1bj3lOmCM0x538uiNcnRx5SNjSq0rVUyQse05aOmWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350474; c=relaxed/simple;
	bh=Ldc3kA/B8po7HRBL7zpvt1BJaIEwgDG3685rS8QLkdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KomQsegjU2KsxYG1E9oLqBMLBANUTTo0U1XM4Npn0g8a55GGjm3UwjZLZ0ltmoKJ8Olu1E8aIbVvrf8O8M+fVS5qZXLWFhPT0x0VU17P0MjR5b2huRXzsI9O52VC6QB423Jv3Pn4AQXTRBESygWOgv2XAgYu36ZAoNobvcpWfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9oixH1a; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9oixH1a"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824adc96ad2so509794b3a.3
        for <linux-coco@lists.linux.dev>; Tue, 17 Feb 2026 09:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771350471; x=1771955271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NzMITkEXZs34lceKZ1bkvJdV8jpP8i6Cd6H1ke9i4qg=;
        b=A9oixH1ac4IXAejS9Zp4r6mgY74jR/sCagl1k7U84U5COeQ7sEqJ20heTCXshSRc66
         mZYp4I6uHglMV2KojEPF8n9bQS7XjM6LAdIsM/Wh9G+OvivwkgtfymYS4f/cOHfeS0X7
         ZFzcZRJ7Hi4tV9F9HTQAUrKVKdsKXGvMJcpdZazbo98J0EzDrT+D0xz7uP2UKAwl4fUK
         2h0w+cnhNQA0+L9Z9f5inJD3IQTzqUZa6uDzkOmMdTWmNIPI3VJhWmvl90Q2nVRaqZp5
         ILellNLXQUx5MrgACJFqNWQpvMq1Jq+HS4Vk7SyS11mHQ9054j0PsX3E8DJj9dRMkiCX
         FFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771350471; x=1771955271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzMITkEXZs34lceKZ1bkvJdV8jpP8i6Cd6H1ke9i4qg=;
        b=pWy0ACRyeyrPnvvGA94E2paFhJxp7eURtAv/IkuHFOSIVq8IxCdHSoGW2PmwW+00Dq
         HZiuzpFb5dw7kKDLZhDfeXdwIqTJhXjrutMAAdB2pUZuXK0Ii2HpgTs3+k20JnR6m0Iq
         MxM1uWtzGAjKqE3nBkBmSy9XnaFX4V0QZ75LCur7saMHba9FK40EffaEtDQatFCjvSWU
         Cn/ehvZHoiuDaC5PxpM/mufucRTiLOuL4w4aPxWheh94q5MIlU96aZ48IvmX6mX7T1B8
         kp1HhJkdHhNB6BRm+4r0HjR9NWeEEO0poEa+sqeNVDrXwZ7fKUVre7VvI8t8teXEOslS
         zdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWocohEt41dz/ut2mcBbPAytrwOolALfB6AGBiljRia1nBrFUPOvuQz4qISfe/+jJuPD4qz7J2n7QQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5ibUzCDPA9RocroKouBaehY+BPDSyZI4h1jHaXXo8HugUydsL
	FubMHrV4Wa3S1iN4KXO3CDZPp4bK7iHDv4x+2cpCAvHjqZTlPVpT2SgpDEB4vfhVLG4=
X-Gm-Gg: AZuq6aJ7DAmZ/jx6/ySjcKuxFgq0lazvK4q3koSCNOjnJVFy59rld9IcuhIHLga5VYd
	lzc0H+G9Eb/Bpyg+H9dSOPh6kEwokrcg0LuJL7PaDdTxq+qJ3PQr/8YgPRbSlYKcJpJPdRGP4T4
	xg/99qiEpxeyEnVk7Swgn6xJLCvhxo69ReYBU0csPHhHLo4KFnQbgyetWayYw3xkfzkqCTfnVe5
	3iXpHB7T2g42F6D5TQevQJpN/TxVE67SllWdm5DxI1G9MgqbY8Bsky+SoBTtK1pqkz1gUFkUd79
	RfSGR2GUR5gx+9BQIS4SUFA+QXY2vYRD9w/Sqm10Ghf1relfjcrRfwypDT069eBYgkrNmFD9XM1
	XHvGF7qQWC5MkoTX8PwrTzX8Sa+bR9qMJtgg029lMlfkkeXnfTK4IANeMsU/GdiMy4UE9lHQ9Yx
	V1+QLX3beQIsiGXZedhFLIdnjrgg==
X-Received: by 2002:a05:6a21:4916:b0:38b:ebdd:919f with SMTP id adf61e73a8af0-394671145b5mr13583057637.1.1771350471095;
        Tue, 17 Feb 2026 09:47:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:970a:754:4a36:44d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5331ba14sm10310210a12.29.2026.02.17.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:47:50 -0800 (PST)
Date: Tue, 17 Feb 2026 10:47:46 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v12 00/46] arm64: Support for Arm CCA in KVM
Message-ID: <aZSpwlZmpjdh3Oxr@p14s>
References: <20251217101125.91098-1-steven.price@arm.com>
 <aY4Sf4lMlWd9LyTo@p14s>
 <55fc4877-666c-4d5f-a167-5692f7cfbd0b@arm.com>
 <9140efaa-dc54-4a1b-8936-3ef876ca9121@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9140efaa-dc54-4a1b-8936-3ef876ca9121@arm.com>

On Mon, Feb 16, 2026 at 02:27:02PM +0000, Steven Price wrote:
> On 16/02/2026 12:33, Steven Price wrote:
> > On 12/02/2026 17:48, Mathieu Poirier wrote:
> >> Hi Steven,
> >>
> >> On Wed, Dec 17, 2025 at 10:10:37AM +0000, Steven Price wrote:
> >>> This series adds support for running protected VMs using KVM under the
> >>> Arm Confidential Compute Architecture (CCA). I've changed the uAPI
> >>> following feedback from Marc.
> >>>
> >>> The main change is that rather than providing a multiplex CAP and
> >>> expecting the VMM to drive the different stages of realm construction,
> >>> there's now just a minimal interface and KVM performs the necessary
> >>> operations when needed.
> >>>
> >>> This series is lightly tested and is meant as a demonstration of the new
> >>> uAPI. There are a number of (known) rough corners in the implementation
> >>> that I haven't dealt with properly.
> >>>
> >>> In particular please note that this series is still targetting RMM v1.0.
> >>> There is an alpha quality version of RMM v2.0 available[1]. Feedback was
> >>> that there are a number of blockers for merging with RMM v1.0 and so I
> >>> expect to rework this series to support RMM v2.0 before it is merged.
> >>> That will necessarily involve reworking the implementation.
> >>>
> >>> Specifically I'm expecting improvements in:
> >>>
> >>>  * GIC handling - passing state in registers, and allowing the host to
> >>>    fully emulate the GIC by allowing trap bits to be set.
> >>>
> >>>  * PMU handling - again providing flexibility to the host's emulation.
> >>>
> >>>  * Page size/granule size mismatch. RMM v1.0 defines the granule as 4k,
> >>>    RMM v2.0 provide the option for the host to change the granule size.
> >>>    The intention is that Linux would simply set the granule size equal
> >>>    to its page size which will significantly simplify the management of
> >>>    granules.
> >>>
> >>>  * Some performance improvement from the use of range-based map/unmap
> >>>    RMI calls.
> >>>
> >>> This series is based on v6.19-rc1. It is also available as a git
> >>> repository:
> >>>
> >>> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v12
> >>>
> >>> Work in progress changes for kvmtool are available from the git
> >>> repository below:
> >>>
> >>> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v10
> >>
> >> The first thing to note is that branch cca/v10 does not compile due to function
> >> realm_configure_parameters() not being called anywhere.  Marking the function as
> >> [[maybe_unused]] solved the problem on my side.
> > 
> > This is in the kvmtool code - and yes I agree "work in progress" is a
> > bit generous for the current state of that code, "horrid ugly hacks to
> > get things working" is probably more accurate ;)
> > 
> > The issue here is that the two things that realm_configure_parameters()
> > set up (hash algorithm and RPV) are currently unsupported with the Linux
> > changes, but will need to be reintroduced in the future. So the contents
> > of the functions which set this up (using the old uAPI) are just #if 0'd
> > out.
> > 
> > Depending on the compile flags the code will compile with a warning, but
> > using __attribute__((unused)) would at least make this clear. I'd want
> > to avoid the "[[maybe_unused]]" as it's not used elsewhere in the code
> > base and limits compatibility.
> > 
> >> Using the FVP emulator, booting a Realm that includes EDK2 in its boot stack
> >> worked.  If EDK2 is not part of the boot stack and a kernel is booted directly
> >> from lkvm, mounting the initrd fails.  Looking into this issue further, I see
> >> that from a Realm kernel's perspective, the content of the initrd is either
> >> encrypted or has been trampled on.  
> > 
> > I can reproduce that, a quick fix is to change INITRD_ALIGN:
> > 
> > #define INITRD_ALIGN	SZ_64K
> > 
> > But the code was meant to be able to deal with an unaligned initrd -
> > I'll see if I can figure out what's going wrong.
> 
> Looks like a simple bug in kvm_arm_realm_populate_ram() - it wasn't
> updating the source address when it had to align the start of the
> region. Simple fix below:
> 
> ---8<---
> diff --git a/arm/aarch64/realm.c b/arm/aarch64/realm.c
> --- a/arm/aarch64/realm.c
> +++ b/arm/aarch64/realm.c
> @@ -104,7 +104,7 @@ void kvm_arm_realm_populate_ram(struct kvm *kvm,
> unsigned long start,
> 
>         new_region->start = ALIGN_DOWN(start, SZ_64K);
>         new_region->file_end = ALIGN(start + size, SZ_64K);
> -       new_region->source = source;
> +       new_region->source = source - (start - new_region->start);

That also worked on my side.

> 
>         list_add_tail(&new_region->list, &realm_ram_regions);
>  }
> ---8<---
> 
> Thanks for the pointer, and I'll try to remember to include initrd
> testing in future.
> 

Very well.

Thanks for looking into this.

> Steve
> 

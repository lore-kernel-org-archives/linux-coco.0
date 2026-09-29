Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6533F440A25
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697970; cv=none; b=uqbrmCh+1EHkIuI5h22OvYFgn0eVPhHsgAsMq3CQNYx+Z/fLVeE0Qrci6cRieIENFrK1ihE9Z5M3sxvC5DHATfHivNUoeG5ui65aX7/R6DfMPbF3eIQz3/tBYlTF5d0yyezd/QolK5guucx4RG0DZjt5sgCZpvaGCZxOgteLP60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697970; c=relaxed/simple;
	bh=KqR996YT3lGlgif4zL+59hQfQW1sI1ucMoPzwCnhQbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrJst5ygEEWUvjJCyKyCD6PcKIkEI9KDw5VDGvQqWJ7w/PZJft2ofg2GpsVitOnDx8d2uKj2x8z7rqq9dI3g3g1f3lSNIiMFtVUIKIo1d9iudiGNLvFbLcJSHsAi5cEGC9V8IfmVOk98hRgV/n/BUBWLA9HoeFc3F7V8LewOWkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FCUKssRQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FCUKssRQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43111516;
	Tue, 29 Sep 2026 09:06:03 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DE0C3F85F;
	Tue, 29 Sep 2026 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790697967; bh=KqR996YT3lGlgif4zL+59hQfQW1sI1ucMoPzwCnhQbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCUKssRQD3SNhMXewWGC7g/l/UBx4ZbOS96rk2Y7SqhScQQmZ/CocIylzMLBjS5LI
	 ftUKijR81omCwPfFRk5FNqmsIZ34IYz9SUzzn7W8n8hNCu5lNMzPRGTxuSpBCWvQVk
	 myZ0/VFE4FAA0JUkQp6c02f8bqePWNT/VLgcSVfI=
Date: Tue, 29 Sep 2026 17:06:02 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sami Mujawar <Sami.Mujawar@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Dan Williams <djbw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	Yeoreum Yun <YeoReum.Yun@arm.com>,
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <arvh6uGzue9yat9n@e129823.arm.com>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
 <20260422124041.GJ3611611@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422124041.GJ3611611@ziepe.ca>

Hi Jason,

> On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:
> 
> > > So this is tying it to the same FW event log that TPM uses.
> > > 
> > > I think that strengthens my point this should all be uninform. TPM
> > > drivers are directly exposing the event log today, but I guess that
> > > needs generalization if non-TPM drivers are going to present it as
> > > well.
> > > 
> > > How do you imagine getting and manipulating the EFI event log to use
> > > with this?
> >
> > The event logs from UEFI will be handed off to the OS using CCEL
> > ACPI table. The CCEL table spec update can be seen at
> > https://github.com/tianocore/edk2/issues/11384
> 
> I ment from linux userspace. event log is well establihsed in the aCPI
> side for TPM and in Linux today it is only exposed to userspace
> through TPM.
> 
> This is not TPM, so how do you intend to give the event log to
> userspace?

The event log would be exported via /sys/firmware/acpi/tables/data/CCEL
with binary format just as TPM event log is also exported with binary
format via binary_bios_measurements.

Instead of Sami, I'll post v2 which rebased on for-next/smccc-bus in
arm64 tree.

Thanks.

-- 
Sincerely,
Yeoreum Yun

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D5D544893
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 19:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709024; cv=none; b=cM+pIwKBb86gBh+N82lZSAbj2zQc3SbkL0dfrbPBOvw43XYSpa6LejkiKzX+zh/1DXmw6F4RY0RGAcj69h6HF7SC2dI85kvuAUCr7cdZVDBUDgfq1GYOT3cm7oblytCU/L7MsbbuJn47htN7tGBymBtOv/SRaAmpXSygVPnyw4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709024; c=relaxed/simple;
	bh=NOIA0AhIJOaacWDtLcFjg4c7jFIJA0gynFswtjRKP4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkDjTsvtzqjcS0xvi1rr7kHcr4KBfbaaKTOgK4jZLz339g+PZgFY1qHP/fKmJ2huQTNTF8tZlUEonDynBPpeQfOP92aZSI4yE2yEdKmRIOemy3nGklsOPOOawuwsNgrqUrL5umL99Ov7f/J+PJbaDzQAfK/jjVF74Yzg03j1N60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N1hUaKNi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N1hUaKNi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08B9C1516;
	Tue, 29 Sep 2026 12:10:11 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8AFE3F763;
	Tue, 29 Sep 2026 12:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790709014; bh=NOIA0AhIJOaacWDtLcFjg4c7jFIJA0gynFswtjRKP4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1hUaKNiEPIGTdjn89BresTbDyQqvAZsh6KjBH1BX8GhcBrLkxlS9vDKSEPAmkKM3
	 0tsnYty7LGAf/vqgRtt9e6bjqrbT6wBSzT+nnmoRN5ek7oGygi7thl/IDZUda9oj2s
	 lwR9mekKjb7xkJVw7tT8cQUDtADrKOETIWPEmQT0=
Date: Tue, 29 Sep 2026 20:10:09 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@nvidia.com>,
	Sami Mujawar <Sami.Mujawar@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Dan Williams <djbw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <arwNEWUEEk7jdGir@e129823.arm.com>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
 <20260422124041.GJ3611611@ziepe.ca>
 <arvh6uGzue9yat9n@e129823.arm.com>
 <20260929190450.GM163130@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929190450.GM163130@ziepe.ca>

On Tue, Sep 29, 2026 at 04:04:50PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 29, 2026 at 05:06:02PM +0100, Yeoreum Yun wrote:
> > Hi Jason,
> > 
> > > On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:
> > > 
> > > > > So this is tying it to the same FW event log that TPM uses.
> > > > > 
> > > > > I think that strengthens my point this should all be uninform. TPM
> > > > > drivers are directly exposing the event log today, but I guess that
> > > > > needs generalization if non-TPM drivers are going to present it as
> > > > > well.
> > > > > 
> > > > > How do you imagine getting and manipulating the EFI event log to use
> > > > > with this?
> > > >
> > > > The event logs from UEFI will be handed off to the OS using CCEL
> > > > ACPI table. The CCEL table spec update can be seen at
> > > > https://github.com/tianocore/edk2/issues/11384
> > > 
> > > I ment from linux userspace. event log is well establihsed in the aCPI
> > > side for TPM and in Linux today it is only exposed to userspace
> > > through TPM.
> > > 
> > > This is not TPM, so how do you intend to give the event log to
> > > userspace?
> > 
> > The event log would be exported via /sys/firmware/acpi/tables/data/CCEL
> > with binary format just as TPM event log is also exported with binary
> > format via binary_bios_measurements.
> > 
> > Instead of Sami, I'll post v2 which rebased on for-next/smccc-bus in
> > arm64 tree.
> 
> Okay, Jiri is close to posting the "attestation subsystem" which this
> needs to plug into instead of creating a bunch more sysfs files.
> 
> The CCEL log needs to come out through that interface.

Agree. Thanks for sharing!

-- 
Sincerely,
Yeoreum Yun

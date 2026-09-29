Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B82ECD32
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708695; cv=none; b=qpj5Ruaa3PZK9ukiEtuPPfxl5qz4PjiHJFyStWbnm9a0erhq1aa3kFkJ9fK2bEgAJ0T5aCWrYoU+szAeRjTfQT8umqnAkLUe0tkmFQQdbuo/Rk2d3Bg+sC75fcdy+1QBDeAHgwgrzuafK3tT+YfRG+OHIffww9v0Y7J8eG4LWHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708695; c=relaxed/simple;
	bh=DA0i1UnLIe05CktviLuH+FpaeQx48/dGLwB49X5lpY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTYASMMjbjUFc91425W5DEttoWqeWzFzdjPPbchIQshIvmzh6UynRIMHRfDSvC4uI3Wac5wp2lZckMl6Yja+tXc++0YrlJWlGSrMPWPXPg2Q66dHvR5j7qzFG9doo2At9yDhm9K67oHpOXnP+h8ROAc67v4B71Pgk6bZyHps9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EpsqcROy; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EpsqcROy"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfd70b08cso538070785a.2
        for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790708692; x=1791313492; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=;
        b=EpsqcROyxC7Pn3HBHgZL9aWkLjI7TqvQI+7LWFAWfPpWXfngJxNKM5nunybDE3DH9p
         v1qsQT8D3fC/EdkiQpeFo0/aqPGed/ZgDotPaTdWjoUz0jSafZ7QmxJy1mNLBdW6G7sN
         6Nx3wNsMyCZ4ZTsGDLhcKKSpbmDs6tls4fqSIcSOfBh63/1nu3DVavAYVbOM5Vd0V+gX
         /tXlufeVWl/LXdac1WQRCh62YNt02+cyme8mQay+MmX1w9xR975jru7oX4XCA3sCRwPC
         UUp/dP/L4V+vst+77vcIWGJpiBibpOP9qvH/Zzm27LtzRQxfcjBXwW6IP5cy1/URTesz
         Y0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790708692; x=1791313492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=;
        b=jX2q+H4/aca5T4byuVF3Pou+A6HNrFg73ie8xqrfAeZ+4IySzNJh9BIDHrfX8aBAno
         24wTOoYH4XjNDPfruVHTu2LVU8Xc55tAmj1tDEUZsASVNkUT6LXxuGXC42LXzsNKhiiJ
         n25YNexJUl6/2fBCKgmn45bOlCz9iRmQY8u8D71FRyQhSugX06Z3sYN3WWkuxAZpZxvR
         d2ML33PfCIxAsOPdeEraYxIrnJ/QKeqn4m4czMDvTFBDXUpsumYPtnnv35Rz1IgMtHPO
         tdNl7GqAeTvG+cUHXCESjhGMqmX30eu6gcQSFCNJOtDNj0ss1W9JgCTYqJtZyMReugaF
         5KCA==
X-Forwarded-Encrypted: i=1; AKwUvByOTx92qgQbXw1AovAzgfYK/YjlV2jYRIxSkLtQEDXwFE7DaD3QqUF8WX0a2UTwizT2zLg4PwufEpt2@lists.linux.dev
X-Gm-Message-State: AFuF++mjZIowsVFXgMwsXs9KAvO0UJP63mt9Inq6c4WWEynQtHEAVfeb
	oWqtN1i0VgOtEw8YFkFG3NWNQRoW3GVgfXbv6ZbyHwxQiv+pbPNWqbTTrA8Gnkao1mE=
X-Gm-Gg: AYBFou3ieJGuUNLm0tNfW0afxOBhgY8eh10Idr0jhT7swkcHRNLfIWPPo9G6gBuXUq2
	hOkcfe/hPBBwur1ni6SYbFQl37r/bWKWaFiGHNhFPhuHKcfzzaWzJ4at/HMTltej9dgiWngroAx
	k6ZEdfukdgQ2wfkzS8SPAfx2iJjk1ImlBEDSwq5bJPdBALSG/rGitugXc0ry1y9QvkpMFHG1elO
	zLyXaJTs+DQC7Gl+CMuU5umgUOWH8zPXQtGES6OLPYckN1uwn6WMR57ZdPE8rTZ8xSxzKklzuGu
	dwjxHSxLViM6PS51frJI9F4rSaGJ5KVl3PZ6CWdus9LdAEjwW/wPLqPBQc87E8edOQRNPeg+wbz
	iXIkXnAZvalldrXF7gZYzlN1sXEruvT79LEL0GtOm46ILeVGQlIr/l7q6Hpcra/ifElXVhlFim+
	8itBAT3Iu9a/L73wE6la/EcZqHUSBxYSIdgRRwb2NFExmL
X-Received: by 2002:a05:620a:1720:b0:93b:d7a1:ba0a with SMTP id af79cd13be357-93c9fa5845cmr105191285a.53.1790708692139;
        Tue, 29 Sep 2026 12:04:52 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f503be9sm38271785a.31.2026.09.29.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:04:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBd8E-00000009pP9-1hGq;
	Tue, 29 Sep 2026 16:04:50 -0300
Date: Tue, 29 Sep 2026 16:04:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@nvidia.com>
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
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260929190450.GM163130@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
 <20260422124041.GJ3611611@ziepe.ca>
 <arvh6uGzue9yat9n@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arvh6uGzue9yat9n@e129823.arm.com>

On Tue, Sep 29, 2026 at 05:06:02PM +0100, Yeoreum Yun wrote:
> Hi Jason,
> 
> > On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:
> > 
> > > > So this is tying it to the same FW event log that TPM uses.
> > > > 
> > > > I think that strengthens my point this should all be uninform. TPM
> > > > drivers are directly exposing the event log today, but I guess that
> > > > needs generalization if non-TPM drivers are going to present it as
> > > > well.
> > > > 
> > > > How do you imagine getting and manipulating the EFI event log to use
> > > > with this?
> > >
> > > The event logs from UEFI will be handed off to the OS using CCEL
> > > ACPI table. The CCEL table spec update can be seen at
> > > https://github.com/tianocore/edk2/issues/11384
> > 
> > I ment from linux userspace. event log is well establihsed in the aCPI
> > side for TPM and in Linux today it is only exposed to userspace
> > through TPM.
> > 
> > This is not TPM, so how do you intend to give the event log to
> > userspace?
> 
> The event log would be exported via /sys/firmware/acpi/tables/data/CCEL
> with binary format just as TPM event log is also exported with binary
> format via binary_bios_measurements.
> 
> Instead of Sami, I'll post v2 which rebased on for-next/smccc-bus in
> arm64 tree.

Okay, Jiri is close to posting the "attestation subsystem" which this
needs to plug into instead of creating a bunch more sysfs files.

The CCEL log needs to come out through that interface.

Thanks,
Jason

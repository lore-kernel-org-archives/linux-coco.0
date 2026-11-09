Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250144;
	b=hzUIdLN4peptDzq8EqwmDJiDti5g4+qARrPz9BCDYQmYmmSPs1TrvRRxbhfQ1aEjQPur
	 Q3na4pjGjqATiShipblgc0Y4mr/H7Bp2xTjgjXjsLhRsLTAApN6XxoMSQxJgQxIYIFnWE
	 u7lseHrQp7mY3ymVrziJ203FhRQ+TYE0Yv45cYxjYuzYQo1JmYeYY5i6MW/4omhmu9Zgm
	 exOTj5ugMWt5NLrw/UOSpWlNRfW6igQDg0vzjO9IQF/07GrM4iT/NoLjV1SYcXLBpGhwe
	 nKuJVMsAR78ggyMyMrYpWd51p6M4VdgsPTHZBkgmDSMVP8zv1C88DhteD/IG1OkzbKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
	b=CvqArl3SZu0ZWmM62+LQcnE+LNXzY/1vBTdxHGiDEEZ2OyTwN136F1ibhAYLKTTBGll4
	 J5R/JH+cmHWVrJuT22ur6rBIyXFvWYUAqdGui1yhfI3ZX33QW749UbCuxvEpacR6IcExh
	 3PLSLUckw7/G15UTC3dJomZmielqXR/Tk7PCmczEPOryb76EURWLglGiByJM/LN2eTien
	 VMaXXMmj11eGcDYDND8yWE4DCP6dQC3lHzCBuFzvwX2t6hWT2TvZ+ODaymJAyuQqtqnKP
	 qCfo+pdtKkDijHX+hG1CHgUWNqRzLAMPlQ2p0VlcvGo+s+5mJoWaX+fbj/tNZ0HrQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OSTrvkxy;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1C7606A32A
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 18:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C1C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OSTrvkxy
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533797e72e8so7273771cf.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 10:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794250143; x=1794854943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=OSTrvkxyStCzAPKHkk0BZhcp8cPjvkzNM33CaX9Tf5sRm7KiDf6/de7adnd3irxDNN
         GKx1dEJI5f3BOszlnz9VRCADc25zjksNVVjFVvc8geoBYncULhNb5loZAoc3ZvWHlk89
         hxv9g9N/TwO1WmBFkpnODafKy4YizPO6ErItRK4FE6fWe/fnLLf4BLehSsWyYiQxHRjX
         h0q2duE+0ii2SHECaouZ84c23nW/5jB3Z7xkaaeRsiNtjXhSHSdoptfKZKxjtrXV4Vh7
         acIriQP0IQBtgnBIsfkrTOIlY5RxDpHOYa1BbY3+GjPjiQFJREQ5bowVIkCUm6jHkhoX
         Nsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250143; x=1794854943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+PQWQ9PbJFOCn9EB5efiBTAKX4GJUUBrxAtO9OF3Dc=;
        b=Gm/TVz8zIsNFVkG7+rNI0bAk+QmlaSo05aVUd6NvDVNot4uztnaX/J8TCOY/pbQEdf
         BqLq2wdtXk2owD24TVAe6WkX2EnYxtCV/hVYCBklPVMheZkFskmt8depF/rOIeKeTz6p
         eQXIdV44Gvs/mPgcRdLP8GT/gmDT2ikVIb15hZuiLxAiNOlqULSksI7UZqatFRGYsl8q
         jx25XxRso2Ciob0oG2YeKLq0hbWT8QlO5O39mZah3HeCBOdl1b+bR41JMdjLO/J5x1Q6
         7WJs6rcrkeAlSE7s0jhFh/VC+Y8MOTS0Nt313XqGB/p7bM6H7/7qp++0diYQLXOtiY01
         QrEQ==
X-Forwarded-Encrypted: i=1; AL+hErHCrdgDa76JMWRAIPTNg9k0lHupLlFMo3xwVXF7nG1s9SrCShGsKKGodZ9MU0pNfYfmPgB5CvhLwADb@lists.linux.dev
X-Gm-Message-State: APuU4Z/36gqBPOGKWlabhMwN1xoXJZjHbwJ8ycxbEFofMe8pMa51Fz6S
	SrYtLkP3d5n6sOOeolZ3bgl3w+jwkSl99XlK0Z9oXAV8Nr4VHVIbS8WYOr0jvKVWzBg=
X-Gm-Gg: AYBFou07P1mka6AGxLY6/H/Y4VzosZFXyUvKq8Mj+GpnePrMKlxeMtfWwta4Lww+PVC
	Ovn54qnJbB7ZBsIYNVZSLZkxxdKLUc+gcrSktSvvqxhCp2NBMD/+CI2l+1v3TgOI98Qkn2XTJYd
	49sHfNmMx3KjCsNK0/v08TiBXo2cSz8bY7vlNe14fSpjt0cK97wEwbvHpF41J61d567KuF8L9HR
	vJfK1Bm2yzgeTdNf6dKBmjKCJVm5aJ1Gm5FS8kkPDPn/oOdst6L6hkYbCmfU2K/+V9K5GP5Hjs/
	PUzq8dm7Q/xTovHAfISXjH4QCU3azoeIZe0eNcHv6uTCC9+TlABgmEzL6wDErEKqfeZLyPRYkzI
	gvXUbIhhgoxU/vatmJFA9FTKFisyHUbnpwyuxNJhUiBTQndS7nyVROzFgaZm44UYiPbqVExYamt
	4ZDX3plwPcz4jzy5ci4crvfIMAjRkna6modF9n8QO9Wqo0Zq9IwW9mQaGSQlJLu4/Hm9F3r1SN4
	tVmsJ8RX41+DEyYeuD1AT5xxdog7IKcZ7RUT6CBIwUL7PNOItTa6xz9zwbaHMa1zQHk/BFf0t38
	/GJmPIn4Ytr/QYxjwHc82PE5DIxCGQmSSKWUtVVYKRniWyob6bpl9ilQnbt0D1eLLDMX/vKSdHp
	X04mg5QeNc6DBm4tIu6DX+Pbi1JHvWSU=
X-Received: by 2002:a05:622a:40e:b0:536:3600:f0af with SMTP id d75a77b69052e-555253df92fmr3996711cf.7.1794250142846;
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af60493sm3967801cf.4.2026.11.09.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:49:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQUQP-00000002A6b-35np;
	Mon, 09 Nov 2026 14:49:01 -0400
Date: Mon, 9 Nov 2026 14:49:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261109184901.GQ663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
 <20261105004934.GE3889730@ziepe.ca>
 <20261105091622.00004a9c@linux.microsoft.com>
 <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48352506BB91C461F25147098C762@CO1PR11MB4835.namprd11.prod.outlook.com>

On Fri, Nov 06, 2026 at 08:03:48AM +0000, Tian, Kevin wrote:
> > From: Jacob Pan <jacob.pan@linux.microsoft.com>
> > Sent: Friday, November 6, 2026 1:16 AM
> > 
> > Hi Jason,
> > 
> > On Wed, 4 Nov 2026 20:49:34 -0400
> > Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > > On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:
> > >
> > > > I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> > > > leverage this? Could PCI/TSM support this role without
> > > > device-security?
> > >
> > > It is certainly not what TSM was originally imagined for, but with our
> > > new arrangement, yah maybe so?
> > I will rebase on this set and send out patches for a detailed review.
> > 
> > > TSM basically just becomes this weird overlay driver on the PCI device
> > > that does stuff. Some of the stuff it might do:
> > >  - Register an attestation subsystem device to do SPDM
> > >  - Register to allow iommufd to create a viommu
> > >  - Some status sysfs ?
> > >  - ??
> > >
> > So we may expand pci tsm to have more than one role? currently it has
> > one.
> > int pci_tsm_register(struct tsm_dev *tsm_dev) {
> > ...
> > 	roles = is_link_tsm(tsm_dev) + is_devsec_tsm(tsm_dev) +
> > 		is_assignment_tsm(tsm_dev);
> > 	if (roles != 1)
> > 		return -EINVAL;
> 
> Not sure what'd be a proper name for this, but it sounds to me that
> it tries to over-abstract something into tsm. The reused logic related
> to assignment or viommu is relatively small, so the other option below
> sounds better if it can work.
> 
> Or it may be the original provider framework that Aneesh proposed,
> so tsm/MSHV/pKVM can each register its own backend...

That is definately undesirable for TSM

I think the very best answer for this is to get the viommu from the
"kvm" fd, I just don't quite know how you implement it..

Maybe just register something like a notifier chain where the struct
file * and the viommu type value goes in and a viommu object comes
back out?

Jason

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512672;
	b=SAM8tbzGnVwlIackAxxBWYb9wXdLysynae3yt9Bv0AVSIo512MvDe0H4WcHqoxTYlaVY
	 242NOlOjPEn4vyJt59bossghdLfCys2JfW+ZKfPoLPp30s4eBsRGuOgW3HyT1MREip8xg
	 rKlT1dQgS94EDsuPRTGTqs20RdMvNE24VcJHSKCsTHD+IrzEgiL1q3ISv7WimRDUIjWlm
	 r9WqVXc6CHz0QJRh/CKJtyuhHKCGNNocMLQGiHqzJOqZ24Ij2E6UI9etvyWsGImhytAb7
	 JWKVY9DDB3/VzG7S1tu3Kn89OJrT/cJYzEou5MAOROxWOTn/iNbamday4G9q5a7AJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512672;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=qGagtzPPLeE5JUUJiGkA5WeVK5upm/IW7i7tq6L22jA=;
	b=xhi/5vUS8OsK7YLzlI0gzxpN+yuzx4Bou7A9ndZeS+NrkOQrOHOVYeAHQwjuhjXTUu9E
	 PIR13+6hBVH19MbXKFchjGrVFkHWhNP81yySjXuH2+C3EWJhBXbLDImiK4YoQ0InmBi3e
	 RqH1MESXFgqXtpSvYY0z9dgwtohzOeg9vN50Tt6OKk2BEn9uG13hpWPqmVdpqKxTV0nJP
	 9Icgv3H7iYMY9u1KBIj64gFo0ETq3aEROraMwfvq/UiVF+zzz5S3Nsnnefstz4tan1sqn
	 0LBngktQQ00G8dLTJ7plPxhXjS+2hiLlO1yiEDSsyWYACRBp6PVX3c5vIb46+1pTT9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DbShED55;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB073606A31C
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 16:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB073606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DbShED55
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A766C152B;
	Tue, 20 Oct 2026 09:11:07 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 412653F7D8;
	Tue, 20 Oct 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792512670; bh=Onq6jxRqEq1WaTY8fGmgczAqDI9uWyGv9j4N9Vll460=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbShED55IdZ5GqRBbk415/IcFxQD5ednAiW31MbR9Rn1dtNulHbKnhX4wEJI3XFbs
	 So+6u7EYH07FhsbRc0NWVaadc13WVhntS6CtJqRJQy7gS9S0cW3VjfLRdokRqWdJnl
	 7dkTDfkWhwCDWfk/tw8ZbIKAh3fG4SMLUV5JGvtQ=
Date: Tue, 20 Oct 2026 17:11:03 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Dionna Glaze <drdeeglaze@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	roberto.sassu@huawei.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <ateSly15N5mLrM1m@e129823.arm.com>
References: <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
 <a69c7e7ac4fd07a9c375faadc599e96bb8c8534e.camel@linux.ibm.com>
 <20261020140655.GV13920@nvidia.com>
 <aa00515a0f364fea0150cf1550a09d9400e4632f.camel@linux.ibm.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa00515a0f364fea0150cf1550a09d9400e4632f.camel@linux.ibm.com>

Hi,

> On Tue, 2026-10-20 at 11:06 -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 20, 2026 at 09:45:13AM -0400, Mimi Zohar wrote:
> > > On Mon, 2026-10-19 at 09:10 -0700, Dionna Glaze wrote:
> > > > On Mon, Oct 19, 2026 at 5:08 AM Jiri Pirko <jiri@resnulli.us> wrote:
> > > > > 
> > > > > Yeah, I was thinking about this and went back and forth. In the end, the
> > > > > only reason for leaving it unbounded is to allow multiple independent
> > > > > users of the same register. For example, IMA and systemd could share a
> > > > > TDX RTMR. The systemd side would read the journal through the
> > > > > attestation device and the IMA side through securityfs, but both are
> > > > > views of the same journal. If one side truncated it, the other could no
> > > > > longer replay the RTMR. Isn't this the valid usecase? Do you see how to
> > > > > resolve this?
> > > > > 
> > > > 
> > > > Bright minds have spent a significant amount of time working on this.
> > > > 
> > > > +Roberto Sassu, +Mimi Zohar
> > > 
> > > Dionna, thank you for including us in this discussion.
> > > 
> > > Based on my questioning AI, it sounds like the purpose of this patch set is to
> > > introduce a vendor-agnostic common attestation subsystem framework that can act
> > > as an internal kernel multiplexor for any measurement consumer, like IMA or
> > > DRTM. By providing a direct kernel-to-kernel call path, it allows measurements
> > > to be routed to different Roots of Trust (ROT)—such as physical motherboard
> > > TPMs, Intel TDX RTMRs, AMD SEV-SNP registers, and PCIe SPDM devices—without
> > > hardcoding IMA to specific device drivers.
> > 
> > Yeah, I would say that is the eventual goal, this patch series would
> > be the first small step along those lines
> > 
> > > To support this framework, IMA requires a strict, atomic execution sequence to
> > > maintain the Measure → Extend → Execute (Measure Before Use) guarantee. This
> > > initializes early during the late_initcall phase within the initramfs (via
> > > dracut).
> > > 
> > > If the new subsystem introduces a direct kernel-to-kernel multiplexing call
> > > path, how will it ensure the mandatory synchronous wait behavior when extending
> > > multiple hardware backends?
> > 
> > Everything has this 'measure before use' requirement. Why would this
> > be hard? Just loop over all the configured measurement targets if
> > thats the plan? Maybe I'm missing something?
> 
> As long as the measurements aren't queued, but actually wait for the multiple
> ROTs to complete, it isn't a problem.

But, I have a related concern about deferred probing of RoT devices.

For example, if TPM probing is deferred until after the attestation
subsystem has been initialized, how would the subsystem handle the
TPM becoming available later (This is reason for IMA_INIT_LATE_SYNC).

In particular, when I see breifly proviers/tdx.c and imange for TPM,
once if it's failed to get tpm_default_chip() in module_init(),
There is no way to retry and TPM seems not to be exported as RoT device.

Am I missing something?

-- 
Sincerely,
Yeoreum Yun

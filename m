Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84BA20B22
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140847; cv=none; b=eUQ1IVOPBvOwhwHS4GelC35e9zhAy7KLVb4eUXDZRo7cwHsRqK8on5d192z1T62Db8h5gmCd/rXhoRCgbaddftCjlcciPvi8gR2yblG2sfPD1W0qsypn3YsX2+IECmO4W8GC6x46ECWvBiIi0r4OE/kBR+E76Kqdt3jriTsqE9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140847; c=relaxed/simple;
	bh=tfKP6oS3UcXrEUfvglzblcjNwnDEyWeQ4yhTjZwOvaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOjFAynSx2h17zb3vkQ0b/v3iGadiCPzFpAf5pGSuhaHLl5uthDh1pmf2vvk9IE3E5Q6bvt5sXr9zDx5caGep3ShzLfYpeD5PV7uVENtxsZjFY5UhFZ0cmb1s8m40BEFA9Yawu9yUadVJljEn6VwV9M0QPBdg71o4RDS30Z4H8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30EE4106F;
	Fri, 19 Dec 2025 02:40:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED14D3F5CA;
	Fri, 19 Dec 2025 02:40:42 -0800 (PST)
Date: Fri, 19 Dec 2025 10:40:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<mark.rutland@arm.com>, <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Message-ID: <20251219-hairy-mighty-scorpion-fbed46@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
 <20251209-hysterical-cobalt-viper-54433c@sudeepholla>
 <29248f8c-b57d-4818-851c-7905dc9f8317@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29248f8c-b57d-4818-851c-7905dc9f8317@nvidia.com>

On Fri, Dec 19, 2025 at 12:26:30AM -0800, Vedashree Vidwans wrote:
> 
> On 12/9/25 03:47, Sudeep Holla wrote:
> > On Mon, Dec 08, 2025 at 10:13:14PM +0000, Vedashree Vidwans wrote:
> > > - Update driver to be in-built kernel module. This will ensure driver is
> > > installed in kernel and would not require any user intervention.
> > > - Register the LFA driver as a platform driver corresponding to
> > > 'armhf000' device. The driver will be invoked when the device is
> > > detected on a platform.
> > > - Add functionality to register LFA interrupt in the driver probe().
> > > This LFA IRQ number will be retrived from the LFA device node.
> > > - On IRQ, driver will query FW component details and trigger activation
> > > of capable and pending FW component. The driver will loop to update FW
> > > component details after every successful FW component activation.
> > > - Mutex synchronization is implemented to avoid concurrent LFA updates
> > > through interrupt and sysfs interfaces.
> > > 
> > > Device node snippet from LFA spec[1]:
> > > fwu0 {
> > >      compatible = "arm,armhf000";
> > >      memory-region = <&fwu_payload>;
> > >      interrupt-parent = <&ic>;
> > >      interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
> > > };
> > > 
> > 
> > This will be gone in the latest beta of LFA, so please discuss and get
> > an agreement for the LFA device tree bindings.
> > 
> > We don't just use ACPI HID as devicetree compatibles. There are more
> > aligned with ACPI CID IIUC but I don't expect you to use ACPI CID just to
> > match DT compatible as ACPI HID will be defined for LFA.
> > 
> Thank you for your comment.
> Sorry I haven't completely understood the concern here. I am using the ACPI
> HID and device node compatible string provided by the LFA spec.

Yes I know, but take a look at updated specification please [1].

> Please find below ACPI and device tree node from the spec for reference.

Yes they are obsolete as they no longer align with the latest specification.

> In case the LFA spec is updated, I will revise the driver implementation.

Indeed, that is the expectation. That's exactly what I meant.

-- 
Regards,
Sudeep

[1] https://developer.arm.com/documentation/den0147/1-0bet1

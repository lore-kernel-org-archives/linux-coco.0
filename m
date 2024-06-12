Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C88153509
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718196501; cv=none; b=E2NueuNhsaKFaTxj8543UCv4wGqp5VJ50opIFlCZEvKiGeJgW7FmBVqYA6Rf+aPqMClG7Ov8J84HpkfcMkxEoUp1BlyeTbTXdz0t9peLddxAATZka8cOYlN7LSx64StAw+GaqoDRVs83t7Ty/UP5Fw4EGxUvQxI61UiyxkjAh/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718196501; c=relaxed/simple;
	bh=VlaDKLWj1pSyKNTvJCjaf4yinJfHvBuoxNyQi+n9vM8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a9orvWxZsMaOquXsOLsXfT0ETyDN+F6B6WLl5jGLChTx1+QR4xSshkGIkOT7mOJomt1CJecLW5TeTIpxOFYaH7SXAJ7JO0sYBBG95wL2OYqiZx5ngmgpvhy/9a1l+ISf1JbBMH8307nK12/ZzyXtrp9HAKs6pYkqRg8JfyyClHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=BLIViicq; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=BLIViicq; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="BLIViicq";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="BLIViicq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718196499;
	bh=VlaDKLWj1pSyKNTvJCjaf4yinJfHvBuoxNyQi+n9vM8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=BLIViicqCeoG1RBkOboKC9uwR2K9zQ2DRlj99jOGlu5+Lezv9eTQ/jzX4aIKfJYZS
	 PyYHRgMXdkbEYXgJMl1luxIqTQIyjU/ttncwlQnZgL2M6JgZFMZNwcpwCqfAbpMmsh
	 /5h9KC3eFIfaltUqn6w9Xle6r1YPKmXTu/ZhQgx0=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5EDCE1280C22;
	Wed, 12 Jun 2024 08:48:19 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 9M_uHjilrFkh; Wed, 12 Jun 2024 08:48:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718196499;
	bh=VlaDKLWj1pSyKNTvJCjaf4yinJfHvBuoxNyQi+n9vM8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=BLIViicqCeoG1RBkOboKC9uwR2K9zQ2DRlj99jOGlu5+Lezv9eTQ/jzX4aIKfJYZS
	 PyYHRgMXdkbEYXgJMl1luxIqTQIyjU/ttncwlQnZgL2M6JgZFMZNwcpwCqfAbpMmsh
	 /5h9KC3eFIfaltUqn6w9Xle6r1YPKmXTu/ZhQgx0=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 993D81280AB2;
	Wed, 12 Jun 2024 08:48:18 -0400 (EDT)
Message-ID: <a3db9f73fb6b95329978c0951754ec8ce2493ccb.camel@HansenPartnership.com>
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Alexander Graf <graf@amazon.com>, "Reshetova, Elena"
 <elena.reshetova@intel.com>, Dan Middleton <dan.middleton@linux.intel.com>,
  "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Kalra, Ashish"
 <ashish.kalra@amd.com>
Date: Wed, 12 Jun 2024 08:48:16 -0400
In-Reply-To: <e1a22a93-bf58-4aa7-a94e-9d2907f2ef02@amazon.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
	 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
	 <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
	 <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
	 <88ca715e6234bd7d09cee1b0cb7682cc3e15ed3a.camel@HansenPartnership.com>
	 <e1a22a93-bf58-4aa7-a94e-9d2907f2ef02@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2024-06-10 at 14:09 +0200, Alexander Graf wrote:
> On 08.06.24 16:41, James Bottomley wrote:
> > On Fri, 2024-06-07 at 18:05 +0200, Alexander Graf wrote:
[...]
> > > 1) Measurement purely based on initial launch measurements. If
> > > the full OS is inside an initramfs, we can provide
> > > firmware+kernel+initramfs as "seed". The CoCo env would measure
> > > everything and I have an easy path to validate authenticity of my
> > > target environment. I also have an easy path  to update the VM
> > > and then measure without replaying any event logs.
> > With an SVSM (that you're not replacing, so the initial launch
> 
> 
> That assumes you want an SVSM in the first place.

Well, yes.  This is a flexibility issue.  If you don't have a highly
privileged SVSM like entity to fix up issues and add features, you're
left with only the hardware lifecycle.

>  I
>    a) Don't think you really need to and

Most CSPs are already doing something similar to this even for non-
confidential VMs.

>    b) Believe it should come from the customer, not the cloud
> provider, as it's the highest privileged piece of code in your VM

No, the security processor firmware is the highest privilege level ...
and that doesn't come from the customer ...

The point is not that the customer should own the component and be
forced to supply it, it's that the customer should be able to inspect
it and verify the measurement corresponds to the inspected code. 
Ideally, if we get commonality of SVSMs, it becomes a singular trusted
component (like shim/grub) in the boot sequence.

> For both, the easy solution is to allow a customer to reboot into
> their own "initial launch measurement" from a currently running VM.

How, though?  The current SNP launch measurement won't change across a
kexec reboot.  If you have a mechanism that allows it to be updated
from the kernel, that will be subject to attack by a kernel exploit, so
letting a more privileged and protected entity control that seems to be
a better security model.

[...]
> > > 2) Update SVSM (or similar). Often today, you want to implement
> > > TPMs and inside a higher privileged component that is really part
> > > of the VM. To update it, you could use in-VM mechanisms, but that
> > > leaves a path where you boot with an old version -> exploit ->
> > > update to the new. If we could "reboot"/kexec into a new SVSM, we
> > > could reason about its confidentiality with a 100% guarantee.
> >  
> > This one's a bit more difficult because the initial launch
> > measurement becomes invalid if the SVSM is replaced.  What I'd
> > suggest happens here is that the SVSM reinit everything (including
> > the vTPM), then measure a "replace SVSM" record containing both the
> > old and new SVSM measurements and then do a measured boot.  That
> > way an attesting system can tie the old launch measurement to the
> > updated SVSM.
> 
> 
> This only works if the SVSM doesn't have any security
> vulnerabilities. 

In the same way that any VM kexec reboot only works if the security
processor doesn't have any vulnerabilities.  If you have a
vulnerability, either in the ASP or the SVSM you have to assess whether
it's been exploited before deciding to kexec reboot or tear down and
reinit with an updated TCB.

> If it does, you can't trust the measurement anymore and your whole 
> update path is out of the window. For CoCo, we need to make sure that
> there is a viable way for users to run secure versions of all code 
> without depending on the merit of their infrastructure provider, no?

That's not possible to guarantee in practice because of potential
vulnerabilities in other code/firmware aspects of the system regardless
of whether there's an SVSM.  The point being that you *always* have
this problem regardless of whether an SVSM is present or not.

James


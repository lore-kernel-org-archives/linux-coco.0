Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8793383BD
	for <linux-coco@lists.linux.dev>; Sat,  8 Jun 2024 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717857677; cv=none; b=OrZHpeimtc2OZcNyD0md+AClUpehJSQyjts8cajD4FRHIQpTVWUsO47K8nP1XqwP3CMyLW3RqTerih4r08rHLIzRD63nRjy5nbAvGIxnTKat8FMA1BXP9CcwDgdARpYcAeAWWgLuwjIkxY+jnF2++1rsnFjhyV9wv/8vrGIfm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717857677; c=relaxed/simple;
	bh=31FwmGanFWt+Vq4kyDltHRpsejAcBQ1KMk+sVDgWobY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQrCH4BAJh5q493QwfZOPr/ZVCVtA5yzQR2ZmKiHTVqAfWriFRNt6iRvLbG6AVbq8GluXCPXxoWbQIyy37CW2yuxdpdopIv416a4cimaJBcyCxwGcWKkRKgBc4D2Cxv6AWC8rPAa71yCz0N9THAjieu0n7vqcxL0tyfbxC3JZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=X/j7e/ze; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=u2dPEOPt; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="X/j7e/ze";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="u2dPEOPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1717857675;
	bh=31FwmGanFWt+Vq4kyDltHRpsejAcBQ1KMk+sVDgWobY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=X/j7e/zesK8iTUUf27ZUP7pgs+ZknH/9eA9++PjgVD6c3nGph8ssPHTnZaAkl9g0e
	 ooEAZ6Uq8sYk7oRDO9I2KUMc+j7lm/FFKP8HEQU9LjCFvvFx9PNQbz1ubPxEBUvShW
	 rD9eqd++RlsyoHkGNvIl10vg1ZCtIBCogySsdjr0=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0A7CA12813AF;
	Sat, 08 Jun 2024 10:41:15 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id bHMZ0gz0BJUN; Sat,  8 Jun 2024 10:41:14 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1717857674;
	bh=31FwmGanFWt+Vq4kyDltHRpsejAcBQ1KMk+sVDgWobY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=u2dPEOPtbpWU/fLIFtYo/aIATExZP0h1FVvMWw3HgE2Z1N1I5VN5X9ihFlglve6nW
	 q/vHmj+mhbHhse3ULz5VoStGsMW1y70QRb3/pXw3B+tinkgRVTEPUUFipKlI4FRPZB
	 pQeEN4wPzVkNnNRlyHD71mIQaenZJg7aMsyayp3c=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 479081280B72;
	Sat, 08 Jun 2024 10:41:14 -0400 (EDT)
Message-ID: <88ca715e6234bd7d09cee1b0cb7682cc3e15ed3a.camel@HansenPartnership.com>
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Alexander Graf <graf@amazon.com>, "Reshetova, Elena"
 <elena.reshetova@intel.com>, Dan Middleton <dan.middleton@linux.intel.com>,
  "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Kalra, Ashish"
 <ashish.kalra@amd.com>
Date: Sat, 08 Jun 2024 10:41:12 -0400
In-Reply-To: <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
	 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
	 <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
	 <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2024-06-07 at 18:05 +0200, Alexander Graf wrote:
> 
> On 07.06.24 16:46, Reshetova, Elena wrote:
> > > Hi Dan,
> > > 
> > > On 03.05.24 21:55, Dan Middleton wrote:
> > > > Hi
> > > > Next Friday, May 10th at 9am PDT, we have a Confidential
> > > > Computing devsec / BoF / Discussion Group / SIG call. Everyone
> > > > is welcome.
> > > > 
> > > > Tentative agenda includes RTMR ABI v3 direction and TEE I/O
> > > > next steps.
> > > 
> > > I haven't seen an email for today's call, so let me throw my
> > > topic suggestion here:
> > > 
> > > I would like to talk about "confidential kexec" today: A kexec
> > > mechanism that allows you to destroy the confidential VM you're
> > > in and recreate a new one based on a payload of the old one. With
> > > that, we would have a very easy and clean mechanism to bootstrap
> > > a VM into a fully measured  new execution stack.
> >  
> > Interesting topic, I am curious of the requirements!
> > Sounds like you want a local fast migration, i.e. a migration to a
> > newCoCo VM on the same platform? I guess the difference would be
> > the absenceof the online migration phase since you are probably ok
> > stopping the original CoCo VM first.
> 
> 
> Almost. I basically want the VM to be able to provide a new early 
> measurement. So the opposite of migration: With migration, I want to 
> preserve previous state. Here, the main motivation is to get rid of
> any previous state except the new "seed" for the target VM.
> 
> There are 2 main use cases for this:
> 
> 1) Measurement purely based on initial launch measurements. If the
> full OS is inside an initramfs, we can provide
> firmware+kernel+initramfs as "seed". The CoCo env would measure
> everything and I have an easy path to validate authenticity of my
> target environment. I also have an easy path  to update the VM and
> then measure without replaying any event logs.

With an SVSM (that you're not replacing, so the initial launch
measurement remains valid) this one is easy: it can reinit everything
(including the vTPM) and redo a measured boot.  So here you have
exactly the same measurements as though it were a clean boot. 

> 2) Update SVSM (or similar). Often today, you want to implement TPMs
> and inside a higher privileged component that is really part of the
> VM. To update it, you could use in-VM mechanisms, but that leaves a
> path where you boot with an old version -> exploit -> update to the
> new. If we could "reboot"/kexec into a new SVSM, we could reason
> about its confidentiality with a 100% guarantee.

This one's a bit more difficult because the initial launch measurement
becomes invalid if the SVSM is replaced.  What I'd suggest happens here
is that the SVSM reinit everything (including the vTPM), then measure a
"replace SVSM" record containing both the old and new SVSM measurements
and then do a measured boot.  That way an attesting system can tie the
old launch measurement to the updated SVSM.

James


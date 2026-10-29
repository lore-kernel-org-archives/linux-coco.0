Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283006;
	b=fVoXb6pMsrTunPg9vGLiPrtKlPY03S6ZPDrXKNSJOwY5udjzopeyONCOfte+THyKQGKn
	 CwpYrqigR8RlqNSTbb6Duyca+RFClthAYWuFWDmbrmDauT/QojD4YwYzn7TFICkruuTEp
	 Ix/qlNMAly8/wWXVvbKXnusc6xFFJM5otVKoYo96D/LjvzQEL6XGt7EdoGOQHYcKvhAPQ
	 Bhd4aIrjno739f31nPaAn8IMMcKcWFIJgmh3G02gC2zg5l4GCZM/sOxCfjjzrVQEPphea
	 ClcCGcttMnqYOrPA595VAjgALAzLqaufjfh93C0URAU+Rq3tp3PpD3jNhEwoHJdkSiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u/mTL+S+jT7oJspNq9ZedMuDxLFktRxLqgiEWs4bjJc=;
	b=o87c8GTfQ59R6bsTV0TPe6ezbeyqjnxmdFF2I+XCD8cW9l28C3AHJ42VV1jwo8A463cZ
	 VQ7UNF1g1QVIL4ubKgq1fHr8iuflawxTnKadAbXHchJFi3NPVL4/pBCRggHljh5aR/qGM
	 9LwXOd2z3/+GCrrVZtWa/8J65ZEyT9iyDVsSRBRlXrKHvQXl+F8Mj0kSbKJyNJRVmWs5T
	 7z6CeVk+gvgHem9xYVZDe80tPe5cx0tx0d1I3q3y67mMsdgRdI8iGxA8QNKYyLQnYgUgt
	 p93xNawTX7f7OKN0YJdSFk2te53c372hB4W1tCXs9QabdZZnLdRDm4c7locbFUT7pRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17252606A321
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 14:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17252606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f20c3aaa5so199818485a.2
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793282997; x=1793887797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u/mTL+S+jT7oJspNq9ZedMuDxLFktRxLqgiEWs4bjJc=;
        b=DMn8GI+N2MNfIYdHfKuoyTetm99ScvHR9l7sTMCOoFPYeBE1mljhxd//eu0/culy7J
         vx0ktMcTeaYh2GekgRDa4vfdtcvc5cA5YFMUaw+wG6QR6Rs+ZYZnfLQDwaNiPedgnPQj
         djeLcH4zCzD9NZtc1g9hDGFeKJESXtIA9WwcDubpTNSs64zsAPEoHhcuyrzDOhu3gGF+
         oFPIE9/KicVMIEncutty3OlwNjVLwMmnSfTLzgM7OSCJltCrv6ZswuHepZ7wdNi4JGSC
         7C99cLi4BWbKnyPuT2FWUyrYuFK9J2FpFfhPraRVc2B//8312RWZ8jmpzw4UlM0SeVOa
         yUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282997; x=1793887797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/mTL+S+jT7oJspNq9ZedMuDxLFktRxLqgiEWs4bjJc=;
        b=z5dJNV6FlExBuwf7xPc6JcwVZvr9elnMJGWQx8t5iFEndDTuEGdAOeQkVXp+cGJwBc
         jhk/21eiW+pOfFNj/jrzzRjUf0C+KqfuUchDNkEIdENcJ/alLc+SO/i0q9oQQg6Zpyh3
         qTGEauswkjpj62a94zhUXGoKbwpumXUivJ7ODC8G50wEUZGMwGu2Z5ePwFIEy3JkWLyy
         9aDE6WoxQHthB8veI+AEAc5XAz31Y3rOsqmD04VkkLVcDtG6aNtGC2wzyMyQxm2Jilff
         0x5UC3Cd+EtFUVJMdzoglRG2i9U6HRlSpRlMDewyZyP+vcNu5i5rtUGUWGxVVagr9htr
         LzPA==
X-Forwarded-Encrypted: i=1; AKwUvBwP+4J/Ld4eNiGBQO+UHQz1BGe1B9DfhORyAK+Jy5ewrVsfZW/Qw6hRH+5FuNgZ6m3p8diFxTezTsOg@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0k/VKodzuImmNknmpg+zfrRHWr1pYvK0Je1uNxWy2IkW1MIW6
	MuY92X8bekzVYRuf2+0gW+CZ/NHx/44QSrORsFwg8bCD0y6aL2R5Fq9IYEbTGx6rmiI=
X-Gm-Gg: AYBFou1XZ+ip5E0l6FcHiZLhuEFHnTeAAkqCdEflr4kkiKW2oUskIQLFhyKKdHx0Ad0
	d5tcyhCIMYhy8dkSBatA9yoyFR+8+xvnUk+7P0YX9ZzuBO2LAW095ibuq313aScluUOrghDC67H
	1o4UenmTIy6cQmh4wI1aLJg1iMA5UtPmpm3g9VZKUV7Ubp+OECU9VZ5Kbz5+fuVs4SBe3p+bmZ5
	/cA2YvKW18U8KvV25pWKDKe2D7o7bvQGizLL+9vB0+Oqp2Uh1ig/ySuyWOWTQeigWsVZuYjh7ko
	Wg4D6hbDX0/AVRP9dyqe5+8rBBepH/eHeGv50SpTDGAa8GdiTlQav7dNf+iu8Oknby2DyqO915K
	7FH4BsjzLg/FSlTVJsrm3oGJMX0G4kYkvYkE+WGWiNXOfUsiiaVqEyVSUA+K3bxGFTi8mk9anc3
	ISF0dZDsf5eA/DBttNzFEl8UnQ5NSdOt8C2WIRAtTJZULpCA0NIUdyvqtOydV/88fDprRJCxCC/
	iYwuiPrCrXsMSIeHeXzGvyU15qpNHxV+/O2JNyenWLqWnByqD8kkSeAoXXj1O5eCU0P6ZaaonQe
	+7VF8zgIQK4QIkOX5utUgEkiN0XVIsVIk7ejLDsCz+LW3M9oOJjtBoopZBc0U0SyR2sIF2Mdcp1
	MnUo3menoOSg=
X-Received: by 2002:a05:620a:29c5:b0:93f:59b8:e28a with SMTP id af79cd13be357-94408cf4114mr838476185a.28.1793282996749;
        Thu, 29 Oct 2026 07:09:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cb4f56sm162421066d6.35.2026.10.29.07.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:09:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMQpH-0000000FhyS-1U83;
	Thu, 29 Oct 2026 11:09:55 -0300
Date: Thu, 29 Oct 2026 11:09:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261029140955.GO1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
 <20261027234658.GL1685504@ziepe.ca>
 <c57c45bb-5047-4aa9-9f06-6ac5f36ff3ce@intel.com>
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
In-Reply-To: <c57c45bb-5047-4aa9-9f06-6ac5f36ff3ce@intel.com>

On Wed, Oct 28, 2026 at 12:16:01PM -0700, Dave Jiang wrote:
> 
> 
> On 10/27/26 4:46 PM, Jason Gunthorpe wrote:
> > On Tue, Oct 27, 2026 at 04:09:19PM -0700, Dave Jiang wrote:
> > 
> >> There are two issues for TDX Connect. One, the device info is collected at
> >> SPDM connect (TDH.SPDM.CONNECT), not at lock. TDH.TDI.BIND only returns the
> >> interface report. So the measurements a TD sees at lock can be from well
> >> before the lock. To get measurements taken after the bind, the TD has to
> >> ask the VMM for a recollection with its own nonce.
> > 
> > IMHO measurements taken before lock must never be made visible through
> > this interface, it defeats the security property of evidence within
> > the locked session. I would expect the guest kernel TDX driver to
> > prevent this.
> 
> Agreed. I'll change the guest driver so the lock asks the VMM for a
> recollection with a nonce the driver picks. Each lock then costs one
> recollection.

I do not understand why cached evidence exists in the host. What
reason is there to ever provide a stale signed evidence? None.

Other things may make more sense to capture once and are not permitted
to change, but evidence is not one of them.

> >> The empty challenge in my provider means something else though: don't
> >> recollect, return the evidence collected earlier. So it's less "omit the
> >> nonce" and more "no new collection". Maybe that's better as an explicit flag
> >> than an empty challenge?
> > 
> > I'm not sure 'no new collection' is an especially useful thing. Since
> > the kernel won't be validating the signature you still need to pass
> > the expected nonce from the prior collection back to userspace so it
> > can check it.
> > 
> > Is there some specific use case for this?
> 
> Getting the lock event's evidence. With the suggested lock change
> above, the guest driver collects it during the lock. But the lock is
> a sysfs write and returns nothing. Userspace still has to read the
> evidence to appraise it before run. The device was already locked
> when it was collected, so the read needs no new collection.

Why collect evidence during lock with a useless kernel made up nonce?
What is that even for?

Signed evidence must always be collected with a userspace provided
nonce. Any path that doesn't do that is pointless and I wonder why it
exists at all.

I imagine lock should only put the TDI into the locked
state. Attestation should later collect the evidence with a user
provide nonce.

Do not collect evidence during locked. Do not hold stale signed
evidence in the kernel for later retrieval.

Again, we need a flow where we get into locked and know we are
continuously in the same locked session until we reach run and dma
enable. That should not be done with evidence or evidence generations,
it must be some contract inside the TDX driver to provide a locked
session generation.

Under these rules it does not matter when we collect the evidence. Any
time during the session is sufficient, it does not have to be done
instantly during locked.

How TDX does this is up to its spec, if TDX has to capture evidence
and do evidence compares internally thats awful, but has to be hidden
in TDX and not leak to userspace in any way.

ARM should do it with the sequence numbers I mentioned earlier.

> The guest driver picks the nonce for the lock's collection and
> checks it before publishing. If userspace sends a challenge instead,
> that nonce is its own. The collection's nonce is in the evidence in
> the GET_MEASUREMENTS request that asked for the signature.

Unless the kernel is decoding the evidence to check the nonce this is
security broken. I'd rather not have the kernel decode the evidence
like this, so the nonce should always be known to userspace and
userspace/verifier should be checking the signature covers the
expected nonce.

Jason

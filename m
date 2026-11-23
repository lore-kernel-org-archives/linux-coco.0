Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448110;
	b=ei3cc9yWs9+uHHdeIpvE0DF+GfqO4ZnSDA9LEL+1qmE9FyHBPeJV0Wqc6d5I4yHQDXdQ
	 dR+peCSf6rvgAl4Y2z7+ZtnINwWZ4y/xx5i/X98B6m1FPkkVkhkNyRdEcwi7puFLCJDkj
	 T6rDZ4A0ZIaXegxiwEx0sflO04gQTyiW1xii+5LJaW31GLVvk8q345gbIMspNimyMn8Sh
	 zOVSd1VaETrFp0SpJc+hMtSdQRcDQPMdnaOGeiVgfuBjG/BZ5zpVBrf0/O+0dWQ/h7mfk
	 rrvkQy3VZZryaG4haTk/y9Bimud/vyWeKqVqfkkDp2medqc9Qqqm3zU28CqUT6Nqv5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jVozDBZgp+27gMR99l+UaMITrh6vU8pxKuFZh102SrU=;
	b=fbujGnVETXYy9onUNRM8Ocqyec006YI05pdbKKre+LjNP26mx9Tc/4htEWJdaQqmyTuY
	 nK235lNswW3OlxvFL1h4fw2Ad7rGMHDfR9FlI10K7AFP0yWCIKeTYHUvxZi/rpgf+h5AV
	 6rNl/i4qMNv0jDQU0nMxeVD+FMjTJ42xWb2oDfnsV6Q465Ls5DHRxNMrgD9N0axUfplMM
	 fzKlLS6HbN4VJr2SoEPIyEmRFN6xSod0pcPyTWLTcqFLBQUOrGk8dmMLNocwJXd1bdKo4
	 zWUOw/gwWMEMjlx2tK7SVSHgCYg4hUE4BvLlhvry9uMAqEY6QxY3v/C0y1q0GoGVRXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="i/FamW0d";
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DB606A330
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 15:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7DB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=i/FamW0d
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98301b325c4so821852241.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795448109; x=1796052909; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVozDBZgp+27gMR99l+UaMITrh6vU8pxKuFZh102SrU=;
        b=i/FamW0dqItDKDcrh3YbiVAMzqFr59iuN2XqiRyjTzhAwQfMU8S6oLV6LTanYRcOVM
         ilZo1vYlPgRc3m6Uteam1cUHRpNMKm0mA+C3rDE4hX8ygwywpxz6Ew+0kxiEy/p2UIQd
         kUGakSNyZ7uEE86lr3JK+gSbvNpoV2cq6gVc5fru5/0SpvBBi9JMyKnhtyAIi41j5Rvz
         1oFEiPIbHhai+HGhF73sb2slrwFLc/dSSqvKreY/Q59Yse6N8opLHTxR+29KvuadJH88
         16JY4LYooSm8rdutY3D2aa46c1tJgBhBcjI8P42I2mrI/Zoe1P+mn2duVw2Cc3alcQTq
         QSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448109; x=1796052909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVozDBZgp+27gMR99l+UaMITrh6vU8pxKuFZh102SrU=;
        b=oYrG2dXAcRWSiHPws/W9GqtOYEZFKYwuCUd6+JW0khuWnt/f0it0qPbg1OhiMD49TH
         iz8KQXU4WuDOEPW4y11TxmzCmvZfzlELt60XVQhzexzY56VrquLM5SdDtypUsY3cUKeB
         pcSVmkII9mHjtOU57sgVPXxUrSFupIlZSJpXe1jSa1Med/LSzKYfY/NOCHAAmt0zYCbE
         Ix5OWAv7EMYR5H/tm4SmXozpUAYQVqHI/txrBzWUNfdErMVbv/UBBIoF4NhO3jILlvFb
         lCWL52CRe3jPmc5bGNnNXo++nd7eO+zjrd1mjn5TQeABrAKKGn4mJRCouMj9YD/JHhJh
         XKpQ==
X-Gm-Message-State: APuU4Z/xhlaRyiALg/GHkAwHrSovrE2IA06U2FmEZ2IJE8PlEVDkesWq
	lzl7W6iXDlFi7j+pD2p7IYikdrDQkqb+4qOo7TEde93Nvq2krb+F5gdi4Mnpz9rQfho=
X-Gm-Gg: AZFdTZcvOInI102Fw/o0i7uIdOSKHvvI5NxaAxERgI+iZQ/K8eYT0iZGZeDgllH5vYM
	v4mNjYwQMO67xcXILukrjonKhvRidgml1/Ze0Agv/6+x0H9/l572o75MG9xlaS2B2/MUjRtkalL
	ATK2nG6EZPhF7auy9Ga3VBTNed7AI9OOVkO5LomAr0JwBu0TPegE8H8L0hji/7hqbQLHoyhnW9b
	tnD9jUGqLMSmzdz6FcRgzR9xeSrGhW/T4hsEmuq/i3rT0gUX804oHCbRXl1xUgRjT8dAFQpvb0D
	nv05IlMlkY+gVvMSy4mRFJ2xvmHrgM+1+89ltw5iZ8/9mE4aUcgf26FGAcoIZ3jhb/PTz2Y+Cuz
	lhoqAxhQlXzuyba/8ERUB66cu0K6kK2/QtJgoyAeEEtBlXfskrqudcVCRfQhSXcrBwqnUdIXey8
	45rAcd5AZtMOhCISWaQD/sbrCEbjf1CEWNfqx3MFAxQ7m2Plzzf6fAYTCqi/IxxdUtgULlNISUn
	sv+u/UpPROwU6X3ylIE0pjjEhkPXusilMoH0Ac7xa7tkgGtTRFvuu21SPI50RfBajDsq+QnQUZ5
	eUTy6QesbbSlPwXpGNzUBGeoAzVcSF9SJ+mI3/42E1LKNdHqIs9jAOjSoiRTNT1b9bVSupuUM6z
	o0Y0=
X-Received: by 2002:a05:6102:5811:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d7393c88e2mr5087905137.9.1795448108741;
        Mon, 23 Nov 2026 07:35:08 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0315f4sm823500485a.3.2026.11.23.07.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:08 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVW4R-00000000swq-2uP1;
	Mon, 23 Nov 2026 11:35:07 -0400
Date: Mon, 23 Nov 2026 11:35:07 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 05/10] PCI/TSM: Add association locking helpers for
 evidence acceptance
Message-ID: <20261123153507.GH179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-6-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261123083337.2731019-6-aneesh.kumar@kernel.org>

On Mon, Nov 23, 2026 at 02:03:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Later attestation patches let userspace finish device setup through
> evidence-accept after host sysfs connect or guest sysfs lock returns.
> Those commands use a saved struct pci_tsm and must prevent disconnect or
> guest unlock from changing pci_dev::tsm or freeing the saved structure
> while setup is in progress.
> 
> Add pci_tsm_trylock_association() to acquire pci_tsm_rwsem for write and
> check that pci_dev::tsm still points to the saved structure. For a TSM
> implementing devsec_ops, first take device::mutex to prevent driver
> attachment during MMIO validation and device acceptance. This matches
> the device-mutex-before-rwsem order used by PCI DMA preparation.

This doesn't seem the API I'd expect here.

When we trigger SPDM session start AKA lock through the CTLV it needs
to capture some kind of 'session cookie' for this locked that ties
back to whatever the TSM is using to prevent a hostile host from
locking/unlocking while we are working.

That cookie should be held in the attestation driver and when we get
to acceptance it should be presented to confirm that nothing has been
tampered with.

It is a further reason why we can't have lock under sysfs control.

It should be attestation that provides a general purpose lock that
serializes all attestation operations including lock/unlock so we
don't need a TSM lock like this.

The driver should rely on that lock and use its internal mechanism to
process the cookie.

Jason

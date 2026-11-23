Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447660;
	b=Syqbjfi6NVIuZG0y0/aBKVUiDtdaTrmeSFGLFBVoiz4up5YnncyyYZa6X8dDMQjru0+Q
	 lQ+7CffC8lGGwJT2dq05SRHSM3d617PfssRGRrwaiSqSoV4+wc4xcJbeiFxY8kcFAeYj/
	 1W//A6Hd600m0KONbFU2R4xxT7bkXkg7rYY2baEsgCYJ0cB0CYXAb12RTBKY2CTv5+1Ja
	 JBo5BXiL1mgy7BgTvjS1KCaL4cnJ075ZczT9zcbwvGG8bxUcPk1HW2jz2uSDZhB5NiO87
	 vq4/oJB/3ip8xj+bipYBTKRZaCS7rgmML/w3FEdlOkw5bRtvw1JFNTcJ+w4TdVeIKdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rWLsIhN+kxPGKJoMsbdqyApLe79fwWP1AaQIjJntY6g=;
	b=cIg6aKS1AKtYUC6N3Wwba5M7/GhqWgn1WS86bylGTPfpfMbDNKolE/rUkQSLQHwApld8
	 Qe0xr5dxHfWiKjxSoziDyOhmFGr01X6Ck9+So9JCAg/1vJQHZ3tF8/i39BXfFZqyi53Oo
	 ezaU0nSY1O3sO5CzOrj7s7StfD+dvfFNYBO799M+W+0Bd+Tw/vQm0Ki2za8xMNoRdjmqr
	 tXngguI6bv0Y8RKhiulr69SNguGCeUhvfCrkXloBN65AdxjDNUC1MpohUL1IuptIyaPYk
	 xJwWqsL05C+UBIyL/14vNCwCSc9vsgnvJd4xbSKJTFd6ZL9JeDlQUdio51UMGQdYw4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OFB9sTMd;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67164606A31A
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 15:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67164606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OFB9sTMd
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c48582654so40165281cf.0
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795447659; x=1796052459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rWLsIhN+kxPGKJoMsbdqyApLe79fwWP1AaQIjJntY6g=;
        b=OFB9sTMdH8qL8kf+A5/ssPkVj4I6zD1lpDcHgEsYuApY2/1oH7AF4/w+xJ36Ngrrr+
         YMpAVORFCybBL/RQ1HSR/7FpI0Ex7yokNfpFScR+Up8ujZ/3Uco3pRQB18ktxHrRcJam
         C72HRS0RLeTemhDR5Jf6hIG0fUqe2G9Qoz81Zm14sOz+pG+j4wpY1CYHztXElRm3A2/D
         1kVkja3DPFsLe9BO1T6q2pBzVD0ht0EQBi2i3vulX5JEfT3D83p99D2YIeNAIl2aobiO
         lPz8TDu8fcrSIvHLpFcNOfBhu7DKIlWYCZjWbzKlWMhYO067x4GQ2RH2ons5vosFPexk
         Shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447659; x=1796052459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWLsIhN+kxPGKJoMsbdqyApLe79fwWP1AaQIjJntY6g=;
        b=fZwgU1IwFHlQQQWAJHmmRxuvPAV+TZkpaNteqNvVjD/wnPhIXKvIXXwDaIDHngNvFa
         C+vrDyAlv8bH0PITQzuXgUWpFk0H9XWUk33kqu6x5lbF17iPWVQYilVfQBPxajx6xTrg
         TtQ1E7MoTWQHjHIkI45T3ncwpInKgR3HH4rezND/JucSzj1gAnr15SFnYLVtV5Yxp0N7
         zwUjNUhpbSbaZ7AI9zB45Yx+vlFr3sFdUjfwzRPw7B48NWgBPVSgjs52b9VBIbg6Xs7Z
         jPSSFx2Dr9IPM+lUIbQODH0ltAGmBvwDlPT0rZW1wXlBytJY8s8KJ4YVFe6IYh6Dj6se
         UzaQ==
X-Gm-Message-State: APuU4Z9ikNzrHvgZ6ShZ8TSmFT25/NiRoNgt50NaCxvowRvq/fWHNEE4
	8fx7vteCc+YySXd6kgR4l+pNO3xmT4aWk3a+Qmz+UobEmWq6VXyNOeaIPIBzbJVc9cMhmt5E9gd
	WC2Fr
X-Gm-Gg: AZFdTZf0gJzxJ8oEvVRMYTMl9PZwKDF3G1h0eQ3z3MULauKUUwNU57Zb7sHQWukE+FH
	K84KYdDn7hPfOJU0wbquloEhkBqANPd1/auXQnIH4BidvA8JTKkgxyRBoIXMsMvFnn1X4mHa8s/
	4kbZj5C06V2J+9oLDnprh/UOLM51tWgd1W/DlTGmLobB/VYrhWl2yX1+1MTwSIAyGThlvHFYVPU
	oQNOHRBeSKoF78Ca8GTx2X2+iKABfbwd9UjAuW151lhcYyD/xAgT2fmaMVbjad8qBXJRgMNn7Rn
	mWJ7ithHjRl94QzeY1JOxgrvFv1TvdU4hp8Q+N3oKvetn1yd4BHFRU/END7t+WXXbGQYLbPOPWM
	qtz42bfDhAUOF/oOlmoAMT6rxp+POn23R+ZrnNdMetF9i4xROYoknyq6vpKlTHLgr9muN7ZfPWZ
	Ah22OrTrHSOTZ8wXYZdMWfUF+x5c8A3ES0LTFX727Wwpjwwkrv//BXYcj4qpOLNddJac1VX9O6s
	YkyA1i/vf3xhoYtQYcab8mbBtRx9hMomi1aRDVInMhVdcGiRRlz8kamWaUnjU6RmJTGCVhmOK2H
	FR/iBiIckts//95Cbl6zLDndw9qnk/G3mffXHTlx40DZkcLOFCe5mdZWYalIbadmChaq2ZIagAM
	T8Yg=
X-Received: by 2002:a05:622a:1a8e:b0:535:2794:851c with SMTP id d75a77b69052e-55d76ac54famr221466701cf.39.1795447659366;
        Mon, 23 Nov 2026 07:27:39 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882bf70sm102842001cf.11.2026.11.23.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:27:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVxC-00000000sQR-1ESr;
	Mon, 23 Nov 2026 11:27:38 -0400
Date: Mon, 23 Nov 2026 11:27:38 -0400
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
Subject: Re: [PATCH v1 08/10] PCI/TSM: Add sysfs lock and unlock for
 guest-assigned devices
Message-ID: <20261123152738.GF179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-9-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261123083337.2731019-9-aneesh.kumar@kernel.org>

On Mon, Nov 23, 2026 at 02:03:35PM +0530, Aneesh Kumar K.V (Arm) wrote:
> A confidential guest needs to lock a PCI device before collecting and
> verifying evidence about it. Userspace also needs a way to unlock the
> device after use or when verification fails.
> 
> Add tsm/lock and tsm/unlock sysfs attributes for TSM drivers
> implementing devsec_ops. Writing a TSM device name to tsm/lock calls its
> lock callback. Unlock calls the matching driver's unlock callback

I thought we agreed not to do this in sysfs as we worked through the
SPDM stuff?

LOCKED should be the 'start SPDM' action in the guest
RUN should be the 'accept SPDM' action in the guest

And though we didn't talk about it there is likely some 'destroy SPDM'
action that is UNLOCK and UNRUN.

Jason

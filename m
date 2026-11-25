Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617407;
	b=0RuEVTAfai89xoZi0eZ09bIosI2T/NVdlNrAhg7RMNAklpSLDIJPpyhhIdOSUNE4FEMb
	 Hd6OLMGNvc3EqTaISewuvIqi8GIStneyk1n6Wj9ItFf0ll4bGUYwHsCOBed+e7yMUS0T4
	 0C5KzH9Cujcrg9xQrDMYGJd2BakVO/9Ql3RxbwIprHbxnzx36GfPRbiYau+oIVRCMgYV9
	 R0lTY6yRTos4SROYpCpXoW7lIe5vfudlQ5YfwTY0J1wylLkvg+SOWRZGeC0KsItbJmfj2
	 8T4LNA/RNaoZwT+rr76GXpQgWLPK/9xV1Tg3nivttH7aDY8VNZm+wgAdoyZSgV8e7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jZ0ODJBUI26+BRK0bblrmNavhVVExfleUfyE4pxTCBs=;
	b=KoQOjlqSxiPuzo1Ua3SQnsLOmjzOa0hGgh3HPfKOkJ/1XiJXiFpcEVD/ZC4Gys6wNRw8
	 3OgS9um6VCvBqd2yFWZITBZlLvoilvGQ8w5rg4XI/OHaCOlDx8rq/rkG/F8514rYv/shY
	 L/IgnGpHE+Tn/r08Pngvw6FRA0CC0abPuGiSgpM95tLfQMBEMydxnBZPIS5w76Ipprj7l
	 oXa9yHWLEFksLUmfrveKJnBRSjjN5Hu5+iEbGvQj2z3RsDImODyZtjZrxp33VFzt7A3zL
	 VTxG0/DjMXA1hy2hhKUQimKGX2pTTLWGhQS8NTV1N+b9EiO74IZBta660M6mTwLaPtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nNufUi+b;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90488606A326
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 14:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90488606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nNufUi+b
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5365f9a04c5so42717981cf.1
        for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 06:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795617405; x=1796222205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZ0ODJBUI26+BRK0bblrmNavhVVExfleUfyE4pxTCBs=;
        b=nNufUi+b+idZrCGl8AZNlJJQ45+Bhfbsofh/RKlszlAZnTI0y6uIgecAwkabYJyyWb
         Uas9Ae4A1wiY80p8PJZ3C1s6fOQxUW5XcRs58VCysSvzjk9bgoJjk3aIJpkw0FBXOS4s
         rnbfI9LezAcxyjFFLRzxe/9Pkd0pG1JbiyC4deR6nK+NEZSTqnoAzcKEXJSFESYpoR3G
         XLJdE93E0lt8gDRWC2ZhGtGxGdv4KUCbDM5TKwNgJtVMHuIXr2k7EdWUVAkVyKljxqTI
         4UfXDl4OCQAyWvNe45HYCBW419byzZjag0eGFpFJbvvyHszt1xn5r75f0IqG/EoUeMKh
         SnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617405; x=1796222205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZ0ODJBUI26+BRK0bblrmNavhVVExfleUfyE4pxTCBs=;
        b=aLwoYZnYJhD43waeouQGdlLLsZvHHjVBs6WOz4xL0WCA91bGKBRguOjF54UvNGKpZE
         TzvFmRT4MPFfy5/WYATGNgsv1yPmqGPw/vQDB/lM/LVq4uuTqHtvt6THxuMgI+TQjIDd
         x5JAABQ47KZFAWRRWlVo3qI51VNA79DGcxHgqYcEuJ5yFFJNN5K36Xq9OGazGYZ6jiWx
         iIdWo66p0jlzPQ+oFo9xMVou37DBCBoBSKFG8zIT7P1nXKZr58yjt0CpSePezuqrsp1V
         GaTeaAOdtJvVRur27/3TV7sENn5GIt0oW9fHFFyHT2AiLO9vCqdVyOLfdiORDyXajn0y
         V19g==
X-Gm-Message-State: APuU4Z/006QaO1TUbtrzyOfmjijc9bbI+K/Cc7dpZfNWWdaFYNKf80b0
	k6nQZSZgJmb+SwhPIhSkwa61kNTHku2RSjT5cV/k4IlgIUzhvMRicE8CoVRFLSzLuWc=
X-Gm-Gg: AZFdTZeb2bMblyOYTBFYYH4x28mv1cuvthRw1NjK+qp9H8beGtEBSmZvy0GSjMWI9lF
	JlVol0zaikkjVcl43zNbB7aDgDoNid8cEPnz2EljSkB3ig2R/gs+V8UHjJadMloiUVMQrcsFLNa
	7ZqGyEvKnAafxdXk4TePOnTF9WfnMMNAGeLNkGxFy7OZD/74WuXxYW3SWFwbd79LVIKhrvN9pLp
	1SRB0ymUUleNm17YYcbqddEVO6uFOPeA/Srn7ivDj/YUd70WB5wjmgL53WPtx5ewZT3XbEJmNCa
	otVVeGlcqqSNB8rVNE9r9ZkUiJZHNsUU49bUwcWm8TltDUlLFJJ3ebhhOnbs6abCqhUx/G9LC+m
	EG/oFKmSd6zXYOrXv2XeJdIV7vkcXw1IUFoQzpsWbcjIT9kxHQ15wU5Ic2Xz+fyW88U7+ZXvWqS
	/V0NpQO/1mrbard52mWtNgf9/f8P9v1JR6zP72qgGk1Nw3Q6ViFujeeE3r4w4ZgKkR23qEo8Leh
	vk5zl0tHjWNHt1+ZavaKAR4KbM2KOIMh3q3Oaf86xEPSQwUtRnpCWTEhQYtWWBd4qyKdjd+Iy+w
	ad5Ivw==
X-Received: by 2002:ac8:5e53:0:b0:536:699d:9a22 with SMTP id d75a77b69052e-55d76aa8754mr328840131cf.57.1795617405368;
        Wed, 25 Nov 2026 06:36:45 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78880604sm157945401cf.24.2026.11.25.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:36:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWE72-00000001la3-15Li;
	Wed, 25 Nov 2026 10:36:44 -0400
Date: Wed, 25 Nov 2026 10:36:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Message-ID: <20261125143644.GF246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-6-aneesh.kumar@kernel.org>
 <20261123153507.GH179082@ziepe.ca>
 <yq5ald6h9r1g.fsf@kernel.org>
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
In-Reply-To: <yq5ald6h9r1g.fsf@kernel.org>

On Wed, Nov 25, 2026 at 03:22:27PM +0530, Aneesh Kumar K.V wrote:

> > That cookie should be held in the attestation driver and when we get
> > to acceptance it should be presented to confirm that nothing has been
> > tampered with.
> 
> We already do something like this on lock, we track the cookie as part
> of CCA and use that during accept. Sure if every architecture supports
> this at firmware level we can abstract that to attestation layer. Yes
> and this protect from hostile host.

Every arch has some solution, but the critical part is the cookie must
be tied to and exposed into userspace.

start returns some cookie ID, and accept only works if that cookie is
still the current session.

Since we have a uAPI that allows multiple userspace threads to open
attestation this cookie prevents trouble if something else open/closes
the session from userspace.

Doing it transparently in the kernel isn't protective enough, IMHO.

> But this patch is about keeping pdev->tsm stable in the guest. We need a
> mechanism to associate a TSM with a pci_dev. Currently, the host uses
> sysfs 'connect', while the guest uses sysfs 'lock'. It is not clear that
> we were proposing to remove that mechanism.

Everything uses connect.

Once connected the attestation FD is created and its internal locking
and disassociation scheme will prevent any issues with TSM hot remove.
Basically when TSM is hot removed it unregisters attestation FD and it
is attestation subsystem's problem to lock that, not TSM.

Once the viommu is created then the ref mechanism you build prevents
TSM host remove while the viommu object exists.

Together these mechanisms should encompass the entire uAPI we see
right now, so we shouldn't have or need yet another layer of locking.

It is why these sysfs's are looking more and more troubled since they
are existing outside the natural object and locking model that is
emerging here.

> Are you suggesting that the TSM association remain under sysfs control,
> while IDE teardown and TDISP unlock become CTLV operations, and that
> sysfs disconnect or unlock be prevented until the above CTLV operations
> have completed?

That is roughly what I'm describing above, it should fall out
naturally from building attestation subsytems lifecycle model
correctly.

Jason

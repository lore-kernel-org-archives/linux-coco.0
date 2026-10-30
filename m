Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369058;
	b=0cFaAfpWMuqrhj47FOO+YatJ0AgXHTSQFu0S31tL/n9HhFVTTytiMRDL8U+kczAlnd+b
	 NpuHzhB7QVBfaZlzhjDMelURK1hfYd4yFz0ofn4rzff23DjZjHWeuZxuL/10Biw+FXQ6G
	 g8uXD0OF0YDEe3nC7L6Jz3/lrWY0QQRgrTlDwWfQN0HBnIGJ14CT9U8AiJKHiFu4sS3HG
	 j3Is4nyd2fvEwMhARyuHgvijrPwpQzpg7MWzDZ31GAPykckJgrl2u9KfA3DY2bXibgBAi
	 S4jTCOOqJBwqc/sR1guMPbTPPOMpu1MgIPMjTTOPJKumrsXQ6PqeGBldp8e/N+5ydwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LSIZZe//120Y6NC9XSNUIlM6NMk9sTlvtQB3HWbcsOY=;
	b=XBNeJVVTtocbS2XzMgRkhr0p3+lpb7H5uZ29nl5//O4wW18gJdX6sTmLqr1sPqzgr0oC
	 LburF9Dw/KSIwf5St3by/RZDiuLohnyJ5naBam9Ip7PmvvZpI9pl6Vp58Wnvli+2CIllK
	 LtjZLHPuoLTZ++6/qzb95UKuWHO6qu8DoQ9U3Y/h3DSCG9wNPuil+wCkR1lct3ewb57ck
	 VG3zWz4Rc/R04tvskkoX/tPD8CrABmB0uq8sUOQBRelkQfiM7QH1ivcSxWbZgbVC9CWdQ
	 lpWi6KEE0gYh1MTlo+KwfcgRs36ttWulcgXhvoOGcvyDmU2lIHPeboWoh3bcI5ED7wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=HIMqx8gI;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331FD606A31D
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 14:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 331FD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=HIMqx8gI
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so829119e87.3
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793369055; x=1793973855; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LSIZZe//120Y6NC9XSNUIlM6NMk9sTlvtQB3HWbcsOY=;
        b=HIMqx8gIoFZBSwwRqIYgolAuYqstkwn7nWmeLP0qy3sMD8WW7gy9VtETYm7Dpp0Li3
         KZQV0G7KehFx4D4vVNue9rmsrYiN25DGJsgtWzTaj+B4wL5fXq4Yi4DAjhfKTMJjIsBi
         hcisWMydg5ciEY6uOrlGh1wz9nWkDN42E0UYWur98ASlw7dfgxnoIg5f12pfpXkx88P8
         CmsMqDewJwcDnRkkpDFuCccDsDJRx+BdprXgl/QQQ9M/K930WXzJE+i5znuBfx1/nVzV
         IiRk0pvtWEfb8PoCROFKs0HOt4vW740iIm14D7I5V/uBBs5OdZuD6BNRVJ1JhUKQq9RA
         VRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369055; x=1793973855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSIZZe//120Y6NC9XSNUIlM6NMk9sTlvtQB3HWbcsOY=;
        b=VfGKCC1pKdRy4Tjf8kF7YWlxt/RkqHRXf4VKxSkp0jY5ZpQa2qtN6gyGSNSewRapLw
         g4152n+RtZ7/a6yLc6ZqppElaYX6c6GI0uF+bghA0oMxsSbHNR6j0K2CVToje6vwZMtF
         ceMjNyM5Xhk6nL/EJfFwt1Oj23n9byb6fx0niyqozl/3D07Uf+G86oZAU+sZxg410ztw
         5jTGtoRu7pkYfEjeB8kJwhfmM6YsbtN3DvKnE3gseFkfWhrqYO163Y/sn7Pm3bdhkJWU
         OUzRxjLeK8QRzNc8cJi874Pt3keAzjhsDlaAbG4ga+4S/SgGvrnZCU5IeJ/spS5rz7e2
         yGhQ==
X-Gm-Message-State: AFq9FYJZQ42TIejKTHNOWU0GYMymKHGXXdEolstwNlgDvgDDeOy8Jnky
	MYIAXMScNaMsAh2AwJXxqsVCoStnfTGxn+tgz+EWzD0j3NtUC7YHkAET9xriBbaKfxU=
X-Gm-Gg: AYBFou0TbzTKZAYDZQYmxgzIlmlmRuee6k4OgTSHt9CVwb1vruWvz8f8vD/pESCnucn
	36tUZiRI7XjWf8TgbP1Drh2Bl60W9DbvFObBSRsZcZMflyRvP61Z3bz86U5B2Kxcf7HCilsJmlZ
	+REg31+fbcScxmRxNlR2StY5nojMg3xBhDyTEBP64ei3qIKIJYRrJONFzdXeno0kEEjhjBwOPKp
	1X5+mirY6Q6Yubwyusvxx/yTLzVLubYbY79c56GAD1G8BqtutU4hG+5iR30JVU330XsOnhBAsI8
	M49NUtqTCck5VMUW+7e1488Jo7gmjIyIUbylqkWCflf28rqsd5/x2dp90w79jlPGIqNm2HNn2DL
	mjCpUE74yeJFvrcQggFRuOupY3ykp3bTizOh3+BgA7/JpHxbvsawpYVO+GvRJmfABxkhkS7xYrF
	9glq93zTA3amLnvqfbSB9iQIBJj3xNcdJxLWHfovoV6oJS/7gZnfGl59O+TLsSfSgncmDiBzxbf
	JrntBE7IEAXj1uyZhj+FzR9EmT1FS7At/0v78f+gEEKu6uFLmPXvPZ4ofwmf6uDhX7POAv4NzMI
	23MXLQ8+yHRCQiCgpcP0Kvn7/j38xMDRn1KU/B/1qhZ8uDIPhgl2E+gmVaLR2g==
X-Received: by 2002:a05:6512:3f14:b0:5be:64aa:af1 with SMTP id 2adb3069b0e04-5bfd951d51cmr751831e87.3.1793369055245;
        Fri, 30 Oct 2026 07:04:15 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c9b4sm870e87.37.2026.10.30.07.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:04:14 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:04:10 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 08/11] PCI/TSM: Bind CTLV attestation to connected
 and locked contexts
Message-ID: <auSjbga8BFsUWwOc@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-9-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261028152618.1356860-9-aneesh.kumar@kernel.org>

Wed, Oct 28, 2026 at 04:26:15PM +0100, aneesh.kumar@kernel.org wrote:

[..]

>+int ctlv_attestation_pci_state_get_action(void *priv, struct ctlv_op_ctx *ctx,
>+		const struct ctlv_cursor *request, struct ctlv_cursor *reply)
>+{
>+	struct pci_tsm_attestation *pa = priv;
>+	struct pci_dev *pdev = pa->pdev;
>+	struct pci_tsm *tsm = pdev->tsm;
>+	bool accepted = device_cc_accepted(&pdev->dev);
>+	bool ok = !pci_attestation_reply(pa, reply);
>+
>+	if (tsm && tsm->dsm_dev == pdev) {
>+		struct pci_tsm_pf0 *pf0 = container_of(tsm, struct pci_tsm_pf0, base_tsm);
>+
>+		accepted = pf0->stream_connected;
>+	}
>+
>+	ok &= ctlv_attestation_pci_pci_connected_put(reply, tsm && tsm->dsm_dev);
>+	ok &= ctlv_attestation_pci_pci_locked_put(reply, tsm && !tsm->dsm_dev);
>+	ok &= ctlv_attestation_pci_pci_accepted_put(reply, accepted);
>+
>+	if (tsm) {
>+		ok &= ctlv_attestation_pci_pci_tsm_id_put(reply, tsm->tsm_dev->id);
>+		if (tsm->dsm_dev)
>+			ok &= ctlv_attestation_pci_pci_dsm_put(reply, pci_name(tsm->dsm_dev));
>+	}


I had in mind SPDM_GET for DISCOVERED/AUTHENTICATED and the selected
authentication slot, with guest TDISP state coming from
DEVSEC_STATE_GET. Instance lifetime already follows connect/lock and
disconnect/unlock.

Could we use those state models instead of adding another PCI-specific
connected/locked/accepted model? Also, pci.generation appears to be the
common device-generation under another attribute name, not a separate
counter, odd.

[..]

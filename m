Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=MxOyOiqPsqWYY0JNhkunZbAP06Y0Z08BnKhwcCDcb7I/N2Jd7VqD5MtLHa0ijMv0IduF
	 gINzezKnlJILksjpCq6JUXGnHQS3sLdpf5F15EDw/bL/CYrhjR9EHjDcd+axdJ+Tc7Ho0
	 gAC/EmzvrOjgMPqQq9Vx/ORHDIfVQjMAcdCUvrJB0rArayPAzWTmHAqlUWT1DaNo14ayS
	 yxNgfvG6vhs06xyjtuUNndomy7Punr8Am/sSp6DhUYwoaEDvyWmculDzXzut57rPYk5jw
	 a9sYLjawTDeV5yeH+5vFvy7klSIf3fjKwKurT0JfIFRBvYX8v7oC8z60owsLwBeqT2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=Mc2JjLGbTtXoeiNUe3lZjUOubaqMknCZua0nGS5Ps9N+ljen55QRoujqwI9alE51AD3+
	 RCBGwqPoiLjy98dIf3fQsrKGBAahzxQDrh3gbriMHJaDqlicEJBbIYmn06BpcFnfKXoaQ
	 xM0WBxABJ6tqAQIv3taoeYNVJHlCJ5PNC0yI0u1THJ/7VYeq4x7zpqVsBlcaEgL4ABvng
	 wMHSH3tMORLyBkpyH+IWm37XxKBt2PJWxIPnxd5fdsrniBD7IMI+rb8KdNY3C24cNhvgP
	 dAp8GLM8myIFcpEN8m9Z5IVwziYNV0mZCTJCJBEh6tuAQriDd41pKXQQkC17gHGFSIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UZ9+oPrS;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB0606A32E
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 10:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBB0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UZ9+oPrS
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4aa5833c263so4155582f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=UZ9+oPrSJcfNGBzobcMALgc8VsOsR6f3NOyyz7R8aeM1O5LqEUECb1sDT/sW6Dngxj
         xDrRNsswV9mun8b0Hq1X2uSD76iDs/m2kndJ9Jsd1PvRPzddD8wBPfe30Y7w658koU5V
         V7IM7TksAkt+lo/gr5mxGSGpG4eqXW/tzJ0qjGCy8gM1ekm3eL3uGgsI8FWp6sV/Rh4f
         H/rECsEvUe4+vVfIjDkyo6ywvIVgjMM1D1FrLf62Swwj3deJKMB5pkdH83K13K7nuMGT
         5UofYpQHVnmmVUCm73YzNfdHZlDiP6J/SHhfQnd3i4bJrN5Xg4zfSgLKKKJNRlEIkh1R
         JAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=JBrNPjqhsQ9NFxOCRioxOl5I8i8lzn3SanMR3KObApkrgFBocLiKiDe8F92NcSvM6Y
         fspgjJlxlS6DmnLOXSVbju5ddvwXXtZJn6L/H9838seUrFiYgkgGaIpPqe3w4pXJOUPu
         6bdfqxmoZ0LSDsT8QGkEQHX2b1o2goAEY+U40YjDLccF/Nk15x4aNgyDIliB/ybBMT5S
         FBqDXsPFt6K0UDG2uDd2BkmfG0tNSn0kyiEL/EG3vkOZEe28lgEI5fE2i4et0tLPoAg2
         27EAhrXLuwkrmkW94G26ILwhAmhac+kuNZDmLOCGnt0r7ws8LlTUKD1A/xSyBUU5UJLH
         oOHA==
X-Forwarded-Encrypted: i=1; AL+hErEnm+QcOrknY+uSu7tTSmQ/45zjssO9o+WbJgMmnqGIUtDv3JpWOYPuJBKohHD0kXhFnS8VCQAWv+gh@lists.linux.dev
X-Gm-Message-State: APuU4Z85SI5YyGrxj4M2BNTy06bgHivYC4b084xT/GGBA5yWZPS2BV9c
	WmwQU8VPsU9Jp5qGYR7ufCnnMuPvSWJOXtJHKU2XEkgzZXntPPUBQIdwUsnKv5uKHKs=
X-Gm-Gg: AZFdTZe7/o2PkM9HzC+vTow6b0UPGFkA2c8AnlxaW6wK5QTgo0HqEbBjqBx05K6bgiT
	GtWv2bd5bI3/JeMx/GQ+9flZVLRy751uXtDE6ouSzXpuXH4Sf1CGs2A5MRDkU3Rqv0+VvlBD4ad
	PDHyva5oxByGDvGNRrJcohtmWNoQBtFNny3dA4tgJyob4DR6u/D1MQXSAIR6mlmu8Lk6unrkp4b
	oyzYy/GtJV4FajD8jX3q4w0s3eWq7ckT8lQEJKLzZsL42Oa6fM5I/HeHJT53jCuE508dprbwkPO
	13Q7W//eDVGrMyX64NtR5Uuh/J2a01qGPEwVc1tQFvSEf8onZsavNSNmhBd7Ilur1Vom22JPVOh
	U3l5KCT6J9vMnV+c3BK7FPqOZpML9MU9Fl8HkkCdG+5HxfehiI9nzN/vgsOzSbxdzy2C6IHxU95
	56L0yeTkoaukvaIPSbe0MQPh7hIlle5++gc47ZDXZgs1vlZrdtUUu0YWbuK89kyaySc+H+FUqfp
	U+PVAc1nxjOjD3c2oy5BRRIvKfaeT/Y0HbD0FlJSWdQ1p+ruRKJqMmRseKN6GbtRNCkXv++5a5r
	7ltb4NH/0G1IrHadoyl9192Fu7gFO2/xc0x/RmTmRSxtNRS34l0vsp1AgSOG/61i4qdX
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver

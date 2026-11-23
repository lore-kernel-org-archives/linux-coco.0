Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451987;
	b=EjnHi+FLrJwwL3x8VgBOGpP11jBvFcbs1NXK9rYsZ4v94tLmPRPR8oeUdXIMmzHiXE8R
	 B0X/GlHWnKnbxo7NJd7nfrtiFSwC0vxjjj1ZLI+u4JYX00YQKN6Cn9zp2IFTxWSbD2wIP
	 slFptUqrkqYqDV3yjXFRwXgm8dDhGfzRwy72Qp8Pg9XRS/rbM/PTWd/U2/JKM3yIxjM+6
	 rHZQvEQR1SqNFVyYICx2sp5o+RY3SZznGKDvWmGj2CCh6kesc29DyGdfgA1yTLZXupeV6
	 6B/b8z7wJA+LBwp3CXkCDIgiBXdDzJ6bpDbm68MSGa0W8WUSBb0gco4GYGh73iCckng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=drjpTP74JsK51H7vM836NsoylzVlZy0Ll0P6+YE0Z3w=;
	b=ERhs68Ci+r9TvZ7BpcuD1cIv8jvh2/k55tUBEjICfVP/xXfQdvdDLSQGa6PjTFCC4TSg
	 azo6xeSn5dXuOCfSdfpmKKBJwqwhQcTiceT7TdEiQNoTNPJvuO6Bj66BMCMYXJNT5nXwY
	 MdTzmRsD9rutoNmq868KTNK2MOZSMw/jaFNkR04+Lk5fqsfu4DeQcUwO0nGCmcpTaDGkz
	 MI0KnvhEX+kAjPkecxprQzVZlHMC06nybB3ZPMkuDxEwBVRyDPuAsjSe0vwWJct6xpeQG
	 d1AYvJ/I1CPSnMCIeyCT1o4WuOB8tNrqtG8vK38+o+KcrghTICXsjAbZv/HIxZG6VZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JHijAuKO;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A11E606A321
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 16:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A11E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JHijAuKO
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9495d543c42so365235385a.3
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795451986; x=1796056786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drjpTP74JsK51H7vM836NsoylzVlZy0Ll0P6+YE0Z3w=;
        b=JHijAuKOjY72eOsyCLK5bQSXHi3v7+L9T5QvMEidcai+av6NrQwrzxbskBngKgBjpZ
         2iJL7Hn5XS23RvpznVhq2a2Qf75izZ+xldFOU3cs+P1rzHDtbP/F35TRlIB1BXuJVQhb
         9reXgji0m8Hw+l8ST4g+WExqnEVYnq7GvSi0zE2zSc4GOAlt8PCn8dWGg5mWPtUF4p25
         qp4e6AwW1uSwVJ+DmXdqMvc+HM8EjUCM5FFoXj9pPNqQ2OPxj6+2+bdONHesfW/ggHJT
         1xyrejXJs6U256UTj215Bbna9M/5WqPUBRxPLBgRyjcYXIFHr/uGYFlWDqbdhOQWX5Iu
         +Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451986; x=1796056786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drjpTP74JsK51H7vM836NsoylzVlZy0Ll0P6+YE0Z3w=;
        b=AcMVGVJ8LwnqY8/1nSzqoHBm7ggMV/dBRDA/EM5h6XXTPKI/P/9Dlzp7x19FyLE0Xe
         lG0tCwPKlOhlHMLnH40h7pE2URYfs0uA+xKwMLQIKY9hzdsZaEeaWoF0542ot7fEw2sq
         0jtMXUoEfnxhFv4cqclkWuIMS5LsH2U1IFAG5xLHOrbPPqqcoM4oigqRgHLPbFvV8DHR
         DqhfcrbVPy5nC117PxFYKl6MzWAMRJsZFdh2fTJAnbLDgsW8BOMTzdK5M5LS+GYRA2+K
         hoLjy+r0r6/aVFZ7/9qurcFUgpc9pDMpDv5/K9/Anx8RIFxezUNZIhD8rSk6DkOvwGY/
         0W8g==
X-Forwarded-Encrypted: i=1; AL+hErEvcDnEVZGxtQN9ZH48afrOu/TSImxjkp0AT6CShd9FgJeNGGEh6xNIW78oSl940u+aPwnv6RC/VQKP@lists.linux.dev
X-Gm-Message-State: APuU4Z9VF2cab0d7xbpEI9GS7uZ8MeI3H4qvDIpsjBVUVO4k93s+mEUV
	hOzU6N+BBxcizw35EI8lNfa8iKWwI+hbIG0/rXddiVdjWa7VPUr+CknLbkb2rORXa0o=
X-Gm-Gg: AZFdTZcJYBFZJ1MNcnJBJQ0yufGqjQuCGxS+tbLhYOJD9PUWCDrvJQQJn3Gr/ZW/pV6
	jNL4LP+2GUWY8y0mWERYbCuEPPPARb69Td8lXtse4CdCnYCXx6mx6rEjRX4XFLlH4kHltbSDnmv
	kCIYbD2UkGmQpZMi850C2UAuEdLrHADuCRgsC64t/88J7A89IryMO1BwzZmHo8lEcFmZc/fJwhF
	QnU5xSfAPdcg8XUWhHasOGNBU8SvJJ8jG6ZUg1PkhkiVaNfsORAhQIhPzOQtPkNAWNGGCPuCHVR
	iy5JcZpFWcBlgpjPjiZRv1jPVXB1mdS2D7387eVC0bQDxDTZql7efutNNrKZil0bp23n4040ED6
	r/PKcJLl2wVGM3dr0E3mfiJcTW/k3cmUhCZX/p0gZwjALDbFYRB55tGt1txwzL39vOlt/+eXLhX
	VwtvNn6quKxMd7dVF7d6nJUENxw/bes492eV3HB1DRxe96c73VVU4p4Lxh6blN1uRkDKngaMIzo
	vVE3M72dWg23N5HRtZTApcDDDlPf+cENfpYEt1tCIy0zxI6yBXjNAomVJIhSPDWBUxpFxRK+WFe
	oS0nJqU4Nd1xtnvaeMrwhysjtmV4YatPl6514pgbbaBgListvabsfDmSvSsSAbJbhV4P9c3fQ5l
	trGS46SzTwtI2+6cn7r012PA/
X-Received: by 2002:a05:620a:4403:b0:947:7f9b:f839 with SMTP id af79cd13be357-949ba9bf10emr2106812185a.47.1795451986121;
        Mon, 23 Nov 2026 08:39:46 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb424fa6sm828689585a.40.2026.11.23.08.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:39:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVX4y-00000000vk5-44Yr;
	Mon, 23 Nov 2026 12:39:44 -0400
Date: Mon, 23 Nov 2026 12:39:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 00/10] PCI/TSM: Support guest TSM drivers
Message-ID: <20261123163944.GK179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <yq5aik1n4iz3.fsf@kernel.org>
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
In-Reply-To: <yq5aik1n4iz3.fsf@kernel.org>

On Mon, Nov 23, 2026 at 09:51:04PM +0530, Aneesh Kumar K.V wrote:
> index 429e39f647cf9..01d7877d0b571 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -604,6 +604,8 @@ struct device_physical_location {
>   *		ancestor device.
>   * @DEV_FLAG_OFFLINE_DISABLED: If set, the device is permanently online.
>   * @DEV_FLAG_OFFLINE: Set after successful invocation of bus type's .offline().
> + * @DEV_FLAG_DMA_CC_PRIVATE: The device is able to access private (encrypted)
> + *		memory, no shared memory bouncing is required from the DMA API.
>   * @DEV_FLAG_COUNT: Number of defined struct_device_flags.
>   */
>  enum struct_device_flags {
> @@ -617,6 +619,7 @@ enum struct_device_flags {
>  	DEV_FLAG_OF_NODE_REUSED = 7,
>  	DEV_FLAG_OFFLINE_DISABLED = 8,
>  	DEV_FLAG_OFFLINE = 9,
> +	DEV_FLAG_DMA_CC_PRIVATE = 10,
>  
>  	DEV_FLAG_COUNT
>  };
> 
> ...
> 
> +void dma_set_cc_private(struct device *dev, bool private)
> +{
> +	dev_assign_dma_cc_private(dev, private);
> +}
> 
> This could easily replace device_cc_accept()/device_cc_accepted() used
> in this series. I can switch to it if that's the direction we want to
> take.

I would prefer to settle this with Nicolin's series that is part of
the point of it since it brings a real user and a justification..

So if you can confirm there than it does enough of what PCI needs that
the PCI additional is incremental then great.

Jason

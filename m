Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC26291C00
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754410137; cv=none; b=tb6oA06TZkh2qGNhrscu/R8CyxFLoUkb4tv48IbN8sxA0fJ3HF9xq7jAexkHb8IKL6QqVeWg2AanUyVgR9TjtTN+Lx9mV1rS0GXWb7veJBsUymanmSc5MFVwC0OWxaL1drlSEpLXmc8C9JmbQCQobga1Oed/Yf4erx/ssXNdAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754410137; c=relaxed/simple;
	bh=kTcaW0q5ivmzGd4QOSXd/nHt7wH8yPYPEOgv2LKOSjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZASaPhS3oRmEW4/vFvNN7JgcNtnkRcSpWQnb0fWdbSiDW1MbTGRImDUk1tcA+FtLaMLJhwAR9Io+Ou4AmH9Uw6LwvkMRhl841E5Nfcaw29DK/r168QBrx19C7q6m2XtJBCBs6gKc7iavs1m1zmogj9KPo6PadUvcQ5Y8SbiLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=odCoTKSQ; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="odCoTKSQ"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7072ed7094aso41554676d6.1
        for <linux-coco@lists.linux.dev>; Tue, 05 Aug 2025 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754410134; x=1755014934; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3h4Juy631wFFbv9pOrZ90ugfOmUc0F+qy1FlObvh3I4=;
        b=odCoTKSQJm2OODg0Gyr5y9Heza6enDasbZAK4zex61vMNDstu+2KwWULm6H8THt5k4
         mXSupL79VezA03URzCZLFPn7MJBlWt1xkucqOeiTU19l67ANV90OPfLf//qfPxirToS9
         qwLHUbJ8j8VISZYfu/vRzI5mSAfSvAB9mbTKUt6cX66qtOhKBS/OfxGKRjPEsr/zoMz6
         6lrlpf+B9XutwpWja0HC5M/Y0IqdM8pJQYusVCFLtKpHfLtXvt8ojTcR11uDco/ZSPyq
         x4iXRmrhaqnDwcZRZcwLa+dOYVWs6vchPLOenMYT4EklwcApQBOlUS7rI8HEkTiT3UXs
         PrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754410134; x=1755014934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h4Juy631wFFbv9pOrZ90ugfOmUc0F+qy1FlObvh3I4=;
        b=jtcM7cN0U37S3pd8eg45PzHnXY6hCmQ22aICYi7fgHRPRj33yN20VJFhxPxLI3qXkC
         14d7mxk4bIo+3vyXK4UAIUoIWseHRbPjIv1X9iKnnPPCsKLJsSpbf2oxlZHhPsgMG/TP
         N/NQ66XR0+vvbZFkeBBKdyTJ/8aoFwCXRARvUrxNt2txjjk2Tmi3C82E/UyK65cc88Vb
         YCpC8Kd5X3KGS8Ap0Z3MpR+B9TCDYOGCSdHK4BEf12Q8esE9kKTRCJBMZced11hSFg3J
         hBluURemqrnR8/auvOxQcBPdiH7ZoCTZEcGjkg9uzbrD1rACXtWmlbebQZg2QE+tPCun
         5F5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDXg77+ATDplEFlvyY4AwbjGreK48w/M5r4bW+TUo8zny53zIbhGqjVtBgouzwkEmbytKznCfJpTz1@lists.linux.dev
X-Gm-Message-State: AOJu0YwhKA5q1wl9hLcywe6Qvd4j6o9ndrJCqMklWqf21HEtiC6H6Cmd
	fEB3IWWTRVn/VTxj1g9hd+fS42h/wwsHkNJe/5Yt8gwwRGp8ipmm5jbVp6thNOuyvOs=
X-Gm-Gg: ASbGnctMHVCstm5ZLC/88iInWeKv+jIy2xdgQtrqd41ykTKyPkGJxOYauvpDN4DKKzD
	/aQ2HzZJBpOWhhpROVvYkH2Q0x3eAJulhRPQL6z25qMFxjmKzi6p8w/sHnlm+7Qb9qi2HZ+xKU7
	bvYlCiDm+g1LjYIbZsKBqGRcmdeDpgT5G2z+NL7P3BPFKmWQ+XXp/YjN+GleNqc+MlBuPidwgEA
	YCHNmtmK4g/xo5MJGzq5S8CzjUB5gf7B/P5Vz5C4INWxwvg61Apy5472nSk9atO1qVVq2LLgNFz
	tXgVQ5XARabFGIGM/OyMjKy/RUw0ZC+tED/4mLlHipfgmxYK2qEmCdqyEYJcLjAUxW8b3ouwuvv
	DGKY24JHyvnrHnGpAz5Axz2/d8r3oay6wYM/E9CkwbzM/+tM/yzysM2QHXoki0VSGDDu0
X-Google-Smtp-Source: AGHT+IHZ3PopPeTcQC5Nnc3xOLSRL4WyZRPVraWd7MpQSpA1ulubjE2uvQ7HveFIT+qKiSlQ1vJvtQ==
X-Received: by 2002:ad4:5fc5:0:b0:707:228e:40b9 with SMTP id 6a1803df08f44-70936287ad8mr236610866d6.23.1754410134379;
        Tue, 05 Aug 2025 09:08:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde8d56sm73667086d6.73.2025.08.05.09.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:08:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujKDd-00000001YvV-1cIz;
	Tue, 05 Aug 2025 13:08:53 -0300
Date: Tue, 5 Aug 2025 13:08:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 04/38] tsm: Support DMA Allocation from private
 memory
Message-ID: <20250805160853.GV26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-5-aneesh.kumar@kernel.org>
 <20250728143318.GD26511@ziepe.ca>
 <a22a1ab7-95c1-41be-b33b-a4009b55631c@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a22a1ab7-95c1-41be-b33b-a4009b55631c@amd.com>

On Tue, Aug 05, 2025 at 08:22:10PM +1000, Alexey Kardashevskiy wrote:

>> static inline dma_addr_t phys_to_dma_direct(struct device *dev,
>>               phys_addr_t phys)
>> {
>>       if (force_dma_unencrypted(dev))
>>               return phys_to_dma_unencrypted(dev, phys);
>>       return phys_to_dma(dev, phys);

On AMD what is the force_dma_unencrypted() for?

I thought AMD had only one IOMMU and effectively one S2 mapping. Why
does it need to change the phys depending on it being shared or private?

> On AMD, T=1 only encrypts the PCIe trafic, when a DMA request hits
> the IOMMU, the IOMMU decrypts it and then decides whether to encrypt
> it with a memory key: if there is secure vIOMMU - it will do what
> Cbit says in the guest IOMMU table (this is in the works) oooor just
> always set Cbit without guest vIOMMU (which is a big knob per a
> device and this is what my patches do now).

AMD doesn't have the split IOMMU design that something like ARM has,
so it is bit different..

On ARM the T=1 IOMMU should map the entire CPU address space, so any
IOVA with any address should just work. So I'd expect AMD and ARM to
be the same here.

For the T=0 iommu ARM (I think) will only map the shared pages to the
shared IPA alias, so the guest VM has to ensure the shared physical
alias is used. Then it sounds like the CPU will sometimes accept the
private physical alias, and linus will sometimes prefer the physical
alias, for the shared memory too so Linux gets things muddled.

IMHO ARM probably should fix this much higher up the stack when it has
more information to tell if the phys_addr is actualy the private alias
a shared page.

> > > +	bool			tdi_enabled:1;
> > >   };
> > 
> > I would give the dev->tdi_enabled a clearer name, maybe
> > dev->encrypted_dma_supported ?
> 
> 
> May be but "_enabled", not "_supported". And, ideally, with vIOMMU, at least AMD won't be needing it.

Yes

Jason

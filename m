Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E930F942
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758284224; cv=none; b=qUoxAtjlJ2IyZo2LuqpHR88VG4X+sfvQ6fnuR3hxum6rsP24I1sCvmCuLZgODC/0TTbhfr8QWQx0NxbXghHDw/gcg3GAi6UHdW0krstlREKxHXEJ4/3T3hQp5mDjB1Zqu61YY+LBImdVHmuptBIMOFqFF2Ca+DUqZXz6syADo30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758284224; c=relaxed/simple;
	bh=9hOdlGjuaO2HgHLNkmD06YTLKgftelYAE87iNaJOHB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvMRJBTpAQXoqgfVZFrKx7zGa+lZrFVN2AcHIJYkaaw8BZScgd9Xc+KI8d9tdACVWEopa9uB6hFKoW6a8itwbuvQbzql51mabdcKgU6537c7A01CB79qC+4eRLe47X+NJPctxsqfjAlqrhfTBKaX2nQKjY8qBa+GeYOPsPPfPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ri6ea0sM; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ri6ea0sM"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-750b77699b4so1477549a34.2
        for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758284222; x=1758889022; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z1PAUhuZhJ0qIsnRvrF+kox36Ion6GUIrhsugfkSaw=;
        b=Ri6ea0sMP9ybe4htga2EG3KftI2S2LoRdLRQG4S4QvEFfddSppS3td6q4rPmMFZBlT
         tmERtmXwdf05VLwVvnClAk79vIWtMU6jRySPk6sHimtuHWJSrLaAGBiCp+hfe+TdnZSI
         /X+zxpRSm5rSNRHu+1koxj9pChAnT8bNriTk5a2oYjHqkF+aq2iWLS5X6BC1G3N0RLVc
         Cw5W0vGjtoG6i+ThijJ8E4Z4NCnfIvBTyTTRTPAo51UBAM63j+2siFhinovsdyMxj0rZ
         imPa9YTgBKO3oZjgyJIXCkgtbU8UJQX4R9GurGtZk7eKrIH8cS9UDEhAk8hZHSUYJpNs
         ZD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758284222; x=1758889022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z1PAUhuZhJ0qIsnRvrF+kox36Ion6GUIrhsugfkSaw=;
        b=DQnwG7HUnNuZrzBtSVbdvPfXWc+BiS+YpXVbX1mrkdHoDd9PArh/LSEJofyx8a42Ux
         4eSWaulZwqz8xvCBOwULsakahfVwVV2Q4WlQcXRzJlovoY82E57zqY/8IigpgBJSz+0W
         kfmJLRgiatwm2fifwV7tu79kg9GY8wPNQ0cGOL5/2eTOaK3NEAvWn5fW6JFZlwD3/cuI
         1PdIcR67ozJvgLT2/5Sa4syA6ZL9nRvg9qIjRAypmJp2mjJrzDcJchaxobXlFRg/LCiA
         0JPo6hv4b+s1KsXOY42vqz0rL5lBkq6DmXWYKBBV1PFrrIwAqwwLnazhO93DEqojSVsS
         gtYA==
X-Forwarded-Encrypted: i=1; AJvYcCVxLk9Kb9MkrfYDJDMMPvxAUw2WDavE/WzLHcizs9X1rsWNtIOfvuvtWe/ysszbbPJVVmcpqmEO7Es5@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv2yehY/x+oTMScj7l+GpshhU11McrI2giJkqXnrTe5WzVmSx4
	sJU+ok7ayoor6OYESAGXcUWG1DXssJC0qdERkfMm4JQDI80s5nYdA51vqFbNLJU+g8g=
X-Gm-Gg: ASbGncvCG22XbVMZ4vuwl9IKLeVuSSMAnRH8YT/hYi/wyqQwF6IDlGo67stAcqysFf0
	fEfQFyFjJcKdbON/p+JJKRgCKXjv9kVsrUDfL2bzAmlOxwzL+JRbcFwDkI539JfizBlyZd4w1jI
	2R3TOQC9i40mrMBxBZd5H6i/YgORJcyOi6F6BrukzusRdtNt6fPciiXKOB3RIm2GsDEt4bhPDFo
	ghzEyupMtEQO4yKDDFMtryhnfItkQvxJg5nBIk/2jhu0VrSkCEuMr9UMO1SL3aURnLWLuQBp5aB
	E3XXyZgbifaAfhCJLMus0oPKlKjSCDTySWuMvQH9hpVfEtu2t/Sz+RxM3p5vbaIffHNl2MqW
X-Google-Smtp-Source: AGHT+IFrXXchLffhfMy1C7fmW24InJQmRXLk2dWjCrL6t07KpNbKa1uhJepPBwWb7oulkXbJlwg8YQ==
X-Received: by 2002:a05:6830:2b0e:b0:745:9272:4a34 with SMTP id 46e09a7af769-76f72bbc69fmr1610183a34.16.1758284221993;
        Fri, 19 Sep 2025 05:17:01 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7692af2f9desm2303860a34.31.2025.09.19.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 05:17:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uza2u-0000000988l-35TG;
	Fri, 19 Sep 2025 09:17:00 -0300
Date: Fri, 19 Sep 2025 09:17:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, linux-pci@vger.kernel.org,
	linux-coco@lists.linux.dev, gregkh@linuxfoundation.org,
	bhelgaas@google.com, lukas@wunner.de,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Roman Kisel <romank@linux.microsoft.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH resend v6 00/10] PCI/TSM: Core infrastructure for PCI
 device security (TDISP)
Message-ID: <20250919121700.GW1326709@ziepe.ca>
References: <20250911235647.3248419-1-dan.j.williams@intel.com>
 <yq5azfau7fpq.fsf@kernel.org>
 <6e8a11ac-21ac-4260-b8ec-54bdb058fbe4@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e8a11ac-21ac-4260-b8ec-54bdb058fbe4@amd.com>

On Fri, Sep 19, 2025 at 02:17:23PM +1000, Alexey Kardashevskiy wrote:
> > The corresponding Arm CCA changes based on this version of the TSM core
> > infrastructure can be found at:
> > 
> >   https://git.gitlab.arm.com/linux-arm/linux-cca.git cca/tdisp-upstream-post-v1.2
> >   https://git.gitlab.arm.com/linux-arm/kvmtool-cca.git cca/tdisp-upstream-post-v1.2
> > 
> > These changes are still based on the ALP12 specification. I am not
> > reposting the series yet, as I plan to rebase the v2 patchset against
> > the ALP16 version of the spec. Those changes are not ready at this point.
> 
> Here are my trees:
> https://github.com/AMDESE/linux-kvm/tree/tsm
> https://github.com/AMDESE/qemu/tree/tsm
> 
> I'll repost after I adopt "x86/ioremap, resource: Introduce
> IORES_DESC_ENCRYPTED for encrypted PCI MMIO" (hopefully soon).

Guys these all need to be broken up. We need to see arch code to
implement only the ops and features in this series so Dan can bundle
it all together for merging.

Think small steps not giant trees with a giant mess of
everything.

Please cut them down and post something mergable.

Jason

Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8322D4E5
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741026264; cv=none; b=Opi5DvGO+r2iNMNR0ydaPDLQ5+Hg1i2B8Q3OJhZcJ/yLeOaqtI56Y00k+EuCwdtiVPHIrcXewP3yOWTGkv6eJnUm85GGIhJ84TNoWzUrnDhspmwFgUAzEoZLhSpSGU46Qn09VlggYC736Ry8BFXiNvwdXK8x7+kUNGXs6siiWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741026264; c=relaxed/simple;
	bh=w2v2TO7Z7r5xka8aiKLuLQ59vaFsTPp6HtiifikSyfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KA2IP9Rq2W7e7ClyJO2on4qKNSwlBTjyb5qtf65tAgNGE4+jtJ2NNpPJz3KHEavZYxFPprSxB8RLKJqBYT4+VQlehyhDli4yP9lrVud0fhQ3PqBzAu9MUsL2IcEUop1HKq1wM3zETJonmbUiI7kB+CEmmwng1nOZwPBn2VsVxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DcLks9bH; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DcLks9bH"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46c8474d8f6so42820661cf.3
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 10:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741026262; x=1741631062; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wFd2UZ8ldmIHGAH7CB3R5Sq6scV42nHS8znHwSV7/PU=;
        b=DcLks9bHUw4ISpL6S8nBood8YTXn/MnjhI93cORVgzMxCp06yBtFvM3EF/REVyyRVo
         06mw+a3ryVjWzmULi/+nMtbdCkXdYIbhtoGkFNqQEI2JGv8xY76Cjas5GbDLVJOoZsSO
         MkTv2ANVioritTJkT0RfWxnXl09WWGlhdz1B9Kk3n6282zX7FZjaAZQi8DS2sWEO/zfc
         F2Y8g5CHhnOu6Q6hPpsHPpmbOo2j9JFN2GDN7ekHuhO9zzljjvdAKsH0oYxpMUxO6wpz
         OBTg8Ft+qoE7/aRf8s8ceRYDYWYikkTwqMWcNiliHbxnRZ5IztCljMJLxFsNXvJTYcg0
         5UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741026262; x=1741631062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFd2UZ8ldmIHGAH7CB3R5Sq6scV42nHS8znHwSV7/PU=;
        b=rB7gYKXTOnJSo9VU3Ybvm6D8s8V6sGhZYjsRynJWjyxl7Eg0002CLaAGjQ6aLJlnXz
         oLvAshGO+ESgn0swF+mlDLa+0eQo8OVsbQTYIioToKHIOl6qQqNHxsBu7bl6iaMWa11g
         BNxIAOGrF8FspPUheRYQEnfCsgvOqz7LOrGfnMG1BKmdPDLurtUl30DYZDnofRtpepgb
         6og93ml42roQKfuyFs8jGE/3hPmwU9eX/R+fVsGhyULEhX9CD5g6t3G5RZ30ZifFh4kt
         XiA3GiDCp5Pfki/WdtFHggnyGJFPJ6F7bJNhJBrTE8CZ0lLoVycQN4gYGRdhObqcwhwz
         AUGA==
X-Forwarded-Encrypted: i=1; AJvYcCXgVNs1EzJJfzAKl5UPlTyfFqePuLWP9K7FGT8Px8XAHzYXAHu1A/pyfBN06zavUzQrWdPMp5Yw2XfR@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Uam8lzrc3HwgszAKJzPQt4Y7SlArJlaDN5BEADVpXVY3XHw5
	F9mD1f8ILvP3/haQt346SwoFoK9XFg9xBsPZhQqGtC+Il8uu3E5Fllwjrf6CRvc=
X-Gm-Gg: ASbGncvo1FZKG4wm+yHXjRp1c8NDuRtUPXRRuQdJ1CyGTFfz31RkvraDyB+C5kPeT9E
	nwhPXk9zmABkSKkngxohgj9sSbVCvbtt3LImaZoTyR6xwAzx67c2OQOWRtl5DKH4epYzwam5fJ8
	DZLPR0e1JeWAOeFBK4rQk8Xe1wXDV3p0nPAzR630F5I7Uhylex26DFCvA25ipI8bVADqOmYRgg6
	hoqJKulzt4WDZoKTiZX/TICIly+scfdwbd1k3lDb7l9zxNDxpF5z0Pbc/KpuVxZzEJXwkTyK57w
	pxvWn05/EcHVldF2yYwWZ3zrQ0aZquqpc7CjZF7TCHQoj8cqMPQIkyHnVltJymyn9jBsWXsYl3s
	RBHLIVshcWC30viVFzw==
X-Google-Smtp-Source: AGHT+IHWCURrix0Rft30xojtcusv99HH/0K8wXIOezwHjJdDQzWoXGybANt1L1TDGdUNQiwXCdU87A==
X-Received: by 2002:a05:622a:81:b0:472:5ac:48bb with SMTP id d75a77b69052e-474bc095d6fmr182789981cf.29.1741026262120;
        Mon, 03 Mar 2025 10:24:22 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f1b76856sm9787641cf.16.2025.03.03.10.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 10:24:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tpASi-00000000qFl-48AL;
	Mon, 03 Mar 2025 14:24:21 -0400
Date: Mon, 3 Mar 2025 14:24:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev,
	Dionna Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 5/6] tpm: add SNP SVSM vTPM driver
Message-ID: <20250303182420.GU5011@ziepe.ca>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-6-sgarzare@redhat.com>
 <20250301002819.GO5011@ziepe.ca>
 <45ze5sxvcvg2ituxrefw6konxtwjgs4zs5bscrp2khfqkf3jb4@zozeerbmtik5>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45ze5sxvcvg2ituxrefw6konxtwjgs4zs5bscrp2khfqkf3jb4@zozeerbmtik5>

On Mon, Mar 03, 2025 at 05:19:05PM +0100, Stefano Garzarella wrote:
> On Fri, Feb 28, 2025 at 08:28:19PM -0400, Jason Gunthorpe wrote:
> > On Fri, Feb 28, 2025 at 06:07:19PM +0100, Stefano Garzarella wrote:
> > > +/*
> > > + * tpm_svsm_remove() lives in .exit.text. For drivers registered via
> > > + * module_platform_driver_probe() this is ok because they cannot get unbound
> > > + * at runtime. So mark the driver struct with __refdata to prevent modpost
> > > + * triggering a section mismatch warning.
> > > + */
> > 
> > ??? Is that really true? I didn't know that
> 
> I initially followed drivers/virt/coco/sev-guest/sev-guest.c to figure out
> how to clean a driver registered with module_platform_driver_probe(), then I
> saw that pattern with the same comment is used in several other drivers.
> 
> > 
> > I thought you could unbind anything using /sys/../unbind?
> 
> I can't see `unbind` for this driver:
> 
>   $ ls /sys/bus/platform/drivers/tpm-svsm/
>   module	tpm-svsm  uevent
> 
> While I can see it for example for others like fw_cfg:

Wow, I didn't know that could be done

> BTW I can unload the `tpm-svsm` module.

Unload the module and implicitly unbound the driver

But not manually unbind the driver?? Huh? That seems pretty wrong..

> Loading it again will cause issues if I don't have a remove function
> that calls tpm_chip_unregister().

You definately need the remove function call doing what you have, it
is just surprising to me that there is a case where you can statically
know it is not callable..

Jason

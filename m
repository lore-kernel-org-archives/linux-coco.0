Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7D246345
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733929253; cv=none; b=qxPoiDkwEpGGirU/wdlO1jiTlEiH+QuxFhSmNq93qbBvAZJs6/5IVhN6aiHtjfxMVT9Ve+r/5OWoK2Nwel6CAwZw+QpbwJ5negJCuFxCw+VhX9rgmZKkE+kNb2weshhqSxrL8a3/JhwO/CZX/2ThnwcR+3eESR3YHnzCPode/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733929253; c=relaxed/simple;
	bh=tLszuGjmr5DmRzuJ37tFeyxJiAHTkhXYikVmA7/gTV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POIGYCv9vMcqrUlm+R1QcEJoMeI0zUOXUY8P0RIHpMDpiOvHiTv3Fd7TRuGI5rqs9tBPwbQVtCYt7T1LEtOxOE+5Yrs8XlJGXWkxwv8hIGiDeSHXtu3lA2As3bqDHsmiGvwcPbTMypEH4wv5TP80i+Zreel27JD+XG0FbgM8MEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=UfN5FJ37; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="UfN5FJ37"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6ef047e9bso34600085a.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 07:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1733929250; x=1734534050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrtmwbffSfZyT6YxRWc9FPtrtY5w8qbaif6a3GhziHU=;
        b=UfN5FJ37psR6vWyOebJUKemueJ3+BuirRPtEDjiD8KZFbi5Hf/XB4WSvXUicjeypIP
         tRCEf7zK3qiwqJo5O/tKu5pixstRdAd0gOd6G7OrVqh8edZgobmozJsxSFkizLPf93J5
         w88Q3MSw1g9MQWEQv2JUFPxEJA7hXdBuJaZrvzUCv5gbL+FXkyskjvGSCbkQk/6KXtXA
         Thr2s1QKrSK55eVId8ha4U/CV4B+4sg/b9/B6xbHqI4awWJKOKPkA0rnZMKlF0axQguH
         9kd2i36JUfyKxIDtI3qQEoX23aH156mDHVaOh5b58JagkC+LDg0FSJBm3VTg+heAFIKe
         fFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733929250; x=1734534050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrtmwbffSfZyT6YxRWc9FPtrtY5w8qbaif6a3GhziHU=;
        b=GsjafoD2q+nKI5lGhcZ1zf+IHFLmJgQRjWhVQ3MaogecKAIz7EyMovkcSfTtU2tGPu
         ix46zGT3ddHH/vUvEX3ahc63+YKg0axZmPF8YZC6ijUhloD8Xf66EJAVcg8nCZniWcBX
         8sG2nUpYdzGWc/HPvUrzpi+U2X0NOf7VThgGs7143pb7DlWPM0ufPWLv+gNXCEVkE0Nc
         5XXLIibn3XJf3SPvgZl8huDNOy9QfDKhnITu7CNhYlzwyRAJkGJXdUoOUW2/ZyWeiPN9
         PwvL/IzpCdKzjX6lDAektN0M0zl+KeIdN0n4EW3wUJvKUOBdKpfAsxzIgxI2Z3d2BC/k
         zb7g==
X-Forwarded-Encrypted: i=1; AJvYcCVQZ9W+p9pVdSIaM+J3ipnWkQ/xxEl/R/pJ9IlV2AIOFHWqfAcVXuCgMzFe34Q5lArM7T2En5ELgLym@lists.linux.dev
X-Gm-Message-State: AOJu0YwIHjEL00zKgYNc1TtzkYieOhKUNJ8MpWTW6PSWyO7VtFIGwjrc
	SilSt+hVAkXV0VIP6IfNB8R+/aqTCz71JHI+l+Ju/gigq7IiCJLNuqal6xSYhiw=
X-Gm-Gg: ASbGncuL77A4Ge+/pNMB4dEqRDbDdj5MQWkfgeGjeXbqEW36EktOJ/OfdCK4Imgn3WN
	YaRDU/jg1DGgXuzIC4J/pRHYneKD/RIuPsyGjHeSKTFwagSVCmwtBzFnJ9JrU3VHN0E4feODXoF
	dws3mvy2yE8kFGhJ/t6t+GmK56o4wM6FAGXEnB3jkMKQfy/W8b77wThuWsOz5OXOkC6cImqWvBH
	3GgcXWdcXxUk5KyXAl/3YvrDxyKtmvOro4H+wszcJrC7fp2KXRbYbuBTJUluRaFWDfpb7apMHUV
	e5mCy3+gWO0FzgIkMJO8NFDk4/Y=
X-Google-Smtp-Source: AGHT+IFQcbIbj/UVOC6lgBpyonYbHxz3lu1y3vK9mVU+Waihpf9zpnAftHXTy27rea7DKFP+zHsrCQ==
X-Received: by 2002:a05:620a:4488:b0:7b1:4a2a:9ae0 with SMTP id af79cd13be357-7b6ebc2ded9mr501476085a.9.1733929250259;
        Wed, 11 Dec 2024 07:00:50 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6ef71409dsm29466085a.121.2024.12.11.07.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:00:49 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tLOCm-0000000ADPI-0U4U;
	Wed, 11 Dec 2024 11:00:48 -0400
Date: Wed, 11 Dec 2024 11:00:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-integrity@vger.kernel.org, x86@kernel.org,
	Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <20241211150048.GJ1888283@ziepe.ca>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca>
 <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca>
 <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>

On Wed, Dec 11, 2024 at 09:19:04AM +0100, Stefano Garzarella wrote:

> > After that, there is no meaningful shared code here, and maybe the
> > TPM_CHIP_FLAG_IRQ hack can be avoided too.
> 
> IIUC you are proposing the following steps:
> - extend tpm_class_ops to add a new send_recv() op and use it in
> tpm_try_transmit()

Yes, that seems to be the majority of your shared code.

> - call the code in tpm_platform_probe() directly in sev

Yes

> This would remove the intermediate driver, but at this point is it
> worth keeping tpm_platform_send() and tpm_platform_recv() in a header
> or module, since these are not related to sev, but to MSSIM?

Reuse *what* exactly? These are 10 both line funtions that just call
another function pointer. Where exactly is this common MSSIM stuff?

Stated another way, by adding send_Recv() op to tpm_class_ops you have
already allowed reuse of all the code in tpm_platform_send/recv().

Jason

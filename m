Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AAD229611
	for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736860045; cv=none; b=jLtRL94if7jRjTuErDLzLb+rGlkKuxpfzNxMGgmTcplz4wLo2IEKLEC5T6AjKOkykCZfQLVpoILGkGkapdSZcvG/aJEsa3ZO8Hoiea31i1eFakebT3NEOS5870OITdr2mwTHTWTj3NMt5nlaec8XUpyDC4gPB9w7ILooxhAPH5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736860045; c=relaxed/simple;
	bh=/avICbdPpHdjemOQvkLGAY2+9dfeloypzwM49yfXZ78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oojKpAc633ol+MAjPlCC4LOLPa+al76eBi1tjTE4skLd2KX54vSu5R2QR/KENNU/BHZiyG6TjtZCWECmZxWCTKU7CozOG+j2AtQFG5RCFKjPa60C0Qvg/qZmv56FtQbewoHT96vqzKCmAQ4644/cK9gRf6fCZyLlreOr8r438N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OK3w9PdK; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OK3w9PdK"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d896be3992so35710926d6.1
        for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 05:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1736860042; x=1737464842; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TbuYi0/uhpyIsEsjZiVCHU/0H6AIyzAzvX2PVA6CnY=;
        b=OK3w9PdKiQTZNwFFkGAs40eqqVhWAOJLrtJdH2omn2AqXzwtVyV/GbFO8YeLJFljmj
         nwAUhtkpajzEm9ejoUN8+VBOqAtDMLkbmmdAdOCCldhxOrxSTQ/Vp2EibheRvOPUD2hD
         MJhF/2NU8AK+9ku33+asHWw19SK/FnhCyQnQGttzgSaeXhsibWgtsW2iAJCOlE5L39vE
         lHP62FB9cI7XSRrNw7LgGU/bPAuiacU5C37mb67Wo6MhdcnwSz6jygqfPkZG057RVU0A
         ct9DKVu5vwwycreh/7N0Ls3eGn5eu9PRKAu7qPhszZK04nWIeMi2y8Xi+qXpRUCE2NF0
         pbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736860042; x=1737464842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TbuYi0/uhpyIsEsjZiVCHU/0H6AIyzAzvX2PVA6CnY=;
        b=irqTtjk6XxDQt4R3uC9Pa7a+RnAX3FMHeMlS0T4Dbeh1OtL5GjSedwqF6gZhqWkir0
         HA2rlo2XHDcdUD2QQhRFu11OQ7em9+sZlnf1F709N0wIH/97xLKPH+fUsyr/Wga17EfE
         uK6OMxJRtiAuk14hZqhB4JCVCkf0E+ycFEB7vcbyc32ftiXK9HDaeFx4sfk1pSwEdWzx
         CfaKyCNFJQxwRGTXMg1iayQ+VcLfAWkQPF8TD0VXV0jFHlEDdDSIErbWY+4f2OI2gB3o
         U0/i4VmWH9DywRxU3UK0gDChLLH3BcIfEwF4qyrIri0R8bMo0StKcGJJFCoCkNnJPigu
         5/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCW70AQIV4kPblbT3hxT7uDtcWjg5hOE3SEMxIp3aO2G82d2hGGHTtPK31CtfydbWBINPzDoWaF615Tq@lists.linux.dev
X-Gm-Message-State: AOJu0YyzEuAomxgrhfJA5qgpYRw2uAAen2BHpeI1XRzB1QKmd+ZhS/57
	d7HIFVcKR4RQhg4DNE3n/CnzvJJVqjQMPZUBQkLbpcfzNF7JDbPnXtEzrCAZqIA=
X-Gm-Gg: ASbGncswgjIgHWidjmf3ZPQW5W5q0lrSzK4yh0sI9CEA1YdB3wJxtk4QOZw2Q1RMP1m
	lKKqObB+1yfLuFeFvOgDOBg2p6zBhFWDu7/aPNfDDOUPV2DSQMkVXGXw1kI6MxrWTgkXqhJcFkA
	Ot6KLbyO1vyd3ZYU98MKWRr/A2kTKb5euuHSPIsRs3bJKsB7mz2iGPSY6Pg3uyqtBA4eHQvcr/A
	HA/5YJhuDuzx5TNxi2bgLw7ynVsPl8SJEMeynY3994M/KoxSO1UorGcUnZxi0EWVWHLJ3PcL5BY
	Zm2vY9q538AM48Ah2kMc0qmCQR+dCg==
X-Google-Smtp-Source: AGHT+IGLd1udhy0Of2yDBsH2ne4/vF+q3n9lb8J+wsePBP6osAhl0cEquesspYzUnUKjTPWXZsReXA==
X-Received: by 2002:a05:6214:2686:b0:6d4:36ff:4356 with SMTP id 6a1803df08f44-6df9b220effmr448916986d6.19.1736860042256;
        Tue, 14 Jan 2025 05:07:22 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade73b8fsm52418026d6.72.2025.01.14.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 05:07:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tXgdc-00000002Lxg-3sFN;
	Tue, 14 Jan 2025 09:07:20 -0400
Date: Tue, 14 Jan 2025 09:07:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
	James Bottomley <james.bottomley@hansenpartnership.com>,
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
Message-ID: <20250114130720.GJ26854@ziepe.ca>
References: <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca>
 <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca>
 <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca>
 <CAGxU2F7QjQTnXsqYeKc0q03SQCoW+BHbej9Q2Z8gxbgu-3O2fA@mail.gmail.com>
 <D6FSHG5Z9UJQ.CWQTAANBVIQQ@iki.fi>
 <6rwo7tkdst227kb4pwvr54w4mfz2zw3offux7mqfupi3rgwkaz@65yklvvqw6n4>
 <CAGxU2F4YQy-otsGtGiUHDiL7PGXic2_HzWL_+GHkn+Hs_ScGpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F4YQy-otsGtGiUHDiL7PGXic2_HzWL_+GHkn+Hs_ScGpQ@mail.gmail.com>

On Tue, Jan 14, 2025 at 11:42:34AM +0100, Stefano Garzarella wrote:
> Hi Jarkko,
> 
> On Thu, 19 Dec 2024 at 17:07, Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > On Thu, Dec 19, 2024 at 05:40:58PM +0200, Jarkko Sakkinen wrote:
> > >On Thu Dec 19, 2024 at 5:35 PM EET, Stefano Garzarella wrote:
> > >> So to use them directly in sev, we would have to move these definitions
> > >> into include/linux/tpm.h or some other file in inlcude/. Is this
> > >> acceptable for TPM maintainers?
> > >
> > >There's only me.
> > >
> > >I don't know.
> > >
> > >What you want to put to include/linux/tpm.h anyway?
> >
> > At least tpmm_chip_alloc(), tpm2_probe(), and tpm_chip_register()

The intention was that tpm drivers would be under drivers/char/tpm/

Do you really need to put your tpm driver in arch code? Historically
drivers in arch code have not worked out so well.

Meaning that you'd export some of your arch stuff for the tpm driver
to live in its natural home

Jason

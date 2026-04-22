Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2207339B41
	for <linux-coco@lists.linux.dev>; Wed, 22 Apr 2026 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861648; cv=none; b=qz6Z1mMtk4xV/Xcfkb+8CuAudcpvUI2pb8EYhitBfdMett7S2NVJfXAV2LNf9W6m7Z35Eumey0gj3rNyZsfKQON3+CeqhoTifstfJXEbO7fQR8VB9HoI5TbiAB7FrBVAwwufYPR/Dw4Lddu2R8ynku2N0JA7zyYyMCoW4eugFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861648; c=relaxed/simple;
	bh=a9axqCXKHPblm4gbverCkRFAKbFQBKqie9Vz8rXYU1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBY28n21ZbJDAt/DtDC9Vk6VifEkercvWFHIsL7gsm0o5i/IInQ+qoEG0As/mnT89qGLGDiQQbFwPxtzruyLN2IEzOKJyrmRKZat7zPA8lL1u0aC+8POvwLga39DbVaPfZhBaY0cjCo4iFVUVXyYrOSmZIPhPTnfYK42kBeHej0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WAbY2Zke; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WAbY2Zke"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ee7ffd738dso172916885a.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Apr 2026 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776861643; x=1777466443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gALF8C80EJ2lCyyRbSwPhK0hTNS8uppnnB2sBTEGTHs=;
        b=WAbY2ZkewP07u+m3eVh5dgoK8SkIz0A0mbehya9kAgQUKliQk+RZxsbzVlfpUrj29e
         YN08fVcH3dSYbjfnfuNrOGpdBR9+0rENs4+2YdtCsGUYD6eR1/QAC23cz3V7GNJwko2N
         NNSQNQaKkflsE4Bhupndb6mWNzvaITU3Xwr5btyDMsue7t0Dun8WD+NhlgrDZRbYxxzY
         DKmqXCT7lQgBkgjgv+9OE/F5ude247ZXc4K7vi3zTfp46/+v6QOtCqZHRqOEdQpqcx5j
         KOur6MwkDjVwKw2KUYf4Jfx8ZGo+6gSJVmnxFXmhemSEgpQYFVGobuDsD3D0UpPpc+OI
         gbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861643; x=1777466443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gALF8C80EJ2lCyyRbSwPhK0hTNS8uppnnB2sBTEGTHs=;
        b=qsk3ZZ72zHrvqVKZEsLIqOIInWcSFfXzdutC0fLeR2+SqIPwTpwkiImwwJv3vXmlqG
         JGFBjPXXIGPhnbbYaOTWq2nqMlsHRwZ7AmN3P9ivhmAKsmtMNZLxCcjCZ4gRf82n0dGl
         XepsAJbjp/1Zo5bNtVdg69wqsy0KaodRE702bYCNvXOnN2FQWuRu+1IucTRg+kpd9i4k
         44gF9hC3DU+OUiI6Cg6u7YGYhEtg5RN7YUVHglrXbpGpMEqhprseRNfeJgsFMDcWOZS4
         PysN3/1WKLfhiGt2ubpermtzjLyCFpjHhnR2BlURWg59wkMQ60Tj3O/0uDaP1kdU469r
         Bv7A==
X-Forwarded-Encrypted: i=1; AFNElJ9JeXSiXgyQib0CUPeZfwl5ZtPhztxC1chtx0Jx/9uPBH09sD7kpOvR/vV44JZaXKVBITFlcvol+uON@lists.linux.dev
X-Gm-Message-State: AOJu0YyxTY3SYSPBG459aV6xU4CjW59BiiNfZ7Q8ecbRv4MwRmvvBh5n
	uI/RWUNy+bkqRoysHSawgepPB0WbfYcUY1AchbfEsiA1fmz4Rqq8LJn0wvN2gz/xZMU=
X-Gm-Gg: AeBDieuuB9mv6ZYxrKeS8/K6aDIzCvhP1hs1C9gnB/PlVzmZlyU3yWfsP7uDmmjU74k
	BjHzwDr7oyt31hOKsNwUCJc8LLjr8fdvHq60NSHgleqrvVU9B4nLwXQu0Onky/lJmYy6XHRLU05
	AbUrH1LmeJhtDWLr8V+KJawEnbKa2krn1b/aoZhPTV4c4b92ve1wvzdY10UpaInD2ZM8xKYSnPq
	frhLd/W3Bjxk9ejPAke55IkS0NbOA5pIvHNqsXg7fCZZFkHmHTFMSPpcgVnpoiIiXl9v3ej4Q5R
	pgmHv3O1cpsiAnmzZpykRuQ+3ApkRH0OKyu5APF6oz8CYOAfrgrHpT97pA7vSPs0tZEy1TyMz5j
	snRtwKrdVEBr66tLWXflONGkIR06ybO4cCY/TP9Yy5S+LsyjL+IuBVc2Q4GTxUic/y8UKMuBBcF
	oyuj1nOCsNlrTmW6q0Ta3sa19XBPEhL60exBds4qlENMvfWASiktIsqwDV4NG1igkqse7exRqwp
	AcmDOeLHXAYhPoz
X-Received: by 2002:ad4:5f0d:0:b0:8ac:adca:2325 with SMTP id 6a1803df08f44-8b028693febmr312429496d6.15.1776861643374;
        Wed, 22 Apr 2026 05:40:43 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02e035b0asm120411376d6.22.2026.04.22.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:40:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wFWsj-00000007c2r-46xO;
	Wed, 22 Apr 2026 09:40:41 -0300
Date: Wed, 22 Apr 2026 09:40:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sami Mujawar <Sami.Mujawar@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>, Dan Williams <djbw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	Yeoreum Yun <YeoReum.Yun@arm.com>,
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260422124041.GJ3611611@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>

On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:

> > So this is tying it to the same FW event log that TPM uses.
> > 
> > I think that strengthens my point this should all be uninform. TPM
> > drivers are directly exposing the event log today, but I guess that
> > needs generalization if non-TPM drivers are going to present it as
> > well.
> > 
> > How do you imagine getting and manipulating the EFI event log to use
> > with this?
>
> The event logs from UEFI will be handed off to the OS using CCEL
> ACPI table. The CCEL table spec update can be seen at
> https://github.com/tianocore/edk2/issues/11384

I ment from linux userspace. event log is well establihsed in the aCPI
side for TPM and in Linux today it is only exposed to userspace
through TPM.

This is not TPM, so how do you intend to give the event log to
userspace?

Jason

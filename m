Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA78B1990D8
	for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753963898; cv=none; b=PS+1L+NJzo4PkSmwRxoP7j5ZG1Xm+JhQCkUc8J5NcnCK5fbmAiV5DMj+S/uI4cM48kEG3pZuIfpqEInIZ4grdrhZ6KhLJ8Lplkf90W4opAf8kcpMsQU8AnP7PRpqybXz20WTlFDkZxwuOl4llUMxMjSWCJd0eSK3cUpEfLZjbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753963898; c=relaxed/simple;
	bh=S1wXea6GSEkJsxBK8lGgS5pwcy7cCkvMsy6PmRLU7EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHpHPBMvqfe+8vjFvzOGWi7ssl82wjp55mJQ791NmvrQbLu5zufi0GBh9KHIQqar0gpv55ysqjc8Sg87U0UjLF7QXLfUQnE2jgKd7xyA+DgU0y40kEKido82Z8mhjsgB72KQgja+VtbI7zn3z3K70BQEH9zSuzrNKlip/Q0De5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=iGi6SRN8; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="iGi6SRN8"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7073075c767so4242166d6.3
        for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753963895; x=1754568695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GiA2tw+gwtAnjFcFPQpD5ne+ingC66pFHpYZpZzeYY=;
        b=iGi6SRN8hR78AV97FCHuISIEwz2RBl79mHjsnhqXVv6FpGIJE06w0PuU1n7bgtkf/E
         vxxTE8idLYGh0b7gXkilWg4YeEufhjbUaYPl/Bx8plDtZiTiMOntx/sae3mSl4ItaOPv
         cWLScfHPtMISPjELluYaZ65yyGN1qGmV9mwYdGbQfOC4j5DQc9jX1kk16aXPYuw/cwCL
         xkPJdFzkDgBVrZtQbJOFjp0bqleBAwQa1QQykhYVsPFABHmQKhKNZ7RzIW2MdzmZIW/I
         o7qY5j4WFOUA0fbEFo//azyDOYSJLk98bEc0frc/OTLACKiGT8rJmcyOj2ri15Yt+wS5
         5ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753963895; x=1754568695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GiA2tw+gwtAnjFcFPQpD5ne+ingC66pFHpYZpZzeYY=;
        b=JLG6yBzbg94v1N8psvohRwQBhIgR/63i38KRtzBUACxHfJe4RWdHUaDF94VmdS2Bwe
         te0AKy5Mycl357csn0s8IDU59G37nFDhp/B5bfkF/vgQuke5pnAYJEvaGRVRbjbJPV7o
         NHAP9KpjLpvzoulM5sbvqbBnyhow5ZPHnx/PpSgTIfbkbKfIlzcid4PwvNRXFTJTS78z
         GlyFMsB9X35JJw6Mli+tccaEtOT6AsJ4v59ErcBZeXIE0mYceaI/GgDFvrFz8J6mkRkP
         7EiP6bV2ZUhGtryNrXR3hUbXF745B7220bTmL+Z65qX8JXE3+WswsVv5i+1KwI1r3uzm
         VT5A==
X-Forwarded-Encrypted: i=1; AJvYcCViRVxzU79uJkKHG1VPwsU5VH7nZIdsVRl2usKlpHB86/85IGxO08MuPIp38an2TRqOT+meJsAorvxM@lists.linux.dev
X-Gm-Message-State: AOJu0YzASUPiaFBk/XKOeE6YmcbFD+8eJk2P87XNPbn3yBOgWyIl3HXc
	M+U9uAcgc++8+QrcMrdiJhmftLxxSy6eQStkTeyM/0b7rHq9a4Yhf4Q3oAo+uwGx2oc=
X-Gm-Gg: ASbGncvmuMH0JFs78B+J6J4mAWRgUUuofXtsi3Kqm44L9/hgrF4V2C18WVzdQ2vdsx/
	kZXS67xI8DrtlOe8YsV3DcoTqUiscWnnCBhANEeFiPgU3J+R0+QlSOsxv8LHAT5AwzJZBz0ymiC
	LDxLHQX1i5ABkGD1+WrCp8Em4QWlCoEzp6OZDSHRTZbynFF21RQSWWjbCRfU7fsVJAYJkRYD4Vn
	JFuVl0Z6P9R9hyJJRHUEXQ8XkZWWi5SUHJM5tsEW4KCI7DUpbAjvCSZVc7sWuHxjRRZe5P87L9Z
	zJfzOn5FALsw/CDXpGaV+kP88EKbmuw5r/rzftSx5VTfElTXcw8Gpo02wSmRaw0Z7Dd1BXQnEpV
	v8BAebYMt0w5+6zg6O1WuAiQ1lJInVe37WoKYIrrYImlkLc1+f1IXsgExcGwbXBZREjQRXb7aGW
	vWo/o=
X-Google-Smtp-Source: AGHT+IHjUvGatsM+Nj0UuwSVsL9Oyl4RA08oAzeUsK3Cyb+xVgspshhI3seh3MnRe0x10Mxp0AXXeA==
X-Received: by 2002:a05:6214:4118:b0:706:fa53:9d4f with SMTP id 6a1803df08f44-70766dc979fmr80279936d6.3.1753963894472;
        Thu, 31 Jul 2025 05:11:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cea1782sm6330876d6.93.2025.07.31.05.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 05:11:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uhS8D-00000000oUc-0rT4;
	Thu, 31 Jul 2025 09:11:33 -0300
Date: Thu, 31 Jul 2025 09:11:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, aik@amd.com, lukas@wunner.de,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, gregkh@linuxfounation.org
Subject: Re: [RFC PATCH v1 11/38] KVM: arm64: CCA: register host tsm platform
 device
Message-ID: <20250731121133.GP26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-12-aneesh.kumar@kernel.org>
 <20250729181045.0000100b@huawei.com>
 <20250729231948.GJ26511@ziepe.ca>
 <yq5aqzxy9ij1.fsf@kernel.org>
 <20250730113827.000032b8@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730113827.000032b8@huawei.com>

On Wed, Jul 30, 2025 at 11:38:27AM +0100, Jonathan Cameron wrote:
> On Wed, 30 Jul 2025 14:12:26 +0530
> "Aneesh Kumar K.V" <aneesh.kumar@kernel.org> wrote:
> 
> > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > 
> > > On Tue, Jul 29, 2025 at 06:10:45PM +0100, Jonathan Cameron wrote:
> > >  
> > >> > +static struct platform_device cca_host_dev = {  
> > >> Hmm. Greg is getting increasingly (and correctly in my view) grumpy with
> > >> platform devices being registered with no underlying resources etc as glue
> > >> layers.  Maybe some of that will come later.  
> > >
> > > Is faux_device a better choice? I admit to not knowing entirely what
> > > it is for..
> 
> I'll go with a cautious yes to faux_device. This case of a glue device
> with no resources and no reason to be on a particular bus was definitely
> the intent but I'm not 100% sure without trying it that we don't run
> into any problems.
> 
> Not that many examples yet, but cpuidle-psci.c looks like a vaguely similar
> case to this one.  
> 
> All it really does is move the location of the device and
> smash together the device registration with probe/remove.
> That means the device disappears if probe() fails, which is cleaner
> in many ways than leaving a pointless stub behind.
> 
> Maybe it isn't appropriate it if is actually useful to rmmod/modprobe the
> driver. 

Yeah, exactly. Can a TSM driver even be modular? If it has to be built
in then there is no reason to do this:

> > The goal is to have tsm class device to be parented by the platform
> > device.

IMHO the only real point of that is to trigger module autoloading.

Otherwise the tsm core should accept NULL as the parent pointer during
registration, it probably already does..

Jason

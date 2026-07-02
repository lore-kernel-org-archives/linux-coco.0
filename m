Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62CA30DD30
	for <linux-coco@lists.linux.dev>; Thu,  2 Jul 2026 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005580; cv=none; b=tkqkc/vZ/OAVoNeO6kC1zFQHD2JqR1EcRE4vcT/eFx0x2GxqgmTDarup/n8gWYBniiaf1s13Jt6k3yWmZ6l7ELyRqffadhyag6f/U9wVRjVLr0G/QIadfm4mwUDJf4Ehm5ui57aapWxz66SXCFz4IZwAg3r9Hn+GJT5mWDswAOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005580; c=relaxed/simple;
	bh=una0b7iSQE3/1X7UfiBFNzSBZGQVECZybRvoQUF1H+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m35COz0KsmTxEk/AbPE/M5NKBbwcEhrUEnhHmAIdaPPw/xGiMVkPcm5XQ5efhIS1kkOO3NWyR2yjxdADtblofrJfwfMnnff3DLD6eOxtrZHAmPtVgwYYaoln2QprtovgHjkJQqnWTYCSXCJt5fNeklbtIk3FSxkOOQEWmtdX/14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ndwCFHuK; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ndwCFHuK"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso13234696d6.3
        for <linux-coco@lists.linux.dev>; Thu, 02 Jul 2026 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783005579; x=1783610379; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=una0b7iSQE3/1X7UfiBFNzSBZGQVECZybRvoQUF1H+I=;
        b=ndwCFHuKINeN8wCfTs6+jYDPMQmUa/daKxB176zlXYOdTfSHPbw+c42mmeiUqVg8z7
         8hOP8V3tagcd7dVj8i3Rkw3rT9PY6V2wZhV2rXC/zbRt3PGL2d6U/qRIhJg04g0ph+ba
         FMet/MsZSAfFgoCc3MYP1rOF11zJkRxnaceS/BvhiSv6a5pqCImPzVF89eK6gKIziudc
         +2cn1BLiZIABHt2hY1KyTJ5I3hWjxsIk7HQTVYdqXjWaGpCniL6iO3CfxTJLLSxsZIt0
         JZkMF0ayA4vSfO4mFkK+JAZLDr8t3pZmryT7Mr+1fu584BaUxkW7Iy8iEZOOufGiXzhC
         mcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005579; x=1783610379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=una0b7iSQE3/1X7UfiBFNzSBZGQVECZybRvoQUF1H+I=;
        b=Qv/m289D0NLeMgwXmjAzMir7Im2S8ZclPadu9xBsCHADZIEZCVqltSygvDnLXQ/OT0
         c3SmwMT//WmLMXgvzzeCUvbp0VuqzlOLhbDEl2DbgqnJYDOiEIanl/jceiP40gYifpCF
         GUa3L/N/0qvoFo4V2Hv4m48WJTu3uFC9zAXzLwpyXTGTGOEwvgWCrq4D+3CGSh6WBgeN
         djkqhuuW6TUPMhMcoLnm2k/apzgDYiY6C42t5itONXwalNgPU5TBy/oeumpNEgovANdE
         20AUl4+L0HdRKzAADggfBL/36REFTFGsxN9H+DOk6zkp/4hXRvvg3N706l18FCTj1prj
         aJvA==
X-Forwarded-Encrypted: i=1; AHgh+RoYFAysIEY+KbkjPJkWz8J2X2/2be0atmZOmNq+yDDZBt+CB5qddNsfdWfLb2gspGkNOvf5ZxgnVVmM@lists.linux.dev
X-Gm-Message-State: AOJu0YzSlVbRG5h4JCF5Gw9gNWGH9C095hPSQRfQe1bIUntzOWNHNMu9
	r4B0dJ31SebCbNjf+lwxNeYwGqYBma3mc++806rM00o+H9iHUUqgssHekjzHpd+kn04=
X-Gm-Gg: AfdE7ckn1ZQQ2EtKqoPzDUx+QnC0l8mj/wH1++HfiYkJDP7WPcFGFly/M2IoCF2aJwK
	WBnhjXxQQdH2MZ8Vp93boO+MdXpvXVn8Tm0ReAyN0KVsfTAS+3SbYrtmZfP/vu/v1otjZ7LTYlI
	/7Jtr+X1gwJ2zgnZlud29g4I2t2RqMrpdV0wXxGD1oE6uvIWzO2O8ZVwhJZBqYegQvJ5H3kurOU
	oxDLxGfICWpYMv9k46WdLtybVgO+GkOhZT0Y2DuxMvbmeNqcpixkrHBW9BmlScAS8RxSd9HAqXk
	wvTvO4uI02tyze9sG26PHx0+YthMUVxuhB8BJci2ZxBeXHL7yCf+1i/bLgFtg0cIxxlAvBRCZA6
	pbW0zMDSFdEJKQHVmsXg/kOQNIQrylK7ZWZZe0VprprkU40ndjeDG7yYJ7Lan+f+o92fSxqpjqA
	GN4sEIedWPRGMo52SXYaeFE2Ep//1+ajcKYtL+9KzjIrFXv1oI6SCNIc34a/JnniGiLHY=
X-Received: by 2002:a05:6214:4208:b0:8de:16a7:fbe3 with SMTP id 6a1803df08f44-8f3c863d139mr68985636d6.31.1783005578597;
        Thu, 02 Jul 2026 08:19:38 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de93a1sm27985376d6.34.2026.07.02.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:19:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfJCR-00000005wsj-2X8o;
	Thu, 02 Jul 2026 12:19:35 -0300
Date: Thu, 2 Jul 2026 12:19:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260702151935.GR7525@ziepe.ca>
References: <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org>
 <20260619122148.GL231643@ziepe.ca>
 <yq5aldcaejos.fsf@kernel.org>
 <20260619140616.GB1068655@ziepe.ca>
 <yq5ao6gtoncp.fsf@kernel.org>
 <20260630174216.GK7525@ziepe.ca>
 <yq5abjcro17x.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abjcro17x.fsf@kernel.org>

On Wed, Jul 01, 2026 at 08:39:06AM +0530, Aneesh Kumar K.V wrote:

> This is the only code path where we need to special-case host memory
> encryption. For this reason, I have avoided renaming
> io_tlb_mem::cc_shared to io_tlb_mem::unencrypted. I can send a v7 with
> the above and we can review the changes based on that?

I'm OK with this

Jason

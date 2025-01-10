Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371724B241
	for <linux-coco@lists.linux.dev>; Fri, 10 Jan 2025 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736537068; cv=none; b=VlNmnkFMAn+17+02YTg/DgSSzQ0FfWEfFpXoiJIb24Zp5CmQUC9ILQot77McohJKqpgISfj5gHsoKQ7ZQJf90kgz/M1iBj9BiKoadSih7tEIdVOgn6IaLJcN6MKWuAkPzWep5XAvwBD3IQ19WZ/e/Sd8LNc/avQesOoPTO+UXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736537068; c=relaxed/simple;
	bh=GAXiVwRl5hX0nr5x2c6GDMtUgYBmYNxhBnIp/PYb1FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUZzgP84Vjbf3dS9m81N/vvvtjKBpT26oCa7imBFgZrhuc1Rz/idX69R+oGX0/RJxebT4Wy5vYZwYRW+I/AvvcVDLYQuOBnFs/She6Ljwq09U55/UpsiMAQUzLHiH6pfIsUuDBAJLPeBOTX3jooEJ2IFOAPE6ChFEt8VU4ZG29I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=PYG+VOVs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PYG+VOVs"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f796586so25850795e9.3
        for <linux-coco@lists.linux.dev>; Fri, 10 Jan 2025 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736537065; x=1737141865; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ACopzyajfJRcuBL6kkHr9KV+I23S42u7LRA+BIOf1M=;
        b=PYG+VOVsWEUr6gEHy/IMDKGZtdCT3Df32y97ghBXRCM4ifRMOo3QMJsc7m8YodL+2m
         F9hTGPF4KogmTTDP4MkyKBGHRjgVUGEnrD9uRcvgQ13Fr8W39+HMSkDWXWMiH474/kqh
         9xtxXWW8Xb4z4VDuIn+ON/By5bkghOMoscCvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736537065; x=1737141865;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ACopzyajfJRcuBL6kkHr9KV+I23S42u7LRA+BIOf1M=;
        b=sTbpMH4vlkksG3ws3m/71kLLck+MR1kcIAgOYucq+zYpxg5LMD+n6/yRrJJMRimiuu
         6r5lXr6N3ufZHrx2RBfTw6xIycqfnZj2kuxTGEnSy08KmOetC7NxoadIe3++gD3W1Z8p
         JzkCRIma/ELPowqpDT5XSV0yOR+3bKa0scGc5u/WnJrzZYKbggNYrHp771j9tO3AVfA+
         tzWsqObgbijsti3879uE6JJfvyNmWoOw3sStb2NOom6VAk0Dti1Fiep9JCmCc1tI0Srz
         2ckx1ibVy6RWCXnuMc98U9t/dDYqP2ShMkkkK2M1XHMBA9hihbqUM+azxF+qHeB0As4E
         WS8A==
X-Forwarded-Encrypted: i=1; AJvYcCXIdZU4cE40GBlMOsJauMMWRAfaU2ci5YKX2/jTGqAxEl3tTl1u1AXJmk438vtFLuVrJr51vTbYogVC@lists.linux.dev
X-Gm-Message-State: AOJu0YyoSWVPfPKQfyrb1pA5k8d60sIo03k5U+BQLOtPeSEtrYrbg4iv
	6ImGu7CyY8L8hp8lFJxcjavLnr+lEtlxtmCJSGXKO6k9aiyWUl7SEKMJy58frxQ=
X-Gm-Gg: ASbGncsBkEMJWHoV+rwKI7cDCZ+1NHBu1CVTcHYDJkaQGgQlGkvns2xKb+vZtu9ihgX
	yIUeqst6TpbuqPell7aLIMMVSCv2Km1yAarCTgwTdryLTGui4+jjC6Ni1hLAIxCh3JpuieJ/FVx
	UV/AB+MBFnhV2G7rNQeEocsSSfQadDfvDmGGRoPNYBH50mVS0rCRwIUrjhQmgyZh3gmD5KCiIoF
	ZKGqvs5WyprhWtM1jgAwnkiRThudToT40CWQPlmviujMzp4Em6IjB99QUe2ohsJjYSv
X-Google-Smtp-Source: AGHT+IGQsKQI4LrL1qdpFjuY9ZWEttHxIv9pv69yZaLOwftdrmmCEXmYM32sp7WuieWtkMyPIHFCuw==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436e25548e3mr2817985e9.0.1736537065429;
        Fri, 10 Jan 2025 11:24:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d11csm5313117f8f.16.2025.01.10.11.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:24:24 -0800 (PST)
Date: Fri, 10 Jan 2025 20:24:22 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
	kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
	alex.williamson@redhat.com, vivek.kasireddy@intel.com,
	dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z4Fz5oiia1JGWIgG@phenom.ffwll.local>
Mail-Followup-To: Xu Yilun <yilun.xu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
	kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
	alex.williamson@redhat.com, vivek.kasireddy@intel.com,
	dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Thu, Jan 09, 2025 at 01:56:02AM +0800, Xu Yilun wrote:
> > > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > > exporter mapping is possible
> > > 
> > > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > > confirm that this isn't true.
> > 
> > Today they are mmaping the dma-buf into a VMA and then using KVM's
> > follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> > dma-buf must have a CPU PFN.
> 
> Yes, the final target for KVM is still the CPU PFN, just with the help
> of CPU mapping table.
> 
> I also found the xen gntdev-dmabuf is calculating pfn from mapped
> sgt.

See the comment, it's ok because it's a fake device with fake iommu and
the xen code has special knowledge to peek behind the curtain.
-Sima
 
> From Christion's point, I assume only sgl->dma_address should be
> used by importers but in fact not. More importers are 'abusing' sg dma
> helpers.
> 
> That said there are existing needs for importers to know more about the
> real buffer resource, for mapping, or even more than mapping,
> e.g. dmabuf_imp_grant_foreign_access()
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

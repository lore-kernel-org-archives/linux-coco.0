Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C6299924
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754419343; cv=none; b=eR5XUXLqOuCwuEQ2OQ49uUngqilu8HuZqdr1GjKoEs88w9SxX2vxfgcI7QhPBRSRG5SaiLhYCIeP+PNJ1CEZrh0/DmxI4+dg3TlOEeQ21CkMqJJFyCdEi/U/xcb1SbCEmx+GtPxzY02MAhAXG7ApyFxwuLPS95m6ebsL8653i9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754419343; c=relaxed/simple;
	bh=P46mtJ0gCpHpBEjbtuFgOf8BIfh7RrO1hxnNGIV0+78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gH55adoUziTNIaIppZd9qgoQABDIKoESAVpOD4uElNTi+/0mF1cLYwr5CC1Y78Pfj1yJlwPpRGFJ1YhhWPYjUTHmCYmEDcEbL20C5EqIyc9s05+r7Vvkh/Y0dpeepw1n33FlAoH/1z2+hr1O9EHXr1RFLTzhxlFtl8UxUYC0cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KuHUop3J; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KuHUop3J"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e32cf22fdfso536115385a.0
        for <linux-coco@lists.linux.dev>; Tue, 05 Aug 2025 11:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754419341; x=1755024141; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7XB7GrHToBPhXF/Sktcv3tgOaDMdGgdpINsfi2+cJw=;
        b=KuHUop3JTUcwDaEz4b1dHEJP6d1O7cVFElZ1nXMtbZliKgVzq4DP0SCxN6NLepZloQ
         vKUUsc9QCszyol2d4htCJNjVpZgGB5c4qGU3rO2VUTl0Dt4NizwR4zgTANtYzhRbrcSG
         PR1I2//ZU93y0IQWLrTm3bNhhDCibe4uPS5jUYPA0z8gHiB6wb0f01uyGpXW9tCQJU1c
         HjzN0znIKtCFuiakCYAm4rkySiCvocT2wqkI4mF5qFD2dHUOKeftlE39h28dv6W1XPF5
         SI7ogTMRjXH7vWr6bKVVuGEIRc3YJJlgPRaJUwZ1aexhBUL+gJlsO5WhZhOfeGX11CYf
         2z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754419341; x=1755024141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7XB7GrHToBPhXF/Sktcv3tgOaDMdGgdpINsfi2+cJw=;
        b=Ou5ZBUzqHkCRA3R8sfHh2nOll0RAxLNMgatI5iVC826qRfG68EFJKIPvamAM4/SZL3
         Y50DBRkyDBJjEfASix1trZhcDyqgb9eNP9qwX6mnUi20ALql92NrHowvlsiUf8O5cvCk
         sS2zFTj+Xkjc45lYDsRuuZiEiRthE5eBwYx513wmz3XhUHgmOnDrypf+EsRiJwPHqH+D
         gY0tgt849Q2+yFV17X+Zje7/eQfwezf86ZAijvjO6069BPUKgO0555Ha2YmujZ1U3ago
         JnvooyGlNbgmPT1Wx4qitVfyNH8GYEtVNqP81UiEhzHdPs/dLOyfwyGt4GWUumnu1nkp
         U0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYVcgNBL+1jz8TAkUBMCIhBCM+9p8zuyXa3E7bEwdXljxJ21COQ4A4O/WFKH1DrlwhHiEvdRFWfcg6@lists.linux.dev
X-Gm-Message-State: AOJu0YzS5RXPqYnTFTFA5yl8BIFSHY1b9yCXOsBp0byoAUkN0kmzSW69
	yyaqjNIDtTyk84WJ4ig8SWBG4IwecC/9NjmI6ry6vZYV1INNrJW3yRRmpvrH6JYmG/8=
X-Gm-Gg: ASbGnctRT/hvpsdWYNKwzPEIVu0ed/QQF/W25sA8GIgGCSG2N8u5buKCgYa1CneXNIi
	WdeLJqzjsYX566bMgFACcU/Yq77L3vS2HOJTGGmJnZ5Pp965+JGc6JIDrboBcNGi+zJOXKBWYlr
	AuPv5hn3uu096PsgqdSchY5VOGDzhEzFL7yNBa0QVwPLdI3TBwBmo+H9WG7WGu0ChbbfWjkoI9W
	4KEeeqfZQzq7BMWiWgCEJtv1lr4UHzsUobS/EEyP1B7XccV78LXHkf+fX01xQ8ASmn8crifXn2I
	XunpEViam2AOUwoborZ6kyQVi4P5kEZZ7MRWAuIs3Q2ICMXtkl/8pXVD7nG90O/B5DiEcat8cdF
	WmYQ8lgU72OETZhRY/bVqP6XNE0aO5W++FXCbz66VFfgKaL3g65s3C06EEeOHwOkkxrN7
X-Google-Smtp-Source: AGHT+IFJzYdfGQoh/nIgvuIB92GlB+9KcosE0NpiAsp7dbUcQ9i0SxxUhRh1JZQ7lvAEKF3yp7Ujtg==
X-Received: by 2002:a05:620a:a91a:b0:7e6:30f0:82bd with SMTP id af79cd13be357-7e814dae548mr48217385a.33.1754419340508;
        Tue, 05 Aug 2025 11:42:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f594228sm692985285a.11.2025.08.05.11.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 11:42:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujMc7-00000001aDl-0KMK;
	Tue, 05 Aug 2025 15:42:19 -0300
Date: Tue, 5 Aug 2025 15:42:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: dan.j.williams@intel.com
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 00/38] ARM CCA Device Assignment support
Message-ID: <20250805184219.GZ26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <688c2155849a2_cff99100dd@dwillia2-xfh.jf.intel.com.notmuch>
 <20250801155104.GC26511@ziepe.ca>
 <688d2f7ac39ce_cff9910024@dwillia2-xfh.jf.intel.com.notmuch>
 <yq5acy9a8ih6.fsf@kernel.org>
 <20250805172741.GX26511@ziepe.ca>
 <68924d18a68d4_55f091004d@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68924d18a68d4_55f091004d@dwillia2-xfh.jf.intel.com.notmuch>

On Tue, Aug 05, 2025 at 11:27:36AM -0700, dan.j.williams@intel.com wrote:
> > > Clearing any of the following bits causes the TDI hosted
> > > by the Function to transition to ERROR:
> > > 
> > > • Memory Space Enable
> > > • Bus Master Enable
> > 
> > Oh that's nice, yeah!
> 
> That is useful, but an unmodified PCI driver is going to make separate
> calls to pci_set_master() and pci_enable_device() so it should still be
> the case that those need to be trapped out of the concern that
> writing back zero for a read-modify-write also trips the error state on
> some device that fails the Robustness Principle.

I hope we don't RMW BME and MSE in some weird way like that :(
 
> > Here is where I feel the VMM should be trapping this and NOPing it, or
> > failing that the guest PCI Core should NOP it.
> 
> At this point (vfio shutdown path) the VMM is committed stopping guest
> operations with the device. So ok not to not NOP in this specific path,
> right?

What I said in my other mail was the the T=1 state should have nothing
to do with driver binding. So unbinding vfio should leave the device
in the RUN state just fine.

> > With the ideal version being the TSM and VMM would be able to block
> > the iommu as a functional stand in for BME.
> 
> The TSM block for BME is the LOCKED or ERROR state. That would be in
> conflict with the proposal that the device stays in the RUN state on
> guest driver unbind.

This is a different thing. Leaving RUN says the OS (especially
userspace) does not trust the device.

Disabling DMA, on explict trusted request from the cVM, is entirely
fine to do inside the T=1 state. PCI made it so the only way to do
this is with the IOMMU, oh well, so be it.

> I feel like either the device stays in RUN state and BME leaks, or the
> device is returned to LOCKED on driver unbind. 

Stay in RUN is my vote. I can't really defend the other choice from a
linux driver model perspective.

> Otherwise a functional stand-in for BME that also keeps the device
> in RUN state feels like a TSM feature request for a "RUN but
> BLOCKED" state.

Yes, and probably not necessary, more of a defence against bugs in
depth kind of request. For Linux we would like it if the device can be
in RUN and have DMA blocked off during all times when no driver is
attached.

Jason

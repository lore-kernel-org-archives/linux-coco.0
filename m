Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625521A447
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754422738; cv=none; b=iE0nF8zzYAzRMd5+/3qsCDhWysf3IIC7r52/mkprw10NUT6JXpYEBIz5hh/Wzaf65IbiQ5qr/XKBFoPzFi8YqqmTN2fx67cIfGP1pHQkVLHNFQ1xUpD8+KuZWe0xF2XvE0/W6gGbwVu/D7W1vFWWUPt06XctOtLhD2vdyz0DLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754422738; c=relaxed/simple;
	bh=d55My0lJH7EW7U+QyZ/8kq2QwJb2wcxt82jheLEtpaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp4i7RLNYaYA84N7bTZkmqQc4j4cFGAkdYEGDjUYpCgpY9ab1IN3Oml0Bq/RaRaxcTmmtB0Q5tMJMWkl8JXWyWk7tRPOatv9Jg+xbGoiJ0Y3S0kyiV8Q9iadV44zzGpgRKL8kjuPG/JIs5Sg9Zq0c7L5/c7nOiB8EnJQyjH7EpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ccx5f+H8; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ccx5f+H8"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e8053d3382so27086585a.0
        for <linux-coco@lists.linux.dev>; Tue, 05 Aug 2025 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754422736; x=1755027536; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WfLvHR5VGzBySOq4iOqpMOpGA+jfUgtajL+0K128VgY=;
        b=Ccx5f+H8ReLt3lgU9bpJStvviaId/5HbxJa/Gl/qdNQkF7MhocYljPtJQvDp9WKcBa
         AhOTBkdDZL4N3OvOMBIVq872AcJlT+Qg/i2ps6Daia+uILbGCSfmo3U/35Eggr8zh/zc
         ZhcIssU6sb8Qrem8G+lHXK5mfpHKIgt2Syq3rW9iBMJyInN3ZT8DlpZkeImdz6Hc/xvy
         puElOcc1b0tIXPtk2tHLJwm5hEDZ6LPxDKXhsDwYDZ5FxLPvcaKGpSzB3a+ynPFo18Z7
         OYW/z78jg4DNnzfJh+iLXkyj1Vm/U7ulRaUvCCCpXtsAWrzf43SqMkg360GSqAVtK1qS
         psmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754422736; x=1755027536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfLvHR5VGzBySOq4iOqpMOpGA+jfUgtajL+0K128VgY=;
        b=Uo2hu20Tnixvdjaw/ZQ35JVtKffiMMKvfqk1tYQkvX2bdh7td6p2AiFaFCO+SiEXYY
         YVBDoOlDvSJLdW6kwoOz0ZAL2J9uBu1Fh5hmNpY++mwPtfuW6aklfvUC1YsHbUDb/pz2
         LpBeVcauJbjjBacFulbEnU49hLO8Io64fjCjY0klYUcjTowycJ+7uGumyC5NbuHaVGfd
         tjUtOS4tmL4kl4ZleoP6gbBQ7GRGVIxZ7icGUVJ2IACNmYIdB5webXS0b9omVHSssRjK
         +vDcMu0I1Yl7kW7Vqt3SK/yHDp2LsuwdgrCR2Vo/g2TPxsYfrQB12lwuSyI7C7MZK4HO
         M3qg==
X-Forwarded-Encrypted: i=1; AJvYcCWrDhnrk+eCxdIAzwrA0XkoiMPizKwUOEk2gsXb9dzF535ngBjKeRY8YJce5VA8OXT+cut6ilOSQL25@lists.linux.dev
X-Gm-Message-State: AOJu0YwzHJAp99XtaDpbmjqXmRj/WdtoC4sAAY1FNVonjWn9W9TVGL3U
	9T3oXhA8V5+DdXglG7SYohAdhKJANQvQQCWWrGoJvRlXGnYH/IPM1ZrJT7YAIOEy4EE=
X-Gm-Gg: ASbGncvsdUYn0Pn+fhxNlchwu+JLjGB71ZZPduN+iJCE55uc9+NAaUsPs9AEC3eMQip
	moYwbP6EWmg0lMlJt0jnWmdLlu9Bpp51oaen2A3xoSt8zbRZv9/N1q2kksjUfZwKk0kdy3asNC7
	wKwVVz7oLrt42dOKfS99SvDS76xprSo25a+naPmJhUkcgsdwxh882ZATvG8f098OMzk2QMsPVgy
	bru6ELX1HDfPOaKyfur6rhr7NcfH2w0HGHvPkzRu7lNg109w5nZ4pelPBHO77eDIg/BSSOqH6Si
	13HBwSZlFXNa3u11cFBzJ0NAPIo2jIgdeXF+/O1MMNigltiTi7/XjIy2h6uh+3fHPBkHwyQPVGq
	ucFRbNURYQxrQKzMhA0gevSxrKH5v1M2s9kgZ3RGUv9KuwsRon/52tHeESUGSBEr+GLM0QGWFmc
	0PlRM=
X-Google-Smtp-Source: AGHT+IHKL5erm4l2X0vMQA58xzXa6BvQRyAOGPl1hFFlslB9qavE3XT0GkQjfse/P0NHo2ZevfOtfQ==
X-Received: by 2002:a05:620a:45a4:b0:7e3:3001:47b5 with SMTP id af79cd13be357-7e8156a5942mr24897785a.1.1754422735775;
        Tue, 05 Aug 2025 12:38:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f7064b0sm717749885a.54.2025.08.05.12.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:38:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujNUs-00000001abD-2dVJ;
	Tue, 05 Aug 2025 16:38:54 -0300
Date: Tue, 5 Aug 2025 16:38:54 -0300
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
Message-ID: <20250805193854.GA377696@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <688c2155849a2_cff99100dd@dwillia2-xfh.jf.intel.com.notmuch>
 <20250801155104.GC26511@ziepe.ca>
 <688d2f7ac39ce_cff9910024@dwillia2-xfh.jf.intel.com.notmuch>
 <yq5acy9a8ih6.fsf@kernel.org>
 <20250805172741.GX26511@ziepe.ca>
 <68924d18a68d4_55f091004d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250805184219.GZ26511@ziepe.ca>
 <6892562356e53_55f0910010@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6892562356e53_55f0910010@dwillia2-xfh.jf.intel.com.notmuch>

On Tue, Aug 05, 2025 at 12:06:11PM -0700, dan.j.williams@intel.com wrote:

> > So unbinding vfio should leave the device in the RUN state just fine.
> 
> Perhaps my vfio inexperience is showing, but at the point where the VMM
> is unbinding vfio it is committed to destroying the guest's assigned
> device context, no? So should that not be the point where continuing to
> maintain the RUN state ends?

Oh, sorry it gets so confusing..

VFIO *in the guest* should behave as above, like any other driver
unbind leaves it in RUN.

VFIO *in the host* should leave the RUN state at the soonest of:

 - cVM's KVM is destroyed
 - iommufd vdevice is destroyed
 - vfio device is closed

And maybe more cases I didn't think of.. BME should happen strictly
after all of the above and should not be the trigger that drops it out
of RUN.

> > Yes, and probably not necessary, more of a defence against bugs in
> > depth kind of request. For Linux we would like it if the device can be
> > in RUN and have DMA blocked off during all times when no driver is
> > attached.
> 
> Ok, defense in depth, but in the meantime rely on unbound driver == DMA
> unmapped and device should be quiescent. Combine that with the fact that
> userspace PCI drivers should be disabled in cVMs should mean that guest
> can expect that an unbound TDI in the RUN state will remain quiet.

"userspace PCI drivers" is VFIO in the guest which means you get
FLRs to fence the DMA.

If we end up where I suggested earlier for RAS that a FLR can check
the attestation and if exactly matching reaccept it automatically then
it would maintain the 'once accepted we stay in T=1 RUN state' idea.

Jason

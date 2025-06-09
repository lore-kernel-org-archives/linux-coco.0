Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F29192B7D
	for <linux-coco@lists.linux.dev>; Mon,  9 Jun 2025 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456175; cv=none; b=OxkHZM8U6CxzBpZGBEz+O2RrJq7K+bHOjj8L8qU+ommb8/LIGcsX9JOhaOU45QOcZytNG/VCdaQQjnoB2ZmwUbKvLoh71IDm7Yl90a7c9mYMK8QI3AAnALFgiTLJvKJNWN20qoSW8YwlewVVxquEFY6xiMwwkojBpdA0eVyoSpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456175; c=relaxed/simple;
	bh=7rNEGkBan0eoSoeImZk17eMKapBrfhPQlHCxzftBoV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioOXYx3Nttaf5uOiM6fhZcaISiUUmYI5NVLdsU0h3Z2ceOCyR899MWQLMlWv6bZzSsvbDNFU5sThJ7vJmpnwA+t3b0DX6poh36VLbFl1M/LsomMSuKRWlTxf9qVZYYfCpUg8caYwlPSfu2prl0EVC95jC9SvvnSxReHR3MaPfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YFZAge6i; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YFZAge6i"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso508221f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Jun 2025 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749456171; x=1750060971; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8jEVH42C4V4RM7OPBVpernVaAA5iY2pieNHM7q6gnRY=;
        b=YFZAge6ij+Pcj1TuUJGPeKA6Wx+otiZJN/aPRCVE+6ha8R+TkocYT1+oHAP4KK6HuO
         udJX9VoIxRkeHxUlothanYL/Pci5EMiLSOJ45TANS3Z8ITY8KGy6PJMcI1O2NE6UIiCe
         O5WztFx5a4aYI3NcjjUSFazx5Ij9SGCrbr+jnDzfMDBNSL16tNm6GL4Bz9rppR7RUxxa
         F8wuz1AyjfpSZqR2BuSjiw8CPvw6rETCSjW8208bA5jyOMD+74YbYBJViFPpBj+CHhLj
         aYEoHvDJkl+P2wMU6yg//C+fAXl5ZG7Vc3cAe7nr5r7AoYHDdpOQqElTB+kiie+0adxJ
         lygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456171; x=1750060971;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jEVH42C4V4RM7OPBVpernVaAA5iY2pieNHM7q6gnRY=;
        b=s+f76AIuw+kpnd66Or9aB1f3DPhS/XGRaDyrUHgtY7phJW0shdR26hw4V7XZCAA5/W
         w0JfKw5yGRDlUg87lBmLJN2plF4xVJ2V3DPSedSDpfbNLWBEk3mJ3z2Gzy9828eztVb5
         UlCEJIHNc1sx1KiA69hL8Wba0GIGU+DJpAuAUiGsn7d/MFM2L4OBHbFaFIpbMcr1BBGm
         62bs8DQCidK1w/s0lP53NTthUY1usbXCcHuHI6K0jeoAcYEBQdSX+7QWCMBlXydKXmng
         aNDj/GOeYIcFy9E/BDCRbLFIUgqK9bE3WwAvgzTHGsIteyPBN6O7qCuyBWuGGUVWcvjr
         kOKg==
X-Gm-Message-State: AOJu0Yxi4y8Xkgk/U4MevVe+FLORgu48BRCL+66K/M8m7RMWWkUA/Hmo
	kBGrsKsWPCsLhgT7UGdM+lDsswvhcSw8LQUxLOpHDoM4rLx1GI9u7RAzG8fNjyfyGfw=
X-Gm-Gg: ASbGncsFZ+s0D0QqeGDZyaKn6/UxkjmuY1/IyktI7z0i1G5TwsboQYwYFerGzPD713x
	9P3cZBIH04G9G9wWsx3/BlI5y2RgDhd66PBiY2i4+Y1626kTCvIN7HI+YcvCSq9YRaF2rOKxk1e
	Lh3IwcJAhVqlQWL6uJsVvhv6qsm3HnF+QX4TbNAfEkNx2suJMxQlIb14A3muNKdCXk1yjtRWBDn
	r1f1W8Mrl7f45/jb0F6x4wB+aQ9GTgS56ctGNAYC3ONAJvTaj4N7HmkxUM6BWSwyFr3EtnRZkjV
	gSX4kBhY4sVcVnbGdzWm6aNaIWnW7iYYIOv8FuzQ/QI3e7OzxEbIcAvFxvFyVCwML2Q=
X-Google-Smtp-Source: AGHT+IFvRF+XgG4wncrB+z3N9gR+KJXYed7DBae2qonjrbB3EvonuPccnEzcGgZ+DZftSs3V+DzeWQ==
X-Received: by 2002:a5d:64ce:0:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3a531cb90fdmr8885623f8f.51.1749456171200;
        Mon, 09 Jun 2025 01:02:51 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm8868270f8f.76.2025.06.09.01.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:02:50 -0700 (PDT)
Message-ID: <175eedc5-d82a-4b3a-bce6-2caf625597ca@suse.com>
Date: Mon, 9 Jun 2025 11:02:49 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/20] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org,
 seanjc@google.com, pbonzini@redhat.com, eddie.dong@intel.com,
 kirill.shutemov@intel.com, dave.hansen@intel.com, dan.j.williams@intel.com,
 kai.huang@intel.com, isaku.yamahata@intel.com, elena.reshetova@intel.com,
 rick.p.edgecombe@intel.com, Farrah Chen <farrah.chen@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20250523095322.88774-1-chao.gao@intel.com>
 <20250523095322.88774-4-chao.gao@intel.com>
 <d1ec91ad-b368-4993-aadb-18af489ea87e@suse.com> <aEaS3i5JhgFX2MCh@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <aEaS3i5JhgFX2MCh@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/9/25 10:53, Chao Gao wrote:
>>> +config INTEL_TDX_MODULE_UPDATE
>>> +	bool "Intel TDX module runtime update"
>>> +	depends on INTEL_TDX_HOST
>>> +	help
>>> +	  This enables the kernel to support TDX module runtime update. This allows
>>> +	  the admin to upgrade the TDX module to a newer one without the need to
>>> +	  terminate running TDX guests.
>>> +
>>> +	  If unsure, say N.
>>> +
>>
>> WHy should this be conditional?
>>
> 
> Good question. I don't have a strong reason, but here are my considerations:
> 
> 1. Runtime updates aren't strictly necessary for TDX functionalities. Users can
>     update the TDX module via BIOS updates and reboot if service downtime isn't
>     a concern.
> 
> 2. Selecting TDX module updates requires selecting FW_UPLOAD and FW_LOADER,
>     which I think will significantly increase the kernel size if FW_UPLOAD/LOADER
>     won't otherwise be selected.

If size is a consideration (but given the size of machines that are 
likely to run CoCo guests I'd say it's not) then don't make this a 
user-configurable option but rather make it depend on TDX being selected 
and FW_UPLOAD/FW_LOADER being selected.

I'd rather keep the user visible options to a minimum, especially 
something such as this update functionality.

But in any case I'd like to hear other opinions as well.


> 
> It may or may not be wise to assume that most TDX users will enable TDX module
> updates. so, I'm taking a conservative approach by making it optional. The
> resulting code isn't that complex, as CONFIG_INTEL_TDX_MODULE_UPDATE
> appears in only two places:
> 
> 1. in the Makefile:
> 
>    obj-y += seamcall.o tdx.o
>    obj-$(CONFIG_INTEL_TDX_MODULE_UPDATE) += seamldr.o
> 
> 2. in the seamldr.h:
> 
>    #ifdef CONFIG_INTEL_TDX_MODULE_UPDATE
>    extern struct attribute_group seamldr_group;
>    #define SEAMLDR_GROUP (&seamldr_group)
>    int get_seamldr_info(void);
>    void seamldr_init(struct device *dev);
>    #else
>    #define SEAMLDR_GROUP NULL
>    static inline int get_seamldr_info(void) { return 0; }
>    static inline void seamldr_init(struct device *dev) { }
>    #endif
> 
> That said, I'm open to keeping or dropping the Kconfig option.


Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0863176259
	for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855304; cv=none; b=KHiIIHZIuC4rJD2c9lyLQjuD/g8rEUeb26gpV/yfw/UU/xQ/REI3xE93OvLGUDOvMaFdR6hde+00oiorfO9yXdpLwYGfl1jY95HG4HnAVjPqvE2qybXJ6RdawEnjcOqTUv3bNXbP0JtH+e4xhocyTRfn+ii8HLQGgsOulB9tEkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855304; c=relaxed/simple;
	bh=IqCHzZOe2MefKqf1QB3jOGgwTrRJJ43Amw8xlR1fSCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiwXO0RMZHmg1rwXwUR4wM5Q1EjKe3TlLCXo04LqWzyFCu6oxWlJE/F2cUG5BZ88fdOwskQ1Wg395cWEJi3X6Ikn31YuWPIOs5ezlli0DDcNCvkO2mTtUUtj1YtvMFtrg1zhdNg8JSXLA3q7HRkPiS+DvojuzaFj5zZgoPBK2Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T4lByg0e; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T4lByg0e"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37198a6da58so4744862f8f.0
        for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724855301; x=1725460101; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wi8HafCTKyKeL7eno3kK3ziDMFF0EjcyEtRLeesAbgc=;
        b=T4lByg0ek/Pk20F0w1SqveurHUgbFw/Hqv3Eld8CG87GYv6frkJqr2G43z/02kTp91
         0KJ56ZdeXeY5Hlikg+XjbJLezlr/zLMfp33dPomZrDnToWQy1Bt+ndftjH+hoorKk1Nt
         72sMA/a7rt0ckObdEZb0jkXnQpI1lRjsm7K6eh9719vkM2Rxugc9yoVrJqhunRklKCh8
         HzhjEzHMYhy95aFo1yqUiNXyHWYluFgLUR1M//QqjRb/z0XHUVAQ43OFDkct2CMobQgs
         zgKf91BQxchesZwMv9WegmvR1I4HgVUKye/Gi3KzuwqhtelhQ/FYpxKTg2NlgLTBaxJB
         8WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724855301; x=1725460101;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi8HafCTKyKeL7eno3kK3ziDMFF0EjcyEtRLeesAbgc=;
        b=bnLbXyGcgHLOTaFzz5rRW0rJqCdZVrMarHys11OGSyvMud9OFzNrstBZh63Y+lhu2C
         YPIEwKmKOWo1GBb5knztbQE68pn9SpFzbmahXWXz6jxaCOklJRPzflou1r+vWF7TNUBn
         U9icPxTHz5LfG8OI4ageybnD4Wk/Pasmd3nLmn+11+7Xdx7ta/2NyQBmChL+336EbaU7
         HLBNBfBvw1tV2y9v4TbNwfEMv0mDTtzGLEzCDd1DFody7GbC9g9nOaV6nW7tRQXqEyKs
         Yj6Qy73iYcS2G8IEGXe8SWbZZ7hXZz2mGCICkZVWmF4086JjfLpLI7aISz/D9eEWFG6p
         MhXw==
X-Gm-Message-State: AOJu0YyCxBHK8u82RGtgcW/rdk/4FdmGEUmbGpVA7u4hH5biFz3x5J/1
	A8cV3ZnhMR4cl6fxWckJqGgoeOWQEL1Sg1NRtmd7/qQgb5lnI9qjUQzg+MzGzgI=
X-Google-Smtp-Source: AGHT+IEu7+LqB/pIxxiTDjSXFhGZ5Uc89Xd+FMOCVfwIMBD9B6VLwoTWWqYC4EhfY9FURWCBWOpHMw==
X-Received: by 2002:adf:f001:0:b0:371:7c68:7cd7 with SMTP id ffacd0b85a97d-373118e33d2mr12898139f8f.56.1724855300934;
        Wed, 28 Aug 2024 07:28:20 -0700 (PDT)
Received: from [10.20.4.146] (212-5-158-46.ip.btc-net.bg. [212.5.158.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e548624asm250836966b.42.2024.08.28.07.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 07:28:20 -0700 (PDT)
Message-ID: <015695ef-d05e-4efc-8bba-03d4251db80c@suse.com>
Date: Wed, 28 Aug 2024 17:28:18 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 1/4] x86/tdx: Introduce wrappers to read and write TD
 metadata
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kai Huang <kai.huang@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 stable@vger.kernel.org
References: <20240828093505.2359947-1-kirill.shutemov@linux.intel.com>
 <20240828093505.2359947-2-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20240828093505.2359947-2-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.08.24 г. 12:35 ч., Kirill A. Shutemov wrote:
> The TDG_VM_WR TDCALL is used to ask the TDX module to change some
> TD-specific VM configuration. There is currently only one user in the
> kernel of this TDCALL leaf.  More will be added shortly.
> 
> Refactor to make way for more users of TDG_VM_WR who will need to modify
> other TD configuration values.
> 
> Add a wrapper for the TDG_VM_RD TDCALL that requests TD-specific
> metadata from the TDX module. There are currently no users for
> TDG_VM_RD. Mark it as __maybe_unused until the first user appears.
> 
> This is preparation for enumeration and enabling optional TD features.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

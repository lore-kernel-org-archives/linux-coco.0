Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C4E20DD7F
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307687; cv=none; b=DH7VWLzREUI8COa+eOhowjYLq7UNHcCHFHFUDW7EncqyHZvTtDP19Lv1+NiTg4hJCkKCgIIvscRB6BDOHIWQ4ybv0qCcJz9mtM6ofLlFd96OW7it8iDFmiqYqqP3ZJND/s/RKRlRto8R5G35XRvqSrfbwxmtOdB7lZm3eBHdvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307687; c=relaxed/simple;
	bh=bSK+2TFYlBo+88nBmG72X8WSTHc6hfb3JBW4AQsB7/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NO9BqDZA3KaSSMK6XpWDNIIt1W9DNRC+8EgX4066oQuaAWIgE7+aKOCUKcBt6xuj7YzdBlSWb2nggiQ5V8ocPCJygoBCY8LctbGr3YbE0tZjcSvu4Moopxnrgknw40+/Gy2DLQzUD8inNkR93Rp7xd6R15jQf63zYFch6wN2B6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bH8OxPYj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bH8OxPYj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso23472545e9.3
        for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742307683; x=1742912483; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxR27kQuwBEt7OQtqQ55XSsL464ltVf3GaX2mQdx5wY=;
        b=bH8OxPYjx5qYuNFMRkBwmUcI8iTEdKlOUZMCRVKK5yn+Ghhmh4wF/SUvIPFxCRAfZk
         WqiVlqjN61kfFPz8jkvAbJW51bOJKUhQPlKb6TdSEVQwO2wXn7485GO8U/HRsi0mvgqB
         BVP8Q6jjuq9f50iGCQo7rcc+oqeQ9i8LvlMwLAA2Ip+WrqTTA3+7s5dO+pUC6nvU6RNJ
         +lzhyXNymYtvXT2Hwrg/Xy4nIQ1RsjqklpJYsqzCK9D99zxuszH68YE4+WCEruaUzsdV
         33Vxrg7i3hBCKljqDdGCCBctc+6CjvjgV1xz36ft1uoGCYGNsCgpIU+aSG4iru/QYeXN
         j+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742307683; x=1742912483;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxR27kQuwBEt7OQtqQ55XSsL464ltVf3GaX2mQdx5wY=;
        b=jy4Y4GBQUFDjHRwWSoqJfiysMqjOegr8fFsunBbiNkj5kBAR7XSK/2m4PFCD88/ml6
         1H2yiIKm/Ytpdj4IUSE+gBuuBhw+FqywDGPkIKAUZ3mb+z5gtjS1Af0tKDXxwGizbxjy
         VcRLTjcrq+RDigtHsiPmdgqopNqv4jkTh9ajAnRvKiCP9hOcQGYtoyGZHu1j2O4DDO4R
         D2BVlqM5ZjEhYOzou0206TAicCOEt83pKoiMFjKn75e2JKKnEvBC8e1y+e1ZmI06wpiv
         SlAdNxc8fs4+doQ7Qn7HH7BdQla5M/92BcGHB1DxvyGZEYwSAhvvNjtotgEzOdD25Z/m
         CUlw==
X-Forwarded-Encrypted: i=1; AJvYcCVg0S4Z9Y2vs3QTebNmoKf/XL63fKPUse+K9r9ZjmqkX371Rzi3Pdx2rSOGIPNyPA+Za6lqZTfw2OQE@lists.linux.dev
X-Gm-Message-State: AOJu0YyVTPSQBacEP379aMd8OS+QTIxXqkD0oPKe78jLDVnImN8zA+Cg
	UWBxU9BGefIgbxT+HRe7L2SxgndFDG3IKg2YM311Ow+kD4dmJdZ1bQvX8imTlLc=
X-Gm-Gg: ASbGncvBo0YVA8iiddOj8kt/u+XD/EnKhQR2EZSXgCFatPm+wsBAY8NrBLwQvDiWU0y
	P4JyMhSkeQDMyEvomk33h/T7ZAfQWtlDKNTlMtpCy4OuKekdvp8Us38bqgQLBsXq4aM9CX9lQyV
	RgNUTKP8yN/HhT2oB7f52rYY/mGWbahKsSId8uP/cTs9oxDn/Bukz372FRNIyd18hwPL2wmh3Lo
	y8WSfWISVV9ncstlKz5Jeu2abZtdz7EhAhfUjmsGNVJS+jyVLWreuixxSYgULOsK3NKt+z2TrIc
	VVy2UJB+DXGPmWFcwH7r2+NWD8oQhB40nwiFXSX71GlwWgj/R7e9jpPtQV4egVFpk+MvHiq1
X-Google-Smtp-Source: AGHT+IEHOb/2Ant15/B6B1CZFyAfapecsnnjB92EQqFBYGik1Jl1z+dobqVz/+A0Y+HNe7ocgqsSLw==
X-Received: by 2002:a05:600c:5106:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43d3b9c09bcmr24196435e9.20.1742307683481;
        Tue, 18 Mar 2025 07:21:23 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.143.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae040f9sm17700535e9.0.2025.03.18.07.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:21:23 -0700 (PDT)
Message-ID: <d0891544-98b9-447a-a382-bfc078865243@suse.com>
Date: Tue, 18 Mar 2025 16:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, vannapurve@google.com,
 Elena Reshetova <elena.reshetova@intel.com>
References: <20250318113604.297726-1-nik.borisov@suse.com>
 <guatjzjzipzjzvj4oou2gktxmzileawshxmxj22hsa5kmet5g4@2rhf7tzaiytw>
 <b6d132a7-b259-46f4-8bde-fc517bd9d294@suse.com>
 <auno67lcikllqdlgdsad72hvsmym4lqxnaqaohmvtvf2boscxu@54ftt6342jxy>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <auno67lcikllqdlgdsad72hvsmym4lqxnaqaohmvtvf2boscxu@54ftt6342jxy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18.03.25 г. 15:27 ч., Kirill A. Shutemov wrote:
> On Tue, Mar 18, 2025 at 02:53:34PM +0200, Nikolay Borisov wrote:
>>> I think we need to think wider. What about applying a subset of LOCKDOWN_*
>>> in all coco guests by default. Many of them are relevant for the guest security.
>>
>> How do you envision this to work, by introducing another
>> CONFIG_LOCK_DOWN_KERNEL_FORCE_COCO or some such ? Will it be opt-in or
>> mandatory?
> 
> I think cc_platform_has(CC_ATTR_xxx) should enabled some subset of
> LOCKDOWN_*. No need in new config options.

Care to suggest which ones should be included? The way lockdown works at 
the moment is that it only supports 2 levels (check lock_kernel_down() 
and lockdown_is_locked_down()) at which you can lockdown - INTEGRITY_MAX 
and CONFIDENTIALITY_MAX,  where each level includes everything below it. 
So by choosing integrity max you get:

     19         LOCKDOWN_MODULE_SIGNATURE, 

     18         LOCKDOWN_DEV_MEM, 

     17         LOCKDOWN_EFI_TEST, 

     16         LOCKDOWN_KEXEC, 

     15         LOCKDOWN_HIBERNATION, 

     14         LOCKDOWN_PCI_ACCESS, 

     13         LOCKDOWN_IOPORT, 

     12         LOCKDOWN_MSR, 

     11         LOCKDOWN_ACPI_TABLES, 

     10         LOCKDOWN_DEVICE_TREE, 

      9         LOCKDOWN_PCMCIA_CIS, 

      8         LOCKDOWN_TIOCSSERIAL, 

      7         LOCKDOWN_MODULE_PARAMETERS, 

      6         LOCKDOWN_MMIOTRACE, 

      5         LOCKDOWN_DEBUGFS, 

      4         LOCKDOWN_XMON_WR, 

      3         LOCKDOWN_BPF_WRITE_USER, 

      2         LOCKDOWN_DBG_WRITE_KERNEL, 

      1         LOCKDOWN_RTAS_ERROR_INJECTION,

Given this if we for example choose to lockdown the kernel for DEV_MEM, 
we'll also get the MODULE_SIGNATURE lockdown as well. I find this 
somewhat inflexible as we might have to rejuggle the current ordering.

> 
>> Should we decide to follow the lockdown route this means the owner of the
>> coco guest will have the ability to disable it and a misbehaving userspace
>> process will still be able to induce an EPT violation.
> 
> Sure. It can shoot itself in the foot.
> 


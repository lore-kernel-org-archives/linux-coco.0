Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5613346B4
	for <linux-coco@lists.linux.dev>; Wed,  4 Mar 2026 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636558; cv=none; b=MRNZ6sT5j2VtsofXiSS3XL5oVOplLRGv69NMQwVShB4NhkhMt3t6Ct6LWm1Y3I5WWc2otbcAqKSaZFrWrnEqny1xE/rU8VRbf/n8HCGMB4p1oGqUfhyW2iViI5E4BxIzW2sRybIzRQQS/WuyCa/876v5nQWzYMOuAFH7gU2w7Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636558; c=relaxed/simple;
	bh=6zZ1Agw5MlpKm8ZY1+2Yokb8eeyLEP5wcbptGyVeKdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QU5vp4iJrc48sNo6DWk20Fyy+nlMUsu8kxZ3p4tKKgjBWhm6U5qG1PQsjAkY72epZ6R4hhBY+d+79aDd+/6Da4k4F4+vW4l62bgz2NgamdTYVakcbd+8qWDP52Hacrfi46IbXMsgiuu1ebRUSecFZt+wWWzuuGiDm/SxEMTN/bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NC1fBBxD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NC1fBBxD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso61647095e9.3
        for <linux-coco@lists.linux.dev>; Wed, 04 Mar 2026 07:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772636555; x=1773241355; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PQaLSfKevN5NxnWRn/Bkxayowjy+4UP8KRfpRnFjRz8=;
        b=NC1fBBxDfgZrGpPFVku9JaGM4Okb5um6oG3CyCqkmD8WjK9f3mOvXDyKACMQT4bVfC
         eDAPvOUhBzCjZbqcI6klEP/ik4Tir4he4G11Dn5uSnsUaztgAsZRXIOMKhBnl2YK6P30
         PlqeoXbEncUx3sGPmd+2bZPcSU94TAaqshExda/Ty04ov/RWFN/gtRj6/p+O8YXJ2s8W
         FYYLzOIvv1so9CT+aHXY3THqWrJJMut09OqhG5Ay9egmi9LzsE1p1MjN33nQAGAbdX+6
         HEMV3XeqbH0752qyQTmRoSOhGxJq2JjYQiQgsfx/iGq+bDwKU7QBXLf2eFV5CuxKYeui
         MGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636555; x=1773241355;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQaLSfKevN5NxnWRn/Bkxayowjy+4UP8KRfpRnFjRz8=;
        b=R6FM0p2Rc/0NEfkU+BpltjSb14bKs6yOU6ba4F/UU9IHxVyX36juD3354s0570a2YI
         Zitu+8MoscNQPc+vIg43/wIfWpmN9wkDGJ0n3KmgIyIuKEJuwcG6qbl5Kjb2IVophvmf
         PYsTgBQdb5Lv3Q50HyzDSOA+fSJY0OVwRD7rrrM8PUwLft8c+LYnJGdXqMhgFXrA6BD1
         nbfpQEBSAUHTetcRf9OiDnVqtDSotiq81aGnNCZiAyP57xphrec0yQ0mo/Fi3N2NgsDo
         fMTbZpkWFMTtSsQIQzkU1rzEj8fYWIxk7JY+4c0rGu7G5ZJ8nZAC3pbo1nTmpjUwEImD
         pOoA==
X-Forwarded-Encrypted: i=1; AJvYcCU+RvWn6QUQv/XTyM7hPZgrCdPdq6r/8kNr4UYFnO6Eu1Dqxmze9RG0lF7hkVh7Aw2aB8QgNNiznhqR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9GRd23tbNRJm+st7Roc938otYZ8XkMpQ02I7Q79nVhbTnqtv0
	J06gpLRFb2+LCIcNQo/7Pe3pWCSIJvyVsnopf0xUULQj1Gcjb9Z0Sy54MdE1xymKkmw=
X-Gm-Gg: ATEYQzzOR0x7Gjccy3V2JYK+KGkoy8bZv4+vYR0OF+KARB8v9bWVqvS8Bo7FmZ15uTD
	wHk7eG3KbLG0wXvjHkb4BSZMmUHBWLe26dOkj6G57AFA8SyX3DMpudzJ5e/WkYR5CCIbY8yFtMB
	U9TpQd/BbPjWbA3EDNPJrWrsHpWiXvfR81sri7HUa0pbhwiRxicJFrOVdWrl9AgzMUqdMm7eGoW
	/QKeNmgL3yOIBh7gVMPhgW6VrdY2KBGTJRPc264nyRMb12KwEyL2oqCZv0/lnPLOVbi4DcDAszf
	4L/VSawmFn2C4KrdUFSeu4C2pCWS3/iWGfCOyktZ6YwDJzmB94INw5lNIP8Mu9q642jZ1kb9pbg
	gcE1ZmHuOxH50jlJEH74nV/9I20LEVDGjP3CxzainpWnAadC0OB9Z83KHxFbbSKmArwQpTMDd9Z
	9lLbDFHi/TyNgClTktCv5zODNfxPWievJAYT9VPIsWVK2IWV0K4bkfDebtLqk=
X-Received: by 2002:a05:600c:6389:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-4851989f63amr33047315e9.30.1772636554833;
        Wed, 04 Mar 2026 07:02:34 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.67.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b0549600sm29325387f8f.35.2026.03.04.07.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:02:34 -0800 (PST)
Message-ID: <f0941a37-1055-4473-a8d2-fbe3e912c7b8@suse.com>
Date: Wed, 4 Mar 2026 17:02:32 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] x86/tdx: Clean up the definitions of TDX TD
 ATTRIBUTES
To: Xiaoyao Li <xiaoyao.li@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang
 <kai.huang@intel.com>, binbin.wu@linux.intel.com,
 Tony Lindgren <tony.lindgren@linux.intel.com>
References: <20260303030335.766779-1-xiaoyao.li@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260303030335.766779-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3.03.26 г. 5:03 ч., Xiaoyao Li wrote:
> The main purpose of this series was to remove redundant macros between
> core TDX and KVM, along with a typo fix. They were implemented as patch 1
> and patch 2.
> 
> During the review of v1 and v2, there was encouragement to refine the
> names of the macros related to TD attributes to clarify their scope.
> Thus patch 3 and patch 4 are added.
> 
> Note, Binbin suggested to rename tdx_attributes[] to tdx_td_attributes[]
> during v3 review. However, this v4 doesn't do it but leaves it for future
> cleanup to avoid making it more complicated because it also looks like
> it needs to rename "Attributes" to "TD Attributes" in tdx_dump_attributes(),
> which has user visibility change.
> 


Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

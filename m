Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A436EAA4
	for <linux-coco@lists.linux.dev>; Fri,  3 Jul 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065428; cv=none; b=BzCkvmwGUuuN8Z9QvX1S0VA63Lfeg5G6LYD7PjOvb0Q3dNhJwbqyv3evObUba6dLIUSwgzLxwIE6vknObU9948lZ5nS0m5eoQc4b2sYmNW/kGHRBwiPsnSxTQpkBYIVOD7eYHh/mevvjuZSf3zP+IVLiUxnjGUR3VZXGBifWD0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065428; c=relaxed/simple;
	bh=HWG8Sz5OtbFuD11nfUVW578oC2IllQpqrCtgiKUiGkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTTWKpERwTYVDclmUge5gfNGqpXSp+a/NgONNSD0KuY841ItaVmVmsjxh/EyuHUGwh8vdNcCH91UHd05rGDBO9aEp16ySBpQB2sUFRX+rCp9UCKgXCWBsX85THB9sfKoxDbnPc2JwUjkqNdrfB39jDyIs85Y0FVrwQy/lB2V8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gkp3QZQd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gkp3QZQd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-476d8e647e9so251683f8f.0
        for <linux-coco@lists.linux.dev>; Fri, 03 Jul 2026 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783065425; x=1783670225; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1yJhLwAuRQ39oUEKAohufcXKhiNT2bhqWZWs88GxXtU=;
        b=Gkp3QZQdJePVJ7kp14zIrFzc/hQRzK0HKflwdt4YdQXQyAHPmOPtr4L49kRZhitzXp
         Fp6TbSD6KZkJJRy+4HYvK/TCUoRHnO/QfjinEJeyub/YH3Ag/7oWD83K1z1ng4fKTuNA
         BiS7Si1ftlYy5o8OsbzMGiwaG0Gpg2r7sasLTdJNZEhBElOHVlIQczqCdmjbl3BgQGPa
         AfaxW3LbSMss0Ts34JpiAoh/P5rDSeRvYedCqsrkNpqZdjFhejT1u5lFrOuTecXzKrpF
         weGdd7E+l2Ug7LlVUImAkTNaZ4aaqYIRBJCQKq6mMZ8zpcx5T783iqYMiTxuexk08Wn6
         RNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065425; x=1783670225;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yJhLwAuRQ39oUEKAohufcXKhiNT2bhqWZWs88GxXtU=;
        b=bJQflWf38Khe97pxcGN6v7VQtI87mDRNJSs2C9hNPZDufDXduDgpVqY8THpdDVYsb3
         lUh1GlD8kj03u184YKUI9+AzqUkKdqN8M41qVNu4vOOaXZ8KmkTSqfrrpuAwTMfw9pLA
         VeQRtu+jN/C+liEBLQKuyjMB6wnWcWKRrU+KAOYSq12/7HXl/OykTe7zpCfcd2fZ+yeb
         3PvDTHUyTXJS6vmKzUKJfS1kj6s82iIOp4yKLJUnj8bWHsJt5WZipernNG4DIYtn7Cxm
         +yEGErHXYPvVv7s3/7OtctXfJW7T6kfrGZ8mvWonq1bCqW/VU1oXay7ERrfSrgXxUOIk
         3ovQ==
X-Gm-Message-State: AOJu0YyksvVfg1ApX8ubx1c5jlehdvFD7mpH121gbOWCj8PLcdndQ5pv
	jvlyxnlMcAeQXGklGKt87tUBpPVh2EDWJj1dpN2rdiFrwCsoskxItTUrzFJszizVzu4=
X-Gm-Gg: AfdE7ckPzabjLa8GLHzSle4qMphp1f7UAYcQnA+D0dQ3v7D1HWD2KwBJgZc7a9dB1ON
	tNzdnNq2R0i6ZWXYphmlxeYWgn563qrxTp+G1UAWz3ZMUekVVwPaw5FVU1tDTiIDWf6FBvB/EX7
	uY6IT5mmL9Ff3DroC+0cQVg6s6ZqgD00m9VOK0tBE8NDWsP5Asttq6K/0v0lEghQWhe94cuZzKY
	Vp6kWs7DuRvvgzaVI7syMkVreDLRVGMP4o6nVpuG52lieXGPi0hooTMe4dSkGv0eN57O/tOz9QC
	O2Fmz4bD9vjzAOYrKYOam38NY1Tmmdb2MzZRBnNz4iC9VPltEajy6ULE+gYDcYNrfprmlFYdn1m
	+ncBYvv++T1V+bSct25B+s05LzCmfZtvQb0fPGQCEixHBYqbddpIsoEeIrgJChc92qBkhUaN8vR
	Vvtfe+ID6uDXqm8ZbQkiRAlMebmg==
X-Received: by 2002:adf:e5cd:0:b0:474:83d4:9916 with SMTP id ffacd0b85a97d-4775a2efc07mr11580909f8f.17.1783065425388;
        Fri, 03 Jul 2026 00:57:05 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15094509f8f.0.2026.07.03.00.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:57:05 -0700 (PDT)
Message-ID: <15b253e2-1a2c-46b2-abe2-bf152d704523@suse.com>
Date: Fri, 3 Jul 2026 10:57:01 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 15/15] x86/virt/tdx: Enable TDX Quoting extension
To: Xu Yilun <yilun.xu@linux.intel.com>, kas@kernel.org, djbw@kernel.org,
 rick.p.edgecombe@intel.com, x86@kernel.org, peter.fang@intel.com
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, sohil.mehta@intel.com, yilun.xu@intel.com,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, xiaoyao.li@intel.com
References: <20260522034128.3144354-1-yilun.xu@linux.intel.com>
 <20260522034128.3144354-16-yilun.xu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260522034128.3144354-16-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/26 06:41, Xu Yilun wrote:
> From: Peter Fang <peter.fang@intel.com>
> 
> Enable the TDX Quoting feature via TDH.SYS.CONFIG when supported by the
> TDX module.
> 
> The TDX Quoting extension generates TDX attestation Quotes via a
> SEAMCALL, without using a discrete Quoting engine.
"Quoting engine" is a new term, introduced here, better say "without 
involvement from the VMM"

<snip>

Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38E33EFD37
	for <linux-coco@lists.linux.dev>; Fri, 17 Jul 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295875; cv=none; b=srzolyIStXNZG45ld9JYVkbO9PNtcEiE9XjgwZfPxDg8oYgJt7YN8bBGnnfCx8NhtlB1cyZkKgFBEAzH4ItcUi+ZSS+B4Zap2bERkqgBnsMwzxQJrFCKJHKtTlm2ybmiQcfDMvhLHq7o895AwzUjaX09ZrwypXvHdo8/6/m3S7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295875; c=relaxed/simple;
	bh=gHM8gxxIGrtelmB4ciSq93JB3GHtaROcZU3f2k2iz0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+fmxMOlKe4i/okAcHD3ulhqOr28Lnl2SxkMTWsS26DWxBtONkOdaIrE0vfcWgYwTHQ4xbH4iHANmcunxypF+McLH1+60g8VolLk/jgcrBwwEMTqouj6Wj/z1CyCHtjfOWD0gxXSzpOgxuQ9MGHt6ZknE0mL5g1qaQC5IPMbFTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JVzThdml; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JVzThdml"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47362928f65so7084446f8f.2
        for <linux-coco@lists.linux.dev>; Fri, 17 Jul 2026 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784295872; x=1784900672; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IgmxxxpCItf1KZzWIsCn5rVL7exNYDJuWybs4ZYZUDY=;
        b=JVzThdml8PbOqYAe9wGjLpPeFvvvvvdbFwjUaKQHewOxYDiIYaAb+wAiFFS+liYhbk
         t6jSJqCR1I2PjjaTuAyb/HH+l3yL7i0ke1XDpGycBWVVcA0B0DuoMtyRFRbZQUVUhty+
         R2GT71ruPyAM4FkQZGZL2BzyUWazwG6ZrrYWW+9aHc3mAla32g4otICSpLN6Q09Xx48T
         +fUGldmC7BONbOVruzuJu4rIqy2e4gaZ7eCVXMj9FIkV9C7ws58y9LlPB+2K63olBVmu
         JqvylhluktGAbl3DWodZ1JLr2hll2jqjXqgRyeGse4XxwD2QWsEy2o5d0NRKM72x98g2
         R1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295872; x=1784900672;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IgmxxxpCItf1KZzWIsCn5rVL7exNYDJuWybs4ZYZUDY=;
        b=cpu+XZbc+/Ki4U1kLIN/5o1DiTl3RF0Q4yvrCDVLNaRSt2QkkZPrXL9Q6rw4pne6e0
         xiakkBI5b7VjNmYkJ6I4h4IWBMVPLKSniDAXyCE7FDuRBJgT+rI2rvU5Bcd+ibg3JIQ1
         qGAeVXyKPHIGuvP8eVvLhjcPGG1CjLXzb0BPZPrebJ18s3JiRFgfHQOhhxpdWpVQPa7W
         AbkbIN8zxuvCB+Mxq5gvTVA1xPm25iTp72V0ML8VgekxDHCiqFfbcPOzcEkpJd2k33eu
         Mo0Q6pOSYBQ6XDqWCKwM6ODRXEpWCwQT3vgwGOv0ZwHSh2KmYUpLXqzZbjr3jcfSg85o
         nmug==
X-Forwarded-Encrypted: i=1; AHgh+RrUfzhmf6ZoifoLEQbdGYwDaxfadTqmztR/9BJt0Sc1uPdu20cGjPd1DaXdpEIVgl5/A2KTfM9QAsD8@lists.linux.dev
X-Gm-Message-State: AOJu0YxAL85DY4RzQyuBkbu8BPoVnKS3jGpIbCMDrKkB7pyd/9lcyE9A
	YZ32OLWZ8+c0ghFfipzjVsjHxauioGDq97vnDRpUQ0hO18u6coKlxQ3IzIiAxhd1F3I=
X-Gm-Gg: AfdE7ckq/5RbJEbucEY+Dax7oveZqoWSWEX1eD22aAaOHJSye1uMiGOOTgo+a/Nt+wE
	WZV+fmd596c288mn92hBZQOduxuO+eT2cYsehOpHtTcapB4Hl3S4rToYnxrS+uW8ueUhcR/E5i9
	OLr6FE2zeDg+bfz++6rNcSi85iQMZy4ex7scfzKjq24iYIhrxLiCLTd/nISRnQVg0tmNh8ILGQQ
	Mh/UywRDwsTBO3rKlqR33RtsUYSdLf5/yqGtMooEA9zqsTWbXlcBeZeiIixKsQh54ok177aRCu5
	7YOQC67jUgD1SGhNj7WdQlI+o/K8eOrL6wAuA9JnutyEbDUzJQQ0YgOsOJSFd6GwspIv7l+bsHg
	HtXQlk5uJcpsLYqFdDcX3DjjLBBxNFLJ70vbKTAFGEQDOjTOUyu88ad76AzmATFTimA==
X-Received: by 2002:a05:6000:25f0:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47f623065f7mr4074816f8f.1.1784295872194;
        Fri, 17 Jul 2026 06:44:32 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f66df025csm2145172f8f.0.2026.07.17.06.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 06:44:31 -0700 (PDT)
Message-ID: <0c2f40d1-f695-45d5-949c-cd173c641c84@suse.com>
Date: Fri, 17 Jul 2026 16:44:30 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] modules: Document the global async_probe parameter
To: Dan Williams <djbw@kernel.org>, linux-coco@lists.linux.dev
Cc: linux-pci@vger.kernel.org, driver-core@lists.linux.dev,
 ankita@nvidia.com, Saravana Kannan <saravanak@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <20260705220819.2472765-8-djbw@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260705220819.2472765-8-djbw@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/26 01:08, Dan Williams wrote:
> In preparation for adding another /sys/module/module/parameters entry,
> document the existing async_probe parameter.
> 
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Dan Williams <djbw@kernel.org>
> ---
>   Documentation/ABI/stable/sysfs-module | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
> index 41b1f16e8795..397c5c850894 100644
> --- a/Documentation/ABI/stable/sysfs-module
> +++ b/Documentation/ABI/stable/sysfs-module
> @@ -45,3 +45,13 @@ Date:		Jun 2005
>   Description:
>   		If the module source has MODULE_VERSION, this file will contain
>   		the version of the source code.
> +
> +What:		/sys/module/module/parameters/async_probe
> +Description:
> +		(RW) Emits "1" if drivers from loadable modules attempt async
> +		probing by default. Emits "0" if drivers from loadable modules

nit: I think there is some tautology happening here, i.e a module is a 
driver, no ?  I.e perhaps just remove the driver word so this reads 
"emits 1 if modules atempts async probing".
> +		attempt synchronous probing by default. This value is overridden
> +		(in priority order) by: the module's built-in "PROBE_FORCE_*"
> +		requests, the "driver_async_probe=..." kernel command line, the
> +		"async_probe" module option, then this default. Write a valid
> +		boolean value to toggle this policy.


Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C576BB25
	for <linux-coco@lists.linux.dev>; Fri,  1 Mar 2024 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709285202; cv=none; b=Tpv1/dVz2hvpNwConaEgRhO/1p8nBhLaDCoo4KxUNzPzYz0IIA8r7swEEQ8vaEYFVjSlUxnwXNqyADUHB1BzpMk7fHVbcTqglnJ31VxzFy5XJZJaoVIsfRBKDnrExMJBEotpCX+2hvnhYYzGY8T1x5u90LnzSU67FEj8BR8ZTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709285202; c=relaxed/simple;
	bh=0wdFpKbEyNhuu/RpjYvuz8KPZKT0kttiGp+cGiKwHZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq1Uhv/kX4HOYZfg2hSTmyY5DZtbb94XbzEPjtnO78rFUI/jWwbWzLhTutYhh9QfQcpkEdLCYoGOZWBLdj5eM1lGMRjupXZx1CrUqcQKdj1DUuEsk8sxRjzJeYxrIc/gqhfjtkpy9NdqR2hCVC/9dtJBfC9BY6D/bMzu9biuVcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso1497154a12.1
        for <linux-coco@lists.linux.dev>; Fri, 01 Mar 2024 01:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709285201; x=1709890001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fp76SLNrOitLz2IPJZxtYaUARyA39f42XEHvT3cwYM=;
        b=FOLZMPvm3gXe0QthMa7dqW59wCCY5pT21HnvmQE9G1iaZ76vuq52T8TzotegvIoKMh
         p1bDSrYhUsMu0nTYoqAWIcRi2hPHhwMgsaA/wnHdfNIkhpizDOiKA+p2xsSQMvW9TKag
         1dQIrlAyD5gWH2rEx/IlmSF6ci2XixHngLUpKXItyYYSSHUkfoeAHi9gyBLRk6CHLrZO
         pe+UjAOMgJ2hL/TawnE7Dm8hZEROLJ+3GrL1V8htHf5+c85hQ9rEFZuHVKRbXNd8Cx3s
         Tbz1bmBM8+ULv1iH24f+Bf3w12e3EWfjIcI8PD0OvvoB+Y4XGuKe2z/zv/NzgszckARp
         VP/w==
X-Forwarded-Encrypted: i=1; AJvYcCWYLjrMUD5T55am8tKvyCwibMLpvU10D/bbmoAvx83jreekj/nBZSC1yyHXZoyrKa20uH2hPPgo7yLvjBw+HYztMld4WvvNVc05Cg==
X-Gm-Message-State: AOJu0YwrXIWL4Ia7RRrm4Zj6S4YQEDP8UUTOHq0peaG4IEz31VpI1Yh9
	ArQgJuQq91I9bPClycwGybLsHQyV9uWjZuWIXhOYaGnbiiDF4cVs
X-Google-Smtp-Source: AGHT+IFzP30XgcgRz16jjeqSQMfVBbG9kjUBn2FuxIWeyBnM+Cs+BqPA7eeqULcAd7TXur4Xy4bBMg==
X-Received: by 2002:a05:6a20:7343:b0:1a1:2f17:1bc2 with SMTP id v3-20020a056a20734300b001a12f171bc2mr989042pzc.35.1709285200822;
        Fri, 01 Mar 2024 01:26:40 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b001d739667fc3sm2947317plg.207.2024.03.01.01.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:26:40 -0800 (PST)
Date: Fri, 1 Mar 2024 09:26:38 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, mhklinux@outlook.com,
	linux-hyperv@vger.kernel.org, gregkh@linuxfoundation.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	kirill.shutemov@linux.intel.com, dave.hansen@linux.intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	elena.reshetova@intel.com
Subject: Re: [RFC RFT PATCH 1/4] hv: Leak pages if set_memory_encrypted()
 fails
Message-ID: <ZeGfTtlx0JOj9gVS@liuwe-devbox-debian-v2>
References: <20240222021006.2279329-1-rick.p.edgecombe@intel.com>
 <20240222021006.2279329-2-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222021006.2279329-2-rick.p.edgecombe@intel.com>

On Wed, Feb 21, 2024 at 06:10:03PM -0800, Rick Edgecombe wrote:
> On TDX it is possible for the untrusted host to cause
> set_memory_encrypted() or set_memory_decrypted() to fail such that an
> error is returned and the resulting memory is shared. Callers need to take
> care to handle these errors to avoid returning decrypted (shared) memory to
> the page allocator, which could lead to functional or security issues.
> 
> Hyperv could free decrypted/shared pages if set_memory_encrypted() fails.

"Hyper-V" throughout.

> Leak the pages if this happens.
> 
> Only compile tested.
> 
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: linux-hyperv@vger.kernel.org
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
>  drivers/hv/connection.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
> index 3cabeeabb1ca..e39493421bbb 100644
> --- a/drivers/hv/connection.c
> +++ b/drivers/hv/connection.c
> @@ -315,6 +315,7 @@ int vmbus_connect(void)
>  
>  void vmbus_disconnect(void)
>  {
> +	int ret;
>  	/*
>  	 * First send the unload request to the host.
>  	 */
> @@ -337,11 +338,13 @@ void vmbus_disconnect(void)
>  		vmbus_connection.int_page = NULL;
>  	}
>  
> -	set_memory_encrypted((unsigned long)vmbus_connection.monitor_pages[0], 1);
> -	set_memory_encrypted((unsigned long)vmbus_connection.monitor_pages[1], 1);
> +	ret = set_memory_encrypted((unsigned long)vmbus_connection.monitor_pages[0], 1);
> +	ret |= set_memory_encrypted((unsigned long)vmbus_connection.monitor_pages[1], 1);
>  
> -	hv_free_hyperv_page(vmbus_connection.monitor_pages[0]);
> -	hv_free_hyperv_page(vmbus_connection.monitor_pages[1]);
> +	if (!ret) {
> +		hv_free_hyperv_page(vmbus_connection.monitor_pages[0]);
> +		hv_free_hyperv_page(vmbus_connection.monitor_pages[1]);
> +	}

This silently leaks the pages if set_memory_encrypted() fails.  I think
there should print some warning or error messages here.

Thanks,
Wei.

>  	vmbus_connection.monitor_pages[0] = NULL;
>  	vmbus_connection.monitor_pages[1] = NULL;
>  }
> -- 
> 2.34.1
> 

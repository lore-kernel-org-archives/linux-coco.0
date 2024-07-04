Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8FA41
	for <linux-coco@lists.linux.dev>; Thu,  4 Jul 2024 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088241; cv=none; b=DwswWnVpYx2JvJuwBPOqp772xNSWuEmAmfbIOBQnU+SNssgbgdjY+QleLzsk0YA4dD9hKty/MXiMrod4wIaDHLKzkAbWy4YFhWN9mSh76ze2Hp9J9euFSt1hbDU5ETaZWNovK6q+Z23Gs4nI/yaBnvjVs30aglBEQWuBQlZbxdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088241; c=relaxed/simple;
	bh=DaPw7dhtBiHRIOzvHRhBDesbLihBnn9jCUdGqLgQESQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0EaShz6N5uAfXrD8cYhTn72Kaezhr/VlIK1Vpp/zHbvl6ob44UAwFFY1OTFomuZUqcVPNBJ7SdQ2SDXf+bKnagdsgqQeUQ6grBSokZw2Rem7OYnz0pEck05fqjZDGBdFnZdc3Qt7Zo+FKwxYydd1OC2S5Xla2RyW6EX0shRgh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AmdDF6p7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AmdDF6p7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso3192125e9.3
        for <linux-coco@lists.linux.dev>; Thu, 04 Jul 2024 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720088238; x=1720693038; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMZja6vOfH2J15j5h8yKAKCQpQzNHB/MOqCeH7KtdDU=;
        b=AmdDF6p79auJze9jtivx5URVj+5oFMycYqjcgaokYMcvVN4W5cx4Lhbzo8SjmBcIk1
         4PxFGYeumT9JJElbOMS9i4H+tlPgj3B4XUFJREOtUYVY0ZIfUuq1vL4ipCaLHs55XRv8
         qsINTqp4iTqZo88nPkNBWKRmezbZSJkHVJXhpCNtz6lBDE1vLFCWqc3+W9jLVeIDfaXu
         Qng4ERdtOvXGj6emxHfSnpqkPr098dHx/AwV5OGIh2rPHAhVckzeOy3KiVNRKsburSq3
         UBFqIoupOqaPgx6Y0WyzSmHZ2ORWvQOTErdk+UXwlcHbTrHvY/KIl/QGWTX2tB1b6gXe
         DEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720088238; x=1720693038;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMZja6vOfH2J15j5h8yKAKCQpQzNHB/MOqCeH7KtdDU=;
        b=lvTJ6+oPgwtAlvuDmCkeSPYF/rsvfOTnYykMLoVJAReZ9+3qmej6DbP081CeSWkg+Y
         z1ljzc/CKDM5Pr8qO7BSv6Ofd+jXvc5Cn6VH8JoGM6XyWqfAJ3fm5Kz4SmiwKn1+CX+M
         HKrZKtd24VDUzBwKVq82oZ/eLFyiRVy9tCj88MFkc1VLktFLELT/8QW5x/PH/B4au9ic
         8VlZ9cW3NGGzHKkYRTy/QaSXjgr2MJ10vm4zpOXJVWQk3v1howdzU32WBmPvA8NKcMeD
         QHJ6Mxt+SJnhpum7eci28jCSMvJiD96cgBnfQ2LH+lsiHPGjtGEH5JDDjG2Wc9JwkDja
         hZsA==
X-Gm-Message-State: AOJu0Yx1GWfm0EGau/8lqo91NEGNH7UlTn+Y79ZXNJWiBMITrVtuqCnz
	Tc4/JN4rnFIUa/tEfCnchBWgLkxNCJdGqDdrV9mLJJ/xIIsbTOIBm7HSsU9/6Pc/8mz9Okzd3C2
	j
X-Google-Smtp-Source: AGHT+IFLEULmeW45awVMyy9QHpYnbRzyVYZu9WLdgiVWKlySZDlomG45lfDJ0wofXRYQF3bN67KxQQ==
X-Received: by 2002:a05:600c:2147:b0:424:a516:13f8 with SMTP id 5b1f17b1804b1-4264a4694f1mr7953965e9.35.1720088237904;
        Thu, 04 Jul 2024 03:17:17 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:757f:bfc7:3301:6664:5531? ([2a10:bac0:b000:757f:bfc7:3301:6664:5531])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678a23b349sm6213305f8f.36.2024.07.04.03.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 03:17:14 -0700 (PDT)
Message-ID: <499db0a3-186c-4998-a1c6-ce774a2d6c25@suse.com>
Date: Thu, 4 Jul 2024 13:17:12 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 0/4] x86/tdx: Adjust TD settings on boot
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240624114149.377492-1-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20240624114149.377492-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.06.24 г. 14:41 ч., Kirill A. Shutemov wrote:
> The patchset adjusts a few TD settings on boot for the optimal functioning
> of the system:
> 
>    - Disable EPT violation #VE on private memory if TD can control it
> 
>      The newer TDX module allows the guest to control whether it wants to
>      see #VE on EPT violation on private memory. The Linux kernel does not
>      want such #VEs and needs to disable them.
> 
>    - Enable virtualization of topology-related CPUID leafs X2APIC_APICID MSR;
> 
>      The ENUM_TOPOLOGY feature allows the VMM to provide topology
>      information to the guest. Enabling the feature eliminates
>      topology-related #VEs: the TDX module virtualizes accesses to the
>      CPUID leafs and the MSR.
> 
>      It allows TDX guest to run with non-trivial topology configuration.


Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

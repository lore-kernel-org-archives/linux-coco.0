Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E1115AD0
	for <linux-coco@lists.linux.dev>; Fri, 26 Jan 2024 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280416; cv=none; b=oiHMd3nZAIvsFI0EiGhmjkuSFlOq1hBdYuRlBKtK/b0+hwH5MtuBkdpes/WaqopbX7VA3dfBbHrOG0mubesJ5LsjRbk/RfU6aFee8Fmuk5gwaj8WHLo1EFMY/BMqW9dgTWYjJV57oLGrn17uckxq9rEXIGIB8f/T/eVxHQ2CPVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280416; c=relaxed/simple;
	bh=W/FdB88dbo4Ofig9JphpMVHHe94m8b1+hdrjMoRC/H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7zqdIG+iX6Xc0H75q6xAS3mTzbCQ5afu6GVvdizJbqoCKFq+v+KyCK4Z9Z+0gAvXakAWOOoQ/ZlygT4XHKY4dRQ3+hg1sqzGCuJvmc3qFn/4Bp99ErREsDO2Tkzaq3jPNABfShlKNKoE5J4RJY5k3MPPNXsOjm6DM0fEClGP0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TzRsyRoJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TzRsyRoJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33922d2cb92so673926f8f.1
        for <linux-coco@lists.linux.dev>; Fri, 26 Jan 2024 06:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706280413; x=1706885213; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwKl7KA16kSrc3QBUn+TdenGDtEm5u8vFzJscSXHTTY=;
        b=TzRsyRoJ06VdAm9pBiQTwpgtG9q/oHGp2rwHXp434m0b6YoWqgBYAno0ceD1CoaFNK
         A18VJ0e57pR9hgVR98kFbovSc3NrLakHaU0c6NpN64IqlAshJ2MBfZ8eGrMCnWzokb3a
         dJHfRzr4NVJa1/zS1JXNFp6dU8gvqzPY4uBe9yiTOLwx9gbmiriJLOWrA1oQ5cj9Q5RF
         PhH4IahXTBdPcULD12G/nD44lLiUSPu2HLQgGn9CPFGK1jgJ2cCLdm6hXljL6UV/vdaB
         1+pGRe3/F1Wp+kVCx3qITu0h278imFhL53wGVhGZ+DWro+TupFGhZ26LWB66eoagK4a4
         u0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280413; x=1706885213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwKl7KA16kSrc3QBUn+TdenGDtEm5u8vFzJscSXHTTY=;
        b=QzkNa/aQ/XQnUxgCmJKU3Y3ggTEE5Rtk5zFNoNkLXsPvbibWMEcdH0gQpQ7nJgT6wc
         jAUZQFkucEVvWxFO/8k5p35AljyHkBR9pKrgbFURun3fXI2eKGZ2G4jKsyTQY4Pj0vFn
         QjkGBfYkIyiVqA8TGb/HFE8+O9/Wjc3I1Rq0NI8f4nmfOKVtTSoRs5gCtYqqxzckGeC7
         HaHeYk9rK/cxSPTb8mK4KzXaeErt7ynzm0UGIcocxv9P6sKHDUXwqh6zI6M/u4Mdzaqs
         2pBy/gfQAAFBjWOJMFj0FPV2UAzt7TW0O9X9Y5hI/kJuLP/cjAtbpOoAh+L7TfaZHLTI
         peYw==
X-Gm-Message-State: AOJu0Yy7Ou45VEf6yUQ2/yonuD6f8L6BEiTGJtRlhWyfokUfj1JB8452
	5NCxYS+/+D68Xc4ZaA2GI0pDl77SF+ti4qRPfWsNpuxRgJHcWqa28Tqt4nZOAhc=
X-Google-Smtp-Source: AGHT+IG3veE69nenUkhE2SVXbzrVU0L/Do3gd+wEYCsuXJnu1R0yOSVv6LwLj/j5xNSNy2+GDv7Ukg==
X-Received: by 2002:adf:e3c6:0:b0:339:611b:bcb4 with SMTP id k6-20020adfe3c6000000b00339611bbcb4mr568107wrm.117.1706280412721;
        Fri, 26 Jan 2024 06:46:52 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id n11-20020a056000170b00b00337d6db207dsm1437927wrc.30.2024.01.26.06.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:46:52 -0800 (PST)
Message-ID: <6afe76be-90a7-4cf7-8c6c-23e6a14f8116@suse.com>
Date: Fri, 26 Jan 2024 16:46:50 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Randomness on confidential computing platforms
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>,
 Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240126134230.1166943-1-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240126134230.1166943-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.01.24 г. 15:42 ч., Kirill A. Shutemov wrote:
> 4. Exit to the host/VMM with an error indication after a Confidential
>     Computing Guest failed to obtain random input from RDRAND/RDSEED
>     instructions after reasonable number of retries. This option allows
>     host/VMM to take some correction action for cases when the load on
>     RDRAND/RDSEED instructions has been put by another actor, i.e. the
>     other guest VM. The exit to host/VMM in such cases can be made
>     transparent for the Confidential Computing Guest in the TDX case with
>     the assistance of the TDX module component.

But is this really a viable solution in the face of malicious VMM? It 
assumes that if the VMM is signaled that randomness has been exhausted 
it will try to rectify it, what if such a signal can instead be 
repurposed for malicious purposes? Could it perhaps be used as some sort 
of a side channel attack ?

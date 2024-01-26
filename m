Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D11D699
	for <linux-coco@lists.linux.dev>; Fri, 26 Jan 2024 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706287097; cv=none; b=LFxM0puQRL+sLDXKoawvaMP2TVYETt0rOdvCEftmhB7id7aOlPDgxTEYkTPE0toHnf6FPu3YPfmYiAvcl8OCxvP1p7js7qXuWwRaTvLf8AAt1mSZ1c9MGwYy7g/CMfje4UsCxMpg0AZ53k/GmQziY5QnvGAhco8Hr9H+bkPq21I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706287097; c=relaxed/simple;
	bh=/FfErPD7fPuY6n+IL4H7hJhZx3N0+Izam7zb+o4a8ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAtC27O3dA6X/iHsd5zSEF6y1kpC0M5eksHhTS8WEGpLTRtUa0imXcZwpt+urJmypQmGTlsIrMy3KxyECnGdZIZuh9PDV3cBJ18UfYOLAZ6vyNdVcwjFiOFt6Ped8+jSWEN7/ayI84jNqsua+m762kV7c9biApREhDGGRPVeUGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EDDEN9g0; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EDDEN9g0"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-510133ed214so989763e87.1
        for <linux-coco@lists.linux.dev>; Fri, 26 Jan 2024 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706287093; x=1706891893; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIxa+CX1/TJs1SziOesxW18rUtHS0l1URIjIkyBIsA8=;
        b=EDDEN9g0mGQzR1PUYzJ7t8imm0ulwGbIDQJ7e7z9hnNsoV40xEmzEar08DQSfR25MH
         ZZ/0hxdGnpPVgh3oPPWkpdltGYY+HlSfkiwH4NNPDvNSBafDzewr82Tn9ahLn9AP/h/L
         jTWAB4ma+D+0nboGUSAksy+ZfdADEO8TT7PrDGQve4IWJ6uF7dTnvjn4q5U+GUeDmCtr
         bw9hHjrYYqqKa2EMOo3jNzYSxDoOvVeEtzReASQ7TkI+YaCuGxM69WURGaCd+qsFf3xw
         IZXFmRYkT2+wruNeMTNppFrKV4IGE/sEZw1hHyCyX70c6m863m/aVu2xxPoAu3uI3/fK
         1b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706287093; x=1706891893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIxa+CX1/TJs1SziOesxW18rUtHS0l1URIjIkyBIsA8=;
        b=jUM3bAuUURowrZ3SyHkFRkq+akAD5M01AkCi1MhSa9Y7vggZVRwNqSfg55OkyhE1eO
         fRyw7ORrb1K9tSCUfBooLM3CMEN/gO9jpgG74F1hacE+q09PEBKePs63+5oSHADpb6oC
         MDNCDlZEkTnSbDPUYL0/TmBX2zEJEsPEJ8dsquE8HF86wXZO3FFlDwLt2XmmU8TK63Ru
         aAPTi99nb1gqDO0vOUOjKf0VJ9p7xhQ2DVveiB+wodZpIJHQ1bRgNb1KioEQEImDOibf
         ww1yoTdHG682rLnkf5L1DusAXVyjVM1tfbuzkLI26gNPCReajVY4sWp4yHBeuur2toCt
         9KjQ==
X-Gm-Message-State: AOJu0YzweKNXzh/17qNZvNBZPclY0DyfwDmZ+bHAxmvkEvSLzxYEsZWn
	OYRn1GsXtWzqqbsPZrSwbNspOUgUviR5lyeesQcDhEcXhWX5Jz/+oHG6caVTMsU=
X-Google-Smtp-Source: AGHT+IE8xcb1wWSISj/bWqhgPC2j6HpUh+TnOucjqd3fNKnHetPqYqz6sgdZkACsOKi6NIy3PvfbbA==
X-Received: by 2002:ac2:5a51:0:b0:510:1777:9559 with SMTP id r17-20020ac25a51000000b0051017779559mr821159lfn.86.1706287092847;
        Fri, 26 Jan 2024 08:38:12 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id c9-20020ac25f69000000b005101772e298sm220688lfc.19.2024.01.26.08.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 08:36:41 -0800 (PST)
Message-ID: <4f717166-863e-4145-8b8b-37e09415e855@suse.com>
Date: Fri, 26 Jan 2024 18:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Randomness on confidential computing platforms
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240126134230.1166943-1-kirill.shutemov@linux.intel.com>
 <6afe76be-90a7-4cf7-8c6c-23e6a14f8116@suse.com>
 <DM8PR11MB5750C6641F0951928E95439BE7792@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZbPWht37uWZGhp4m@redhat.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <ZbPWht37uWZGhp4m@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.01.24 г. 17:57 ч., Daniel P. Berrangé wrote:
> If the CPU performance counters could report RDRAND exhaustion directly,
> then the host admin could trust that information and monitor it, but the
> host shouldn't rely on the (hostile) guest software to tell it about

I guess it really depends on the POV - from the POV of an encrypted 
guest the VMM is hostile so we ideally don't like to divulge more 
information than is absolutely necessary.

OTOH, from the POV of the VMM we could say that the guest could be 
running anything and so a facility like that could cause some confusion 
on the VMM site.

I think it would be very hard to reconcile the 2 views.

> exhaustion.

Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF7F53A7
	for <linux-coco@lists.linux.dev>; Sat,  9 Nov 2024 01:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731115210; cv=none; b=C1U8cyvCOfsQRuY6jr1AFfOHgeTC2wbupSCpYr8Ky/gZzOykofiurq8eTEVc52C7p/p/z+SQTd3E7UNaGnvNhqohb9sEMP1eQpJ8CZOHpIYI2dyhnbAtlFGUI17hfPqSjnIr5cJRa9t15breH89jbPTlaqDM2NCQC+KvuV/kRa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731115210; c=relaxed/simple;
	bh=8T57QwEx0r82E64B6MC0tKGz17LxJfUJ65qzn8eT3FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYe+fwqMrwnOwYXfgf3KNnpkPL4GqNx1WrZkiTCsRCkenIgYIDvPSE22dPOFhMD/9MdEzkAXT5pRYooWu7dG7mDs5kBqzO78ugzWGvIZI5l9FPVeERY7i5Jb9AuF2wmRlEYmUKOfH9LBsWMScvVRke7hqixGoOG/89iAPWj3MtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsR8cayD; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsR8cayD"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e604425aa0so1691506b6e.0
        for <linux-coco@lists.linux.dev>; Fri, 08 Nov 2024 17:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731115208; x=1731720008; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+nzJol7Ows9sCcHIaknBt/mB5hbo+FW2PxTq/Jiujo=;
        b=gsR8cayDsiS44Oa393HbIWv2c7Q1mmc6A/e5bqoFSkAmIRISa9n8ceNCTyJ9vUvnS2
         IxYWbuXCdGtxbX5IZ3zMtViN8ivTwAqn5hRREchxt4/SPRWv/P9t9XzrYJCcxq/PL0zX
         0KLAmw7yxzNshyMb1Dg9dFIADZjCdIfdcnufto0NOO36B2u8Zf9FerlVXTchLqRVOu7s
         0s1DWqlJgFcSheaC8U4IRtSggc3rI3gFUeSvVJtHQZEV1yiN3CWQQcmiRL+PNTsos9+S
         uI0cct900s7LRbzpqT2rn4YTeMce1qEjTVyK67FYEE8YQ8kpY0s81s3OsIGTbVtYIv51
         l0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731115208; x=1731720008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+nzJol7Ows9sCcHIaknBt/mB5hbo+FW2PxTq/Jiujo=;
        b=v48pkRudnf9eTtgzq7a2saYt/Fex+tVZVRSAh7t8L/POk2A4wWXQJfTcevqftzeOxy
         JpxyUiGxwKEaVyo++ipEf5DEY6IivgL2D9/nzSOtRbC4xjDIvuQ5bxG5eiTKTuIQJDsf
         JUu5IF0k1m93ohILzpBT/5zX9QJRqlyE7/qj7kM1beefuk4vwn50U+LEDHNrpg+/+pQC
         QU1+tSu6vDnT1keVfCiffJEuRODH/wacrDIezpsrq0Sxk988Ud108gOuJZZ5vrvEmAVT
         f9oNEz54ZHPTwhjGdUTjhtYhfjngM7FC2uvqB+oVsM8wTD7bNrSoDfbi71VbQsKmejJU
         UGvA==
X-Forwarded-Encrypted: i=1; AJvYcCVdQbhXqhI2dGDfInyug1Y5u6NQ0OnwicSlHl4UjF+FSjIwnvWZIfdwpfUO/fus6U0jcmFHpAYFv44H@lists.linux.dev
X-Gm-Message-State: AOJu0YzoJhlmlR0g5pRP2OJcH+13bKeQ9ATqg0yBgCx9cJJD7VRB0Z4w
	6RCUQyc/E8qpbA31Lq1x39sR31qAeZSNw7udqXKEyI2r0Danw/TH
X-Google-Smtp-Source: AGHT+IEWwZS3Ni+/0mOo+fFHB9SYtom1YAKoeu5S14QI++T0QB+N3M8W4JCqTE4x00SFLsCMZqd+AA==
X-Received: by 2002:a05:6808:3c8a:b0:3e5:fd66:c16b with SMTP id 5614622812f47-3e794737dadmr6209409b6e.33.1731115207668;
        Fri, 08 Nov 2024 17:20:07 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cc67484sm989696b6e.6.2024.11.08.17.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 17:20:07 -0800 (PST)
Message-ID: <a28ee651-b557-48ca-88ba-1f46eea81eda@gmail.com>
Date: Fri, 8 Nov 2024 19:20:06 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: GHCB draft specification v2.04
To: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Shukla, Santosh" <Santosh.Shukla@amd.com>,
 "Giani, Dhaval" <Dhaval.Giani@amd.com>,
 "Upadhyay, Neeraj" <Neeraj.Upadhyay@amd.com>
References: <3453675d-ca29-4715-9c17-10b56b3af17e@amd.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <3453675d-ca29-4715-9c17-10b56b3af17e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/24 09:25, Alexey Kardashevskiy wrote:

> Hi!
>
> Attached is a draft GHCB specification with updates for SEV-TIO, Secure 
> AVIC guest APIC page, Debug Virtualization support.
>
> Please take a look and reply with any feedback you may have. Thanks,


Just silly feedback, but "AP (vCPU) creation from within the guest" sounds
fun! Thanks for sharing.


>
>
> Changelog (copy from the pdf):
> ===
> Revision 2.04 introduces support for SEV trusted IO (SEV-TIO). SEV-TIO 
> allows for passing through trusted PCIe devices with TDISP support to 
> SEV-SNP guests.
> Revision 2.04 also introduces support for guest to notify hypervisor of 
> a vCPU's Secure AVIC guest APIC backing page.
>
> Document Additions:
>
> Document the SEV-TIO Guest Request Protocol used to communicate the 
> SEV-TIO device measurements, certificates and SPDM attestation reports 
> to the guest and provide the guest with a means to enable the device 
> functionality if it is determined that it can be trusted.
>
> Document changes in hardware debug support in an SEV-ES guest.
>
> Document the Secure AVIC vCPU APIC Backing Page Notification Protocol to 
> communicate the GPA of the guest-owned vCPU's Secure AVIC backing page 
> to the hypervisor.
> ===
>

Best,

Carlos


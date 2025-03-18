Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAEF128816
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742320601; cv=none; b=eiyvAJo1GDk3xbNtzlLXmyKLmJDuOiBdXLr46B8+i2f40LvGUMB3+ZBHVJKuXV3dAHjyUDVhC4LH3w2Dn8nRDNHT1ziXAd6S5cueYQ/nwivjh0xG2IPXSY/df2cc9g+KL8QNbSdRLa9eKuQfit6vSiKiW3raJww/PbsOVGjqQxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742320601; c=relaxed/simple;
	bh=4PZfwGrp8v/V+a6ySydcmrMh5p9mr08FuVy3311xhwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIhReDtIC/GtBnpzTz3xjjVwGRJltj0XHIJW4nrPdR0R34czFkaIWRnDA2mL08ONEjJj8Ww/pdUtL0LIfTJ/jrVViwbTVhS1+QidDPF8JgZasIBvMlgRmq5PK7ynZ36FhLZOmpT9Fnt3kGf+llaQxTmyMpzCS71/L3kCRmUjoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MR9OvdVx; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MR9OvdVx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so1016400566b.2
        for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742320594; x=1742925394; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBPjmyPyfiOdzrQpzRRrkTO8G9wlDGhtVrZqNtmDiH4=;
        b=MR9OvdVx5FBB9lDyr7zwPo3UQsGW+d1U6AyI7SI58SEUT5E/1YCKZJeLHWqNPdFK4m
         /hMw1LKKsIN0xqPVq/dWcc6956Lw88Uv68dBiSoMKwsILuVZ3RGETY5H77ZqDY6hQzGc
         GN8OItKqMVyld+Rymr+RIp//xPo5t/nKIJGaJCSxzqlwCirpv6clHWJSgpKbt9OgGhV4
         qVH5o9CAERnvA+4HLk0QnVP0nEseeHPZDGylB6lIWx49jA+JuiJNJRFGslSI7rov5bwD
         YfL3HrEkJA9+M5GtGPV2X5GUx8Z43axY0OM9wmQR3G3OrRICMD0RGnHqcDqHnWENZlrm
         FsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320594; x=1742925394;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBPjmyPyfiOdzrQpzRRrkTO8G9wlDGhtVrZqNtmDiH4=;
        b=B3TZpbwZrh3dbZSGVpSia+e8p5EPbXiQel6ip9BQwKbq8Uu5cfFOWKanRyeWsejUsw
         RUOsiQDmoVDNq0eeI21ArsbByg77N0hVmvCHrYrYDHzX+5IcApxTu/KkDnk5c3NdhTBS
         Sv4WzP5TbO4BxV0UTUl5O0pHWvhxODba8TidEAKm8FSlwPDVUFZn4wfjyjnM4Gjuw/bH
         yMiCUQllOWGIrTVBpKxxJf4Va1TkDcg0y6r5tiJPMFAHmT/pxsRfDdsgcgXCruyOnmna
         VafcGzzE3BCV/Strm40/S1SDplCyYbs/JosRpYoEd0hpkGSd4aQV3SLpKEP2Sy/dffxE
         K2gg==
X-Forwarded-Encrypted: i=1; AJvYcCVVJdK9Jjf0eZzPaKldJ99D8T5L4oFXQznBCwjLJNRmVV66WUDeaTuy57xk8uJw2jolN+wAYegn9wZS@lists.linux.dev
X-Gm-Message-State: AOJu0YwHPZHwUycvodq/GJazkoCxoo1p7UQKdrF69Z02x0ZIH/GMjDdG
	TszE3iae5ulBPPQhempVg3znFsb8onmhSr3WFG3bDk2kD4goQWewckeC0BAB2Qk=
X-Gm-Gg: ASbGncugVparr9c7p2afpOdhbm/bXQlebiDv0GJJpdZ+47r7xWJsqRa6BYI/36rgHHJ
	b8x96khnOqbCX9Z8eLCIj6eaYRrHjb9o9q961az68pCALq23L0ioTXLx+INcY73Lf4pePP02dNJ
	Gi0KovoyxYjNHDAB5UNrLVwiN/s90NaXRngHzZmXBZsdS5HbJ51E+unQrxUDYXwNHAnckWhNdAx
	nog/h9qBjeKN1WQWi1sCk2oElw1ZQUIItJnBltr4BIsRJiiZvg2lEqTds8OsA8WkMogVIc8F1NA
	BRyjiKSkii9JBE+nksMf25C0FkLXxYLwQIzylQX9js7jxRcYfQuNAYv717EaMkr//QJBzJDm
X-Google-Smtp-Source: AGHT+IFMjkZ5IrHq4jLg0uEgl/6brC8Ml4DCkmZvAq2IsoOMSkCZ8VOYThwlQt5Wy+iO2RTDT/fpWg==
X-Received: by 2002:a17:907:728c:b0:ac2:4bfa:6f33 with SMTP id a640c23a62f3a-ac3b339ceddmr13164866b.54.1742320593886;
        Tue, 18 Mar 2025 10:56:33 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.143.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aef90sm887318466b.6.2025.03.18.10.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 10:56:33 -0700 (PDT)
Message-ID: <3a6889b3-114a-4921-adbb-0579891aca6c@suse.com>
Date: Tue, 18 Mar 2025 19:56:32 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
To: Dave Hansen <dave.hansen@intel.com>, dave.hansen@linux.intel.com
Cc: kirill.shutemov@linux.intel.com, linux-coco@lists.linux.dev,
 x86@kernel.org, linux-kernel@vger.kernel.org, vannapurve@google.com
References: <20250318113604.297726-1-nik.borisov@suse.com>
 <babd4e40-0cb6-4796-af86-1944e32f89ee@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <babd4e40-0cb6-4796-af86-1944e32f89ee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18.03.25 г. 16:48 ч., Dave Hansen wrote:
> On 3/18/25 04:36, Nikolay Borisov wrote:
>> 1. Should we forbid getting a descriptor to /dev/mem (this patch)
>> 2. Skip creating /dev/mem altogether3
> 
> Like Kirill mentioned, it would be nice to leverage the existing hooks:
> 
>          if (!capable(CAP_SYS_RAWIO))
>                  return -EPERM;
> 
>          rc = security_locked_down(LOCKDOWN_DEV_MEM);
>          if (rc)
>                  return rc;
> 
> Lockdown seems like a decent fit. We'd also ideally check
> lockdown_is_locked_down() in x86 code and spew epithets if someone is
> booting a CoCo guest without lockdown.
> 
>> 3. Possibly tinker with internals of ioremap to ensure that no memory which is
>> backed by kvm memslots is remapped as shared.
> 
> It's not just memslots, though. It's any TDX private memory which
> includes stuff the TDX module uses like the PAMT or SEPT pages.
> 
> 

How about something along those lines to warn when a CoCo guest is run 
but lockdown is not enabled:

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index 9a0ddda3aa69..e34f6c0f9269 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -10,6 +10,7 @@

  #include <linux/export.h>
  #include <linux/cc_platform.h>
+#include <linux/security.h>
  #include <linux/string.h>
  #include <linux/random.h>

@@ -206,6 +207,25 @@ void cc_platform_set(enum cc_attr attr)
         }
  }

+static int __init cc_lockdown_warn(void)
+{
+       if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+               return 0;
+
+       /* Not a CoCo guest */
+       if (!cpu_feature_enabled(X86_FEATURE_TDX_GUEST) ||
+           cc_platform_has(CC_ATTR_HOST_SEV_SNP))
+               return 0;
+
+
+       if (!security_locked_down(LOCKDOWN_DEV_MEM))
+               pr_warn("CoCo guest running with kernel lockdown 
disabled\n");
+
+       return 0;
+}
+late_initcall(cc_lockdown_warn);



Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613C286D5E
	for <linux-coco@lists.linux.dev>; Sat,  4 Jul 2026 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783176318; cv=pass; b=GgUX05dfcrNSgX37Bb7sw4e9yFR8eNSqrgnAcDQvnJtDP/oERK672XBdUvYvs8KiCpA3P9JYb4fP+aiTGOSbVhFWHGzQ3ao38qxCbUXLD2EWjR5egG5TceQU+S29EMxi+LwxWBdu4m2yDsQWK4r2idjJzeEjgVHU4mQQB8lSTDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783176318; c=relaxed/simple;
	bh=XpQJwh2GgNhD6EAOhQ4I53c3yuO4+5Tzr8NzYHPiJFM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw1kqE6uUT10KMIGL2i8dwbdXDJOBBTu6SxXk9gELv4ij8ecw9cXZLOf4Eh2eMGNSuH7H2ORAqIKzrLC6UbESrA4Y8wZ85LSSYBDTYZZqD9QszsH/G/KBKqwCj+XORR/AQEn7/HlcYG6eeKRDpyNh3gxZSs7OP3OCot1dyd8lEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AiOHFlTF; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AiOHFlTF"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso996545a12.0
        for <linux-coco@lists.linux.dev>; Sat, 04 Jul 2026 07:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783176317; cv=none;
        d=google.com; s=arc-20260327;
        b=EbIRDEz+yf+WJ5p2uZUfFsx7SsQX0YRwJBuACDNDC9ELd2vg9CEgszpFv9iq5Dcj2h
         kMCwNUJE01QgHmkIk2jOZQQvIGHZIJ0eUr81FlzzjzMQeHrvtEALvYK6CAtAR1wkpvN2
         3KvLq2k+u6PoLjnUPO+PVA+j6yyRfBofagCmPDr44CPnRMRU17vyEbD6JnetdeHadyq/
         R/tnQ9i/z+mWmNIK+G43G8zYpsWhV16U1QyA8uqoAUe3arTh26leQjNew8Cffc707KfH
         9mmjdfqISEbOxzKfOWD5VSIJtfb4Tg2MyGK3mwT4AcHPc7JfTHGfAMg5gnTkov1OjZ9g
         rt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=L9xOVRuKFfEvpugkoigwFk6Gb+xTAo+YrZVd7V9k8iM=;
        fh=p9GgXCX4SQz9Snbgs+tDHsjQYrPHdPAvA7GXLYHUKk4=;
        b=MOyY4U1znCczkeQoeHnsQC2vShkcdiJpBBU7bqZzIc6jyElkmVgzC4KzUap3QEHTmQ
         nak6kCiKKlw1Y0HodN+Ts7Rd8E1l98TTwhyhM5cUWEXbRgSbjyKM3PJh4Bu187ZTy9SY
         V5341uZyMopqC1Ko2JUVzdgrlKJA3PljwHEowrajhDdNEpXUfq8O8CHWTFbM4gqvOM3j
         RYpfW90BWLKTA006OwTInNZ69pKcqgL5LRpAj3zTfmTEKUz2VqHGC9CltKoE/mCidNKf
         unfO71wqqwzdAeK6DbHwqomxv2pxg45IBMYArdLUTS0LarUCnJ/KdV40ZwAGMmucIlud
         yOWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783176317; x=1783781117; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L9xOVRuKFfEvpugkoigwFk6Gb+xTAo+YrZVd7V9k8iM=;
        b=AiOHFlTFGcr6G5SdgdgMmF7GVRG8xHkUL1y624HkWfrLbxMgBU0mkOK2/FgASDYmQv
         vjJ3QogJ+uqpJlJ+GI44PHGjuNxT5ZuRDhrGyFQRfkuaQOUfXugf8uxB3snI+3yppGYa
         twlymSak95tbZvcepSNAPp+A3WeS61jLFVqX6aQWHWVeV2D21T1t5Woh5rBQFcWApLJx
         T9DywcdrFPSACRqW61GQAtKo0/kTvqe0PQBzlPtmYvK6hG/NCLTyyxq649TQcZBChdE1
         kXq2deuAd+IpOjpBrpIiy9efu8EhcN1+YT5FvWlT7e2LVWa/vdWAeNtTCcldUSQmDmWx
         jE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783176317; x=1783781117;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9xOVRuKFfEvpugkoigwFk6Gb+xTAo+YrZVd7V9k8iM=;
        b=kCGNOp5YVy22FC3GZjAkX1fsGI3r/PUefH4bHG3oQKwnHKdnP02Nr8diqVO2jv0cmz
         oA7iq1LTF44zv1ingm0GHK73nKk+qJUHVB3Ow56aLLPOZaFsF//CrersKeipdIzHG2/8
         AaDwhooOgf+y+uY/XFSFyeU90BdheyV89Qd7TaQt8pLEnuYoazyzKjvDQXumlgfkJo0H
         +MLByMypilRwQVCnfGy8iCTNXwbFDzEOy+iQtlrsINdILLV8VOUId3wFtJ7/FfdCUSOf
         DJCOG8e081M8BCdWit6K9bO6PFh2V6ZL57UIRB9wDj07D//tjQEsKVhSL/IWJn5L17Ti
         Oggw==
X-Forwarded-Encrypted: i=1; AFNElJ+DXnzP2qHYLKl6yPqNK6fLJt7qqXjerLT61/ZgkksSoDupCYQ4xcg39f3w0XrIvHJKFGSWrFbWhNCA@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfdft4ZbenHNwbBMjBvhUcpaU/p8vCADicVf4G3NCqrurkshH8
	a0wTrQuT8Pp8izIttaqB0aCjZJPKo0AyDSytx19IcSNp0QYhXF3qZZyggO0z9sopxjPfLtSOU6f
	uatndeoWNjtRLu1RykgGoiFxDjZMDtqk3KHfU/Iwl
X-Gm-Gg: AfdE7ckvjxzHELvTczy/q4RYgzBcte1RdBpy/FdP6DDPSbDYIZfOKaGA6XfIo0mP5ZM
	8NV+g18yP7xrSEQ1ErCwYAJRG404qpxA44NXYMueFyrd05oHwEjfT8/qQMdKbNe6FkB2Jh87510
	MSLq6PTGt4zEzDp15bbeJw3cL4nwlS7HsMBopt+glX4BYvDhQRz/OuDnMlW+aS3sapdLYCQEDkT
	sWG04xXSkPHnKReTtHRPmRGpJuS6E0/a9bolX3K29TZZoT6Xku+yd0Mtc7NMwkLbxttx8wqFUeD
	pyfaGVAjucUdolxyn7Bm0NtRQU+T
X-Received: by 2002:a05:6a21:4516:b0:3a2:d838:bfca with SMTP id
 adf61e73a8af0-3c03e18c1a6mr3784343637.3.1783176316400; Sat, 04 Jul 2026
 07:45:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Jul 2026 07:45:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Jul 2026 07:45:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <BN9PR11MB52767E6C22CDF7DAD9D5FF1E8C582@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-21-yilun.xu@linux.intel.com> <BN9PR11MB52767E6C22CDF7DAD9D5FF1E8C582@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 4 Jul 2026 07:45:15 -0700
X-Gm-Features: AVVi8CeBOQYKqHyO-ZgLrEnt9NfH2sTywpBsyBpG5p82n6nbBzKMaxoqUYDvD88
Message-ID: <CAEvNRgFL_UYz8449z-PJ2ew9x3Ju6qzaBeSxVxLkcNMJeqzMww@mail.gmail.com>
Subject: RE: [PATCH v2 20/31] x86/virt/tdx: Add a helper to loop on TDX_INTERRUPTED_RESUMABLE
To: "Tian, Kevin" <kevin.tian@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>
Cc: "Gao, Chao" <chao.gao@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, 
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "Xu, Yilun" <yilun.xu@intel.com>, 
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

"Tian, Kevin" <kevin.tian@intel.com> writes:

>> From: Xu Yilun <yilun.xu@linux.intel.com>
>> Sent: Saturday, March 28, 2026 12:01 AM
>>
>> +static u64 __maybe_unused __seamcall_ir_resched(sc_func_t sc_func, u64

How about __seamcall_retry_interrupted, to emphasize that this function
retries a certain kind of seamcall?

I think resched is part of the implementation, of what's done while
retrying, which might not need to be part of the name.

No strong opinion though. Thanks for considering.

>> fn,
>> +						struct tdx_module_args *args)
>> +{
>
> 'ir' sounds redundant with the trailing 'resched'?
>
> not big deal, just a bit confusing when seeing it in IOMMU side where
> 'ir' also refers to 'interrupt remapping' and is frequently used in
> irq_remapping.c... :)

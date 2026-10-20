Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505275;
	b=mrwLk6QfKVTBnbF2EFBZ+7z5CmzjYr8995wOWNMDlo9qpv4unpRF6dSNEuR46u+3vU7l
	 zvDuIZ3xk+2DaSdGhrVO/CXyQlIV/6NDsoVGEC5BL//+c13qriANbnotIPrs6Ni25k6gm
	 C7pSsb0PnngN4kVwiESLbx7Kd7xxCfAaaSpeIx7iSDoP9F+SWhX5zGR6yQCB/8aMDL7kb
	 N4uxk2AtuqqhUJ4kS08cmLRD1igRhb8aPAsk8IfBBXjoC/DgkQhlpNPeV/aXq4F5b3mEz
	 T30B2DfLvXhxA27yBB8K2v/ILi9YUQdSdUUQrQJlch3VJ1PffyqJn4R3rkFnDqLaftQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=o+EfFrr6u+uTNXFgvPFyR21Dr/tevP4cbAxZ6qNFw/g=;
	b=tnT6/83c4K1/YCGEzIXoLT6ujjdrijHtwzQ1nxssQv/otQiwJsRBzKNazJqxhwvf88TV
	 WqPm64HKoYs56+XrKTHB6TQfMZz17s7En3XXtkUOCGhM46EiztIAq9BCTD0SWhLCmHs9+
	 VXha497q4p4CXLyh//vfbAvXMxqVivZMSlkK8eVTeTEDi4jzvEC04TwQGr5MlZM1iI/43
	 a/BvmEXsJSejlaew+ZYwpQIOa5W86jDXqwzwg/nHo8hDrjY+pYLTf/CCS5SMbOJ98Jg5E
	 S7V4eZO9hN1UY0A985FpIfiGpX+SY1UxwTMT70gztnH3fWoDuvT7umru9lXi7dPy6vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bI15iWsz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68366606A31E
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 14:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68366606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bI15iWsz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so549432f8f.0
        for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792505273; x=1793110073; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+EfFrr6u+uTNXFgvPFyR21Dr/tevP4cbAxZ6qNFw/g=;
        b=bI15iWszs/Xtx7ZIBI6kYNbvv0SumTeWNKlUJiTN5KER1yLJ8ytxXVDHbNnUMwQeq0
         A5KrGOyIdimpsrtg6R2TMkNd5rRA9fscy9QDvsCN/Q57UMwyB/9JbKt52u905pZAo8d7
         npJsFQBJnU7+MeKLVVDGBrlJcmptvvKK6NBNPLyVKFZcKO8AWf9RREblN8pzmknODY4w
         msNP/2GK3c+Y+frJj1eR3UokfHVnNAt47N0rcL5Ay0sdBRNS7IcVQ7661GHR9QFY2KBo
         B9btegeznsz69FG9HVzBj59f0i2JBZFiyQuDdnOMoLi9ngDIAvA/MyOd2N+4XRawKMR5
         2zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505273; x=1793110073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+EfFrr6u+uTNXFgvPFyR21Dr/tevP4cbAxZ6qNFw/g=;
        b=h84lHDuEvz7ztWQZeZZdE9sLeS/UqC8uaNdppv7rkVmo1FFiHMXBlAy8+phtDNQyvK
         nROXVbPXZtvIppfczoc5xfN41sXEOKAy6jFRaR2HcY86CEPR7vHFDA4vvsL6YgKg8Sg2
         /lQBuExi3bQ9NS/wJXIvKEQJLdJgmhD6rJXaIy7QDDx+QtE9mpp+P5w7W62CbhpdmqmH
         gk5dzUV/PVh8xTQaXv1EVwOjBq2iFtan2CGXXEOjanwC+8wR2H2rQJUapJ3Y0mtBYn3y
         5M5t44YsgAZQf2e/T92BTXHla8UB5GWNPhBtc0yo5sTzypTo5n7d8YWXXeQ9ZJpjAoYp
         dBag==
X-Gm-Message-State: AFq9FYKvvsIDwIy6buBvw67PLZxq2xmyrwMODuuJ4AeKhOuv8+qZgYf8
	3va+9nui1ChpbEHoTWyTvG2KffKeTwsqwH4PwSdrD+0MWaBYKNa2SvdbWLdHdFZUkxo=
X-Gm-Gg: AYBFou0vHcmEA9vnlsILpUnUuXjWjNUau1/8Zrdbls6zQocMLJ5UpSvN/rCqlWoDM/x
	iboMzthXxVprGmEL35JMBMlA+G7EAjzVgM96xZlKhcfMXXe8RF0XCdoEVP9vpU+kz5zezbgdraj
	8KA7B9DZmmwcNlKTTejOYsoKRWtBJ4JACbXJsHpyPw9SdFSATaB3eFSuyQVHmH4ynJLQX0C9M35
	V49mTqj44OwMro6rZ5poSsJIZjXpXsx81ZZFVJ0NGodt3EsJ/G9Q8zOIgUiIbpHFYLLkVnLJBVp
	04MH/3+I8fHn3KHs7/yYRk47b6trdQj+b4/Nxl5L8Ssq9UuazY3gmBeKeEUCqBXQx8CyE0SZwdT
	RAJcI68ZC6m3vYAaG/rye7mHeBlAScGvrdl5LryXk+2N8dY3ljeJZISF0T70+04zFwGzhVDMb5X
	aE4E1H7/O23uv0cyEmbs/zN6XJK9eszLHL/qrWJPl//vPZfFywB9Cq/IW3qG4ukV+VCYzIz2MRn
	wq0
X-Received: by 2002:a05:6000:188b:b0:48d:eac6:5c2c with SMTP id ffacd0b85a97d-48e1e7bdaffmr4987751f8f.15.1792505272557;
        Tue, 20 Oct 2026 07:07:52 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm6913917f8f.36.2026.10.20.07.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:52 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:48 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atd1rKbCweUfCCBu@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <179245258505.58760.6060356114682279013.b4-review@b4>
 <atdeH3nA_gkLwPLM@FV6GYCPJ69>
 <20261020125520.GN14213@ziepe.ca>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020125520.GN14213@ziepe.ca>

Tue, Oct 20, 2026 at 02:55:20PM +0200, jgg@ziepe.ca wrote:
>On Tue, Oct 20, 2026 at 02:28:55PM +0200, Jiri Pirko wrote:
>> Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> >> [ ... 238 lines skipped ... ]
>> >> --- /dev/null
>> >> +++ b/Documentation/ctlv/families.yaml
>> >> @@ -0,0 +1,13 @@
>> >> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> >> +%YAML 1.2
>> >> +---
>> >> +# Append-only registry of CTLV family names, indexed by family ID: the entry at
>> >> +# index N has family ID N, up to 65535. The root family owns ID 0 and heads the
>> >> +# list, and every other entry comes after the entry of the family it inherits.
>> >> +# An entry may be marked deprecated, but never reordered, removed, renamed or
>> >> +# reused, its position being its wire identity. Every entry must have a
>> >> +# specification in specs/<name>.yaml, and is added by the change that adds the
>> >> +# implementation. Fixtures under tools/ctlv/tests/ are not registered.
>> >> +
>> >> +families:
>> >> +  - ctlv
>> >
>> >I see where you are coming from with this, but it is going to be
>> >problematic from a global kernel perspective. Given CTLV is imagined
>> >as a general tool for any subsystem we cannot control the tree that
>> >things merge through. It will not be like netdev where there is one
>> >authoritative tree with a linear history.
>> >
>> >So if Bob and Jane maintainers both add their own subsystems by the
>> >time it gets to Linus the IDs will get scrambled, and bisection will
>> >be lost. 
>> >
>> >Either changes to this file must be strictly done in a single tree
>> >with shared branches (which is going to be a bit hard process wise)
>> >
>> >Or we need to put the ID #s here and have some simple process to
>> >coordinate them during the development process. Since new families are
>> >probably rare it shouldn't be a big deal
>> 
>> Exactly. Collision is not very likely. Explicit ID or implicit, scramble
>> would still happen. And in that case it is resolvable.
>
>I think because of process if it is kept like this we will have to
>merge 'dead code' to reserve spots for people doing new work..
>
>But at a minimum this comment above needs a big fat warning not to
>change this file without consulting with XYZ to coordinate merging.

Agreed.

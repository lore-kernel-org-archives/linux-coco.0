Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499340;
	b=CotMb9Gt0T8q9wmUbvoQGZ7QXM5mw50wdL6lww/ZQFK6OMms8QoxN8AZ88muXbYBl/dU
	 7ncge65YOOSqWcjsqOzDYhnUs9Au/LrCzPHJrPs817sJZoKZ4+tIycBr6z8s1e0LFu4lq
	 E4I4nY78KtvvtUHkeA0r6Z31XVtB/lyc7GpIP/btz5SQ3bYR2mFTNG0MVVVeiWIAM3atE
	 uE77mk+pBf0iwK102z+NK2CR6H6lLMG5/VnSgUmUurQDLVJxxJeyKPcy3ZhQSCNgi8T36
	 9bg/dFSa16iHzDfbq6qajoLzcTj3rB/mVnmKeHiFqzgd8uzkXVwSmYDpRw/62HL0ccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
	b=ZVvMdOEWZDNz3pDhVaAR1BAskAXznO8aglJV4C/5eM4IDXplqy1+IQilRch1wmOXFsL5
	 6Xqs+0Q/9YzOrtN9tbJE+P6qbWlipG6/6xCiAuJODysNtvx5S4t4uStpRZIeA+IIfz4ZU
	 +G3F4zX6suMysDEyYP9iBhrHtMGpJ6vSvUFJsX/qtBJmJWJwrvp33Oc2NONZ0NtIBuH4y
	 85g4lZtGGqNQ4OOQgI+3H3UxCUCyeNLPQLEmZQA9LL38eUHm57+CnDXe+uMk9i1yOp4CP
	 vT4Szmz+JeWBAhD2qPtGoWuITUFiX7kdnGAWbS9ww8LkpVsJOUf3L/Q52ghQoVPyIxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=X5sMCbeM;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C75606A31A
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 12:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=X5sMCbeM
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df54150dfso2445181f8f.0
        for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792499338; x=1793104138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
        b=X5sMCbeMM45B+AOxpO/Qks/x7FLtWInH8WwyWy7yUhNgS1Bk4ZUU1gykWd7Sl1w+ep
         d4MAFP50gt0zyO3qilKOxApXAIOFL+FQO5i+Y1CLa3u8g9tsKywa+LHQ9B7LPCMtock4
         jMC0qr9Bv6Vz0kVqCOEPjTYN9hy4DMQTB/iyG/6s1Dnlt5u7oypxV6notlj4Qb/dYRKA
         zWct1oArb31Ccqm/kq+7N+IyAdaeGEORp1TqOkq3cPcs52A4/JjCH1UdQ9SF2EXQ+jkk
         50KdAfWfKsL6vp9Zrok/CtMPbjYwI5wuUyydxeuYvxRi3p1aup1uRsHqkfRhdjwATYUU
         W5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499338; x=1793104138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
        b=YgMmxipbB8WFZDdxgYSK+R/g5ewlqbwbiQi3nDRbGswtnrLylg28HB/HJoCZs/+J4Q
         9+uyDQeY336Z2kQzpm2Uz0jxV9kTUk7gBbyMWovsazitueLv1OKsJN1cgKILowWnuicx
         laGL2Df0hMnarLGf1bml4/R/KxBbVKDcBDf5flYQq6u8EUwsZgupOVLlWz+M2Ggd8fG3
         TmUNfGy/HEQomd8JeP6kFqrfBmM9qBAQQjuklCO8zVejN67mD7sY/HVB4RbNiZxt273c
         QxITurvBl4GPEKzzCF39wsYnCUzzUO+pahXjDWBCMcNZ4zFCiMO1U9Z76uXoMvxgFfxf
         xpCw==
X-Gm-Message-State: AFq9FYIsjptcg46sa4SWQBJe1/OxJAjHaudwXbAcARw6VjPC3WeRgolJ
	VhqwXrsLcY7QFUJBODWRz8jmoXrMIaNMa28U77+62QjVFc/V/N4Xk/63tLxE6LGAYMA=
X-Gm-Gg: AYBFou3J0SZgMXCsMgp2mcnr2XBZiv+oO+/+rFITAviARW/D0/2EyprUb7nD2GR7ON+
	nIwnGZrqGk3Bz5qYymsCjVoug02UztuA5otqf+aZz3QPFsm2ONBTtzN+EMTkwD3iEbgBBOd3pMR
	RO+dGr53FWb+ydOfdEMv/Eq++hDQDOPn8iufPsV8bjxZJ8ds8QyrYF612dt8Z9vTq/eIYFV3hRe
	wJ/5111xW3Cg6PVYzmaUVV7BLQz12YIO16XdxIh5BFzBsG8rjbfBzxnuOldEOR+y7qDCFsFeFwd
	jBOUCyy22QWf6EAPH/5vg5DHLVZe+mUZ+PTrT0lslQxj4xYuks/wbZCCkOFgGrOCiL+/PXqkJXe
	8h015gZMIjvhfne2J/fpCTC4U3Xbe/J3qG9C2P12OGbOUlBOYkxrqiiPTgempqoDq9pJXoYUSNR
	Thu6KUOaSmz1V7QZ3TPHrPg4i12+0SGTzsmog9dUHvErAKxDP6BK13uTQpS8Z4svhs5sqf1t9yl
	ESD
X-Received: by 2002:a05:6000:3108:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e07bc104dmr25850403f8f.31.1792499337690;
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fc6csm5636775f8f.14.2026.10.20.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:28:55 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atdeH3nA_gkLwPLM@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <179245258505.58760.6060356114682279013.b4-review@b4>
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
In-Reply-To: <179245258505.58760.6060356114682279013.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> [ ... 238 lines skipped ... ]
>> --- /dev/null
>> +++ b/Documentation/ctlv/families.yaml
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Append-only registry of CTLV family names, indexed by family ID: the entry at
>> +# index N has family ID N, up to 65535. The root family owns ID 0 and heads the
>> +# list, and every other entry comes after the entry of the family it inherits.
>> +# An entry may be marked deprecated, but never reordered, removed, renamed or
>> +# reused, its position being its wire identity. Every entry must have a
>> +# specification in specs/<name>.yaml, and is added by the change that adds the
>> +# implementation. Fixtures under tools/ctlv/tests/ are not registered.
>> +
>> +families:
>> +  - ctlv
>
>I see where you are coming from with this, but it is going to be
>problematic from a global kernel perspective. Given CTLV is imagined
>as a general tool for any subsystem we cannot control the tree that
>things merge through. It will not be like netdev where there is one
>authoritative tree with a linear history.
>
>So if Bob and Jane maintainers both add their own subsystems by the
>time it gets to Linus the IDs will get scrambled, and bisection will
>be lost. 
>
>Either changes to this file must be strictly done in a single tree
>with shared branches (which is going to be a bit hard process wise)
>
>Or we need to put the ID #s here and have some simple process to
>coordinate them during the development process. Since new families are
>probably rare it shouldn't be a big deal

Exactly. Collision is not very likely. Explicit ID or implicit, scramble
would still happen. And in that case it is resolvable.

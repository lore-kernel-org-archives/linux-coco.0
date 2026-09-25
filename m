Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DDB28850E
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322149; cv=none; b=Xn1Yke8u14GNT2vd+UjV9nqY04f49qj/mhn8BP6juKh7tX9o0lU+jSbYAy6niZ2LJaoQ7N/aAPiu9GiNKiJ9N4gZlGFhKGtah/hCql6u2ZIwCKT9Xrg0HUknYr5stjkqbFDD+8/eLNKmSWMG/juCDrP1hQXelC2tXRb1mbo3P9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322149; c=relaxed/simple;
	bh=gKzD/FCuBblIeUCUQ3O0RIcSqBSTsdWpYrSMq5ViNP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGU/fDoRC4RV/bekeUWv0pEOQwt8DoS5t5uDpgnGLTnJnw9WiDw0oITWswARgtsL9laEpwdRezC/+HMJb0RILlPrzlDMKl574M9cASQ5AVFgwGndkCZanirZ8/lY6d1yTu1K65T7+nxWGPLDQZYahBkpOlj7HF3otxxTOQFPtIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T6UbkA1f; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T6UbkA1f"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so434690f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790322146; x=1790926946; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slZdw4A32DSCjt02qSS0R41Pao+j/iXx1LV40wWX79k=;
        b=T6UbkA1fMB+NGWPcOSuURk9u0wvpg828DGHn0TQ/cpsk/xlobEykQS1mxF03dNlm51
         j3LOlWZjChstuCHbbCoH4Q4jDJgwiAj1gf04vpmYyo7Jzs9fsY6kOLZ5FjIXqojDoQNJ
         JfJv6ueVJFneEAtz5sMXp/Sr41z/mf07GdR0qGwycwIBT/ckm+QrodgOjwMYO9Wfmpzk
         FqdnJ4PX6b3os1QbmdkkCRKfmaogYVucvwmvj6070nqW7Q0MzjlfqgoHuAdr79csWLCX
         XvXUeucntlsmp1oTG1n1GorVIX7ufu0pzSUIM5SNhjh2VoieQeWP5+fTSYiIzFGDG0zb
         FymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322146; x=1790926946;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slZdw4A32DSCjt02qSS0R41Pao+j/iXx1LV40wWX79k=;
        b=zqCihW4MGJ/fRRanv9oI2ra5tB1GKBUB4hfci5KZKXzQ9jomdrbc3/CoeF7Z/ICA4L
         03bP/KQ4MmLpiExzYjLympHx9nA9N8ttg8tSXQzxPl/B/eYENlSODEEMoj1gAcGs1w0h
         SrS+FNOKAzGmKKQzDqPkpYARUZlZhSrhMfJo/w+phWBa/dVy0UHzndoJEz69OlDvAivF
         7wgSTcLTFGgetwEGBuopBkHaLPnt+G28pKK+RPXNl0ZhfA2JyDy8IinSpoCNygXtnHVO
         C7EwAcRaUpaDlA27dPPR0c/21bAXsFZMXI9uJ54gX9EPIgEvVBlTWhleAaxoC2iqdpna
         A+bw==
X-Forwarded-Encrypted: i=1; AKwUvBwmpc6DO6C/R8fSRsYuKrRpEpMhq4RPH39yAsSmLg8hJDYpMxWRBxRGpbw4BZN5xoPsAnh7wJeSNlEy@lists.linux.dev
X-Gm-Message-State: AFuF++lOOPaeVTB3tmY+7A72yw1axqOaMLrjX2hjLDT9MQKbEiG0cvhB
	yEFHcwexMQFVHTWEbbGRrzv5rq56x0Np0gXenTdFQKS6GMqBsak/m/Xpo9VU27L57HI=
X-Gm-Gg: AYBFou10leKvG1UNR6fiIXu4R4b1O6EP+vThUEdVuZTJRC1UFYFqjcsyVFqQo6PPavm
	WMpxe5S+c2DQaLOmhMRLJNo35rC5O9+TO7Hi+ny7s1JxcHyYow/VovtSRjT1siHXCAo6T+JbuHi
	RlkS66Kkv1SWXt2yjE4v/P/bv3r92QKYpPtsHpGABnzzXeLtya8W7dGbnn1WeIt+CF0fYozTjYu
	bLsVP5pjW9PU2Rs2KmWfvqlQCYfOr29VO9C+jUJbC+kmUbfOI9sxzlKunUMalezOqUgcHTXchCF
	ITlQn6G5/8KxyBANhEoYxIohjf0Qwz06ZolzYzv6DL3R/ny8htW7RsAPfUroIMb13zvimDcxwMP
	b9s3aRveVXBlIggZ1zAvbqsLjzK5Bi64nwKJeL7f9oEzcsuY1/rf33uKh0nKAW6sPjU5b+q5Z+n
	QGOxk+qhzbSa4LVVpYoNMYWlYzQmSOYxGM5Pn5Qm6wdSj6Pr4MrTBAxfw3+iRHz8Ewpobh4lF+b
	/kO3KKYh/k+UNseF7Bby6Q=
X-Received: by 2002:a05:6000:260a:b0:487:144:ee60 with SMTP id ffacd0b85a97d-48871725478mr8189943f8f.19.1790322145762;
        Fri, 25 Sep 2026 00:42:25 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm5007303f8f.12.2026.09.25.00.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:42:25 -0700 (PDT)
Message-ID: <5b3cb5e4-dcf8-4337-9c8e-40c6d0b1a9b1@suse.com>
Date: Fri, 25 Sep 2026 10:42:24 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/tdx: Harden exports
To: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 "kas@kernel.org" <kas@kernel.org>
Cc: xiaoyao.li@intel.com, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 x86@kernel.org, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20260917110714.1587301-1-nik.borisov@suse.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260917110714.1587301-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17.09.26 г. 14:07 ч., Nikolay Borisov wrote:
> tdx_* function aren't supposed to be used by the kernel at large, rather
> they are mostly used by KVM and a very small number of them are exposed
> via the tdx-guest/tdx-host drivers. Reflect this fact in their
> EXPORT_SYMBOL* declarations.
> 
> Reported-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>


Gentle ping

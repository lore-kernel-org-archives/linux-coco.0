Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618903;
	b=TyCRQuJvQN3Ig1W0gSkIRd5LDfIJGGzyOCIblmJ0CmaShDnxfnQBLJPjHm5+ZjsCZMdc
	 yA+e8xH+QGgliAIedjCdjBxDfKgZ2QTUYozG3HEnMyNtlD2B0ss/i14oZGU05TX6nnfYC
	 ztLjrBnLdrQaC2/gh7D9DR/LjJizHIfbYJUFa0YuOPLMPegr9qO9CrlIaXcZdU/z8xniN
	 RBoR5n9yZ1EDz1b5cFHeWDOD7BK4BHbbgqysj1CbPORZSuioP64p97ekaKibO27YXb1Sq
	 A03w29lG9JkJBFMVr7zioIdTu3II+mdN3tFIsBb+A0sr8vAIsK9nmxYplHEjofDzjXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MLwaQ6Jl6/f4tSN2XtwUoJlbirpWyViWzdWq1gz8VdM=;
	b=xHBoHWkGhNIPdth7/QXf3MSCLGloAAGFwCyzLRVguA4FO47p3RT1ft/3jtma0WPh/JTB
	 ZRwfM8/yb/unocPZAft65EyBiIexWxRkFbLk690cKGctGVXf0c2zs73d4gNTWCQtsEWq8
	 KHFAdAjUQgnqx5g7Pg5YdXKXN4eHOKdeleojhKZfmuTxOnABbvk7o2Le4/i7UIab5+6y8
	 P7prTyKOHvGPj4MzDw/sMhnuDOtGKB93TXv5RbYPR0KpEBxErfSJiALuOBDxqCgJKp8Tz
	 n6e8iF77IPvXGPa3pDU9z6FJTxZE0RNLCnhaemh5YEolRuSLHe1+Nqnwz6uxbNkz//w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=qIQ2ejEt;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3423160A2619
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 11:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3423160A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=qIQ2ejEt
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so25777871fa.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793618900; x=1794223700; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MLwaQ6Jl6/f4tSN2XtwUoJlbirpWyViWzdWq1gz8VdM=;
        b=qIQ2ejEtRr21NrEuCV4pMJgM3PhQjmZwVsbgTI2E9SHZL6HIiFEd99mQhCZZja39Sa
         4Wne3paKRI0HxAMDQV/v0Dc9UsDQWQUV7nElwR/y9SCoINc51kThlHd82ET1FINYt/xr
         aw0ypjseHVo0p9mDLVQf9CmR9U9jRIJ93ABktK234qZrDvAxx2IGQqo5I3wuAZPRtCeC
         LJYioPVr4IlDvhha/y8o83w+CME7I+bMg4gk/UZafn1Ompx5EfGTseTRGKly0oNflu83
         NZseOVRdcgOEt3X6OhTJG+805I+whhPzuBFTv7nrITucJt+mNtejFe6ReeIEffmpcmY8
         +S7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618900; x=1794223700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLwaQ6Jl6/f4tSN2XtwUoJlbirpWyViWzdWq1gz8VdM=;
        b=sAPbArBoD9C+97p1ecexBkfixiJvW8ZdI7SnKcQyJm6YLOWdaVvrDj+0qS12MQtJL+
         jDurOz7+Vzq/kGyfHeNBRzp46VzWApB1SlnQH1hP1GFwgImBuRBWdzGMAkcv0MwVJaqC
         Fb3PdAkReJR4vPZAibYArmE8srmp4oGGwe/sdtz3pe8DoGPowRB6OOLoaXGHgyTiXmKF
         Pbu4VHkshRTcM9taSzGZdv9/5jhEhJtKsieaVwYNg8CEE+igaKIYiNhXmmVo2A8xS9rL
         gNtKv9/xnMptbjCYgxoUOhsr6GNEH6CG+6u2Igwu41kFAvnt66ZDXwSMYM4UByH1lyIU
         ThZw==
X-Gm-Message-State: APuU4Z/HHyRB5dmMmOAJrWd+scxrYYJE0mXHJ7nErOpLmwBLxEoUMdkZ
	iLKdd2IK7pRB9G3a/WcMm+dYREZEvB77NS4nxgsf00QsO+n6hBoI4P16y2tLxFYahYM=
X-Gm-Gg: AYBFou24yuPrsaxtE1k8gPwt5qU/D4zpaRoCgIv3okjo2HJdAYFoikXjzb98oVZniJk
	GoKEAwFH7A3xgqGEw2gUJ5z/dxIhSKlM5LMNH+iqAxxHkWDLwEXGcGczK+15Bjuh8oqaYtbBquM
	JARWUV92ZMiFfpmbmQB84GS9+mk8bPyMehL3yUNzlKL/B6UpPdcmV+fEtnMsCfKUqfOSGPT37lb
	r/Y1JFAHefQsWDCjW05DXg/Dr6xbxZIciZVDPreqx3mjLHhOIjQGJjG5xybXynl+jciECGBH20P
	pYlhPBGkp7j1vZefJTwqPi0ly/WIWPfYlHsEAudtprhHZDs3sTR9hBpS1UhSpTkklIi8xSh7cio
	7EO4CBJwPtFqTzPtTWK92o6b49KRmMqWl8p7FrQF89WloO4fII9zxb/q8WUhiJ6WpKnmJb84pRO
	IIYYdehTu+hrI6H0RQ2Uaz5tDgxzUTIeH2RqJqBrGkPJEJ1euZTlTJkJ5KUvZHjqkkTG5zqMHty
	Wct8FYCksS670ZStfByzfrEoof1RQ709DLSaa0K23YZ1aEVCZ6Eoax08Ksf64EZnQSyCCfzwllT
	Ox70wBVhde9ufX1tLoAq0hSBH0xmXXK0UHm/6ySGJWjc89FYaA+Z+z/iGxdA
X-Received: by 2002:a05:651c:3137:b0:3ab:4eb4:5f19 with SMTP id 38308e7fff4ca-3acb7b5ac93mr23955881fa.27.1793618900071;
        Mon, 02 Nov 2026 03:28:20 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbefd30asm23263631fa.23.2026.11.02.03.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:28:19 -0800 (PST)
Date: Mon, 2 Nov 2026 12:28:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 03/11] attestation: Enter secure operation when
 evidence is accepted
Message-ID: <auhzxNDC7JZylDOt@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-4-aneesh.kumar@kernel.org>
 <auSfroz-gNb62nMG@FV6GYCPJ69>
 <yq5ajymya4ud.fsf@kernel.org>
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
In-Reply-To: <yq5ajymya4ud.fsf@kernel.org>

Sat, Oct 31, 2026 at 05:09:30AM +0100, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Wed, Oct 28, 2026 at 04:26:10PM +0100, aneesh.kumar@kernel.org wrote:
>>>Use EVIDENCE_ACCEPT to enter secure operation after userspace has
>>>checked the evidence. Check the referenced device and evidence
>>>generations before calling the driver, and record acceptance on success.
>>>
>>>Remove the separate DEVSEC_RUN command and callback.
>>>
>>>Keep DEVSEC_STATE_GET so userspace can read both evidence acceptance and
>>>device state. Clearing acceptance does not undo the device state change.
>>>For example, with the following PCI/TSM patches:
>>
>> Note that the published wip_attestation_all_1 baseline still
>> has DEVSEC_RUN. I am planning this merge into EVIDENCE_ACCEPT for
>> my next revision, which is not pushed yet.
>>
>
>I agree with your comments here and in the other emails regarding
>attestation. I will wait for the next revision of your attestation
>series. If you can accommodate these changes there, I can rework my
>patches accordingly.
>
>Could you also add the ctlv-attestation-spdm family so that I can base
>the PCI/TSM changes on top of it?

Yep.

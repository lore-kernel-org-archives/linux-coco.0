Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882155;
	b=meL6b3cK56P60VbeFCRtpMlEkvMBpyu0XXzONafGiSvxoGTkbPhG61OS3w1UMzJdaRY+
	 42NuKOMvkg0W/qvrDFUkyj8zt90C4Si41DRpo7Pk4dL0jR+PQhCeXSGRNunEvOx8APFGW
	 6kg64D0lezv2lSShki/Ue+AUYwAiAFpA2ERoqe0Dnx95i9dNqNCtbf+1nvtOIY5p8mrGw
	 6Hqfh6HZDx8tmtgi/FRYrhbUiVYmKTMpgDN3us6+tST0uzicqLi98YtlBZov5tj4NazwF
	 uYdhx4kGtElCIuEUkTvLER9bzgp75SXxr2NUmHUyg6w0bs7p+gWTnqtsLgaIWAUe8RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=viyDdmvwD4U6PS8lafjWT8pU3blZXU6a4uhU+bJMb8s=;
	b=BJeLJxFqV85jV2RJfC28MFCLhWtovuztgXXepSGVdPN2XHJhiIFLwPGjTl9Mx0uaKETH
	 lgURU+ka3QCq+E6ivGTgIp305IyBjZrNfzgZQxSTLTraYBE85Qato7jVuM6wKfcUsuFES
	 xc4adM/Zj6QpPu5c9wvJIBjml6+O6jPZuNAp5pntFosLCnUanoSNQ9i5pGJgHL108KMqN
	 L6aFekXgC4t3+11IihwSBXEOmh8VQPp8cMqukHhrQLZrY6OmPJWl30FhaqrtiyEec3kKP
	 sildqAM44yzf+ZB1SvRjpMD/hiONC0JwYkIgl5g7nC4H+EB4jCqLJyvePOLM2CcieXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wF50YJ9p;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33221606A33F
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 12:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33221606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wF50YJ9p
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso734396e87.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793882152; x=1794486952; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viyDdmvwD4U6PS8lafjWT8pU3blZXU6a4uhU+bJMb8s=;
        b=wF50YJ9pWeGpIZgjpLso4vSCFokBc66tU9z3+ylmj/Jt3A7tPFuJ/I/BPI0WGQvQM2
         0OdGfU11sU+hIYc8WbZDcJpYjUnbOmmWOMNRFS2NpZcJZW6nQlQZg4NeGaNSpwmrvXjl
         ZgE0kbkF+8T21vCbCfq/2U+HWcAYown2ra+ybQPjZPfQaBim0GgOuD+3AZSbBX0TT9RI
         3FNXHbTcF34aBiR6AS3Yg97j2YufEuqy2cEpHHjAdU5xXHOxKmbkoDtnU3WMoAAVil4x
         LGoQcPQ8CRHfgnnN5id4KykLWyeJdPzbwMPVa7orOqDBCG77Ffd4wIyLNrvjC7Ax+8Go
         1U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882152; x=1794486952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viyDdmvwD4U6PS8lafjWT8pU3blZXU6a4uhU+bJMb8s=;
        b=AREvMwhr4ocRJEL+Rre6SLkkw5XYUMaMdUYAcKOjtCI+3V/FBauRO/oHaVP6IY5aBu
         dtATkeU67cCSgYSBL0dRpLu9vSdLjiU2YX+uopI0DnqtzCIyoiGy0ExZYxM39IGEpQyS
         wNr0Sirvi2x7DriKQewnaqCeKwyNH+ckl+378k8Fo70CEm4ewdI4gcS6mdK/AEel7KN4
         0btPvC8RGoTfT+Y+5+VL6bhFJUIUEb8irNn+1XTbnfajbNuHCjQSkq6BFApFdeM0j/kh
         fKqWKKLaOQFG1/hV1L5K7jktXLQRC+kMykEgsQiutBJenEOS2eNu1jPZ0SqG/f9y3GZ7
         pHkA==
X-Gm-Message-State: APuU4Z+N44q7eEmOU9TDqxjAx6oHFWOjgMrBdU7pVfeORqWr7j2oUz9s
	D34JKkfJKu9jexF81Oc+c/tQfwPvIInb2/rBxhw/ziVIZlwU933zJcOpltCPavFsvHc=
X-Gm-Gg: AYBFou2DPFOeui8T+43CAIzPju18rysV2H/YNWAhjEtAfrGSeF4DxCxQhOr7kEMc2k1
	3Aik42eoQ/MT6XAQsLFv274sUH/v2BvZKAcAH34HvhKioM9N08mjkYzeN7Oe5vmzMuhVDwUJtgI
	v48kIVnexwe+eQ3GT4qYBSGVawGzR7Tu1Qf6L6rwNHaWPXLVXKHigVO1wXXsbZ2621ebBNS67yi
	TRVpj+uXVABgjGJPNRUi5h9I0OFCRS535jv8YIpY3ShMMRsXsT+MuLs+k8st8d6882rAoEZOcG/
	+oyIx6em6mTYfLOBN6x7KF+z7GHlQm5pdsf27mYEant4NcRjUQrha7HQwRzy6k7dHQKE4nup+F9
	oICDI5GT+SKwxwZNWiPrrp2C7qzZXzKpXIyz9F3dnIk7gvWL2ljygaqpaS+S9wvDbWfBnUvs90l
	3sMK+C9RIK7nCCSnXwj/mZEf7p5Q3ovWBQuSbVD7LyteZemTiT7BIOPFN2alua9p0jQmX/9l3bq
	I0BzKFTzOA86MZRk6dTxtnAHMchhS3Gw8eAxmB9UbWgwbHrNXsNOY2dMgACSR8D9LqSJzfLzxeW
	o6lHLyCHBBZVZQjsk9ObsdXIScDtdRwwd9ZZ00I=
X-Received: by 2002:a05:6512:2342:b0:5bf:d738:a5a9 with SMTP id 2adb3069b0e04-5bffa1653b7mr666170e87.22.1793882152273;
        Thu, 05 Nov 2026 04:35:52 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab878sm806136e87.21.2026.11.05.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:35:50 -0800 (PST)
Date: Thu, 5 Nov 2026 13:35:46 +0100
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
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <aux4F5Fj1VjSwUb-@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
 <auSxxPM5z8BzgNm3@FV6GYCPJ69>
 <20261104175436.GZ3889730@ziepe.ca>
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
In-Reply-To: <20261104175436.GZ3889730@ziepe.ca>

Wed, Nov 04, 2026 at 06:54:36PM +0100, jgg@ziepe.ca wrote:
>On Fri, Oct 30, 2026 at 04:05:13PM +0100, Jiri Pirko wrote:
>> Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> 
>> [..]
>> 
>> >> +
>> >> +/* attrs of group cap */
>> >> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
>> >> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
>> >> +
>> >> +enum _ctlv_attestation_attr_cap {
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
>> >> +};
>> >> +
>> >> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
>> >
>> >I feel like there are too many layers here for a code generator..
>> >
>> >enum ctvl_attestation_attributes {
>> >   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
>> >}
>> >
>> >Do the intermediate constants add anything?
>> 
>> True. I originally had it like you suggest, I changed to enums to avoid
>> the explicit numbers. But you are right, does not add anything.
>> Changed back.
>
>I was also thinking that having the explicit numbers makes it more
>robust if someone does backport. We should try to have everything
>explicitly numbered in these generated files to prevent subtle errors
>like that.

Okay.

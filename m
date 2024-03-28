Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2245F876
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617139; cv=none; b=q8sjLK8cJcxc+g3GnvkHgZLVSYmeQHCFmkq2aKQzlpS0bTIBWVsNHO/5fg/doWDF1BDVTZAv4sReLyo4AKuG14QNGe+cWdK8cVv7XRmHi40+4IT14AWQvk/6DquKEXRPlj6wCY30HjQSYeXIAi0CiGUxcsP9wZprpq1/GWA4no4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617139; c=relaxed/simple;
	bh=J9qjVWR/ECBphclbsZxM/Qk+RFImlRA4yNn8p/wU394=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UvzVDwRhPL34TN3gZ1F7mfCehOk5BlQrMJpdM8/GAM3AO+Fc56ncSgnOVekl7be8k9o4yqP0+1pq78k/DP4hjFlmn3oq/WkS9nG9IWtiyUkVhuMP7dsgwx78rp6b0lobFKyB6bBxURYseR5tGf1t5jPcIDqufYOhKjwiQ8HYYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SUTeCQ5P; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SUTeCQ5P"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41544650225so3065595e9.2
        for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 02:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711617135; x=1712221935; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9qjVWR/ECBphclbsZxM/Qk+RFImlRA4yNn8p/wU394=;
        b=SUTeCQ5PyBNDy2jLFrpg3iOFvTkZ98q+EU895NkWJYuQwPOt7ZFawGyWzJQzVLY5d3
         KKDZrAnymUkUEEgwQh+EShcK4xrRZKRAgTHPj7mAUzstT1WM+appKNd/yLN6/j8LE3hU
         yd0xwSU20ILKVSqTlxGVvNbYn9sGwD83m28DBars0bYIC5o3UDahLAMiJDGHQewlI2dj
         vjIg1LzCjp6B6u8daJgcslxwqfH97p7kKXRjeCMVEBdTa1K9UcGw8B1Blkr914WKiLy5
         Vy37jl8r0JbfxOaH4IpqQajXdjK05OgM77CAfT8K+2Y3zRGIl9bbC+adlw4w524rhMmr
         3Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617135; x=1712221935;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9qjVWR/ECBphclbsZxM/Qk+RFImlRA4yNn8p/wU394=;
        b=It4DiXMISRPxRk4ISjLZry+0GWoiv8KAzPB2GH+mmMK+Q9FwfEnFPc6SYye4VOw8/0
         RZzApcJmPhnp/ODm88M8kznQXTded8uYFLrONhyH4N8LdlTG0wTMPhqKrVf/WhSEiGQZ
         Itu0fjmgMwN5gvFprPmW4fDd0VFJFtmg7L7EZyHYMw43rxby3VcWS9VU14+E3VmFejW0
         Z6GUyzZwpGwnXTmMIWp4XYIXsDQkNGe3xbtrM8DKXFfQedYpbca8Hz6vV4IxEDHf8212
         jrvzw0LYTvBXR/dE8PJPKqrkSS1Ol3h02V3T16vClbM/HyP8P980/2dRf9HCeOtrvqiz
         5ikA==
X-Forwarded-Encrypted: i=1; AJvYcCX5E8ZNzBIhxQr/lgYS5+Y4Nb3NPVsTVwYNtHwmm7n1MBEyv+XPuf8kcJu8WsK/mHro/TWOvMZGxap1svNpiV60yab4qRUJRW6+Nw==
X-Gm-Message-State: AOJu0YzW7Sj0zWqsb+Bb/WLdxE5it8JaZCY66+IjsOYH7hvuXId7Di/z
	TPvM/+TjdRvc5zPg2J1ZwxoBTt9/DyJ6+qhjdFkPE/ti6hszq6uU+w4v3EeM7QE=
X-Google-Smtp-Source: AGHT+IF5Xi3vEgmmfFRP7akAW7dCHrhX2Z26khY9xuSGH6toF+fZ8+Fgx6IH3+TlxbfMv0kMI3F67g==
X-Received: by 2002:a05:600c:310f:b0:414:1363:539f with SMTP id g15-20020a05600c310f00b004141363539fmr1445125wmo.8.1711617135544;
        Thu, 28 Mar 2024 02:12:15 -0700 (PDT)
Received: from smtpclient.apple (p200300f6af1695007d0c1ecb0a297a7e.dip0.t-ipconnect.de. [2003:f6:af16:9500:7d0c:1ecb:a29:7a7e])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b0041478393b8fsm4721839wmq.42.2024.03.28.02.12.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2024 02:12:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: question on vTPM interface in coconut-svsm
From: Joerg Roedel <jroedel@suse.com>
In-Reply-To: <DM8PR11MB5750F62889411B10570C61AEE73B2@DM8PR11MB5750.namprd11.prod.outlook.com>
Date: Thu, 28 Mar 2024 10:11:59 +0100
Cc: Jiewen Yao <jiewen.yao@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 James Bottomley <jejb@linux.ibm.com>,
 Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
 Jon Lange <jlange@microsoft.com>,
 Eddie Dong <eddie.dong@intel.com>,
 Simon P Johnson <simon.p.johnson@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <86C30BC3-4111-465C-8AA2-DA8EF12D36CD@suse.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <DM8PR11MB5750F62889411B10570C61AEE73B2@DM8PR11MB5750.namprd11.prod.outlook.com>
To: Elena Reshetova <elena.reshetova@intel.com>
X-Mailer: Apple Mail (2.3774.400.31)

Hi Elena,

In the end COCONUT-SVSM will support both modes, emulating devices for =
enlightened OSes which require those to implement an SVSM specific =
protocol and the unenlightened OS (paravisor) mode where the SVSM =
emulates the interfaces of real devices.

Which devices to emulate in which mode and what mode specific emulations =
support is another question, though.

Regards,

J=C3=B6rg

> Am 28.03.2024 um 09:11 schrieb Reshetova, Elena =
<elena.reshetova@intel.com>:
>=20
>> Hello
>> Since Intel is planning to use coconut-svsm [1] for TD-partitioning, =
I am evaluating
>> the vTPM support for coconut-svsm and L2-Guest for Intel TDX. As =
EDKII
>> SecurityPkg and OvmfPkg maintainer, I am also evaluating the impact =
to EDKII
>> project [2].
>>=20
>> Currently, the PR for vTPM in coconut-svsm [3] is using the AMD SVSM =
defined
>> vTPM protocol - SVSM_VTPM_CMD Call [4]. It is a brand new =
communication
>> mechanism. As such, we need a special SVSM vTPM driver in EDKII =
OVMF[5] and
>> Linux Guest [6].
>>=20
>> At same time, we have also prototyped vTPM support for =
TD-partitioning based
>> on coconut-svsm [1]. For vTPM interface, we just reused the original =
TCG defined
>> CRB interface in TCG PTP specification [7].
>> We modified coconut-svsm to provide TPM CRB device model + TPM2 =
library
>> reference code. It is similar to [3]. The only difference is that we =
don=E2=80=99t use vTPM
>> protocol [4], but use TPM CRB interface [7].
>> We mapped the TPM CRB MMIO (0xfed40000) as private MMIO which is only
>> accessible between trusted L1-VMM (coconut-SVSM) and L2-Guest =
(Linux). The
>> untrusted host VMM cannot access the TPM CRB MMIO.
>> The TPM CRB interface is reported via TCG defined TPM2 ACPI table =
[8]. The
>> TPM2 ACPI table exposes StartMethod as
>> EFI_TPM2_ACPI_TABLE_START_METHOD_COMMAND_RESPONSE_BUFFER_INTER
>> FACE (6), see [9]. And we don=E2=80=99t need _DSM for StartMethod, =
see [10].
>> After those change, we can run vTPM in OVMF and Linux Guest =
successfully on
>> top of coconut-SVSM, with minimal change on TPM device driver.
>>=20
>> Questions:
>> With this POC, it seems TCG CRB interface [7] is a feasible option =
for vTPM in
>> coconut-svsm. We are NOT clear what is the motivation to have a new =
vTPM
>> protocol [4].
>> Would you please educate us on that? Why not reuse TCG CRB interface =
[7], but
>> introduce a new one [4]?
>>=20
>> What is opinion from Linux TPM driver maintainer? I believe we would =
like to
>> align for vTPM support in EDKII and Linux.
>=20
> To go one step further, it is important to note that while the current =
#1 usecase
> is vTPM, we can envision in the future other devices that coconut-svsm =
might
> emulate for security purposes. So, whatever direction we decide here, =
it must
> be scalable and acceptable beyond just TPM usecase/maintainers.=20
>=20
> For example, are we ready to commit to write and support a new set of =
Linux/EDKII
> drivers for any existing device that someone's security =
usecase/deployment might
> require to be now emulated in coconut-svsm? Or do we want to develop a =
secure
> way to use the existing drivers for what is essentially the same =
device (function-wise),
> but emulated by different environments?
> Both choices are possible and each has its own set of tradeoffs that =
we must discuss imo.=20
>=20
> Best Regards,
> Elena.=20


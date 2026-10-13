Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4950B8A3
	for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898627; cv=none; b=KcY7gZ7Kg69ZH5VfnHS2EU63j48GkpVDkRi99X7eI5T3Jc/XmREKvdEP/FksFzYQDekrquIcZ9kjHq6Tvrchi23bKqdgq0k2lLdRgjw4RDxpSFsQHqeYyNta6wTrTy8V9sz14RIK4LkRDDeZ800GCcEvcYA1IXDT41PaxGMyLKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898627; c=relaxed/simple;
	bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDuSnoXU/VSdTwGG6Eijcp1BFe2TBKxED2wbpudqfs7ItLJQhhYieh62eJ8BMiIimXsY6VAsZoSBE1LZxiqzsx2p6vcAksIb9VBxqJemn7RHVDejfP87y2oHrqWWUM7dzZdDrwrq3MZAZvRN4zGWJcbJOUReHCBj3It+r7N105Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LvZyvlb9; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LvZyvlb9"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e5f819884so191058885a.2
        for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791898625; x=1792503425; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
        b=LvZyvlb9PSFviPlxnpfxkIB+UNhUumWgaAuuHgcHukTud061BULKvojmJYKxzuOT0t
         H3MXh+HhwKcj1FqxWWd8csUvV1+reYLW5gE7pkRB0HA8xFZl1DEWTZAqEy34J7oRAJM0
         YgUz3G8aqVrg4juoFDkr8aV6fA6BFpIcL571Pmb5/v68VcpKZJq4NKbgGHzLO3ON5Skw
         95RneTeNoP5NpQqeRKOYAAhCe/HQU9iGc+gAr3cEpnIusvxdQWhBjCe7tnx6G/A3/WZg
         iO3I2aCGId4nXt2OPYUe439JGU6iBMYPVxgwCMp2jpaU+Z8O0qpB+7HU3593Nbaxm8Nl
         10mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898625; x=1792503425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
        b=Oybs7dFkH0IAEr6ix0VjWX2NfK9unKU1M5QiBtcXss8svmbkQGZT4M9oecoNEO3VXw
         +BApB92wxGxjfs8J1t98DbE2TH+75J2ezxb4KyYzxoSALjqFfCkS1rs1ISualsMLrsT7
         u8P50wFs5b4FjLMKghXEg1qnZln7cL757IadcxFMRTpJwoRUZXoaGLRZKfTMvgQ1wczZ
         KRtcz/36IFmGT2SauplDww0yZ4iepi8cTeDhszrlsDxK4dSHwTF72OEw2LGU+9Ux7p8z
         NS1BV68xrJwLdPgZywjVGh3tCIc5JEmWBIexJgOi6Kt3bUmIwOK+SG5xTvq8S6/ExlDJ
         ReRw==
X-Forwarded-Encrypted: i=1; AKwUvBy8sFg3Gaf2H9ZfCheKPcpiJXl9EfdYVnDHPaGvQICrvYyzxii8BM3E6i+n67lxYAAkn8Lf2WwdYA0E@lists.linux.dev
X-Gm-Message-State: AFq9FYKLmlabIBn3j8I3LpfUmy4mBswy5iU4v2pWmYQBDqs2RqtjZuxE
	eyTNHbqqZ5KmFbJbmwbCvgi83fooyK1y5C+3sLrdyi9YVyIR+mIoyHK2Vngxdrxq23o=
X-Gm-Gg: AYBFou08ybtr/EmODOP7X/xazELyU5R2eCnnxnG+M3F22VwtYXSx8ayU0dc8k5l6ajK
	Ft1hKVNmj6yE0dbT/gzsztWhTBLyiswJ0R4+6h+7peSYJfhYiekz3yDSEQHMLvBi+bbplTVlxol
	jy+qqSc0nkRgplwbVMvQI4xPUlD/8eUmKj0FI+cqxpJvhJ/YKeClJ3jHv0I2KRZDADkRO2cGkTQ
	GcjIutO8sZGg9nBhaKVGmj8RiRchRpwkzlxbuIrxIMH8IHkhgMl7slbloP3lOMVhv1iiXIb60z3
	TKGrr3TSgQ25yZxicE+1mGK653bj3FS29X57S/JXPM+dFUpNkUl/ET9XEKz09gpAP9pR4Kn5d7o
	Fn759n9VPtM4/SGbaOXHOjSTUhLAkW3JAUaeFVNXGJY+f2ThyzBXG2NF16rVnKlVprN++U8Xo0N
	uvaDKgRjI68XVh7vsDZqsgZ2IlZC4jpOueQdCbr3ifIsiWOO/6NTZF737+hDeQLfj8jogFbunVy
	4NUDJNLlldfmnz13stOpFUZ3B6cuZEfOUY7uqNdEf8l4W7c2zgIATVCLrPHNiHcFuI=
X-Received: by 2002:a05:620a:1a03:b0:93c:ba44:673d with SMTP id af79cd13be357-93ebd1b7173mr2238297585a.23.1791898624601;
        Tue, 13 Oct 2026 06:37:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50295a7sm238844085a.23.2026.10.13.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGcgh-00000009eSN-12xH;
	Tue, 13 Oct 2026 10:37:03 -0300
Date: Tue, 13 Oct 2026 10:37:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Dan Williams <djbw@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
Message-ID: <20261013133703.GJ14213@ziepe.ca>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
 <ar5tOUor0bp3MtQ6@e129823.arm.com>
 <9e74ff9d-e8a3-425e-bf7c-f973d06e6cdf@huawei.com>
 <as3uzQ7L6tJ-Lu-Q@e129823.arm.com>
 <1451a49c-f37a-486f-ac47-e2ff86fef28a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1451a49c-f37a-486f-ac47-e2ff86fef28a@huawei.com>

On Tue, Oct 13, 2026 at 09:05:37PM +0800, GONG Ruiqi wrote:
> I'd rather not base our work on Jiri's patch at this stage: it is
> a pre-RFC draft of the new attestation subsystem, whose design is
> itself still in progress. Building upon it instead of current
> mainline would be quite risky — we would be rebasing on a moving
> target, and merging would be blocked until the whole framework
> lands, which is realistically far off.

I'm going to be strongly against any work to try and put a ROT
multiplexor into IMA. This is architecturally the wrong direction and
is clearly very a short term project that will expose uABI that will
be difficult to unwind later.

If you want this to go faster please work with Jiri.

> I'd suggest we develop the proposal on current mainline, and
> switch to the new attestation subsystem once it lands. As I
> understand it, for us that is mostly just a matter of switching
> to a different set of APIs.

It isn't, one activity is moving the policy and ROT multiplexer into a
shared subsystem, the other is building a ROT multiplexer into IMA for
only IMA to use.

Jaon

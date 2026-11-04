Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814887;
	b=R2wGocoQxm4PQVctA2AfFm6TuRqwZEhVmndek20XOrksRjP3NITFZAKn/WYoB4gHRt9s
	 4AmZSQrYt8JXIbwRFjadsAPqRtlno5DqKLx/eX4CYY3AV6i5lXq9vx+cuRdVxZalV7a7W
	 RARoz5q5YhQKblU17htDAH8ZVzcpLapc3+lJ1dfEebbZaEEXY216+nFkWmk5lebluK0w4
	 sb0vBCuJ55Mc5AoCZ6ytZdFGPlX7E8yGtWcPAxp7qIcfH65Q9w+sbLeKuBkN9KE1yJtlk
	 OLUpPb6vG3MUtU7lg8Q2kgVqkInFRWiE5fWkLfgWSfn/1VBO/AVv+lHwahrd8Nf/Khw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
	b=3ts/nllXDuAmW+Zd4vrRgsPexqf2qh2+9k+GbiKpWpcUB29ZArUKJmqVhewCyrKvtMu/
	 PyWxfFR4mmME6ipWWXB8AZ+6Lju2fJ0xbNqdSkRQSMU7ybDOeIRAs0P9oB5eawv00NtmF
	 60jDA5ueHF6B01nWZ3NPECWD5fzSZP6lWgMiEZHo7pcXRxFPXUDIlwdwlzjdnjMTWkEQv
	 ErgltlLRc9hZ7WmsemtBwEnnGWs2cwNOhB6G6SOXjOUvSiuOPcfsNQ6M9rnBjNJiGyJHA
	 4C33WZUpL8xDNl1GXpTbe16VV9WxeSIFESgAj+yRfdFPB9ynBNGV/0KKBF0UvCwofcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=i+5WJNIU;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711C606CFC9
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 17:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6711C606CFC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=i+5WJNIU
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f3c8958d5so109066785a.2
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793814886; x=1794419686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
        b=i+5WJNIUjl6quW8IMLI8UjWnXUfipqhPcAJZOk6dSwx1VRnKa+uX8lGzj6S+D+xz5o
         oQbXO4QDYwqXECauxbvCX8DtQSnkfNM5EscCtI/T21eS8jB8L0lPvpKvnQ0NjI75evao
         l/G1QkmM46/G0J0diD+Nfsl1laDO4J1eARosyf5xb68EpXkzFmDqpDNX2jmZw9mnfbPc
         5+J88aeLw0fhASj4iuiRqS7DDpvwijeH4Y3S9UXY7Wye0Z/bIBguqbIP5Px5U9++feUY
         rNEeuwhe86lRF27v/XV+H+tDGj5ZS0FMVFF4ROQXSmTaIESMUYGl36Pt1M7R4L1WleRQ
         srwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814886; x=1794419686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
        b=w2ZNE4n7aGUAVO5egKbXWWEPeVJgTWXedzKVzfhc4MAKI+ASs/f52WTms7Qtajs3Nr
         3YEBJjqXHo4GCo8/SIYww6+11grazitj7zigxa/Y8xX0PK5JE/HZ6f9g5FJnbZ6EJQNY
         4Ko0mkVS0QDgayuNfFGkbff7atpVqAyMufpKqFRzelW/t43wMGmQ/uA/nYyt10CxKWQ+
         ESHLdiEq6p3DUzhg7wpwjhA0q5SHzPaY0KT1pIIq7FGB4vWP4C3F4F84+BWeSVTRP5Z2
         xOnS+/+6dbeWbk9F21pZ1Smn9Q24YtRWw4XNrvDzHUCZidMgYbBt8NYcRNwUvfC4lGaL
         eb5w==
X-Gm-Message-State: APuU4Z8f2FDP3YMIuAzj6DJzkbjdag3vbbmiBsP+HQDJ+ZrYLjwTAsNN
	iqsQ6ARH0ROB6x1HbwJ35NGXqFB7HKc4qQ1HslznANq/n/4lDNjBGMI7ZlyglACg2pFh9ssm1oa
	hK0HN
X-Gm-Gg: AYBFou16cKIL3762zj4DHfS14kMygeIQqoVFVnihO+vQyOfZE3hKiaEUu8xT+QZUOWi
	7bALLAxq2NaeRYiCGR8yDn+vOQmyRdC9dlStC3Gu8yrUXlOmdxhc2iqulEvCtzk60JifZbS7dmT
	rL16Xt3SAt3v9zXwT57ispSqoMM3bUKXQCSBrWxLE8MsDcDAWpAFujx+PGQ9vCqrhL33AdTZ9Mh
	8ihraRGTWO7TXlQXJrWLMXxSJ8FyqyAB8EEQhQZdHUH9Wk86QqaGzzZddsfapUmPV5qMEyUc6YU
	OLo14ZhYXDnGaKCZ1ZnjSt4uFaU5BNITMlkSM45RkhhWEHpIfiiI0XZ2sQ9VtqB2isLgW7NuIVo
	vypCtrUPAv12ZOTqEpHdzZWVO60cQNpMrOTn4Ikeic6mZFQpKnjpbE8oIy6HCGLmvY0Q3tfVncl
	WSY/22NJXRzGBUmVXe/RhLGKipxCyHm/jrDGG1wVtSmmkjz1Z4SUUgN9y4exmqHA6ExL1ueeO2v
	1aLDD+vinNe2LxZpDxR+s8dkSNJYKkT2Xb1NbVYlk6QT1qr3FYtCU7+Uv4WqDllj2mKmd7TH9ZK
	tvEcLyq+jQlS/UEttsGD/HoYZX59YvTAhikm6bLRvJuXwyOSv9smg4rSr4KWUVeukEou+ny5TLW
	Gyw5zyeiX8Q==
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2702179085a.40.1793814886203;
        Wed, 04 Nov 2026 09:54:46 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479a7easm257041185a.12.2026.11.04.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:54:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOfC1-0000000H1Y6-00br;
	Wed, 04 Nov 2026 13:54:37 -0400
Date: Wed, 4 Nov 2026 13:54:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <20261104175436.GZ3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
 <auSxxPM5z8BzgNm3@FV6GYCPJ69>
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
In-Reply-To: <auSxxPM5z8BzgNm3@FV6GYCPJ69>

On Fri, Oct 30, 2026 at 04:05:13PM +0100, Jiri Pirko wrote:
> Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
> 
> [..]
> 
> >> +
> >> +/* attrs of group cap */
> >> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
> >> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
> >> +
> >> +enum _ctlv_attestation_attr_cap {
> >> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
> >> +};
> >> +
> >> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
> >
> >I feel like there are too many layers here for a code generator..
> >
> >enum ctvl_attestation_attributes {
> >   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
> >}
> >
> >Do the intermediate constants add anything?
> 
> True. I originally had it like you suggest, I changed to enums to avoid
> the explicit numbers. But you are right, does not add anything.
> Changed back.

I was also thinking that having the explicit numbers makes it more
robust if someone does backport. We should try to have everything
explicitly numbered in these generated files to prevent subtle errors
like that.

Jason

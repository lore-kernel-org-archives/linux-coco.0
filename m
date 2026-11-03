Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701849;
	b=NGuh2qcf8cqkFcwZrotqpDqnp4nA/Bh8V9LQwBAN2hdmZKri80Wk54xGNTx8I7ub+rNB
	 9QT0Owhk7S+FoM61HJf6cav3c6i/ypt94CTbXgbDkws4nTUGPIDSOKUccyrA20p6C7O3G
	 ids03qJIZcccxhWTUWxQm6ZCSQSCDVne6h5Y/YVu0BhOVKThSKZgF/ws5Vn6YW+jMqYAx
	 zSCcWrYpjiHqk8gwNFszdxpeplkpb1ku2Usura5juxNS2a68tUxyD0ED9OJDPPWcWWAkx
	 r6Ob2z78XyIQxj3lQHhNOCVKQHRiOnVCAh6PYzjdnDjgdg8VXr0AxbpUtTZzvM24dPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
	b=b46J33tEf2UrdyDYAunlWSaozxzUYG60Fzy9y+Fnm74m7U/T9Iy9sM/3Ht2JZzLKbv93
	 hvyvYjg1UlaxN8d0BNUE5t9TO8lF6nVQJvVDLOqI7R/nF6KlBRTvBUEimxkB5ndJKpHN/
	 OFyCRRfdzS1bz+i5I22k07KFBhECeHtH+IE6Nf/2IVchPKcluKJv6d38udTOOEMGk+PqP
	 8X+TQ9hHST2VdQNwT6fxm1kFLFhOFTHwK0KK8hbzI4VgbCsp9qZqgy1UVMUT7wISc44tj
	 in1X2K/AI2GtCTnvTPlRHNTIqUYE0wohqC4X/guXy7uTKE3FO9RuqcibTXFOPYEAoWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="Iz/03FjT";
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA6606A802
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 10:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07AA6606A802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Iz/03FjT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso3410898e87.3
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793701846; x=1794306646; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
        b=Iz/03FjTSKzJ4hZxD9qDm8/8PHwfZHoO4DEsoIXHETft3Mgr08yrFcZYGCfLUVlFVS
         TT8XBCNOV4BfPp4fnHyMSJWr9/3NbZQGxMDbWD3EvIXKKRRCeKZ5+W8enPYMjb6LIMgC
         mRUrN1d2byaA3Sh2b1n3MZHO5kf610BusVb8PoPXfYsE+QbMT5eF8TxCD3Hf4xziCEYX
         sN8Vak+ZYzpXscXc8cqkHinNbjdZZ+rYRh+ClqZLUdqIxJQ0SBD4jO/luvN73EmtlR1I
         hK++m3o+Ss7xNGzVCENOq5rEkqmdyVrenMi6HNwLWtKtALZZr5kHEfPsNfEq19dHEMrc
         FBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701846; x=1794306646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
        b=rxi1c6n/KaNWLfUNHzZOnd7FNTUXkgGGl93byGc04reIKnAWROpM3SaDkI+OV13sqt
         orDChhYSwBwVM7omMtsQoL/p7z6IMP+3KtaYShVWU4PdukA+/4A4ou5rirvs0QFx178x
         BfdkM/R3RHWUzn7Z0KyVBbA/TnYZkLrhR8FlhuW6tEA7ePzwbIHizmFXW3ZmLNkr4RTr
         epqIMpSDSJn04Md/AGKHBqUyGxZQYc4JrMOmZYJrtpQQc572KNiflmWN+wya62k1RHoF
         cUdL5ZjVBcABBj1QcfmmfljpnxuMhdCvz0qj8WVEizCpoB0cHIrdljH26Bq8+LVAcuhS
         +2bw==
X-Gm-Message-State: APuU4Z+M1GnKI2IiMDeaMHS7u351XN3TRF2aShYy+vHHwpe8nH5rVr5n
	PH1bL4kWIClW/x/BoCTxIA8B2vEZsxcrOqXVp/MpA+8uJ4xlJTvsiormI80BOg0LkbQ=
X-Gm-Gg: AYBFou2mz9YzfF2K46GW5glgp93Q5iOJWZdw1CXCgDEvBQmppV9c+LDBOcdNQ1StgTu
	MR/wIsxCAImMKVzGwzGY+akPDwskwyFd4+xHG02JQRAtFLY7vowOM9Sec5FXwk0y5bvy0D48gi3
	JX5WIygXdtHdwi6EZbFrgoYfmahdv2TrFtMw3/qOB4Ozhpx3n2B9lPHYXz/l1HrUXbyL9BJAhyp
	S81A6BwcUqb5g66XCKGFPP5zWe3E6DEGncTaruM5NF3nOSwvDCdNngth1U0y7IH2zqy0wv3OQx5
	6O2HHUbOaL1UFhGh8lhcGqOAPUVxWa9aZwUJ0T5l3EV9fWwZAw9PnEAN9qCaNOBCSRsgUuydCF0
	5mwx5jV8cR5HK9z2jS0K4pWJh5VrxBHHtlNaGn3wQbb8vYZXun5hBKCDf7qmxZmq635G98zlJCW
	fu8GQQYs2H9bZHXHIyrXsxSGrARV3X0m75h2y9hee6Mab+Uju4rLE0MctMl1Lm/cFVFG5v61/sq
	0Ojv3Pi/w9ggt9qlK30zOvkayherhbLc+8b2d37CM5lXnfIU910WbjuRvu+wIF7SR9ELeUPNRoR
	q6qAzrTMP0rS42JLxA4+UcuGuIA3B3qiPLbo
X-Received: by 2002:a05:6512:3da9:b0:5be:41a1:d2c3 with SMTP id 2adb3069b0e04-5bfd958d569mr4093510e87.49.1793701845873;
        Tue, 03 Nov 2026 02:30:45 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm2132213e87.75.2026.11.03.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:30:45 -0800 (PST)
Date: Tue, 3 Nov 2026 11:30:39 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 04/20] Documentation: ctlv: Add userspace ABI
Message-ID: <aum3xbO4lbiBWUtL@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-5-jiri@resnulli.us>
 <auOWFzX5N7HBbcH3@MjU3Nj>
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
In-Reply-To: <auOWFzX5N7HBbcH3@MjU3Nj>

Thu, Oct 29, 2026 at 07:53:11PM +0100, sergii.dmytruk@3mdeb.com wrote:
>On Thu, Oct 15, 2026 at 04:50:37PM +0200, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Describe the CTLV transport, discovery, wire format and userspace
>> compatibility rules.
>>
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  Documentation/userspace-api/ctlv.rst  | 507 ++++++++++++++++++++++++++
>>  Documentation/userspace-api/index.rst |   1 +
>>  MAINTAINERS                           |   1 +
>>  3 files changed, 509 insertions(+)
>>  create mode 100644 Documentation/userspace-api/ctlv.rst
>>
>> diff --git a/Documentation/userspace-api/ctlv.rst b/Documentation/userspace-api/ctlv.rst
>> new file mode 100644
>> index 000000000000..5ebca3d4d94a
>> --- /dev/null
>> +++ b/Documentation/userspace-api/ctlv.rst
>
>[...]
>
>> +Errors
>> +------
>> +
>> +A failed operation returns a negative errno. Where the failure is a rule the
>> +message broke and the caller offered a reply buffer, CTLV also writes
>> +error information there in TLV form: a ``validation-reason`` value, a
>> +human-readable message, the offset of the offending attribute, the offset of
>> +the nest it was in, the ID of a missing attribute, and for a stale query the
>> +expected and the current generation. A buffer too small leaves it unwritten;
>> +the errno is authoritative either way.
>> +
>> +What the transport answers with, as against a family's own callback:
>
>It seems like this mixes results of several syscalls (e.g., `open()` and
>`ioctl()`).  Does it?

Right, will split.


>
>> +
>> +``ENOTTY``
>> +    Not ``CTLV_IOC_OP_EXEC``; this transport has one ioctl.
>> +
>> +``EINVAL``
>> +    A reserved field was not zero, ``op_id`` was zero, ``generation`` or
>> +    ``cursor`` was set on something that is not a query, or the message broke
>> +    a rule of the format or of the schema.
>> +
>> +``EFAULT``
>> +    The structure, the request or the reply was not accessible.
>> +
>> +``EOPNOTSUPP``
>> +    The device does not publish the operation, publishes it but has it
>> +    disabled, or the operation is an event, which is read rather than executed.
>> +
>> +``EACCES``
>> +    The fd lacks the operation's declared authority, or an ``O_WRONLY`` open
>> +    was attempted.
>> +
>> +``EMSGSIZE``
>> +    ``reply_len`` is smaller than the smallest fragment the operation can
>> +    answer with. Nothing was executed.
>> +
>> +``ESTALE``
>> +    A continuation whose ``generation`` no longer matches. Start the query
>> +    again.
>> +
>> +``ENODEV``
>> +    The device was unregistered. Descriptors stay open and every operation on
>> +    them fails this way.
>> +
>> +``EBADF``, ``EIO``
>> +    A blob descriptor named something that is not a file, or the file refused
>> +    the transfer.
>> +
>> +``ENOMEM``
>> +    The kernel could not allocate what the operation needed.
>> +
>> +``read()`` answers ``EAGAIN`` when no record is queued on a non-blocking
>> +description, ``EINTR`` when a blocking read was interrupted, ``EMSGSIZE`` when
>> +the buffer cannot hold the record at the head of the queue, and ``ENODEV``
>> +once a removed device's queue has been drained.
>
>[...]

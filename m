Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571634;
	b=ZUvqS5+zql6226welKNevepLtckbmhoYLZvByvLM+C81WfXipYhrIJKeTBGn6FMmdO9X
	 pwZt0AJsP3xFajIBiIDnCLs6wQritJDcfp9yyV2aYP6zAwUvZdfS5odfw4yvhvP+xsnTy
	 Wyb8f4k2UYq+zCB0qYXiMVkL0ORyfScvGRyQ6dvYNZ4yxn0zTHk59dvrVXCR1f0k/SXAI
	 +MtLin/gYt6ux2ceXa1u+svasWiJpCsWW99f5dLV5BmQqm3sBl5yFEupPozEBiMj9o3+m
	 xm1LL5zvK+Ujr3fhVLUxJ/hFWLH7AflcKtUfdbnGoY4gRjwXdzq5owfg5WeFLdm8jOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
	b=lR+5feH6GcFACaajVKDwhiPy/ibTx2JZ5PgtXkEr+RTQtcbHfOa5JZ0XLtpQU5Lyg2kh
	 JOEIH3jLNicVrAD8+yNooT5+RTI26SLkU3frKvngNGFTOJNGA/uiG9WuEu7p0SxC+NfBe
	 LPD45rt9/xRW7DlUX5gfhTde8r4k/5zVkzbQJjBOdzUkb6LFiicWM+UeCbDTOmHjohw3S
	 mAJQcCrJvYUu7+QWEUBM5eR42R/oDHEezSqvwaNAURFdZuCyRR6ZenP4g0kO+Stp4B/uj
	 yqT4qQfEbfmlK2KmiTE8zobfbRlRqqBG5WfgeaBX7/4wSdsEnkoXRx2SLLiOKpPeUVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=gtRuzH5R;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C07606A322
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 08:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C07606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=gtRuzH5R
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a808f09021so3569421fa.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792571626; x=1793176426; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
        b=gtRuzH5R9VqphWKiuS6FBHVPnpLXYyqcMM7qzB9rpeeK/WEZmVYeq4+bdrYn3yFMEf
         M5184sMER3hAgDI5n63RAeT27JnpH/nBoy9uBoUVMHT+u//PaJVP2QoGcXOpdTTdPqy1
         pGGzrO3ulCLfblhNDWfVjEWsHLspHchY+zogBnvMpBcLMx4zFhX1HIfQS0+BHbnZSVdI
         UIKVEcgL0AmvZ/TZKcnHrJrSTGuBJYBRTN8X0KQU/wRR7+SOVnUB28gPPpLwRDeBpeHE
         zTr2gdK+5+gE5yM9cBUME9BAtW6OL8efnZuVDDjXH7WiRsABI4JWTxYBFm9wvRVCmuRP
         wryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571626; x=1793176426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
        b=K1jMHELIxMRkCDfuDVg20pj/mCWkq7jRxA7gUhmfRXWuffe+Yf2kRy+c2gjQgD1hSB
         NgJjkpseZfFrmDievBNj6Fl0CJYzyfLD/l5siyOzann3/4CIXYWYgqiFMvE7OBeRUeKs
         cGrbkjIDRPLfmX6IQrrBSWABpL+yyp7bgbGftzK+F9nogeKS8Ub4oXYYCEPnX3dCpnHR
         hgBTYD+uOwiw7jEkVjKfPOalMicUOuRP4R3rcGA5Cd9WEIwvKKes8ktA3a0UaQVZI8Wk
         NBlxMKt+NsmRwYdYybVRUSuxnYZ7TKA1JYCEMpJJsBreXxIiRTnSsUVqSMMxhTaxtl9X
         YgCg==
X-Forwarded-Encrypted: i=1; AKwUvBxrK8wybdW1Bnbikr0Km3VGhSDMg4E1fXox1I3uY4IVwud07K6YPdmucYNB9uQJIgN2vntL8iT66oD+@lists.linux.dev
X-Gm-Message-State: AFq9FYL06V45zUPRsO8ruu1dBYVavZoffRXqJa9zlFj3QhsCjgwopFf5
	6Unyt4EvGwnHFMG3Eo8k90xbCvM3mO9yLJXz66bAFMhV2q8Lid03jrCGP8cVMIeJs98=
X-Gm-Gg: AYBFou0L4+guTjfO22GJa5RpC+UUapRhPiKkcFTnhnkOW8s9OvVlc1Ww+PA2kqJUb+9
	/oDtZUpFsa5ySdO3dJPFWZc3ffvYW49F4iWo8z7FbY6aD9ebzNQ7H9X0dJctAjpeP5oLy2tOwK5
	qDeDJGoGK15ROiR0kUMkRgGRkVyqM/bSekWEKR87Z1XUjUPoiva0Lw11xgI+hK/UXqQ/x8UYIgm
	7hROKQfD3vnlCBcjg65JCSLshfJTwQzHM9vM5fEm79zS41IsuXmnZCwHsLIK09zzFGSAkmqxR7F
	CsSB1CpU3ACqMloOkGz/ExgKg8Y57Y1mHtVYRQiciAZ7Yo8DDISadZWi/pR4fyxL9eWnNopRBa0
	aEI30meXN1s1ZkijjAT6GfQXdbSNATsFk4Q7rZOqm/Hk5mUladybjg+zP00KXZt1EFLygTGG3mH
	uJF8jLMKQDfY9oSlQl7xYAWBhScHofIVd6MI85UPsrzc7voYBZk0INscDjSxlhg+zTPL6b37CL4
	wd9pI4PgMwP8/WN5F5oDo8pSTcAtqRe6GnOKRqFuZWqyEHxc9I54/OcJYwC/KTd310=
X-Received: by 2002:a2e:be10:0:b0:3a6:692d:b7ed with SMTP id 38308e7fff4ca-3ac441af820mr4315381fa.20.1792571625331;
        Wed, 21 Oct 2026 01:33:45 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac43772cb3sm4553341fa.16.2026.10.21.01.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:33:44 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:33:42 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dionna Glaze <drdeeglaze@gmail.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, roberto.sassu@huawei.com, 
	zohar@linux.ibm.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <ath4vwt7KGyDXKVJ@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
 <20261019225658.GS13920@nvidia.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019225658.GS13920@nvidia.com>

Tue, Oct 20, 2026 at 12:56:58AM +0200, jgg@nvidia.com wrote:
>On Mon, Oct 19, 2026 at 09:10:31AM -0700, Dionna Glaze wrote:
>> On Mon, Oct 19, 2026 at 5:08 AM Jiri Pirko <jiri@resnulli.us> wrote:
>> >
>> > Yeah, I was thinking about this and went back and forth. In the end, the
>> > only reason for leaving it unbounded is to allow multiple independent
>> > users of the same register. For example, IMA and systemd could share a
>> > TDX RTMR. The systemd side would read the journal through the
>> > attestation device and the IMA side through securityfs, but both are
>> > views of the same journal. If one side truncated it, the other could no
>> > longer replay the RTMR. Isn't this the valid usecase? Do you see how to
>> > resolve this?
>> >
>> 
>> Bright minds have spent a significant amount of time working on this.
>> 
>> +Roberto Sassu, +Mimi Zohar
>> IMA logs and systemd logs are both system level concerns that are
>> relevant to the OS construction, not individual users,
>> so I would just say to reroute IMA to use ctlv using a kernel config
>> setting, then make systemd the new system manager of the holistic log.
>> The securityfs log contents can simply say, "log managed by ctlv" in
>> this setting, in the form of the template identifier.
>> For policy violations, only the 0... extend needs to go to ctlv.
>> IMA can still keep its violation log as a ring buffer when it's not a
>> 1-to-1 violation to extension
>> https://www.youtube.com/watch?v=gyYUYbdiN_4
>
>I think for now we should not include a new dynamic log here, the uAPI
>around this Jiri drafted can remain a future step. I don't want to
>open complicated discussions about new functionality at this
>stage. The whole CTLV idea in general is a big enough thing to bite
>off for this series.

Okay, dropping the log from this set.

[..]

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096471;
	b=ZB7wB75aTakAq4jEpc/wmehH0peOzTyG16wEvcSPSFVB+IgaNYI+MrrJEi5+iGURqr6h
	 OTLj2LQ92hwJat/c5waVGdVPLcKL9Cq2m3xyVb+ewM0yKoOVapicnLxmXj1C8em4X+TiK
	 1oIBpY+MTf81WlEQdOA0LSUKi+rgG5zSUOw5+nD11XWhZ9FWO5oNANEevUg/01tJ0rFsB
	 SRBq4VJ34S8HyIs/saYaNAhU+feg1WMxGqZL0+O/BLf0NrOPkcIHqZqwj2+xOex5ZmeCa
	 SeDuHpOA6KrBH/QZ8K0DMQOCqp/3QiRZaPxiZpuml3XvsNNApXar35xKRfdApLpNz9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
	b=MCwRNxUPLEnu5VlBZAugUGL6IQKho+RPCH2K9BnMKC9Eh2Hlel1nVf/rCFWxqlXWo7bV
	 y76Evg1fG+igno4XF5txO7WRJ7ZvEfZxX32xNxqZSAKHSAKHTy/kz1DgACha28P1kd/x7
	 WVigtrkrrxtMst65o0eidS5ETbRhTbfjQQTS1322y0fKOMNSeQo7dRjFbCXyJ3aHJOPxO
	 jL0DzmurSTpUqEPwpOjRwwSrOBatnI9baoqCh3ZLXiXZivJROcmdT4MX7GAZ/lnJMUeE+
	 dQ/NbjJ1DEJhfCbhsJPpHTsgg3hL1YJBwnXPY9qcQjPzbJfXTy+gZlwJRCvIHC5Adtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=j8CUz3nN;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA3606A31A
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 10:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=j8CUz3nN
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso2999968e87.2
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793096469; x=1793701269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
        b=j8CUz3nNsS1xEFTcDjF/rHByMJ3WN1AhOAqeFzN9zS/2Ik2iS5Dw2HEik2xwVnQzuq
         agMjwIPItQTw+brZFgVSO7ZGkwq7MY4NXClLSosOx6XeiHKBaevCuf0XP+ZdiJugh6nf
         RYCNbhCQajzBbYqBb6vRxoB5OWYnYzrBenFy+X/9o/rQSRQ/fxoyGlKnfbxenq15eUNI
         ekDEeYNC+TBxBV2e9iemUTkGIHGG9/7yy6oJLUSAr0Pdua0UI9JpVCp0z0QwHKw8rnar
         UqPM5Kn1FUWZrFv/cSDoaZyR2YULXqBVlj3sIZFLIAcO/NDcw8z4dkrIsA/WkOBZRwc9
         IMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096469; x=1793701269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
        b=jX478eoOc6OxS45rwf+BfN8mvErt/eHHkwCv1XMO7S/DYYOzae6+HJW7Rel2VzJtrT
         ak2xy5hxvdyo88o0oQGLaiIGVA5z8l2W6SeBV0IkrDYKNh4ragLfqZswxk97mUaPt75p
         5VBGRUzGJiWBd+zfap40bpn2TTM/EPBATRf9I/HCza+VJl9vsmD3YHkD9DHKnLyOUBP9
         Sa6UQLNY0RmaDLYzPCl+4y1Q/PnlwhOGQWwfrstJ6s5+HQg4Xjv/PxfX7DA9ZccP5c6+
         qzXw4WHz46Ls6FkmcT/Ai8+vD+//AlYYp2PPE5TINRf4cNad1sCfz70HS7oFiS35E6e9
         JlQw==
X-Gm-Message-State: AFq9FYJRe+DHRI3bQkN867aGgtTDUgKHUrXt8xkt2VnSh4D9xBEKfcdk
	tMvLfwOI1wOQCzlN72xB60K+4L2rUgzxCj39V+smN3zAAiuuVIcOK9r/YvRTgfCfdqw=
X-Gm-Gg: AYBFou2ir+W3KE9JMR+JBcpU78/cypW60Z9/0zJ0barTYv8xgzRefEpOaX7SiB1fzNc
	QdfB2dmZ/JTei/Y66Mpkp/ThFneZe0YUldAbwgf8hbz6MZ8PVf9KzUu4kMqlgbhRDTF92jHe2Qf
	GojTigQrbOufRIdoTUEqVxAur6mkehJC4W7EO40WADLd/qPQqIcr4aDy77b5wOwpNQQBFcKKk0F
	Q/EMMjYJUwnzRgb2Rov2l741qqpSnhrQE7haJkjzihWt+kOhZQmkQsr53jNPNcOHegfQ8BrHH8Y
	I3VEd3QZWzxiau/kz7e3v24i5miK6R/vxb13NAJjLPr8gmTblZdMPURTQfpRNn62GIec2xY5Fyx
	S+6oB6NFQXr1Jg3QCaMo3h7TWDKQRzMRGrRkrR2aGrpxJSqXjIagKt3ifv7OKukXihivVyk97Ju
	bNXnXCX+n4oAmdy6AlD9k7mGqLyBfn466VnJNJfkOgdLW8hxlWeS7zFerJipgthqXrmali1Nqgq
	Vx6I6l9wxfixmx6Df4kD3qNV5A8bFDBx87ajf8Q6kXpC3bf/GJJq27x5zF4/bb4
X-Received: by 2002:a05:6512:2211:b0:5be:4d37:3bc0 with SMTP id 2adb3069b0e04-5bfb71fe90cmr3245577e87.62.1793096468475;
        Tue, 27 Oct 2026 03:21:08 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6aca4sm2051901e87.15.2026.10.27.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:21:07 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:21:02 +0100
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
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auB61re2C6eN3BmW@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
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
In-Reply-To: <179302367452.58760.11808905856343064399.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 53 lines skipped ... ]
>> +/* A cursor packs the record and member where fragmentation resumes. */
>> +#define CTLV_INTROSPECTION_MEMBER_SHIFT 48
>> +#define CTLV_INTROSPECTION_RECORD_MASK GENMASK_ULL(CTLV_INTROSPECTION_MEMBER_SHIFT - 1, 0)
>
>Use genmask for everything:
>
> #define CTLV_INTROSPECTION_MEMBER_MASK GENMASK_U64(63, 48)
> #define CTLV_INTROSPECTION_RECORD_MASK GENMASK_U64(47, 0)
>
>	pos->record = FIELD_GET(CTLV_INTROSPECTION_RECORD_MASK, cursor);
>	pos->member = FIELD_GET(CTLV_INTROSPECTION_MEMBER_MASK, cursor);
>
>	return FIELD_PREP(CTLV_INTROSPECTION_RECORD_MASK, pos->record) |
>	       FIELD_PREP(CTLV_INTROSPECTION_MEMBER_MASK, pos->member);
>

Okay.


>> +
>> +struct ctlv_introspection_dump_position {
>> +	u64 record;
>> +	u32 member;
>
>Maybe a comment describing how record and member are encoded for each
>of the users?

Okay.


>
>> [ ... 13 lines skipped ... ]
>> +/* The immutable root-first chain always has generation zero. */
>
>This comment seems out of place, it should be closer to the 0's it
>refers to a function below

Okay.


>
>> +static bool ctlv_introspection_family_record(struct ctlv_cursor *reply, struct ctlv_cursor *entry,
>> +					     const struct ctlv_family *family,
>> +					     struct ctlv_introspection_dump_position *pos)
>> +{
>> +	const struct ctlv_family_schema *schema = family->schema;
>> +
>> +	if (!ctlv_family_entry_start(reply, entry))
>> +		return false;
>

[..]

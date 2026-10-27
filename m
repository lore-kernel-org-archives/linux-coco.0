Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095400;
	b=Pm1zHICu0xIM6otzs8pmfD+n4P16H/tQwS8hxrinDyxakg+qKK18n1QFfHzduCo44DgU
	 guhy0W0ehkDIqX4KvQOO5dKb2Aw9gWcipVYTRfsIzbVZz5Ima9YoGz0pZqJztecIIffzy
	 xhyarSGvazRhQnkDcBppRZOwYqwkp0dzFehiQQDCjzTuDYf0QefCdrgGO7m4va76lci4D
	 rLGlkYdLSTnN+EdDkljGefCocRel8lAetuu349VGtOw0wdypBc1u4qW5SYHdRSGLeSdWb
	 2oRrAYviFvAGK1MSTh3iB2JGfNxsv7nmqmr3t2LR/KSW4ClelefkPsI4ZnjZ+GZLXXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
	b=bSmPHZFgPYpTH/NcKXV12ZslpnAw5Wy1qtVEfboFIKx/2/yj0m0csZJ3SeZYPs9OWyiC
	 wiJlINoMjvOjGxOeWMXSGMzaYg/I2PxVSpcEh1T67Y9e+RKL54DjGCio61vPq1vBapU6u
	 KdCZ+L8ABN8e9pDU0OPEYYOJmy0GOnyyXf5BiobO30N9R4suGxoEkVGRqNVIOBW6waQXU
	 Fjhh1k1R9Hfe3lNlSndtLYMO1+NUwgnPM0FUBxgfpThKWd+uA6UdldiRDNE4meTnEzmVJ
	 4+Z1pG5KxP4XylD77jmldl3dToDTDhLvPwcb34bPPb5E4c0BKL1XbW57VV14bbtaSYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7C606A31A
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 10:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c423b145922so528123966b.3
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793095393; x=1793700193; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
        b=UrWa6xLonU9Z54d6mWKr+cJ5Tq41nkmU3dMOo0bOwWR4k6yivrxZbghuCz7VHryo54
         ibx0AJqAK1i2l/EPmB8DoLV5U4Snaq3W50fgD7rGJVDE/MQc7tQwwyxP0DwwZst66QVp
         72RZjxTUF1ZRAA8osVqc6PqRjS4prabSWdwaWxIlCGj9RocApN/2fc+xH4fa2suImpiu
         1AXBpAw1selYNss4NnMGXtKh8YdAKtuJvBjWe7QcQ8XfjuwJy/7WgnCfiLolW98lff9E
         3+aBTJJeBPHZbg7DKdmDK51FiCclG4EbGy9PSfOtjrH+husLYOOzHdyAwRuY5NP13Bo6
         zRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095393; x=1793700193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
        b=nWouW/LwmXsYL0ZYzUAOArU0FajEMeJMSyBjgQ8uu1XBBYnJwLGj9CrodumuKbW27I
         Av/Xb5mMFGlG11HidpTHJPh323KlW8PJ07mdnQWDj3gs7RZeNyCG3WfdBeR5qr3H0ZzP
         Klc7pzR2DTAQn9sQmitehzOX8CRidzgNW6uZvfS9neXmTUJLbnLEbhoGTXZspHd871z8
         uk0enSwbHCoc0SnOStcEdwg7cjfTxFs+B0NVo20KrJ7TKJWW4QpCq+bijwo21doSdJgO
         REgW0cyuupU7p3f8+pkrm/b/5p6bVHjeMVI1oLi0VFnYRtPAF5xYZ0mqFqH3KU1PPpdG
         oxiQ==
X-Gm-Message-State: AFq9FYI6mEcJn69kT0lgnYKalcXhRP0w5ez+FAMWVDuIdjxokYtPfWBd
	79GfvgqL+JGpIgK7W+o5p/cQ2TSdlnr/p+KooCzRml6+vi5TtEZ6ZkYWETwLPBy6eOs=
X-Gm-Gg: AYBFou3k8xWYkut5+mQ2hKgWb7/OKpKlGiEbh4AmJKfMaA19HfIZmPWKsYjkF5VdQC6
	s36ul3leRXf0Ql51tZF/kc/Bs09s9BLEXuKTTv+bwRFg7PqJXen7uE2+tyrP34J8/suPNL+xsCL
	01du5njr2l5Ax06L2oI8tmWm5Zkm8s0/X3pH4X5bqpsf8YD+tp2psoG4dkY5VRzzFMjtK/Auxp1
	edwtP8T15pa1u0PqHR8lilJSr12pd+MNICc+ygYrbW5ZLTY5thLJKoYG9T4FpoI0jONcmyOGWYm
	1mJi/j43jagbD6BxAt52jEKF9lm/CXi9PWDsDJ9OdzRydMYNbKnxsHFzc9zHVTRsOuSmWF3LRbF
	F0fH46Jz2FrE3UlDNlhZoMS9l27d6BEITsIHalh8YKNEp8t8gcKNbyNhDYD1/v3AQFdK2JRUX2P
	jYppkP0J+2HhDxVbWKf7RlfdB/C3INla2pqpdA1zkaoXvJ209zbhuDwhGfvnhAFcSE9mazWHTco
	UfVG2xZ1yCgasl3GzruwbbNxDnng9CCPBcB2TYSmHq3jlKHNM6Kj+7oUxckfBv6
X-Received: by 2002:a17:907:728f:b0:c3e:d18c:1d7d with SMTP id a640c23a62f3a-c46bddc42dcmr1033526666b.22.1793095392233;
        Tue, 27 Oct 2026 03:03:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd790afasm420098366b.68.2026.10.27.03.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:03:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:03:07 +0100
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
Subject: Re: [PATCH RFC 18/20] tdx-guest: Expose the native attestation
 service API
Message-ID: <auB21VZhFg3sDcXz@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-19-jiri@resnulli.us>
 <179302367453.58760.3338436189030317197.b4-review@b4>
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
In-Reply-To: <179302367453.58760.3338436189030317197.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> Share TDREPORT, Quote and measurement-register operations with one
>> in-kernel client while preserving the existing misc, TSM report and TSM
>> MR interfaces. Tie clients to service initialization and removal.
>
>The tdx stuff should just be an attestation driver, we don't need to
>make these kinds of linkages..

Okay.

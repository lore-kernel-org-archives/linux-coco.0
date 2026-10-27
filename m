Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114256;
	b=2kn6rQdVcXkm1SE41k0WKOLWW/7OeOEkxgztMfLautjEjc95AVoHFnmr5NDTSN1xMQJ7
	 rm68BhEwKjQA9384i5LrZbbmZKfHU0hYjIBbblzW2Ws1JzrEmZm0OTuP880K6RtT4qgP5
	 Kyo0C0w2w48fPcV6gAT57UkQlHN6M/PCWCLhkRcz0TxROz7i8G+i+P0A1nQvNABezt+ND
	 agK46Nz+ZwXZFIik3040mXlnLWmfWTsgvQS5RUMtiNRqXTQShAI8TM7LHLCklfZpx1TeL
	 cKniyM7X4ZiN3gp0KlnESmYh2TbVwOpSOPSVqwrsQnpENeNICxkKjOsFbqEM3tW2smg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U4Ud7qq2I83GZDTdN1xiR67Ms11VsCn4buA6mqvOa9c=;
	b=SAlSsq110zShO/L01mvim0v3N9qT2zlOBUBlU+j2eGw6lBDGbKBKlguy0Hs3XCM8Xcyk
	 JI8D55uDX3wRXH9a5oyVFK5QxXmQYq6wIcaKlsXGFXU5MeqYwzCf8nZ6F52lpM7DsL0ew
	 2DG8yRa3XWqx1f1DnmL5AQRPt94DlaiLL9Mt2VcZpY8qBsrvIq9cEIA444qrQ+EgM0eML
	 yCloLgSoxYu3zN4ee2Oh/5rsyeatgPxyhPuV+ie9t+QO9iX0rtuBN0aUurQg6s9dEljnL
	 NFUTp+Fg+F6/Pv1RuKNBf3FgIbTBpG57suJc5hPPYBv4KOOvlAGpRiP76nds7UFQ9qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TRtUsxnS;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7974606A31F
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 15:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7974606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TRtUsxnS
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c7a0c1617so194116d6.0
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793114255; x=1793719055; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Ud7qq2I83GZDTdN1xiR67Ms11VsCn4buA6mqvOa9c=;
        b=TRtUsxnS5OhOBtM0nqEu3BAEHM8agKTpPFFj9cQTN+TQi8hLjEWZG8kXy7P0oiRE7z
         POXeLjz++zwPsc+7KE7WfPjLT7Gmax7FK2ILBPjP7u/gSYToJYLQUxFKAQwtcIrgJZlH
         WeKVJkpHYyE+RgLjk6pt53XPVAW/XLZnxlA06UuldrOjILfmeF5Zpbsm/32zd68NaUyJ
         H2sqcVAGJApp6xwPOnBHS3IU+jwtQyEEPoXRc6KiUyDakvjvIM6YGYodLZfRs/tcb9jS
         TyHx3uFxYDnMiJhZPSWVc7R4oXHbvKhb4/4pXrkaXz8YrPxVpDlyecBG7cn47mNixXju
         eVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114255; x=1793719055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Ud7qq2I83GZDTdN1xiR67Ms11VsCn4buA6mqvOa9c=;
        b=gHlVezk6JqBqsSjhWcPK0B3ldwmIJ5qk9ApMtcERkK+7srWL7XwlIF+54MTiFugsM0
         JfN9UCcCjQA2nIq7KR1ChtlQOkFBx536xa3gxSEJ5HgvK+Gq76huMNXADC4sT7TlQ5nE
         kCD0F/nLbYcbJALvwCbUsgKI4Mwpgaxy6HW1+EYNBxb+9C+vh/QUbS1AFeOTtLdMQt0E
         iiYNIZk2Tfvl40lR5GkZYA/MVDH4qf6BFBT+w7gZmoa6ihrVuUyUEfQ3zpwKqg/TBv1d
         dAr8Q+NGOm2Xo4MerPzFvduuPE6g1c+pfMukGzRquQ/23Rl9ukjmCYrC9SMw8RiNyHQ4
         UgHA==
X-Forwarded-Encrypted: i=1; AKwUvBw5PLy+99LlmesUeNaCyj4cdHZUtp5UInOpDrPHR23G3Xke/xRCxEKtIId2jcjpGt0rnde/xEw6sJ3E@lists.linux.dev
X-Gm-Message-State: AFq9FYIyLYWWQEoQ89lAJjcE2qB42sxO/xGrPmE1pGjMTJXgrU/VLinP
	ObAX17SERY6AeTI0DcXdpES1Cc4V3VNXyZ2FeXKlZR/nhoW344flVmNWPYnYczsSIsQ=
X-Gm-Gg: AYBFou3g7nDFAcbVgSNw/xHp2B2Ncncd6uF1pdItMV6YjyP2Y9+rgLH//K3SH7d5G6J
	p4uTX3y3x06K3GrFMP1JA3sVVgiWI7RgXQ9rzY37Vu2OmkBKD61x4afdl7EYCiXYbDSg4R3Km25
	/8obK5HVprlrAuiVymlP+GRp0N34RvOoq6U5tDEORIlappbdg3LK4cMok5xZlhZ0/n0qAgp22c+
	U9yE1zY1czHnjkVNynU0B3muwW7X3PjFvb15kERuEVroinuMH5YiUV8lmO/jpg+xp+rh7iG7ea3
	kmI9q5z8HBcCVWvc8uNvOlw8tbfNsJoaZTKTv3jAyZicuSP+ElVhPc8Y7Hk5UcEWAHTQllCsFCR
	jrKogr5dSNykIzTSOukl9fJwvUvAjM68BqKbco2l0whMCrPuY1nD8GA8/ssu4IUMhXkxLnLf3pf
	Ss6xq2ZY7egoYASnhdlG+w4CS1xDnus4NqYH/6cy7bSIjD7cY8vieAbpjaZwKnzEbMOIYREgW5V
	TuVJlp9u1oSxyMOpsyUCSmPlNpbYeWyMsBFv5ZxloKUSL6xVYSQ9G0+/svs4GcqiufneVNI8r9K
	aOvpT8Q0MYXQ7nPd2Kq08eJ7KdlLs/5FiDY85A==
X-Received: by 2002:a05:6214:f2b:b0:91c:7246:2d4a with SMTP id 6a1803df08f44-91c72462e58mr34928326d6.35.1793114254057;
        Tue, 27 Oct 2026 08:17:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c96375sm105565826d6.33.2026.10.27.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:17:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLivZ-0000000ADMO-20dz;
	Tue, 27 Oct 2026 12:17:29 -0300
Date: Tue, 27 Oct 2026 12:17:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <20261027151729.GG1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <at-iEMxN98nie1Qr@e129823.arm.com>
 <auBaROC0XdWpILEI@FV6GYCPJ69>
 <20261027141524.GF1685504@ziepe.ca>
 <auC5sw9YMC9NO4wl@e129823.arm.com>
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
In-Reply-To: <auC5sw9YMC9NO4wl@e129823.arm.com>

On Tue, Oct 27, 2026 at 02:48:19PM +0000, Yeoreum Yun wrote:
> > On Tue, Oct 27, 2026 at 09:02:14AM +0100, Jiri Pirko wrote:
> > > Mon, Oct 26, 2026 at 07:55:12PM +0100, yeoreum.yun@arm.com wrote:
> > > >[    3.856919]  ctlv_schema_check_attr+0x3dc/0x538
> > > >[    3.857105]  ctlv_schema_check_indexed_nest+0x788/0x958
> > > >[    3.857301]  ctlv_schema_validate+0x88/0x180
> > > >[    3.857482]  ctlv_msg_test_as_deep_as_the_core_allows+0x11c/0x1e8
> > > >[    3.857698]  kunit_try_run_case+0x64/0x188
> > > >[    3.857878]  kunit_generic_run_threadfn_adapter+0x30/0x68
> > > >[    3.858086]  kthread+0x10c/0x140
> > > >[    3.858245]  ret_from_fork+0x10/0x20
> > > >[    3.858398] SMP: stopping secondary CPUs
> > > >[    3.858630] Kernel Offset: disabled
> > > >[    3.858720] CPU features: 0x0,00000000,00b0802e,9f190bc3,2affe72f
> > > >[    3.858872] Memory Limit: none
> > > >[    3.858976] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
> > > >
> > > >[...]
> > > >
> > > >I think it might be good to configurable according to architecture
> > > >unless it's not good to reduce the CTLV_MAX_NEST_DEPTH number
> > > >otherwise, increasing stack size when CTLV is enabled seems unresonable...
> > > 
> > > Agreed, will lower it down. I think we should be okay with 8 for start.
> > 
> > I'm surprised this ran out of stack though with even as few as
> > 32 levels.. Is there accidently something large on the stack?
> >
> 
> Nope.
> 
> When I see the each functions stack allocation:
> - ctlv_schema_check_indexed_nest():
> 	sub	sp, sp, #0xf0 // 240 bytes
> 
> - ctlv_schema_check_attr():
> 	sub	sp, sp, #0xb0 // 176 bytes
> 
> Roughly (240 + 176) * CTLV_MAX_NEST_DEPTH = 13,952 (around 14KB)
> consumed.

400 bytes per nest seems pretty big to me...

Do you have debug options enabled or something that increases stack usage?

Jason

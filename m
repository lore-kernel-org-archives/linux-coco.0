Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112507;
	b=auNh8nXoajiAMN83q/rBhzsR+AKG5Zuz4+F1rTk7PN8EiMwFU7TWvX5RHRxrGDe8Otl4
	 DNnZNq48eAYOb/fvzqBOpcKJ8KrvVOeowW0edmG5LJTzr3gsseSiDULxZWvIig08/Bstn
	 atoOHqiYcRVJ/FizVrppTJGnXstTJI9t4JXgjnI7xZfvGXfO+fIuaXKXj6v5eXs3LBnvq
	 0tWDAZjH0Lwe7RQbBo4EXQusiPCE+dfI5mW85fblH3K6aPsLRu/fc1BXXsR3jIN2Ingru
	 2CWxrINy1zw1fUU0VtY8Ir+4ocGRcOZW2IXboth7lj3ixuQvXEmlb8SiiTqb3U93lgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112507;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nNSn1iDCXS83Lm/PKK4oFjsXwcuIQQO4gEr+otSMQQw=;
	b=xou/oWKwgFCFFBvyg0Mt+iE6bzl/ti3PK2aqnXi36ZfE4EpdW2kGeNbU2tjMBEQcGn4e
	 Ole/kI99mxKK+/pHzjYe0Vt6/hGhhH9swIEZxcBhA5KigIHko0Y5R4lJm1CrOcDpy0Ekc
	 Hh1k5suxglFaEeseuchfdPjrGH05lvyLoKbClnOaqEN12T7MNhhEbKNTxA7j1c/n6D7h4
	 Ipvg0+/sIirdvo0ZdWpFOWJDtz1ATb1dzau+t3Ehsf94ZtKPBHvSfpZ16QoOCa48sKIR6
	 C+l7/5M1dqvt3M2uMSGf+lhIb8YISBUTTb46333L0OSg4eKMIGjpKZNd+ZggVItK/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=E6pJ45fE;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BC9606A31B
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 14:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80BC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=E6pJ45fE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9733115A1;
	Tue, 27 Oct 2026 07:48:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 265773F7B4;
	Tue, 27 Oct 2026 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793112505; bh=l2aOqIdWdEHxnfTEyx8tR1cJeGMoe3DiGN3Vu5hXhdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6pJ45fEUnYL+9iKScTKSIPvvanwb68q1wHbMVPZKn0aulFKGtBhYDhb7yBEWJ1Ci
	 QQak2KgSS71pttpO/Yy7gbSl6zM/DUr7SlQ7V5tEGhZlrvbfkk7ORAngaeYIZAcEVV
	 zE7iqXTeSnArSbchgZYfP3zvQDTHyn49jDWEy24Y=
Date: Tue, 27 Oct 2026 14:48:19 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <auC5sw9YMC9NO4wl@e129823.arm.com>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <at-iEMxN98nie1Qr@e129823.arm.com>
 <auBaROC0XdWpILEI@FV6GYCPJ69>
 <20261027141524.GF1685504@ziepe.ca>
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
In-Reply-To: <20261027141524.GF1685504@ziepe.ca>

> On Tue, Oct 27, 2026 at 09:02:14AM +0100, Jiri Pirko wrote:
> > Mon, Oct 26, 2026 at 07:55:12PM +0100, yeoreum.yun@arm.com wrote:
> > >[    3.856919]  ctlv_schema_check_attr+0x3dc/0x538
> > >[    3.857105]  ctlv_schema_check_indexed_nest+0x788/0x958
> > >[    3.857301]  ctlv_schema_validate+0x88/0x180
> > >[    3.857482]  ctlv_msg_test_as_deep_as_the_core_allows+0x11c/0x1e8
> > >[    3.857698]  kunit_try_run_case+0x64/0x188
> > >[    3.857878]  kunit_generic_run_threadfn_adapter+0x30/0x68
> > >[    3.858086]  kthread+0x10c/0x140
> > >[    3.858245]  ret_from_fork+0x10/0x20
> > >[    3.858398] SMP: stopping secondary CPUs
> > >[    3.858630] Kernel Offset: disabled
> > >[    3.858720] CPU features: 0x0,00000000,00b0802e,9f190bc3,2affe72f
> > >[    3.858872] Memory Limit: none
> > >[    3.858976] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
> > >
> > >[...]
> > >
> > >I think it might be good to configurable according to architecture
> > >unless it's not good to reduce the CTLV_MAX_NEST_DEPTH number
> > >otherwise, increasing stack size when CTLV is enabled seems unresonable...
> > 
> > Agreed, will lower it down. I think we should be okay with 8 for start.
> 
> I'm surprised this ran out of stack though with even as few as
> 32 levels.. Is there accidently something large on the stack?
>

Nope.

When I see the each functions stack allocation:
- ctlv_schema_check_indexed_nest():
	sub	sp, sp, #0xf0 // 240 bytes

- ctlv_schema_check_attr():
	sub	sp, sp, #0xb0 // 176 bytes

Roughly (240 + 176) * CTLV_MAX_NEST_DEPTH = 13,952 (around 14KB)
consumed.

So, I think we need to reduce the depth...

-- 
Sincerely,
Yeoreum Yun

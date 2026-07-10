Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABE433BA3
	for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699013; cv=none; b=mopIpEfFLTfdim1LHeOCY/eSWjpejtozhTzra3g1wylG8fQSs/YtVVntrZvX5QEsG5Ctck0Pgs6ynq9O1UT131aHf6a3hHhCkndaEN0Isp7Onjz7T3z1Cmbm9dErJQh7A2SFwNfex1xWFM6LXXkNX+e9NYO3oldMOh/SuuGKLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699013; c=relaxed/simple;
	bh=qswUXJMyKVkoQW4w3QEUfvB/Ki1O6fh2RKlrD2G09eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o63w0EpoVoqu94mzQ4BxiypkumOejvkpyEeWvi2vPr0qfI+nyxf655gKLV/Ud8YC0MeoeMAy+T2nDCC8V0uw4Uz9LkwhymLA9OVqSkXcPquBf38H1hg8wjq8HYT9yaZC8NHKsgYNMEJmPbQSMIw/IFg6V52iMwZlcMlTS3nDc4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghUDztrc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghUDztrc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2E01F000E9;
	Fri, 10 Jul 2026 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783699012;
	bh=lULRqsQDj0rcyN0NrX3MOHwNncLg5PyK4/nlVlie3w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ghUDztrcwD0V3wphJDg3WfVxrQeY7iVkDrWCkSUDr28y3JT5PkVrCYUkWn8IkrSqW
	 /Xhzs4K5BzE6s5IEdkOhFPDS1Bc5PA4WIrWNj9RmTdoAqpn1XDtCuWT4tNfW5NvIYi
	 ekwpyXzVJOQbolP5z95qZZb14YcHIPIEmG1WDlswoZust3+5iK2vltav4Nonx6lmVZ
	 q/mOiKmEpjsaPg5HKtKEyaESAIq2+qMypYcbP8RJRVAXWOIdE/uMLvSIvG7MHUFHJ6
	 PeyC2QKWSum4XKUSseHDER0MRF5B/GeExCORncp6jNDn5aGZZI3+BGPmDHFy/RAP+L
	 SLJOIGAqjz8CQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3C209F40254;
	Fri, 10 Jul 2026 11:56:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 10 Jul 2026 11:56:51 -0400
X-ME-Sender: <xms:QxZRan_j2-k4ng1dx4FxTEL4R-ITk4eEpkDLeaSCiA2jxhzHsQ1CuQ>
    <xme:QxZRalaSdI8WaWNVi-1i7VfiCt8Tv5Xe3TZTDAuaL6SjIn-OydOFgxqTkA5wRNOhE
    EEQlpOwt8CU3eMnWzOtIjJf74DtPD9ZcWm7q5RtSaahEZtl7W74eXg>
X-ME-Received: <xmr:QxZRaodDYkgPaw-z5JbjVdFnU56u73w4i7SavyEyO-RSNdIkWZHsEWADms69tg>
X-ME-Proxy-Cause: dmFkZTFyDRctqLlVBX6wiurfi0KaFeQNOGvt+TQMjv2HdbfJLg1V9vUQW6DhiBAWHEoJ+x
    zRoO8+XHwXiqpL0PMESxllhpG/YCI3/zfLHLVWoP+Q1AeQENQVdzDcu1hpVUr2KzoWLWrL
    tSeQP8UE6fFq4Yx+VgMyugjAoE/3NZ7oenwhp0HczAhfw+t19AZU5+Z0ZncsI0anAqG8hY
    Ez3hlJzQ0q6UHD4WXhGo58hirkug84tpyKqdgy/n2UIc7poWmb+6k2NqKOB1DgfolBDAdD
    iHAkseLZxn1K9fsh/6uZ3iViHPfiHpRTLBen0mGRJJmnKgtp9QolNSSRtg/b4dKNtmzsHs
    dy89jwrVUVBYy1tpLo9Vm6CsvXgNH1FRH/TEFhv0TKOUPYA4iS0zltMNxvIlE6y5JFQoYn
    OR4gkjEbNlKHIad+LnBQyuwHh9gnW9cgL1/B6i825YXnBV90oQcG4DQYuRynzZJ7wGkEQt
    FUW/SkeBcwVAwGZAejlQ9ALezYHU2vPnLI5xRl/KfdoTR3Wf0bBfxv4xj/5iL6bwZ0p58e
    6gOEP31x/KS0WzgsY3soDxsTQyKOho6KqgkgA/jTuJ1N6H9jWyNbknLaU3KQ5TOTjA7bwf
    E5g8Oo78erGXL0BXn4fJJekEuqB6PdkRgNk7yvR81+PThH1fDKGval5zOcQQ
X-ME-Proxy: <xmx:QxZRajQAZcYFaiPrNEfV4QzreEXCIIIVkGgpTn2k6ldUmCOF3KYI1A>
    <xmx:QxZRaikrjINgKQKvA_9JfTo-Gl9vvzOVFuyKclVqT1g4T-hPwR3eTw>
    <xmx:QxZRapu1I2o-ORqogz7VuO2QUo6WGaf0DbrUHrJNJ-23g9Ass76wNQ>
    <xmx:QxZRat-bGXLP3QcLkFET_vQgZ3wZb1NQHbj6QYrmZBCWW9q03h-Nvw>
    <xmx:QxZRaixvNpKedR5DE6zWJoWsPW4sq48Fpxk5SpG6LJdMHtPuuPHe9RNg>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jul 2026 11:56:50 -0400 (EDT)
Date: Fri, 10 Jul 2026 16:56:49 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@intel.com, dave.hansen@linux.intel.com, 
	yilun.xu@intel.com, chao.gao@intel.com, djbw@kernel.org, linux-coco@lists.linux.dev, 
	peter.fang@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <alEUAMgx7HMegOmX@thinkstation>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708170330.83850-1-yilun.xu@linux.intel.com>

On Thu, Jul 09, 2026 at 01:03:30AM +0800, Xu Yilun wrote:
> SEAMCALL invokes TDX module functions using a function number and
> parameters. To extend the functionalities of existing SEAMCALLs while
> keeping backward compatibility, TDX adds more numbered SEAMCALLs of the
> same family. This is just like syscalls, except that TDX defines a
> specific function number encoding pattern: a base function number and a
> version together encode the full function number.
> 
> An existing SEAMCALL helper (TDH.VP.INIT) is already using the version
> field. Having the caller pack the version into the function number
> open-codes the ABI layout.
> 
> Add a version field in struct tdx_module_args [1], so that most existing
> SEAMCALL helpers get a default "version == 0" behavior without code
> churn, while callers requiring extended functionalities can specify the
> version descriptively. Encode the tdx_module_args.version in the
> function number before calling into assembly code.

The commit message covers the mechanics, but is silent on compatibility
with older TDX modules. That context matters for the design choice, so
regardless of where the implementation discussion lands, I think it
needs to be spelled out here.

Who is responsible for picking a version the module supports?

TDH.VP.INIT can hardcode version 1 only because KVM already refuses to
enable TDX on modules without TOPOLOGY_ENUM.

The TDH.SYS.UPDATE user from [1] is the opposite case: it has to pick
version 0 or 1 at runtime depending on whether add-on features are
configured, to keep working on modules that don't support them.

The second point is the actual argument for a version field in struct
tdx_module_args rather than encoding the version in the leaf defines:
the version is not always a compile-time property of the call site.

Without TDH.SYS.UPDATE context, the patch seems pointless.

> Link: https://lore.kernel.org/kvm/4f4b0f29-424b-45ed-8cfd-c77da2ea390f@intel.com/ # [1]

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

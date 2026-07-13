Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE13431E3;
	Mon, 13 Jul 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942687; cv=none; b=Ee9X1NvcMPpMwgtlIBWo9+KZRYMDc3vXkaLbRrgxGDj2Z2JsEyRRjWTSzokskpgf9bANdGSqO3kqB1hJSzw2nY4YHL/V8Y8S4MPVbyKvfH/kHT6g5KVlRTl9ULEyYFFW+evzqlQiE+uUHXT62Yf3niNA3/FSQssUxWsgAeVKUMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942687; c=relaxed/simple;
	bh=m2XyRAThAsq7XqpIjqyvovv1kN246/VSUW3CWylrvU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkNp5DROiynBuOiUBCMf4K76/XMYH14w+6VWewwJCsZIc0b9dchryU/1Vnqi9l37WmDLIu/rC+FZugk3OJIHur80m0z/vyz4ps4tGnitl0fXGs28tqGmmcymJSRnpcJ9oyHs9FQ+AsHuiwhRxzQNp5YZyWGBl1biSVlY7tx9Qe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoD5YRTN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoD5YRTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D401F000E9;
	Mon, 13 Jul 2026 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783942685;
	bh=0+1f6sqYuOD8MeniHwAebzRApWUCWa6XFfi/XzBxs+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eoD5YRTNd6d/xe57kjd24n62FROGx86Cdr1+N9hesLwrSQlIoJEssmGM3/6FLvKHJ
	 s2QrMPTCMYu9W4YrbHA1gvdeUPzhYCKn6VTaCdo1Zul5ksFhcH2qri1HSC5z0IELvu
	 kA5N5C8Pp8oKYybE9vYYkekI2ntKI2CEDmac6JKJQpH6h74cpmItf73r/2M+azG+CD
	 VEuJ18LOh9BHeLN+Q/i92iEN/WYt2CXbvzGvGzUPlB43XhJGJwjk7i0NswJbSm9fR8
	 TzRdxGv8/vy3nLj+Dqg94yBKCQLNmMIOI5uMeiLZkwQH1vgqNzfy76A1HqdbF6bgzl
	 k7kVrhDyJDZJA==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7100EF4023D;
	Mon, 13 Jul 2026 07:38:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 13 Jul 2026 07:38:04 -0400
X-ME-Sender: <xms:HM5UauOE2gt8uQiIDCZJBMa-Gf4cKautqt2FoJ2P2_OWPFYfAAbsbA>
    <xme:HM5UamB8IRSKgsJdAd7d_2CJBqU2ZDg8xwITdVLaYn4PonqkuqaJF8oUbI4tmifAs
    UOsqaNbrJ-QM96WW1IGjtxuAubMDrLG96VmscPWcyxSWJB2CwlAdNk>
X-ME-Received: <xmr:HM5UauWR7JSOmGYZ3aIKvVOJQDanABbRI7SjbaHdXitAzrPuHo_7iSShU9cs1Q>
X-ME-Proxy-Cause: dmFkZTFbfmDtuTP5maT4fu/1gMOBe8VOIAVgLE0SRs3V2srq3R5K4M9dEfTr7iyX9ZtxfF
    XY4g1ymv4MgsaM8gppHD6t67H/RwBLM9Qko3JtykWzm1hpdSDA0JaNnnf1yPI1GBmJVAaY
    Cd5yhXQMmrzrWghI8oIQZajxc77RJW95r7j11Hp5dB8hwrW63YB2AfMrsbBweyk+audgng
    QxKCS+//hVPWb7dA3xD6DlSFpzpQL8t8OjjwzeX1qblwCwuWLlmTLNVWmLGvmg99mH1J1L
    RvTRlAPqK+ofhBBJJchECzJnms7+pIIrXykc34M4xqOxeZ5i6subo2Ho1N1sUlk47nyMWs
    GFDcAkOwL+EtY3hbA7ah2JqY9NraKFZcOewBHq8BZz3iP/DEUvk7/Vve/nYLWqKS5uJ8eV
    ldyr/8+QdqPZmRHX8bbKEA1QlV/LPqL1il62GKLzdSO8GIZD/BC4hkc46/M/1Ch97CUYX/
    jaE3Q51XRmm+PaffMlr3Wly5S8yNa/Rt2wnCfvhdL//hmsUpTuaA0mCERPzOO9Z0qmxXCr
    1Bhr0OxPHxkJ9kSH+6X+XoL/+QLFCy93UTo6HiiYyP7LxPOlbvYbnDY9MFCWaV11B6EX5a
    F9IJZR0FvFquUa8my2qMbR+rGCsmBtYw5HCImGQuanki+m/dBfRYcZ5nx0gQ
X-ME-Proxy: <xmx:HM5UaqdbzCnt0OaaLD6rVL4_MhsQfR1VbhruD8oBOPT5Gt-lIherIA>
    <xmx:HM5UavsWJw3u07Agidlb28_34rSaTQtWHan-eqylo4YNwpI1Z2k9tA>
    <xmx:HM5UahgCX3kH_V0n5nq3ghV14W3IExL5bqOSXX_zfuPi-ZvJphsT-w>
    <xmx:HM5UaltJ_f1XH1tQcSFMgippQ7oadY2IoZReveY4nFHIxqXYtaFUZw>
    <xmx:HM5Uar5DfpG6oxb98deMxMRV0_rKF8UiidBbgCGe7mRwE1VKPMON60ZH>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 07:38:03 -0400 (EDT)
Date: Mon, 13 Jul 2026 12:38:02 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@intel.com, dave.hansen@linux.intel.com, 
	yilun.xu@intel.com, chao.gao@intel.com, djbw@kernel.org, linux-coco@lists.linux.dev, 
	peter.fang@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <alTMhIWnRgrqatUK@thinkstation>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <alEUAMgx7HMegOmX@thinkstation>
 <alSt/TgbDQgNveoS@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alSt/TgbDQgNveoS@yilunxu-OptiPlex-7050>

On Mon, Jul 13, 2026 at 05:21:01PM +0800, Xu Yilun wrote:
> > The commit message covers the mechanics, but is silent on compatibility
> > with older TDX modules. That context matters for the design choice, so
> > regardless of where the implementation discussion lands, I think it
> > needs to be spelled out here.
> > 
> > Who is responsible for picking a version the module supports?
> > 
> > TDH.VP.INIT can hardcode version 1 only because KVM already refuses to
> > enable TDX on modules without TOPOLOGY_ENUM.
> > 
> > The TDH.SYS.UPDATE user from [1] is the opposite case: it has to pick
> > version 0 or 1 at runtime depending on whether add-on features are
> > configured, to keep working on modules that don't support them.
> > 
> > The second point is the actual argument for a version field in struct
> > tdx_module_args rather than encoding the version in the leaf defines:
> > the version is not always a compile-time property of the call site.
> 
> That's good point. I'll add the TDX module compatibility argument in
> changelog:
> 
>   One concern is the compatibility with older TDX modules which don't
>   recognize the new SEAMCALLs. The kernel should decide which SEAMCALL
>   version to use at runtime, selecting the minimum version number for the
>   required functionality. It can't overwrite the function number with a
>   new value at compile time.

There are two policies, not one: make the new version a hard
requirement at init time as we did with TDH.VP.INIT, or fall back to
version 0 at runtime like your TDH.SYS.UPDATE user does. Both are valid,
and the changelog should not claim runtime selection is the rule.

BTW, we might eventually switch TDH.SYS.UPDATE to hardcoded v1 once we
stop caring about older modules.

> > Without TDH.SYS.UPDATE context, the patch seems pointless.
> 
> mm.. It's true one target is to address the compatibility with old
> module. But is the other concern valid?
> 
>   Another concern is the obscure usage of the 'fn' parameter for seamcall
>   wrappers. An existing caller for TDH.VP.INIT packs the version into the
>   'fn' to match the low-level TDX ABI RAX layout. The RAX layout
>   interprets some bits differently, such as INTERRUPT_MODE, SEAMLDR flag,
>   which are not a good fit for the function number definition.
> 
> Is this a blocker for you as an independent cleanup patch?

Not a blocker. But respinning now seems premature: the shape of v3
depends entirely on where the RAX composition discussion lands --
args.version with FIELD_MODIFY(), a version macro in 'fn', or Dave's
rax-in-the-struct. I'd wait for that to settle first.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

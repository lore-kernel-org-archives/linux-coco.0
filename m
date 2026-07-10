Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F046359A99
	for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700476; cv=none; b=rxeVG4fXPD+bfujKWJGD9/YP/ell7FpHq1Qt6giHZ0a8PoMe7nyzfyApNReTblTyUPBQ7lUAuu/JYu91x8UrtPAAY6yuiA+Pm/1enwLF4z122GR88I6j1hhu7gf0pmZ5tT47/p55KPHDHchKfHCbk3Rk7t3fHZTMZYGjd5JUXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700476; c=relaxed/simple;
	bh=mEoRRWSo6DAIK0SlW+LQPTUO/5DjaFNEbyRnGasiBso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arjasbIgJtofbLcBpw/BkGR0DbwKdAqDXpMKuNorGtFlPZGCq4pttUJoA4PzyVikcYardtLoRnw392WHMeE2ouxjwa5JFUTGEVynOrwRM2uzJIwJ9LhCNBZ7sPD1Ere0L9VKPi7fip3PX6/9/Fji+uRJkOeK5qeS85xS/rAsggU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISRgInQD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISRgInQD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210991F00A3D;
	Fri, 10 Jul 2026 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783700466;
	bh=UzrzmVlQxn+ZR5FPF+zBoHQ+F/YG8ANO2IH5J4aS5zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ISRgInQDYwEUXsW2taP4ZirjMgcqZ8F3ytDXHMOFsrGyIPnuI+zPIMK1C+Ar7b1+8
	 ZY3Hau++Os2hMcskPmQHSOS+Nl9RLOyxulH7XGOMspujHJF4fH4Omiuiz8y69RyXV+
	 GI9cE7LKleSYwamMQvZ9Uti/+uCNMVlXFt+b7Z65oml84f+z6SPiLueHlwPj4XNrLA
	 JME2Xr/vVLo5qwJ9xtAU7aXCU0Js+JerTmTOrYO2x9zUuzB7op+rCVPuk4J8R4oP17
	 OLw2G3WKa+/az27EU3PPxu23DyoEXr1L0b4+Fbs64wCOhwWQOKq3+T6RPCE4KCxwuN
	 0TIuVroDfCM5Q==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 33420F40244;
	Fri, 10 Jul 2026 12:21:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 10 Jul 2026 12:21:05 -0400
X-ME-Sender: <xms:8RtRajOi6ONqFSaOn8oSwqa7MNqQuU6DE6jHHjSMBK0E_M9VMfu3fA>
    <xme:8RtRavp8J2DUc6XQZ_57rSIA7kXMKdIphr9zwj7XPnaTrOZNu4_teceLsXnM9m2W8
    3R4b_g8QJnzND1q2ty-TnSeZWocb7xvVM29J_qey_7ORCJQOquU2l4>
X-ME-Received: <xmr:8RtRaluDj2okVMG_L6VdsMF7FYnPeZF894KuaIiO-vNwqpRhALmHhD9cvRoKAw>
X-ME-Proxy-Cause: dmFkZTGegIQIiSyXdto7rtHUCFF64bpvZRloqLHGkRPu0at43boRWxvfHZObrV/9El/SZX
    BVVPULE5qylfcPoCz2VSKffXr5XWoKJvbMPqtS5XPbQ78+pQaRdyKBoDcLD3QB2TUdNxtk
    yvubXwPaBGt4h2AvvaSx2KDhg818jKCsd6G6SNhnPhM6kfwfH6JelLdYM85fBwjgoiXZr9
    EX2IOnDW0zj4RHBJQClzxr2SvB5TAtXWrxemY3QfS648gOotA8ZpCIm79gkg20EN6IZRr0
    2yfML5a6+nNK6GqNoAAeVc5eZzMv+Eu/tLxjcNNbRmIZoDeAlIh6E8mn+CsRbToWzY+FdR
    fxkJ8rIedE5G3C83qJqXWRvIHVki9onYoF9ahifUPW6UgQWcmct3jCeZWajWn0VhZq4NNs
    Jv1RKEvyNe7aRn6iu55+p0aWBkZpaH8R4z4J52dkxmwIFt/mtsdqDqk2osirmu9ywUb5xm
    L08Q6Epu2hKIw8hXCYM3xYoNnis04zF4rRBEOpCqAjlmlrUKZdgdRaxQ/lyCXYvgjTk3kH
    Ma54/mJESjtATsveDWmrcWc20tp5VDSoMVrxQK+UR9SW7imxnmsXoVTlmPT/ur+tKuzTdZ
    Yz7CloAi7+7gxd0CIREGq6/S+oz9sAqwQrpaP6nLGXvXEic6OvyFK6cUQ9zA
X-ME-Proxy: <xmx:8RtRanilcaq62u-SDcJHCHU2UaT-rV_cCRRSgFYHW43u18t8veNjiQ>
    <xmx:8RtRah2hGUyLXpxvYIvqt14PtPw-q9jl6dOnE-wFLa_BSGRVSsG0uQ>
    <xmx:8RtRan8mSDvPTDAdjYpOcxDGs4WaOTmDXU4TmkOuJGsutc8ish8M5w>
    <xmx:8RtRavOEOgac9QamloKFoJ8mvcyNaiiBnM22zTBjJQFY0kQswEHGbQ>
    <xmx:8RtRarCkEWzGbjO1qv5cyO7kn3OSMwo1RdUcYoOee7NStRbMy6yP87aw>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jul 2026 12:21:04 -0400 (EDT)
Date: Fri, 10 Jul 2026 17:21:03 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, 
	yilun.xu@intel.com, chao.gao@intel.com, djbw@kernel.org, linux-coco@lists.linux.dev, 
	peter.fang@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <alEXflESyo6ndDTY@thinkstation>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>

On Wed, Jul 08, 2026 at 11:03:14AM -0700, Dave Hansen wrote:
> On 7/8/26 10:03, Xu Yilun wrote:
> > +/*
> > + * SEAMCALL leaf:
> > + *
> > + * Bit 15:0	Leaf number
> > + * Bit 23:16	Version number
> > + */
> > +#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
> > +
> >  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  						  struct tdx_module_args *args)
> >  {
> > @@ -39,6 +48,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  	 */
> >  	this_cpu_write(cache_state_incoherent, true);
> >  
> > +	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
> >  	return func(fn, args);
> >  }
> 
> This is really looking fragmented and inconsistent.
> 
> What if someone *does* set the version bits in 'fn'? Also, if the "leaf
> number" is just 16 bits, why is it a u64 in the API?
> 
> Additionally, look at this:
> 
> > /*
> >  * Used in __tdcall*() to gather the input/output registers' values of the
> >  * TDCALL instruction when requesting services from the TDX module. This is a
> >  * software only structure and not part of the TDX module/VMM ABI
> >  */
> > struct tdx_module_args {
> 
> "version" doesn't fit this comment, does it? It's not a register.
> 
> If "fn" is just the 16-bit leaf number it should be a u16 everywhere.
> Then there's no worry about the version number leaking in there
> somewhere. The type can't even _carry_ the version number.
> 
> As a general rule, I dislike doing things in assembly that can be done
> in C. But, in this case, we have some pretty darn simple assembly doing
> a pretty simple job: marshaling data out of 'tdx_module_args' and in to
> registers.

Ughh.. I think it is totally wrong direction.

The version is not a register operand, it is part of the function
number. And RAX carries more than leaf+version: bit 24 is
INTERRUPT_MODE (enumerated by TDX_FEATURES0 bit 62) and bit 63 selects
P-SEAMLDR. If the version gets a struct field marshaled in assembly,
do we add fields for these bits too? Composing 'fn' as u64 in the
caller is the honest representation of the ABI.

Rather than pushing the version all the way down to assembly, let's
look if we can salvage what was proposed initially[1].

I know you didn't like it, but the problem there was that the version
was invisible: TDH_SYS_UPDATE was silently v1 and the old one got
renamed to TDH_SYS_UPDATE_V0. With the version spelled out at the call
site, that objection goes away:

int tdx_module_run_update(void)
{
	struct tdx_module_args args = {};
	u64 seamcall_fn = TDH_SYS_UPDATE;
	int ret;

	if (tdx_addon_feature0) {
		seamcall_fn |= SEAMCALL_LEAF_VER(1);
		args.r9 = tdx_addon_feature0;
	}

	ret = seamcall_prerr(seamcall_fn, &args);
	if (ret)
		return ret;
	...
}

And tdh_vp_init() stays what it is in mainline today, just with the
macro instead of the open-coded shift:

	/* apicid requires version == 1. */
	return seamcall(TDH_VP_INIT | SEAMCALL_LEAF_VER(1), &args);

This also addresses all three complaints above at once: there is no
FIELD_MODIFY() to silently overwrite version bits in 'fn' as it is
exactly what the caller wrote, tdx_module_args stays a pure register
structure, and the assembly is untouched.

[1] https://lore.kernel.org/kvm/20260618081355.3253581-3-yilun.xu@linux.intel.com/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

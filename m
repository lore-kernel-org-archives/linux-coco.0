Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12B359A6D;
	Wed,  3 Jun 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480950; cv=none; b=c/F/Dh2FO/GHQGve2dWB1kmzadyp9qygbj0EDeA+0nJKxLcuYiHO9MFJH5TyDSkZu/I4dTGjQexkWemzJ6s/qZN/XNGXs285uJ25HILOVCRvP0hlA1cXABFxnyh1D/sfMNOtpUfUekqsyOHzLCmwIfoStJC/kqgUlgU3+qBwP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480950; c=relaxed/simple;
	bh=yXx+rqfeV3LVpiDnFV5kG5jvMFi7X+jyX4MxnENzlnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtrjQLNCTsPGqktZfKW1Chu/xbQ0F8r9uSleZGNLVZ5zqg6TPZ1dxPFraGLUH1WJ2p3MtLqXzdFStb+8tJyeBndLtfJomwu+t3hfFFKNvLb3zQDOYvm09fK9QVWw0e2l/+cFYUX0eN4dSOVpor7rcWM664bFyhBViw1Q32ypycM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heqiJfYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heqiJfYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BB81F00898;
	Wed,  3 Jun 2026 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780480949;
	bh=V8fVwdI7wxnksQVE14DY2HWli3Oy9+kR4dG/B9JF5Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=heqiJfYNfvCVfeDdF07xE4qHhG7Ix22oFDFTYVM3WDBZVFjjq7MdBm7RxPXb2NQ3h
	 wlPm/fq9mnt4GRJr7WluzoMlgjC2Kl3T10enIwOHJ1XpcPMo83xxJet1qDAoJ1C1JD
	 5XKUMVwQ6K/HPE0uhrHFM3U4IWwd0Tbk3NwNrZWaS8txhD7kZTaMg6w+5lvM8K01uY
	 //OoJ4TLPg+551ngLS3gx286ROaDNVBuWuY8QWxE7kMKzW/dfnSG/n5UV6niq98AxV
	 toH0afbm7Bb1/0qnLaXL2Xfmx4yRd7FHvPV5vtqCusZI3PhWlaVNLDGaeRYlkK2oBf
	 9MHHVXSJAHBKQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1B503F4007E;
	Wed,  3 Jun 2026 06:02:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 03 Jun 2026 06:02:28 -0400
X-ME-Sender: <xms:tPsfauhaxGVEUgsvlHEIwecFN-9ZEF71setn4TDGW-FCZRyQ0LUDyA>
    <xme:tPsfamdy_fjRoYDOeR8cmy-cPfUgoaO8mBFumrmZMVa1jqXBPwZUvuLW59ggNGPh6
    y6Fg25GDh1rZ4Nor5r3OQmW7R6jePR7YEy-XB3OaBYhUGAYnBP5RIw>
X-ME-Received: <xmr:tPsfajmUqQ7cLJ253fvAZjjjhxIAhgwirNcqfwrQkow3MYEGcKhn-5N2p_izhw>
X-ME-Proxy-Cause: dmFkZTGuwFznDiQhelvFQOBp2/9r9H4fxoNNaEmxB6iOaHyiMwffQUPfC1FAZMpbzqIqkk
    CN9TCgwxMINXJSdtTnBkzIXOc6K717wq9QjeaoGXRWKTpKm0u+QpWfmKKW9HN3pL/A1+6p
    92lcvawl98fM5nvrzMFAJ0zCHVpCTPUX+0fcWGBVn0sUJNaILiDyF6WAR5GTLaYBf9LtF9
    HeIJf/jM6FJN5c4MVjb/Nm52s7djeDzHoqhhvyRfCScg4aR0UhUORBt/S3XR36+WsGhT7P
    bVueHPke7HzKjPxs+Lmcr4uF/2Rif/nWiVWI2Sn/X2KEDbfEm3ZjS1qdm+5tHCszTtFFts
    /VzzRZabQfVduEReAlUgkBJ79Z4LSt1cBS+rSnnFi9jDTiczC1H87ZS7qLCKADqoqzrmR4
    mGIz8sa4eqINRsLod/oLKxieYbrnEsfQXN/59nPX9ObnVXbRESfnOCNA6fc+BZp0oeNprP
    PvGGkzDmtovVRJkI3ywAfrhFpNJvUXD0fDzsSJPA0RLCqMYGu9iLwI5MlFSpJg7a/5udeS
    lJZWm/zw2dGecCf6mp/nhd1OdYPK7oDQIXbomfj0Bb9MYjyFb44nJOTTHxAkkFlEu1IJB4
    mvQH42vq4f+lwAhvj17/Vsi6xt4tXviwqxjQO+AmX3bH/ZlUDX8iOWPxS9lA
X-ME-Proxy: <xmx:tPsfaixl8twHiScZRF0l3aPUkADDTTORVWaND_noCCfDud9HhsTR5Q>
    <xmx:tPsfalcLZ32BWK_NdqC_-FR1DBldNJTO6IRNGnlVk2pTTVI454R5Rg>
    <xmx:tPsfajhekMHXMQ6qYg0RgZ4pegrE87GtuiN4Aa5Q13qUrGdoLAXSdw>
    <xmx:tPsfap-OinTX938zNS5LgCJfS2x6J85u1U-3v3h3dj98T7oCnvJ1vg>
    <xmx:tPsfapa94FWneQTrYxrkNAOdSEUGyY-WiNNfJ2K6qxxwDuEUGbG_4uoT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 06:02:25 -0400 (EDT)
Date: Wed, 3 Jun 2026 11:02:19 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, 	Long Li <longli@microsoft.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 	Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, 	Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, 	Juergen Gross <jgross@suse.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 	John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 	Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 	Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-coco@lists.linux.dev,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 	Tom Lendacky <thomas.lendacky@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>,
 	David Woodhouse <dwmw2@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>,
 	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 07/47] x86/tdx: Force TSC frequency with CPUID-based
 info provided by the TDX-Module
Message-ID: <ah_7jEMnqs80gXLG@thinkstation>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-8-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529144435.704127-8-seanjc@google.com>

On Fri, May 29, 2026 at 07:43:54AM -0700, Sean Christopherson wrote:
> When running as a TDX guest, explicitly set the TSC frequency to a known
> value, using CPUID-based information, instead of potentially relying on a
> hypervisor-controlled PV routine.  For TDX guests, CPUID.0x15 is always
> emulated by the TDX-Module, i.e. the information from CPUID is more
> trustworthy than the information provided by the hypervisor.

Right. EBX is configurable by TD_PARAMS.TSC_FREQUENCY at TD build. The
rest is fixed.

> To maintain backwards compatibility with TDX guest kernels that use native
> calibration, and because it's the least awful option, retain
> native_calibrate_tsc()'s stuffing of the local APIC bus period using the
> core crystal frequency.  While it's entirely possible for the hypervisor
> to emulate the APIC timer at a different frequency than the core crystal
> frequency, the commonly accepted interpretation of Intel's SDM is that APIC
> timer runs at the core crystal frequency when that latter is enumerated via
> CPUID:
> 
>   The APIC timer frequency will be the processor’s bus clock or core
>   crystal clock frequency (when TSC/core crystal clock ratio is enumerated
>   in CPUID leaf 0x15).
> 
> If the hypervisor is malicious and deliberately runs the APIC timer at the
> wrong frequency, nothing would stop the hypervisor from modifying the
> frequency at any time, i.e. attempting to manually calibrate the frequency
> out of paranoia would be futile.

Agreed.

> Deliberately leave CPU frequency calibration as is, since the TDX-Module
> doesn't provide any guarantees with respect to CPUID.0x16.

It is fixed to zeros. Sounds like a guarantee to me :P

> Signed-off-by: Sean Christopherson <seanjc@google.com>

Looks sane to me. Including your reasoning about tsc_early_khz= in reply
to Sashiko.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3D31BC96;
	Wed, 26 Nov 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156350; cv=none; b=UgJMRCsLlEnuVsJChcrezr0M5ggNHdxBvvfjOj/pjNHt9kDwWJmzuEeIYcMh+29D5UD9auoaUzCrs5nmlIq5/Gn+xsYN/FMQi1ulDhPcEiNiCTxCWffqmtSlqERGWtoqvONiUpUmEEmFgsbMLBf9uxUhL4+OPbB7iikPCYItVQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156350; c=relaxed/simple;
	bh=jrj8RSr5EmDJN5Cor4Bp/JJt6OJx0LUM94igSYbBygE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+/7M0PJtAvgpAyKHPeRkDtvgPcY0pXPe7nq8Ozq61MZ0KoDLrWhLBuVJ2PC2zEMmC/frhHt8dc+K+jxvWP5ABPrZm8dslu3sHLTL/F1RTZeKsThSU/Vs+TimCo8zvFNDrFpwGUyFlzTHR/d4NbCj1l/x4Kf+QFr/ZPOp1KNqzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpSu0ZVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpSu0ZVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B96DC113D0;
	Wed, 26 Nov 2025 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764156346;
	bh=jrj8RSr5EmDJN5Cor4Bp/JJt6OJx0LUM94igSYbBygE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpSu0ZVpQji1V1a4k6ZIvBXGvwoMQ12tNR/ZaOYR8X5+DxOo9SVNKjf+1rCoDf/9Y
	 Uothmk0RsA4A3yliJTY+UQnaHj0vaVcfq/XGYQbmBKSemJyJ86rllM8ohfEEtTpC8Y
	 mG0kW5KYu8JpMoYI29Zg/rJpzp4ekIOQEUUquljCE8hagf0UKdfQ++yKy3K8cHnKbE
	 tuk9QI7j5P15SlxxBEjUStn5H9ixhSlL23WrFi6JSKMt1FDdV8n2qiQMY15Hl7OHHZ
	 lGJARpY4/Gzq4R9JQMfl6AMsqQnONVMjoH6Sbb18ZoiPv9OZd/Eka88BinGuwL+Bsb
	 UAK+kIbo4iUeg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5EE5AF4007C;
	Wed, 26 Nov 2025 06:25:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 26 Nov 2025 06:25:45 -0500
X-ME-Sender: <xms:ueMmaUGIDfVdT8Kq2QBXthyDRqigteL7pLmGbWhgAOsHUIWqqt4d9g>
    <xme:ueMmaddJIedyEAcUFF7aDiuPOE0ezXgGVfic3sf3jUGRIPwlwqlMhb6FOR25H7n1U
    EGYe8oInS2-NwAUb3Dyy-TWaUETXpcCpSIHvPCFlR77wY2FETQiMZM>
X-ME-Received: <xmr:ueMmab_4jdC1aqpXIuT8gBwxMZev9IIJ6HyAUnvxqsCFJ6jVz22leCoiSLgl8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeegvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepheeikeeuveduheevtddvffekhfeufefhvedtudehheektdfhtdehjeevleeuffeg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeigihgrohihrghordhlihesihhnthgvlhdrtghomhdprhgtphhtthhopegurghvvg
    drhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhglhig
    sehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrd
    gtohhmpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepgiekiees
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhprgesiiihthhorhdrtghomhdprhgtph
    htthhopehrihgtkhdrphdrvggughgvtghomhgsvgesihhnthgvlhdrtghomhdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ueMmaaXC99-YPUWWboSPjOi0X7J9DV09Kh3OJrYHuUWS2dPLLLfUBg>
    <xmx:ueMmaYjMk9UXVZL2Gp9qOY8fZoNzFfEZq14bpLhOk_gP_acwZD_PQA>
    <xmx:ueMmaYw5luYWZ0mqLiPLzb2--pLPCf4TagTScUqkzoWdQKsetFZFeA>
    <xmx:ueMmaepuLH7CQC4WrMq24ZCldCTqol0SyNEQjetZVrXji0T2eqBCuQ>
    <xmx:ueMmaTl33MkqeIjBqU3E81YQWT6m-jiUI0jQWokUXVvnzMpP64hmkhe7>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Nov 2025 06:25:44 -0500 (EST)
Date: Wed, 26 Nov 2025 11:25:43 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, chao.p.peng@intel.com
Subject: Re: [PATCH 1/2] x86/split_lock: Don't try to handle user split lock
 in TDX guest
Message-ID: <lvobu4gpfsjg63syubgy2jwcja72folflrst7bu2eqv6rhaqre@ttbkykphu32f>
References: <20251126100205.1729391-1-xiaoyao.li@intel.com>
 <20251126100205.1729391-2-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126100205.1729391-2-xiaoyao.li@intel.com>

On Wed, Nov 26, 2025 at 06:02:03PM +0800, Xiaoyao Li wrote:
> When the host enables split lock detection feature, the split lock from
> guests (normal or TDX) triggers #AC. The #AC caused by split lock access
> within a normal guest triggers a VM Exit and is handled in the host.
> The #AC caused by split lock access within a TDX guest does not trigger
> a VM Exit and instead it's delivered to the guest self.
> 
> The default "warning" mode of handling split lock depends on being able
> to temporarily disable detection to recover from the split lock event.
> But the MSR that disables detection is not accessible to a guest.
> 
> This means that TDX guests today can not disable the feature or use
> the "warning" mode (which is the default). But, they can use the "fatal"
> mode.
> 
> Force TDX guests to use the "fatal" mode.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  arch/x86/kernel/cpu/bus_lock.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/bus_lock.c b/arch/x86/kernel/cpu/bus_lock.c
> index 981f8b1f0792..f278e4ea3dd4 100644
> --- a/arch/x86/kernel/cpu/bus_lock.c
> +++ b/arch/x86/kernel/cpu/bus_lock.c
> @@ -315,9 +315,24 @@ void bus_lock_init(void)
>  	wrmsrq(MSR_IA32_DEBUGCTLMSR, val);
>  }
>  
> +static bool split_lock_fatal(void)
> +{
> +	if (sld_state == sld_fatal)
> +		return true;
> +
> +	/*
> +	 * TDX guests can not disable split lock detection.
> +	 * Force them into the fatal behavior.
> +	 */
> +	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
> +		return true;
> +
> +	return false;
> +}
> +
>  bool handle_user_split_lock(struct pt_regs *regs, long error_code)
>  {
> -	if ((regs->flags & X86_EFLAGS_AC) || sld_state == sld_fatal)
> +	if ((regs->flags & X86_EFLAGS_AC) || split_lock_fatal())
>  		return false;

Maybe it would be cleaner to make it conditional on
cpu_model_supports_sld instead of special-casing TDX guest?

#AC on any platfrom when we didn't asked for it suppose to be fatal, no?

>  	split_lock_warn(regs->ip);
>  	return true;
> -- 
> 2.43.0
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

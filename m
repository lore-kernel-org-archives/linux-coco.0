Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C695278164
	for <linux-coco@lists.linux.dev>; Wed,  9 Apr 2025 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223911; cv=none; b=cpiN13lKvUYrPte1NAMN0pQTrTu8I59kfiOAPG1gdiJZagcCxKgDeRKKI8AqBXXsXYVJvqZdTFkh+E3iMRah9cJf8idTX2Athic+s7A0zF5Fq6/lKD4nDaugCZiqFg2pN5SNNL8Ql6OpK2BrwprO+p0ZZKHempRZkEl4QGdgQv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223911; c=relaxed/simple;
	bh=O91Rd3TGfIwk1sO125yxwB7temY2Aamv+SYGkxjLuCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2XGGe1rhY26LvpnuRguCr1HlR7gdIZp/BpAn4ZvDYvLh5q6Qm+8FPtnDMXCsrFpQoP4C6zW8aPfG5L8iS0XtimJXLW3PHj0NveCh4oh9WAhpfndK0+YyJ2dFudwo8QTJpsoiJURIGvbpevhFTtx9Mesxi5X/Dq/Kp9QWlmj5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gDRXhPzc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gDRXhPzc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4C96140E0242;
	Wed,  9 Apr 2025 18:38:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xpK6NzLgVthG; Wed,  9 Apr 2025 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744223902; bh=TgdTSj/I304OhqXPUcdq1y+UDQUl/WMEGBHx8SNycKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDRXhPzc9AYjHOxgl7AZS9SiW7cyYR8PmbbFzIVX8hOYDrAsXVGMOgX8Wm9QBW8+s
	 l24V6TZ7nLaWwKLQIr5ocjT4z5OORwwQaauw7YGVSMaN+BVQEJmu613ebhdShP3IEd
	 +eUznxAGV+kE/xaUiER1s/ltazS5I68oLYLmrbyda2gdwHRSLNlI7pjwBp9XiwAfS/
	 qy+zcRs8F5w5+fx5IzJyC5HW9B0qwZYtx7TFshnwQ+xQlbnQhME/GXc0XwsLP7nVIQ
	 qQXD3tGoamLyXZS6hvILNyEsDXPWgfIQJ2zDDFt4G63xFt2MHww07VEzSBxsw9prHt
	 KnKt3hTx+PQbNkgAy5XbIcmQdOKXqrOzPsaIK/4kF6uoyA0+Y5BA8Zjyj3p1q8N9Ou
	 Z30IMTtObgaFsr65GRVTTudy4anDDN0cq+P6ofmQIwnQwzaAD/IvDgxKl4FS3fgMYK
	 0LDzszk6ZVw7q1HSWi0O2n9rFzjylqtUMGxgmA2sGmUQJoub9vshWjMnZ5gjB8mKQV
	 A1VxzljHaqjSmkuji05HdXaAvjJ4WFgGxxw1x6IZByObuemkJ6UY3mFGdGa7t0+gQ9
	 lxlztjjkxD0L+64EAaxgLChXyCSiseBfma8Z2ma4S8b6QUZV48qsXaFRJOkOdnvWZH
	 xQwmltk26zGwW+7keJu9GUXY=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5E98C40E0243;
	Wed,  9 Apr 2025 18:38:04 +0000 (UTC)
Date: Wed, 9 Apr 2025 20:38:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev,
	linux-integrity@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
	Joerg Roedel <jroedel@suse.de>,
	Dionna Glaze <dionnaglaze@google.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Message-ID: <20250409183803.GKZ_a-i3YZM4WfpkeU@fat_crate.local>
References: <20250403100943.120738-1-sgarzare@redhat.com>
 <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>
 <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local>
 <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
 <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local>
 <CAGxU2F7r_fWgr2YRmCvh2iQ1vPg30f-+W6FXyuidbakZkwhw2w@mail.gmail.com>
 <20250409113154.GGZ_ZaqgfRrrMij_Zm@fat_crate.local>
 <409a9171bc3224dd55344729ab3106917ac113bf.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <409a9171bc3224dd55344729ab3106917ac113bf.camel@HansenPartnership.com>

On Wed, Apr 09, 2025 at 08:22:37AM -0400, James Bottomley wrote:
> Because of the way driver and device matching works in Linux.  We have
> to have a struct device because that sits at the he heart of the TPM
> driver binding.  If we have a struct device, it has to sit on a bus
> (because that's the Linux design) and if we don't have a bus then we
> have to use a platform device

Thanks for elaborating!

> (or, now, we could use a struct device on the faux bus).  Busses can be
> either physical (PCI, GSC, ...) and abstract (virtio, xen, scsi, ...), so
> it's not impossible, if the SVSM has more than one device, that it should
> have it's own SVSM bus which we could then act a bit like the virtio bus and
> the SVSM vTPM struct device could sit on this 

I guess we should keep this in mind. Depending on what else needs to talk to
the SVSM in the future...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

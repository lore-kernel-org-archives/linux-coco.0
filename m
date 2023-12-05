Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860BCAD56
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="L5gkoKXD"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 27BD340E01AD;
	Tue,  5 Dec 2023 15:07:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0YSLOHYtqL_t; Tue,  5 Dec 2023 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701788822; bh=SxyqOCYtJ0Jgo4rmEhzoNB1yXpfANdgicu3F4wlIel8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L5gkoKXD7jmHN85/Z7vuHn8ouhDbVEbLES0u6GoHalQz33UxUm3kZCRd3gFmCvVAt
	 g7ESLaIq00QWcaknOs/1TPwXWSxWaRMhn252kRLUYYp6Zy8KuyMfH9VUwzT9i0xZTQ
	 4x22L1/Aar9dD+wZVJKgqw+FOMnBetwjRKgIRgWzL+RLxGh/tivYD8X/weGDxBrRHG
	 vPQm5xDdQ6XVj10X0II0ThiJrf2U5guOEcz0Yg9KCvEHivqASFMmOsOQvQnsXBJEaP
	 NERtsTqvo3DLZ8PKg/LFjLIR59MZMYKDfiLIeqKidDAx9B4BImONeqd/h3vq3RTyyX
	 Vj4EgWkarldHckRl9I3Bo2+pJNSREK3y/yJJIq5ZbNGRKP0iv6YcIp74Pb478opu0u
	 iGpDQaGxOmQ4iQb2OUZuQdTKbLEUXMm4xWERCQXBIvklHlm6yWfKoJ5ZB2/dk9gjI8
	 9a8OSXntqmVEbx92x2HLFlQ4crx58cl3ld+CDTu0Wfl6VowDDZhnFANhgWtWraosAH
	 irdNBshe49cnqeMVzJmJjm3vEes58VV+Oe8shhMQgEpXOpnzqrA45vjy4FCbp/j/LU
	 4KyN5IxR9hSBWxTQSqLW7SJhsapaB+Ey2l1zrgkCS5i+1e3hm7NprOiyOr3Gey5YAS
	 cUmCq5Z+JTplMXcoI8cv6TO0=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3C7C540E014B;
	Tue,  5 Dec 2023 15:06:53 +0000 (UTC)
Date: Tue, 5 Dec 2023 16:06:48 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/coco, x86/sev: Use cpu_feature_enabled() to detect
 SEV guest flavor
Message-ID: <20231205150648.GDZW88iAjBzYoIJ0+o@fat_crate.local>
References: <20231205143738.2875-1-kirill.shutemov@linux.intel.com>
 <20231205144619.GCZW83uzAomKmupn7j@fat_crate.local>
 <20231205150012.6lma2wzcellr7pz7@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205150012.6lma2wzcellr7pz7@box.shutemov.name>

On Tue, Dec 05, 2023 at 06:00:12PM +0300, Kirill A. Shutemov wrote:
> I don't think cc_platform_has() is the right check. On TDX side we use
> X86_FEATURE_TDX_GUEST for this and it works better than stretching
> CC_ATTRs beyond their meaning.

You don't think it is the right check because you do something else on
Intel?

I can't follow that argument.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

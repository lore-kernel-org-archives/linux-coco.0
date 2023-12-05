Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12D6A345
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZlCPdpsu"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BCC7C40E0173;
	Tue,  5 Dec 2023 20:33:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fIA2bYMxYBIT; Tue,  5 Dec 2023 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701808427; bh=SQIjUtKUjx1k/ihWQekdjEpX0BxntYQsedoVYhd9nZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlCPdpsuLl9kG7HvXjCt5VaKGA7jC+zQ00BRct+Hp1iZuM77uc0nOjeAE82ioUs8U
	 XdRSgtBOwsUzp1YEoIMAwxJhGJi/RHMONfJm1UJuI99sZorl0dsePFalqJYMv1af9l
	 YzMJzGU2f92zWlhIwpUXNZl6Myex5k/nXA7ZutC7SGE3dbH94O26cZahpoJqyeGGb7
	 6b+XoHA2qrnt1kwSfJphlqBQodquS81mZwsMSoDWiPM3GfYcR7e2dZM4WBQoQR7pR2
	 Lzeu7CW9fTAGitX9xHMGIF4Z7bbBvXLbrNNrVkhpZ8H1JBK5/4pVLcOJLJJ0RgBxtn
	 uzPoSFfCW2DwmO4OgSuavsN2aKO0GD6718k6tcNTnop4u9YxBQA1STzVaBzVwFP9tC
	 d060DM8d39onwdmiV9BV738ADpJ3T21M5qa97CKyi5YPqM9zphZaM+1xzEahLc1aeQ
	 ncCPDnU1j1KI8QyvzA/Jt0TTBu3brNuZuxW48nNW6NjYgNDdmSlHavm4eRCEs5LmGT
	 Efm8pvxcbgmkQs18VLb0nbAKiKUii/cH1UAFqWwHUhHFogH5pmcFmW+8mXjG9qLmQJ
	 dXaQ1gDqaF6bxDoYLQptVyHik9HyJQODBtoZRY5xm2NAr7CPPzfO2dub+H60c/lkXN
	 zoweAcG3NVcrT9YmieELLMFQ=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F1D5640E01AD;
	Tue,  5 Dec 2023 20:33:37 +0000 (UTC)
Date: Tue, 5 Dec 2023 21:33:37 +0100
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
Message-ID: <20231205203337.GKZW+JIe9m2/QVi7Xl@fat_crate.local>
References: <20231205143738.2875-1-kirill.shutemov@linux.intel.com>
 <20231205144619.GCZW83uzAomKmupn7j@fat_crate.local>
 <20231205150012.6lma2wzcellr7pz7@box.shutemov.name>
 <20231205150648.GDZW88iAjBzYoIJ0+o@fat_crate.local>
 <20231205151437.aqmuydosfmnq3zr4@box.shutemov.name>
 <20231205160035.GEZW9JI8eKENXBo6EO@fat_crate.local>
 <20231205171643.zg7fwxjyccab53kf@box.shutemov.name>
 <20231205172436.GFZW9c1EaCaguGhglb@fat_crate.local>
 <20231205180813.phbxg5jdumfovshz@box.shutemov.name>
 <20231205185241.GGZW9xeTtiG6sORMTr@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205185241.GGZW9xeTtiG6sORMTr@fat_crate.local>

On Tue, Dec 05, 2023 at 07:52:41PM +0100, Borislav Petkov wrote:
> So yes, we will fix your issue, no worries. I'm figuring out the
> details as we speak.

So you can do for the short term:

---
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index c461c1a4b6af..f8999f6d1b00 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -434,7 +434,7 @@ static void __init sev_map_percpu_data(void)
 {
 	int cpu;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+	if (cc_vendor != CC_VENDOR_AMD || !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
 		return;
 
 	for_each_possible_cpu(cpu) {
---

until we've sorted out the bigger picture.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6248860B82
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fIiGrk+h"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5CD5240E0195;
	Tue,  5 Dec 2023 16:00:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oJp3iniH4q9n; Tue,  5 Dec 2023 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701792049; bh=skWef669LIuW0C7FbIVUwAo/oIDKwFCgLbWfyWSokAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIiGrk+hATSHkcLrZ3Yzahlp9bedmttWKp0Ul3RfLURg2WTeH3SeVnN3KKja1v1HS
	 flpH4z5Q0Rim28eWp7rEZBFqGQz/l8q6dj+7dR8xSlUetggZYIkQPMOhYpw/rhNT2H
	 J7W1B34JClWIDJEMrXNjadcqejweJrcc5khoYau+vgSC7bO8YwuQNlidlJML3IT01T
	 gVaqH4XKci6mm3br0giSkJrS/paFOpKaHJw2rq/gMrp8mGZzKesTntVCYp++DTXnFI
	 3gQEYPEs75kz1wQlyhWIXA7LFWYuoLqo5cYdVRUjHs5FCWS/6/xbQuXvpQg7u3uv/1
	 Pt8MZ0BvJ8AdGgVlaDcYzy4Yezn0wTqake2hulwNvPa2M02GDnBEz4l2jK9yfdIA1P
	 kWouLjo/GFMisFp6FSukDFFw/Q1F9shaxD9Vgr9bbDKs2iiczMcaAM4Ymq3L/vBlR4
	 QnVo7sSsxhzfHxfoN3xwELWjLyu69z9ybhXRmP2fo1HfTlouCCuurKX4BACk4yzzTg
	 vRlzKxZWA/wL8Al5ZtAzGm5jpzgXPYpOWoEoUTPPa4dJGG+bl/NN9AtnU/KQYIBQ9M
	 mwt5zC5baoPsxhjcG2Nq4IqlAp2Kcr/XmLFF/C4N6UhhjLZHhAO1rDPVoY2a6kV/P9
	 XtHQ+g0z4wxqDNQetTSeuh6E=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 658E240E014B;
	Tue,  5 Dec 2023 16:00:40 +0000 (UTC)
Date: Tue, 5 Dec 2023 17:00:35 +0100
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
Message-ID: <20231205160035.GEZW9JI8eKENXBo6EO@fat_crate.local>
References: <20231205143738.2875-1-kirill.shutemov@linux.intel.com>
 <20231205144619.GCZW83uzAomKmupn7j@fat_crate.local>
 <20231205150012.6lma2wzcellr7pz7@box.shutemov.name>
 <20231205150648.GDZW88iAjBzYoIJ0+o@fat_crate.local>
 <20231205151437.aqmuydosfmnq3zr4@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205151437.aqmuydosfmnq3zr4@box.shutemov.name>

On Tue, Dec 05, 2023 at 06:14:37PM +0300, Kirill A. Shutemov wrote:
> My point is that if you need to check for SEV you need to check SEV, not
> CC_ATTR. CC_ATTRs only make sense in generic code that deals with multiple
> CoCo environments.

That makes more sense.

So that commit already says "If future support is added for other
memory encryption technologies, the use of CC_ATTR_GUEST_MEM_ENCRYPT
can be updated, as required."

And what this test needs to do is to check:

	if (guest type >= SEV)

meaning SEV and -ES and -SNP.

I'm wondering if we should export amd_cc_platform_has() for such
cases...

The logic being, we're calling a SEV-specific function so using
cc_platform_has() in there is the wrong layer.

Tom?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

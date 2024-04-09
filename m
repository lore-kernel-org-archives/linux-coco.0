Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37838DC9
	for <linux-coco@lists.linux.dev>; Tue,  9 Apr 2024 21:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712697755; cv=none; b=VgC+iZtZQ74bOlVQGxAvs/0UCocr+5GJJmoHUafA4yZL+V4jW2ZQb2G2oliTRAFFb7JUiUEXcwpVCFRSiZ109U9jj9v4PQiRkphhttv1nxxEtBhCz2ejSQe1c9kkK91WLZwisVVMsyv0D7R2/IetX7AgNFB68yBS59x1sfucLu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712697755; c=relaxed/simple;
	bh=yHbf2Av6vbnjP4V9YlfMBezal1Uau1LRG1ANx8tkxzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt9ThSo0JqeTwoHXP6qWzDxEmFk1vn5W609ewYgQU5gQSaX2R55X9kP2f9vp7UBMUQYVyrS9LGFXX3QI5pYQD+0pakoXTYgmGeH0afjmeX5FtORd+RJjJb1ySHBYEZ+oWCzSywYp9ouw/QQj+kZcFpQhXhBBiwZJrtEDqGnAznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D254C40E00B2;
	Tue,  9 Apr 2024 21:22:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gjc4wQ84Wzh0; Tue,  9 Apr 2024 21:22:26 +0000 (UTC)
Received: from zn.tnic (p5de8ecf7.dip0.t-ipconnect.de [93.232.236.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D3E6340E0177;
	Tue,  9 Apr 2024 21:21:58 +0000 (UTC)
Date: Tue, 9 Apr 2024 23:21:52 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, rafael@kernel.org, peterz@infradead.org,
	adrian.hunter@intel.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	jun.nakajima@intel.com, rick.p.edgecombe@intel.com,
	thomas.lendacky@amd.com, michael.roth@amd.com, seanjc@google.com,
	kai.huang@intel.com, bhe@redhat.com,
	kirill.shutemov@linux.intel.com, bdas@redhat.com,
	vkuznets@redhat.com, dionnaglaze@google.com, anisinha@redhat.com,
	jroedel@suse.de, ardb@kernel.org, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] x86/sev: add sev_es_enabled() function.
Message-ID: <20240409212152.GFZhWxcIjiEsObqecf@fat_crate.local>
References: <20240409113010.465412-1-kirill.shutemov@linux.intel.com>
 <cover.1712694667.git.ashish.kalra@amd.com>
 <906e037ecd7592eba859448606b028a68a5d48f8.1712694667.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <906e037ecd7592eba859448606b028a68a5d48f8.1712694667.git.ashish.kalra@amd.com>

On Tue, Apr 09, 2024 at 08:42:38PM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Add sev_es_enabled() function to detect if SEV-ES
> support is enabled.

And use it exactly once?

Nah, use sev_status directly.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11A9A50
	for <linux-coco@lists.linux.dev>; Tue, 25 Oct 2022 08:56:48 +0000 (UTC)
Received: from zn.tnic (p200300ea9733e753329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e753:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D25271EC0682;
	Tue, 25 Oct 2022 10:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1666688206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=jzZuHCRT8tCn7Q/Cc28ysAO72/F5QJaLOhFhC2xnWuo=;
	b=F6nuzK5egVyOWZD7QTs1xY//bjUly+5gwu9iPkQkz3X/qmkffNZ+tq/+xSuJ/Wqzc5kdt2
	HdnHTNzbHU0q2syd5lZ0gmy6OoUpJIkNBXYWeExX9OSOkX1CBAVRA38ylozzbFg+2kf8Me
	mnuYUA7WKZ+r2b5WPJ2HMfbPIAzXGI0=
Date: Tue, 25 Oct 2022 10:56:43 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	michael.roth@amd.com, vbabka@suse.cz, kirill@shutemov.name,
	ak@linux.intel.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	dgilbert@redhat.com, jarkko@kernel.org
Subject: Re: [PATCH Part2 v6 12/49] crypto: ccp: Add support to initialize
 the AMD-SP for SEV-SNP
Message-ID: <Y1ekyzdjUtpE1Z4n@zn.tnic>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <87a0481526e66ddd5f6192cbb43a50708aee2883.1655761627.git.ashish.kalra@amd.com>
 <Yzh558vy+rJfsBBq@zn.tnic>
 <f997dd38-a615-e343-44cd-a7aeb9447a1e@amd.com>
 <fac90493-fb40-d1dd-e40e-d522bf0f33cb@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fac90493-fb40-d1dd-e40e-d522bf0f33cb@amd.com>

On Fri, Oct 14, 2022 at 04:31:42PM -0500, Kalra, Ashish wrote:
> so that means we can't combine the IPIs.

Ok, thanks for checking.

> Also, this is not a performance critical path, so should we really be so
> concerned about it?

Not that concerned but we're always trying to be as optimal as possible.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

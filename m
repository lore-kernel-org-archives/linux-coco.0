Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707321C34
	for <linux-coco@lists.linux.dev>; Tue, 20 Sep 2022 14:04:14 +0000 (UTC)
Received: from zn.tnic (p200300ea9733e791329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e791:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 42A471EC00F4;
	Tue, 20 Sep 2022 16:04:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1663682644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=UxdIT3N09KsqckiSbe/NvyvNSdoIMMBwrOEJCizvJpo=;
	b=OG8msomfvFRFV9h3zLBfUDcULQo18fC9SQfmUXStEGVHnVEZfxdSTH1x+T966I7DiYxTNI
	zqviVHAhV/iBK8leiTrSHyB1VB7J+QX88UY2i3mug6eBVVaSVnM1xzd9XIwgSSFLkOQomr
	6qM4pMYQXH7yq+Z49OOoOIov0lQVJYA=
Date: Tue, 20 Sep 2022 16:04:00 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kalra, Ashish" <Ashish.Kalra@amd.com>
Cc: "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"jroedel@suse.de" <jroedel@suse.de>,
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"jmattson@google.com" <jmattson@google.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"slp@redhat.com" <slp@redhat.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"rientjes@google.com" <rientjes@google.com>,
	"dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
	"tobin@ibm.com" <tobin@ibm.com>,
	"Roth, Michael" <Michael.Roth@amd.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"kirill@shutemov.name" <kirill@shutemov.name>,
	"ak@linux.intel.com" <ak@linux.intel.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"marcorr@google.com" <marcorr@google.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"alpergun@google.com" <alpergun@google.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"jarkko@kernel.org" <jarkko@kernel.org>
Subject: Re: [PATCH Part2 v6 11/49] crypto:ccp: Define the SEV-SNP commands
Message-ID: <YynIUOoAxZyBi+Iu@zn.tnic>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <f5dec307d246096768afd770d16a26be25fa28b3.1655761627.git.ashish.kalra@amd.com>
 <Yym6Ob2tPYeb0Kq1@zn.tnic>
 <SN6PR12MB2767213C998077DFE8D52CAE8E4C9@SN6PR12MB2767.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SN6PR12MB2767213C998077DFE8D52CAE8E4C9@SN6PR12MB2767.namprd12.prod.outlook.com>

On Tue, Sep 20, 2022 at 01:46:25PM +0000, Kalra, Ashish wrote:
> These are structure definitions as per SNP Firmware API
> specifications, and they match the SNP Firmware commands and required
> arguments.

Yes, I have the spec.

> Isn't it better to have 1:1 mapping between specification and
> structure definitions here ?

Why would it be better if you can have a single struct serving multiple
purposes and thus less code to stare at and deal with?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

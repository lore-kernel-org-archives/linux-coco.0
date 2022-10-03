Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138797C
	for <linux-coco@lists.linux.dev>; Mon,  3 Oct 2022 16:17:16 +0000 (UTC)
Received: from zn.tnic (p200300ea9733e749329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e749:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6A2B91EC04F0;
	Mon,  3 Oct 2022 18:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664813823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=f6X5g8GcElSJ4aErKNUI9tgVig9HGv4p8NBwLOTsszg=;
	b=o3ICosTDJrTXu97urHrwN973GwpVGWPjb+YTjoT85PQfCDEspNCKwBHtU/lzxqgtb8j2UO
	6str+rtz7CuOijTGsF7DTTc+vXUSC3xLnunDZ9y6RJCA/joxqkHgIZIrEmpLpDefr0ejc5
	wb5+8OW6BfsOAtxR8pPtBn6y5Uiekg8=
Date: Mon, 3 Oct 2022 18:16:58 +0200
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
Subject: Re: [PATCH Part2 v6 13/49] crypto:ccp: Provide APIs to issue SEV-SNP
 commands
Message-ID: <YzsK+szsWoAlMsrR@zn.tnic>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <a63de5e687c530849312099ee02007089b67e92f.1655761627.git.ashish.kalra@amd.com>
 <YzigaOHddWU706H5@zn.tnic>
 <SN6PR12MB2767062CAD241C0BAFB7FAD98E5B9@SN6PR12MB2767.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SN6PR12MB2767062CAD241C0BAFB7FAD98E5B9@SN6PR12MB2767.namprd12.prod.outlook.com>

On Mon, Oct 03, 2022 at 02:38:41PM +0000, Kalra, Ashish wrote:
> There are actually only 8 functions

Only 8?

Lemme ask it differently then: what is the point of the wrappers at all?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

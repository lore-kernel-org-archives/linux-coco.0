Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10ABA4A
	for <linux-coco@lists.linux.dev>; Tue, 15 Nov 2022 16:27:18 +0000 (UTC)
Received: from zn.tnic (p200300ea9733e7da329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7da:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F0DB91EC02AD;
	Tue, 15 Nov 2022 17:27:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1668529636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=rqKIUpJn3nuSltSmzhMF2AZfwfkeGnGGGviR3ix9tLg=;
	b=mejjCFr9kN4KR9WGJSUq/Be8o4tEwH/lc5S4fwqi2vbY822ufKa0pQR5vK6vWnDWoXFJEg
	uw11kiWVcBoHglbEPF8K6WOiFUS2d8AorPN5Nys5XjJuAAy0CRlcecCpx++70Jjg96KZQX
	V2sGDC+J4ua9VYHLBcwPcohp3KOjn/Y=
Date: Tue, 15 Nov 2022 17:27:12 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	michael.roth@amd.com, kirill@shutemov.name, ak@linux.intel.com,
	tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	dgilbert@redhat.com, jarkko@kernel.org,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH Part2 v6 14/49] crypto: ccp: Handle the legacy TMR
 allocation when SNP is enabled
Message-ID: <Y3O94GPUECo+Gg6T@zn.tnic>
References: <Y0grhk1sq2tf/tUl@zn.tnic>
 <380c9748-1c86-4763-ea18-b884280a3b60@amd.com>
 <Y1e5oC9QyDlKpxZ9@zn.tnic>
 <6511c122-d5cc-3f8d-9651-7c2cd67dc5af@amd.com>
 <Y2A6/ZwvKhpNBTMP@zn.tnic>
 <dc89b2f4-1053-91ac-aeac-bb3b25f9ebc7@amd.com>
 <Y2JS7kn8Q9P4rXso@zn.tnic>
 <c2ce6317-aa51-2a2b-2d75-ad1fd269f3fa@amd.com>
 <7882353e-2b13-d35a-b462-cef35ee56f51@suse.cz>
 <Y3OuvXCjttfFh++w@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3OuvXCjttfFh++w@zn.tnic>

And,

as dhansen connected the dots, this should be the exact same protection
scenario as UPM:

https://lore.kernel.org/all/20221025151344.3784230-1-chao.p.peng@linux.intel.com

so you should be able to mark them inaccessible the same way and you
won't need any poisoning dance.

And Michael has patches so you probably should talk to him...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571C2C9C
	for <linux-coco@lists.linux.dev>; Mon,  7 Feb 2022 20:28:50 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-221-104.088.067.pools.vodafone-ip.de [88.67.221.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CD8721EC01A8;
	Mon,  7 Feb 2022 21:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1644265725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=lsALf0mo+v2UYmS1+2QBtB8DaKBuaxhZCLFlo0oeTIQ=;
	b=k7oaKTuyKJ87lCuFeqZIkMqyWz8IEMcy+2QTNjOgl1ghLsooBTa98Qbu+mhy6AIBb8kcPK
	yJrOvR4ku+S1hY0YSV6AkFUDf6xlH6JRVj9e1pR754abzO+lEdJks2btya5uLOiduJRhlH
	VRuKqBHTMrlMuX4gYR0QMFera0OrpGs=
Date: Mon, 7 Feb 2022 21:28:43 +0100
From: Borislav Petkov <bp@alien8.de>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	brijesh.ksingh@gmail.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	Liam Merwick <liam.merwick@oracle.com>
Subject: Re: [PATCH v9 42/43] virt: sevguest: Add support to derive key
Message-ID: <YgGA+wiyqPZD0YTj@zn.tnic>
References: <20220128171804.569796-1-brijesh.singh@amd.com>
 <20220128171804.569796-43-brijesh.singh@amd.com>
 <YgDduR0mrptX5arB@zn.tnic>
 <1cb4fdf5-7c1e-6c8f-1db6-8c976d6437c2@amd.com>
 <ae1644a3-bd2c-6966-4ae3-e26abd77b77b@linux.ibm.com>
 <20ba1ac2-83d1-6766-7821-c9c8184fb59b@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20ba1ac2-83d1-6766-7821-c9c8184fb59b@amd.com>

On Mon, Feb 07, 2022 at 02:08:17PM -0600, Brijesh Singh wrote:
> Boris, let me know if you are okay with it?

Yes, most definitely as long as there's a comment explaining why.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AA2115
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 18:46:30 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0F6771EC04C1;
	Fri, 13 Jan 2023 19:46:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1673635588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=KRD3E8588u2tezl2sQYKK6rlbF2F4B2OiI46B0gWdS8=;
	b=U2zfdZTum+2P6uMM4n6GHE4xnTO+4sYvHQBkSnFhinj1QhDfWL+E7/h45+S9I/O8MWXEl/
	Vkur79isKnnRXyK/+y7DJiKOa41dy1KzpXCzdZqzDrdwUDgWV2nYD87K13d0dSgrJr3xrf
	+zSgtgag+kFcMUCAylS4Qf7fa3inf6M=
Date: Fri, 13 Jan 2023 19:46:27 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com,
	pgonda@google.com, peterz@infradead.org,
	srinivas.pandruvada@linux.intel.com, rientjes@google.com,
	dovmurik@linux.ibm.com, tobin@ibm.com, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
	ashish.kalra@amd.com, harald@profian.com,
	Nikunj A Dadhania <nikunj@amd.com>,
	"Maciej S . Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH RFC v7 08/64] KVM: Move
 kvm_for_each_memslot_in_hva_range() to be used in SVM
Message-ID: <Y8GnA622oqQ7ihsl@zn.tnic>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-9-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221214194056.161492-9-michael.roth@amd.com>

On Wed, Dec 14, 2022 at 01:40:00PM -0600, Michael Roth wrote:
> From: Nikunj A Dadhania <nikunj@amd.com>
> 
> Move the macro to kvm_host.h and make if visible for SVM to use.

s/if/it/

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8229D2F2A
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 16:00:30 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E46401EC0657;
	Fri, 13 Jan 2023 17:00:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1673625627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=27o6Yp9lIyQ9qbRTNp3Mdd/CmshSTWD6HQz/gXlOA3o=;
	b=e25h2q38vIHUR9CNYNMf4tXTOlOHI4G8rk4VVrsSmSLtK5pcWLoKu4BpzQjB4kuEIq3lg+
	IsXSlOSBZ8LddYkmLkfbbsvYWLBHAbCUKnqKZnif4mdcYkpHnf//cFvKItev7lixW7KDtI
	BAYLJEDGsUX250/UeZjiceJ21LbTllE=
Date: Fri, 13 Jan 2023 17:00:24 +0100
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
	Nikunj A Dadhania <nikunj@amd.com>
Subject: Re: [PATCH RFC v7 07/64] KVM: SEV: Handle KVM_HC_MAP_GPA_RANGE
 hypercall
Message-ID: <Y8GAGB73ZKElDYPI@zn.tnic>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-8-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221214194056.161492-8-michael.roth@amd.com>

On Wed, Dec 14, 2022 at 01:39:59PM -0600, Michael Roth wrote:
> From: Nikunj A Dadhania <nikunj@amd.com>
> 
> KVM_HC_MAP_GPA_RANGE hypercall is used by the SEV guest to notify a
> change in the page encryption status to the hypervisor.
> 
> The hypercall exits to userspace with KVM_EXIT_HYPERCALL exit code,
> currently this is used for explicit memory conversion between
> shared/private for memfd based private memory.

So Tom and I spent a while to figure out what this is doing...

Please explain in more detail what that is. Like the hypercall gets ignored for
memslots which cannot be private...?

And what's the story with supporting UPM with SEV{,-ES} guests?

In general, this text needs more background and why this is being done.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051092FB8
	for <linux-coco@lists.linux.dev>; Mon, 14 Jun 2021 19:27:59 +0000 (UTC)
Received: from zn.tnic (p200300ec2f09b9000b7fffe760596043.dip0.t-ipconnect.de [IPv6:2003:ec:2f09:b900:b7f:ffe7:6059:6043])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 483B41EC036C;
	Mon, 14 Jun 2021 21:27:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1623698878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=laL7XkHns5/yXOay8jXifFn3byoXTFqIh5OZCqwkQxA=;
	b=QU37vsFRCs1g8V2Hv19vW6MzgEmVl3iprMJ1vstfinAJMWwvaB4Htigv81twAQEglWqxVr
	nw9WIU69ua8LDbYF6WGgczvr3uPNBm0+grzV0iaNqYc05YVjVa0fTlY2MQKPaKO0+rjxqn
	dgR5T/C67PFm8cx8E/Of8m643q9ujrY=
Date: Mon, 14 Jun 2021 21:27:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>, tony.luck@intel.com,
	npmccallum@redhat.com
Subject: Re: [PATCH Part1 RFC v3 14/22] x86/mm: Add support to validate
 memory when changing C-bit
Message-ID: <YMetti2R6SbC0mI0@zn.tnic>
References: <20210602140416.23573-1-brijesh.singh@amd.com>
 <20210602140416.23573-15-brijesh.singh@amd.com>
 <YMMwdJRwbbsh1VVO@zn.tnic>
 <267dc549-fcef-480e-891c-effd3d5b2058@amd.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <267dc549-fcef-480e-891c-effd3d5b2058@amd.com>

On Mon, Jun 14, 2021 at 08:05:51AM -0500, Brijesh Singh wrote:
> Guest OS depend on the hypervisor to assist in this operation. The loop
> will terminate only after the hypervisor completes the requested
> operation. Guest is not protecting itself from DoS type of attack. A
> guest should not proceed until hypervisor performs the request page
> state change in the RMP table.

Some of that could be in a comment over that loop, so that it is clear
what the guest strategy is.

> Let me understand, are you saying that hypervisor could trick us into
> believing that page state change completed without actually changing it ?

Nah, I'm just saying that you should verify those ->cur_entry and
->end_entry values.

Of course the guest doesn't protect itself against DoS types of attacks
but this function page_state_vmgexit() here could save ->cur_entry
and ->end_entry on function entry and then compare it each time the
hypercall returns to make sure HV is not doing some shenanigans with
the entries range or even has a bug or so. I.e., it has not changed
->end_entry or ->cur_entry is not going backwards into the buffer.

I know, if uncaught here, it probably will explode later but a cheap
sanity check like that doesn't hurt to have just in case.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

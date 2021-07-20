Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF491173
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 09:11:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D2971FD3E;
	Tue, 20 Jul 2021 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626772266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+kd/u8CU4q26Few9zjEdRRSxYLzHoRL5c+SvecSD1cU=;
	b=tzc14/s6q326MAX/80brC9WF6A7XgWSXeSSLmj6PNY7rXZZJPeRmGz5hFedadMeZVN8/AK
	MlPmOGBhEk9b5LHvJAzeDhZhRgqPlAmN3B+R/kM2S/OKUnmT3kwx5DLLk0NLj7VOamZZwc
	MJUrz0ElEaCUAbtvWL3GF+HeVBWNQP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626772266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+kd/u8CU4q26Few9zjEdRRSxYLzHoRL5c+SvecSD1cU=;
	b=uwuvTENOmHD9IJ/WMdd1vHZ0TdBeHTnAtN5Hak03B42Mkn6NeWYykYxmx/Oe++jT7iAlPR
	5Zag7Dpmx5JxKDCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1A3E13C89;
	Tue, 20 Jul 2021 09:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VtGuKSmT9mD1IgAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 20 Jul 2021 09:11:05 +0000
Date: Tue, 20 Jul 2021 11:11:04 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Andi Kleen <ak@linux.intel.com>
Cc: Erdem Aktas <erdemaktas@google.com>, Andy Lutomirski <luto@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YPaTKF0TPicll2FN@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
 <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>

On Mon, Jul 19, 2021 at 10:17:36PM -0700, Andi Kleen wrote:
> For non crash kexec it's fine to reaccept/validate memory because we don't
> care about the old contents anymore, except for the kernel itself and
> perhaps your stack/page tables. So something very simple is enough for that
> too.

I am not sure how it is implemented in TDX hardware, but for SNP the
guest _must_ _not_ double-validate or even double-invalidate memory.

What I sent here is actually v2 of my proposal, v1 had a much more lazy
approach like you are proposing here. But as I learned what can happen
is this:

	* Hypervisor maps GPA X to HPA A
	* Guest validates GPA X
	  Hardware enforces that HPA A always maps to GPA X
	* Hypervisor remaps GPA X to HPA B
	* Guest lazily re-validates GPA X
	  Hardware enforces that HPA B always maps to GPA X
	
The situation we have now is that host pages A and B are validated for
the same guest page, and the hypervisor can switch between them at will,
without the guest being able to notice it.

This can open various attack vectors from the hypervisor towards the
guest, like tricking the guest into a code-path where it accidentially
reveals its secrets.

For that reason the guest needs to know at any time whether a given page
has already been validated/accepted. And the guest needs to pass along
this fine-grained information even in the case of kexec/kdump.

> If the device filter is active it won't.

We are not going to pohibit dma_alloc_coherent() in SNP guests just
because we are too lazy to implement memory re-validation.

Regards,

	Joerg

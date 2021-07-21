Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F86173
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 08:51:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0EA81FE7F;
	Wed, 21 Jul 2021 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626857462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RgODuVW3AaV2E0f9UPQm0t7b6U8BHQyRuS3VzEAnXZ8=;
	b=FQSKW8knkTEp5/E1cgVIPc289sKfAUTSzNkE1RDQUVag449dya2FCrQ4WxTsEFPq3hbOup
	IlMThr1d7vBAcu43/0V08meLXkAHblcVJeJZ1+csntKarE4u5ZAUEiodSbud59QuoQNMoA
	c3T+BY1LHgezMA1UOpVS8RBnYtm7VDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626857462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RgODuVW3AaV2E0f9UPQm0t7b6U8BHQyRuS3VzEAnXZ8=;
	b=ZkIIlxCXNeGrRWdra/1UuYLRW4ht9H4gfYF8hhS317yaWIwzhSjRcG+DfZjWd72WGo5zje
	8iIhld61tRJIkuAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CABD13B36;
	Wed, 21 Jul 2021 08:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uzk9Cfbf92CVFgAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 21 Jul 2021 08:51:02 +0000
Date: Wed, 21 Jul 2021 10:51:00 +0200
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
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	the arch/x86 maintainers <x86@kernel.org>, linux-mm@kvack.org,
	linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YPff9IMQFC599N4+@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
 <eacb9c1f-2c61-4a7f-b5a3-7bf579e6cbf6@www.fastmail.com>
 <CAAYXXYzDheR6C19Q01w267CfgW6DnZ-Hurscm-=OVATwb4dy4Q@mail.gmail.com>
 <20210720220113.GA535804@tassilo.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720220113.GA535804@tassilo.jf.intel.com>

On Tue, Jul 20, 2021 at 03:01:13PM -0700, Andi Kleen wrote:
> On Tue, Jul 20, 2021 at 12:54:16PM -0700, Erdem Aktas wrote:
> > I did not see any #VE implementation to handle SEPT violations when a
> > page is in PENDING state. I am assuming that this needs to be
> > supported at some point (If not then we need to discuss the use cases
> > for such support).
> 
> We actually plan to disable those #VEs, to avoid any problems with
> the system call gap. Instead the plan is that the kernel will know
> in advance what memory has been accepted or not, and accept it before
> touching.

This confuses me a bit, what happens when the VMM is malicious and
re-maps an already accepted page and the TD tries to access it?

My thinking was that this causes a #VE, but what happens instead when
this #VE can be disabled?

Regards,

	Joerg

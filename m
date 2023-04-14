Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70464810
	for <linux-coco@lists.linux.dev>; Fri, 14 Apr 2023 09:01:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 548C71FD96;
	Fri, 14 Apr 2023 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681462858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0l/ikP83dDW4zv5edWPxEJ1eKwhsJ2wrFcqkhU3L7s=;
	b=kdi3c3xnsHaq/oyiGm/uY+4zZxFEIzz73Lr0ZO4OsoGsHkpiSEgVg1YDIsNvdmdZwgFIFW
	OhOgaPj7JNyMMZi3poKpsLSe+CFxxIQL4a/s8Sny121kgvZaeEQwRBRF84uF3P15E2kbkg
	VWb3agMX8vRpfGE415phDg0z3GUeOlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681462858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0l/ikP83dDW4zv5edWPxEJ1eKwhsJ2wrFcqkhU3L7s=;
	b=11wifBI70zLYrE9G+aakhlzMH65NOLX0K5aT2BsjOueRqbw5aZPLfbyi85mtYm1VjbZu9f
	/3a8qohpSgybjUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 236D913498;
	Fri, 14 Apr 2023 09:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2hqtBkoWOWQzewAAMHmgww
	(envelope-from <jroedel@suse.de>); Fri, 14 Apr 2023 09:00:58 +0000
Date: Fri, 14 Apr 2023 11:00:56 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, amd-sev-snp@lists.suse.com,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZDkWSMUNiJ7BfoCo@suse.de>
References: <ZBl4592947wC7WKI@suse.de>
 <bf7f82ab-3cd3-a5f6-74ec-270d3ca6c766@amd.com>
 <5ab2bca5dab750cce82df5e28db5ebb8f657e3ed.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ab2bca5dab750cce82df5e28db5ebb8f657e3ed.camel@linux.ibm.com>

Hi James,

On Thu, Apr 13, 2023 at 12:57:38PM -0400, James Bottomley wrote:
> We (IBM) did look at what it might take to add a vTPM to Coconut, but
> we ran into the problem that if we do it at CPL3 (which looks
> desirable), then we have to wait until pretty much every one of the
> twelve(!) tasks in this list is complete:
> 
> https://github.com/coconut-svsm/svsm/issues/16

Thanks for looking into the code-base. Our approach to getting CPL-3
support is incremental. We can take some shortcuts where possible, as
long as the foundations and the underlying design is right, to get code
running at CPL-3 at some point in 2H/2023.

Looking at the points listed in the issue above, some of them are ready
or almost ready (just not included in the main branch yet):

	* "Archive file in SVSM binary" is implemented
	* "Page allocator enhancements for reference counting pages" is
	  implemented
	* "ELF loader" is implemented, there is a pending PR for it.

The "RAM file system support" is currently being worked on. All of the
listed points probably don't have a 'complete' state, I think we start
with something very simple and improve from that later as needed.

A primary example is the syscall interface, that will certainly evolve
over time as people come along with their own ideas for other modules.

The rough plan moving forward is:

	* Get RAM FS ready
	* Implement a task and address space abstraction which allows
	  to map RAM FS file contents for CPL-3
	* Task switch and sycall entry/exit
	* Example binary to run for initial tests (that will probably be
	  worked on in parallel)

When that is done we can look into how to get a vTPM into a binary and
improve the underlying interface as required.

Of course progress will be faster with more helping hands :-)

There are also a lot of places that don't have a final design yet where
help and discussions are beneficial.

> At a conservative estimate, it looks like completion of all twelve
> would take a team of people over a year to achieve.  Some of these
> tasks, like task switching and a syscall interface, really don't look
> like they belong in a simple service module, like we were imagining an
> SVSM would operate, is there some rationale behind this (or ideally
> some architecture document that gives the justifications)?  I think
> what I'm really asking is can we get to CPL3 separation way sooner than
> completion of all these tasks?

We do not imaging the SVSM to be simple and small, we are imagining it
to be secure and extensible. Of course it will always be smaller than a
full-blown OS, but the vision is that it can do more than running a vTPM
emulation. Also when we start looking into paravisor-like features like
ReflectVC-handling later, the SVSM will certainly not be simple anymore.

When I talked to people about the SVSM I often heard other interesting
ideas what services it can provide. To make this possible and secure the
SVSM needs the ability to run multiple modules at CPL-3. And a task
concept with a simple FS to load those modules from is, in my opinion,
the right approach.

Yes, it takes more time than simpler and less flexible approaches, but
as one of my favourite TV characters put it: "This is the Way" :-)

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman


Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7720E23AD
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 09:15:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C629B20BC0;
	Wed, 22 Mar 2023 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679476535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vuU+MK/FXn7xoP85DKc8ga2FJYBFyrgSQWP5NJEOjzY=;
	b=Xs4g3HJct5fFdEtInUjujKraPbPkqUfMHIW/BZV2v5giS90uLFVvWL8Jnu4AeT04+Enxsr
	KRL4xkyT1tUbOA+Xwg8hKMZXEGn1q3JjCWMHdXm/pa7R0Mj3/N6WZ92CjP2gxg0vrMWmjB
	LAtSV9BlRBNjxWuJ8LFVLbdcgK6S1C4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679476535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vuU+MK/FXn7xoP85DKc8ga2FJYBFyrgSQWP5NJEOjzY=;
	b=+ZB4+lyg+AJX13pysOQXNipJB3NVF99+K2JMxLps+Mrc3a9GJtBg+fMhCCDk6HHGIhbjp8
	Bgf6ZlNBgL/MuZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D47B13416;
	Wed, 22 Mar 2023 09:15:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SPPoJDfHGmT/XQAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 22 Mar 2023 09:15:35 +0000
Date: Wed, 22 Mar 2023 10:15:33 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBrHNW4//aA/ToEl@suse.de>
References: <ZBl4592947wC7WKI@suse.de>
 <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
 <ZBmmjlNdBwVju6ib@suse.de>
 <c2e8af835723c453adaba4b66db533a158076bbf.camel@linux.ibm.com>
 <ZBnJ6ZCuQJTVMM8h@suse.de>
 <7d615af4c6a9e5eeb0337d98c9e9ddca6d2cbdef.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d615af4c6a9e5eeb0337d98c9e9ddca6d2cbdef.camel@linux.ibm.com>

On Tue, Mar 21, 2023 at 04:05:35PM -0400, James Bottomley wrote:
> OK, so this doesn't sound like a problem with the AMD svsm, it sounds
> like a (solvable) issue with a particular crate in embedded rust.  I
> have to say that embedded rust is so new, it's really hard to tell if
> this is just because it was developed by someone who didn't think of
> all the OS implications or because it's a fundamental issue within the
> rust ecosystem.  Have you tried improving this crate? ... and also it's
> a nuisance we came to with our insistence on using rust; it certainly
> wouldn't have been an issue in C.  I suspect improving the crate would
> help everyone (although I note the linux kernel isn't yet using this
> crate either).

We did not consider to work on the x86-64 crate for now, that would open
a new can of worms and would have delayed the project even further. I
agree that the crate would benefit from that, but targeting questions
like how to introduce new functionality while keeping it compatible to
other users is a project on its own.

COCONUT is now in a state where it has its own page-table and IDT/entry
code implementations which fit its needs and can be quickly adapted as
we move forward. When the dust settles we can re-visit that question and
start contributing back to this crate and possibly adopt it.

There is actually one thing from the crate I would like to have in
COCONUT too, which is the abstraction for VirtAddr and PhysAddr. COCONUT
just defines those as usize, which is rather limited and leads to ugly
code here and there.

> That's entirely possible, so what are the chances of combining the
> projects now so we don't get a split in community effort?

That is not on us to decide. I agree that a single effort is much
better, but at the same time I don't think that porting upstream code
between both implementations is worthwile (things are different with the
work that is currently happening on-top of linux-svsm).

From a functionality pov both projects are mostly on par in their
upstream branches. COCONUT is lacking one piece or another, like it does
not work around the VMSA@2M-aligned erratum yet. On the other hand
COCONUT has a bigger code-base, implementing exception fixups and
bracktraces already.  Soon COCONUT will gain an ELF parser (and building
on that ASLR) to load the SVSM kernel as an ELF file from the stage2
loader. The ELF parser is needed anyway for ring-3 support, other
changes are also under development.

There is of course work building on linux-svsm out there, too. It would
be interesting to get an overview of that. We are already looking into
porting over the attestation code IBM wrote for linux-svsm (although we
would prefer IBM submitting it :) ). The vTPM code out there can not be
ported over as-is, as COCONUT will not link a whole TPM library in its
code-base. But maybe it can be the base for a separate vTPM binary run
by COCONUT.

In general, since both projects are written in Rust and the APIs are
small, it is not a big effort to port over changes for linux-svsm to
COCONUT.

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


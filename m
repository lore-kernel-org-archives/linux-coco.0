Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2031010F2
	for <linux-coco@lists.linux.dev>; Fri, 27 Jan 2023 08:35:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38FD821C8A;
	Fri, 27 Jan 2023 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674808508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMHCo2IaxjAOU2J2Ms9bWJiuH27PPjByclXzyRvq2ZM=;
	b=FXsc3AepgydnruLGFZBneTZvSVD0l2xlgTR01uW3qOqK2P/eHEPSWABB0LnTgHli6W7A0c
	mmtaRDVwmnIOjAVog7CWotzHY5LfOQTY8eSwSoa1L64t0O/5Jrtft2PSzmGu6y/SVdynd/
	jU7aEx6BeUBUhaIkqlx3xDT/aXVwfkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674808508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMHCo2IaxjAOU2J2Ms9bWJiuH27PPjByclXzyRvq2ZM=;
	b=6PspRe+8VCm/5IM0v+Yh65O7QpqclQQZX8FwX82DMrdmDR8c5UDklx9wqKOzEpNZ7wgjRV
	WOKDsWBWQnSOxuAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DF4A1336F;
	Fri, 27 Jan 2023 08:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Vy4BAryM02PdfgAAMHmgww
	(envelope-from <jroedel@suse.de>); Fri, 27 Jan 2023 08:35:08 +0000
Date: Fri, 27 Jan 2023 09:35:06 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Jon Lange <jlange@microsoft.com>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Message-ID: <Y9OMuuHz2utBASOm@suse.de>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de>
 <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>

Hi Jon,

On Thu, Jan 26, 2023 at 05:33:54PM +0000, Jon Lange wrote:
> One of the design goals of SVSM was to maximize the compatibility
> between all guest OSes and all SVSM implementations.  The idea that
> there are SVSM-specific protocols seems, in general, to be directly
> contradictory to this goal.  Why would it be desirable for a guest to
> have a conversation with its SVSM that is specific to the architecture
> of that SVSM?  I would think it far superior to define every sort of
> interaction as a generic contract that could be supported by every
> SVSM implementation to maximize compatibility in accordance with the
> stated goal.

I agree in general that the SVSM implementations need to be compatible in
their guest-side interface and that a guest should not need to care which
SVSM implementation it is running on.

But I see still a need for implementation specific commands, which will
allow the guest owner to get information about the SVSM and which could
help with debugging in case of problems. These commands are tied to the
architecture of the underlying SVSM implementation and can not be
generic.

For example, an SVSM implementation can have one or more log buffers, it
can have a trace buffer (or not). Another SVSM might even allow the guest
OS to change some configuration data. In that area I see a clear need
for implemenation specific commands.

It probably makes sense to specify them in a way which allows the guest
OS to have a generic char driver to send implemenation specific commands
to every SVSM. On the guest OS side per-SVSM user-space tools can be used
with that char device.

> Put another way, seeing any upstream implementation that provides
> functionality that is complete with SVSM A but which cannot be
> achieved with SVSM B should not be viewed as a desirable feature of
> the protocol.

Implementation specific commands can also be used as a playground to
experiment with features that later can become part of the standard.

> Attestation itself is a generic concept that should be applicable to
> every SVSM.  Why would anything related to attestation be implemented
> as specific to a single SVSM architecture?

I agree that things like attestation and vTPM must be part of the
generic protocol.

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


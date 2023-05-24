Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07D3BE7E
	for <linux-coco@lists.linux.dev>; Wed, 24 May 2023 10:49:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A17122175;
	Wed, 24 May 2023 10:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1684925371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I72T63NU2+6w0Tyt1L23fnk061BHiJxR1Ivrp6NxQBs=;
	b=E001a7kcR2sZ8jF6Cp6otwCoH4HS7dweAEfpgT00jWABLOCg5e+esaBPJuqhK9hSk09wFY
	xgCg4/M0mwtisj0cVeElANBUAzVt7hjEEWSDTTkLOZSUD8Hc+95yJUEw2hC+FxyfWD7ZHe
	edaqOKYz7VgWAmDPjj/z3TteUWFqU08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684925371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I72T63NU2+6w0Tyt1L23fnk061BHiJxR1Ivrp6NxQBs=;
	b=V5UHbrMrQXzH5248X0AIY3UtUe26yXI7538fWOzzfpA6LAemPdKEayfYxQo/+Cm1fQqKhp
	kIgHGsO7nYmieyDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07415133E6;
	Wed, 24 May 2023 10:49:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KIRRALvrbWTVLgAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 24 May 2023 10:49:31 +0000
Date: Wed, 24 May 2023 12:49:29 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev
Subject: Re: [RFD] COCONUT-SVSM project governance
Message-ID: <ZG3rubI1enwgiYpN@suse.de>
References: <ZFjL0oXu6NjYKCXl@suse.de>
 <53adca2d4e8287f2189c631be611c9c76ee1b708.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53adca2d4e8287f2189c631be611c9c76ee1b708.camel@linux.ibm.com>

On Thu, May 11, 2023 at 03:26:30PM -0400, Claudio Carvalho wrote:
> At least 3 maintainers looks good, but I think we will have a better answer once
> we know the number of maintainer candidates and their experience/interest.

Yeah, I also think that 3 is a good starting point. Having more probably
does not make sense before the community reaches a certain size or we
get to a sub-maintainer model.

> An option could be to have maintainer(s) per area. I have worked on the
> vtpm/attestation for the AMDESE/linux-svsm and I could help to maintain it (and
> other parts) in the coconut-svsm.

That definitly makes sense. There will likely also be effort to make
certain parts of the code more generic, so that the different parts are
easier to maintain.


> We may also want to discuss about release plan/model; e.g. the dynamics of new
> releases, how often they will happen and if there is any priority that we need
> to consider in the short term.

That are all interesting points. In my opinion it is too early to think
about doing a release. But we can discuss possible release models so
that we are ready when it actually happens.

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


Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8763D63
	for <linux-coco@lists.linux.dev>; Wed, 24 May 2023 10:39:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D85BC2184F;
	Wed, 24 May 2023 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1684924743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIZOjHy34Pa3aKJjPE1x+kaQAyEQhGMM/I45dR2QCrA=;
	b=dVu2W9A8ON8JyVnLKjBuGJv6SV8EEg+HxSSFXIMOMzGtJ05kGk9Pn8wRBd+6dBKnkIkGDt
	1XpSnZsw84YzjSa0J9SYiRaIpMw8Sn0yxjsBaTADJQlqrFJjUncxPcAsBISCKhilvq1cCA
	EPzc78PCjnm57wQoxiOkcXIniaNLULk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684924743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIZOjHy34Pa3aKJjPE1x+kaQAyEQhGMM/I45dR2QCrA=;
	b=ETzkhO8i8atkPAz/8Snt2EX5SoggaDccax5hMSKza+1Lo4p/ibNRBuKHHzk+vaqGW0IIbr
	7BG+MV8zgCI/Q5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5599133E6;
	Wed, 24 May 2023 10:39:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id C7PfKkfpbWQTKQAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 24 May 2023 10:39:03 +0000
Date: Wed, 24 May 2023 12:39:02 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev
Subject: Re: [RFD] COCONUT-SVSM project governance
Message-ID: <ZG3pRhRPTXl1FkGG@suse.de>
References: <ZFjL0oXu6NjYKCXl@suse.de>
 <CAAH4kHYpyeu-UFBYL5mXnS0xQh_rD039FgMz=Qfa=ruCUsVL_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAH4kHYpyeu-UFBYL5mXnS0xQh_rD039FgMz=Qfa=ruCUsVL_A@mail.gmail.com>

Hi Dionna,

On Mon, May 08, 2023 at 09:28:40AM -0700, Dionna Amalie Glaze wrote:
> I'm in favor of governance models that strongly value transparency,
> good-faith disagreement, and a set of community guidelines that both
> has enforcement power and accountability of all parties involved.

Thanks for your input, I completly agree with that baseline. One thing
to keep in mind is that any processes and rules we potentially put in
place are aligned with the size of the community. Really large
communities like for Rust or K8s certainly need different governance
than ours.

> 3 is a minimum I think, with at least 2 entities represented.

Right, we need to make sure different entities are represented.

> I think the sigstore.dev project does a good job of running regular
> community meetings and publishing meeting notes to allow for regular
> collaboration across institutions.
> I don't think we need to set that up until there's a good reason to
> take a discussion off the mailing list for higher bandwidth
> communication, since who needs more low value meetings?
> 
> [1] https://github.com/ossf/scorecard
> [2] Robert's Rules of Order
> [3] https://www.redhat.com/en/blog/understanding-open-source-governance-models
> [4] https://www.youtube.com/watch?v=m0rakUuPXFM

Thanks, that is a lot of good input. I think in general we need to find
a balance between the needed bureaucracy to ensure fairness and
inclusiveness on one side, and being able to stay productive and make
decissions as needed on the other. That balance might shift with the
size of the community, of course.

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


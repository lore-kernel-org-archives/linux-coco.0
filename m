Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5CC6FA3
	for <linux-coco@lists.linux.dev>; Mon, 16 Jan 2023 16:55:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EFEEA339A8;
	Mon, 16 Jan 2023 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673888153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYmbDch77SIAoPKJpmKnD10RwGprELyA0QQKbyH/6uk=;
	b=zD507BKGmcGZtd/wDZdGoOA+CCInb1Cy0twtEYigqfNTULXkDnEVhDXfqpPcTFo6uBFMjc
	nNnZsDNvXsaVDkHHaaF/MldEUmanNbJxnCHIiIVHDd7DS6nEASiYoi8067e1ciRmEnodwa
	1E6h8P8UTINexInnZQ+RgBIaJEjeQKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673888153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYmbDch77SIAoPKJpmKnD10RwGprELyA0QQKbyH/6uk=;
	b=NIW4274JyEfY01OT6pw8D1563iZoy2cGbGGxYAyZZAwmllHnl1U4N4aWPX0mIUW3w8/56L
	/K9i7N/7BtzjuKAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C62F1138FA;
	Mon, 16 Jan 2023 16:55:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id c6vaLpmBxWOdPQAAMHmgww
	(envelope-from <jroedel@suse.de>); Mon, 16 Jan 2023 16:55:53 +0000
Date: Mon, 16 Jan 2023 17:55:52 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8WBmNVD8DuRQuC2@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <Y8Gi0KLj5JbhCqBE@redhat.com>
 <Y8Lhd/H4yGTsOM/+@suse.de>
 <45342f9ca1170817b2f741b35a5b0b2c85dc72c6.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45342f9ca1170817b2f741b35a5b0b2c85dc72c6.camel@linux.ibm.com>

On Sat, Jan 14, 2023 at 01:22:41PM -0500, James Bottomley wrote:
> On Sat, 2023-01-14 at 18:08 +0100, Jörg Rödel wrote:
> 
> [...]
> > As James also said, the measurement to unlock secrets need to include
> > all software/data components up to the point where the encrypted disk
> > gets mounted.
> 
> Well, we have a prototype in IBM Research using keylime to do this
> based on the vTPM measurements.  We currently bring up a network
> interface inside the initrd to run the keylime agent, but if you're
> already inventing a non-network method for attestation, there's no
> reason we couldn't transport TPM quotes over it as well.

So you are unlocking the disk via keylime remote attestation. This means
you need a measured initrd, right?

We were thinking about doing disk-unlocking via TPM in Grub, but that
has the problem that we need to securely deploy the TPM state at SVSM
init-time.

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


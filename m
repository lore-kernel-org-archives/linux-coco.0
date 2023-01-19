Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFCF3D6E
	for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 21:18:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEBD2218B8;
	Thu, 19 Jan 2023 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674163126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ato31DoHh5qdfHEJbF25PbR7HJIP2rLDvbdv7/fpP3c=;
	b=abp73jvrYF2YEPTNxDlRqtNuGfgfQPpfpAnjZrvOuioX3XqaBllGtH+aN9W7vfv07olawd
	kKqYSA6yjh/76RUj3XMpdgpiafJukpOkFlfsRRxWoPhFPSs3pGaUStKG4W2vvGHzHFgbNH
	WiMrSqghlkIrDM2lvTihtsI9HCJppKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674163126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ato31DoHh5qdfHEJbF25PbR7HJIP2rLDvbdv7/fpP3c=;
	b=d74yVZjFo2CWBPPsF83eBM9uLJyqpxThu8waclL+mtA9kLxs6omJZodivV5pEYHThDMZBA
	ICnZmXfQxecBI6CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82C57139ED;
	Thu, 19 Jan 2023 21:18:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yz6WHrazyWP/bgAAMHmgww
	(envelope-from <jroedel@suse.de>); Thu, 19 Jan 2023 21:18:46 +0000
Date: Thu, 19 Jan 2023 22:18:45 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
	=?iso-8859-1?Q?=22Daniel_P=2E_Berrang=E9=22?= <berrange@redhat.com>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8mztTGpZbWi89sn@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>

On Thu, Jan 19, 2023 at 09:10:48AM -0500, James Bottomley wrote:
> Yes, you have to think about this.  Possessing the secrets is the
> problem if you don't trust what you've mounted, so in the original
> prototype the secrets got destroyed if they weren't used (as in you
> couldn't crypto mount the disk), so you can fallback to a potentially
> untrusted disk if you can ensure the secrets can't be leaked.  I
> suppose secret destruction and fallback should be a configurable policy
> of the system instead of hard coded as I did in the initial prototype.

Is this still an issue in the SVSM version of this? The secrets will
stay in SVSM memory at VMPL0 and the higher VMPLs will not be able to
access them until they proved that only trusted software was loaded.

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


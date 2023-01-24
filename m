Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D78010E9
	for <linux-coco@lists.linux.dev>; Tue, 24 Jan 2023 09:45:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90F80219FC;
	Tue, 24 Jan 2023 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674553515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHHvbPD7gCv1uCYHPdeYfbgN5lb+j5iuGvlY4zyUq6Y=;
	b=aVueUt9npuaVyMv4r9vFnJb0bIFA4pMiQrRCX+H20BDWpMTfhTl7AspzDltLkyRKu6C6DF
	SZTtCkY9ZI9HQzaAAlHoT3nm09bFc1IdTq/TQhef3til0fUOSuG0vGv3SsaG6WQe+awy1D
	BHp6SJCsuK3Oy5cvlOK8bBp9bicKAj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674553515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHHvbPD7gCv1uCYHPdeYfbgN5lb+j5iuGvlY4zyUq6Y=;
	b=/oSeDBtIMR4K6cA9Kc7wE6yiv2gwjaW+yC6JEVrq9bxu6oXRqv72ftHAcUI5y3wdv3hvwD
	VqyD/QRqzAy+GcBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E63F139FB;
	Tue, 24 Jan 2023 09:45:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id l32HGauoz2NiXAAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 24 Jan 2023 09:45:15 +0000
Date: Tue, 24 Jan 2023 10:45:14 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Message-ID: <Y8+oqoU2jZYrNlz1@suse.de>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>

On Tue, Jan 10, 2023 at 12:54:27PM -0600, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with added
> support for an attestation protocol and a vTPM protocol as well as other
> miscellaneous changes (all identified by change bar). Please take a look and
> reply with any feedback you may have.

Another addition I'd like to propose:

It would be nice to have a protocol number reserved for implementation
specific requests. The protocol number only defines one standardized
request to identify the specific SVSM implemenation in use. Other
requests are implementation specific and can be used to manage the SVSM
from the guest.

One use-case would be, for example, to read the SVSM log buffer from the
guest side, but depending on the implementation there could be more
requests defined.

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


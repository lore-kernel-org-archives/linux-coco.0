Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA010E9
	for <linux-coco@lists.linux.dev>; Tue, 24 Jan 2023 09:35:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA0B1219EC;
	Tue, 24 Jan 2023 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674552951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SdxtwLNdyMTKUQRBNrerz9hnYMIgu77jvAErM6JRTRs=;
	b=HY4L9BalZ8m1avcRoIGhKO1LC+utj9QV+gJXHRBVHEPUv1WRmB3oU2RUiwK3zXr/Ky2ZSG
	xvGwZ7PPrOCHwgEie90agPzzxzbbo3hiomPYUFL30LpbmubmREW04DXZrCueeTuP0S2QcS
	LkxZ8Wdu7/zXiTUdOpMvggSnvsUHLfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674552951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SdxtwLNdyMTKUQRBNrerz9hnYMIgu77jvAErM6JRTRs=;
	b=DOXl760Yyrenu1RTCKyxlmaeuw3KzsBLNozqn39GXxK6qw87sZcW0AqoZpqxmsqkM9t6Ns
	wGmYV7KtNv8lTqDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86FA2139FB;
	Tue, 24 Jan 2023 09:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aJpoH3emz2MIVwAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 24 Jan 2023 09:35:51 +0000
Date: Tue, 24 Jan 2023 10:35:50 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Message-ID: <Y8+mdnCrn7sNCcMt@suse.de>
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

Hi,

On Tue, Jan 10, 2023 at 12:54:27PM -0600, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with added
> support for an attestation protocol and a vTPM protocol as well as other
> miscellaneous changes (all identified by change bar). Please take a look and
> reply with any feedback you may have.

Thanks for putting this together, Tom! I think the review comments
which have been posted cover a good amount of improvements, but I'd like
to propose another addition:

It would be great if we have an equivalent to EBUSY in the return codes
to the guest. Something like SVSM_ERR_BUSY or SVSM_ERR_AGAIN, which
tells the guest that some resources needed to fulfill the request are
currently in-use and that the guest should try again later.

The reasoning here is that in a setup with multiple VCPUs one CPU does a
call to the SVSM which can take some time to complete (e.g. asking vTPM
to generate an RSA key) and then another VCPU comes along with a second
request to the vTPM. In that case the SVSM would have to busy-wait until
the other request is finished. I think it would be better to return to
the guest in this situation and try again later.

Thoughts?

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


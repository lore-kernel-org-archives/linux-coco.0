Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22098F5C
	for <linux-coco@lists.linux.dev>; Tue, 22 Aug 2023 08:31:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA7C422C47;
	Tue, 22 Aug 2023 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692693111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XmI28UMS7MhiKdOHU6vDRkfhX0mWsp2euCuO+zRtcMY=;
	b=uUE/suRFS2UMK0z5ujJV2PXShDl9MR9EMobWtVazGxpHnKbYnGv6OxXvvDCI4CpgW8DwH7
	ObBJestXjN/M6PyyW8MfS9WNEsy8H9h6bTk0ssWiMH+l8oTsaDYgq/Rrdz+UVhPhKcSkN8
	NHD4vKP/NSiJRiNWAg/8ujs5gP3zn3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692693111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XmI28UMS7MhiKdOHU6vDRkfhX0mWsp2euCuO+zRtcMY=;
	b=fMTZCQspP074MmegXlMmmph7EFiLXswyRsVaeP5BYoZP6ZW0lxEcQFrwnrSpUdmQg1EQ2H
	bM83+32syIOQwgAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B54C0132B9;
	Tue, 22 Aug 2023 08:31:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AqgVK3dy5GSlbQAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 22 Aug 2023 08:31:51 +0000
Date: Tue, 22 Aug 2023 10:31:50 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev
Subject: [ANNOUNCE] SVSM development mailing list
Message-ID: <ZORyduBLCO-QEJKE@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I'd to invite everyone interested in the development of
Coconut-SVSM to join the newly created svsm-devel mailing list. The list
address is

	svsm-devel@coconut-svsm.dev

It is hosted by mailman, the link to subscribe is

	https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel

The list will be used as an addition to GitHub for discussions on the
further development of the Coconut-SVSM project.

The archives are public, so please do not post any confidential or NDA
content to this list.

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


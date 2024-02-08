Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AF7CF02
	for <linux-coco@lists.linux.dev>; Thu,  8 Feb 2024 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707398074; cv=none; b=BAHy/VHPpo7T05EUhiOOtlcfJLFY/AlCz25HQoL0O62yP+9VfYuDYT8UsMAb8cx4E889YK3d41JUU9A6EaWcUj/yR8ffYyRJJrwQCz8QfR0GC9slN/pxquJ9njIbv0L94Pv19d3P1sNpm15BV/b+54dMptEEF/M9hl8FkSGa1Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707398074; c=relaxed/simple;
	bh=qc/QUzIAoXnycO+wmMn25Ign0tl0oChS1W2GTrGq/h4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q/Rxt4NQnpFveyVvoihbbxxltxOPI/Yj2pq5O2pbGA0DYL1N9CeJW0NUPVo2o6cNc69AZIVElJu7Q7jsCecj2PH7R1A2SdnLPvEjT/pTz4++UM9PQNi1NaEVuV2SpjT3xZF1BBwPNYZcwGJ1fInRUqYTIdgRTG1MbyjqJptShS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ot7wGwM5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cR/o8+6n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ot7wGwM5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cR/o8+6n; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ot7wGwM5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cR/o8+6n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ot7wGwM5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cR/o8+6n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE8A51FCEB;
	Thu,  8 Feb 2024 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707398070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
	b=ot7wGwM5im6UmDmLStnbTOk45XAOIJWsLEHEp6yNSP2HZ78oDwUarYP9Y+Z1H60+RhsRsT
	QzVyZW8D8gtTC6INGp72r4htlih49zAII//QfJMlCwyo8XZOsPPnJ/dB6Yp0SGcl7tiUJJ
	wFNa74esG4b7q9W3uwGUJn9XW4Ag8YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707398070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
	b=cR/o8+6nAQeyWFmOiLZACP5j9JCvuW5V2DRmB67W6Op8Irv/aGP9onv97BXAZ0CyRHICir
	mJQSwKqR4sDqB2Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707398070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
	b=ot7wGwM5im6UmDmLStnbTOk45XAOIJWsLEHEp6yNSP2HZ78oDwUarYP9Y+Z1H60+RhsRsT
	QzVyZW8D8gtTC6INGp72r4htlih49zAII//QfJMlCwyo8XZOsPPnJ/dB6Yp0SGcl7tiUJJ
	wFNa74esG4b7q9W3uwGUJn9XW4Ag8YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707398070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
	b=cR/o8+6nAQeyWFmOiLZACP5j9JCvuW5V2DRmB67W6Op8Irv/aGP9onv97BXAZ0CyRHICir
	mJQSwKqR4sDqB2Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA48F13984;
	Thu,  8 Feb 2024 13:14:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XE6oJ7bTxGXAUgAAD6G6ig
	(envelope-from <jroedel@suse.de>); Thu, 08 Feb 2024 13:14:30 +0000
Date: Thu, 8 Feb 2024 14:14:25 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM now uses cargo workspace
Message-ID: <ZcTTsZ156ghln73W@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.05
X-Spamd-Result: default: False [-0.05 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.00)[33.40%];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-0.999];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWO(0.00)[2];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(1.25)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

Hi,

I spent the morning getting the transition of the COCONUT-SVSM
repository to a cargo workspace merged. There were a couple of issues to
fix, but everything should be working now. Please report any issues in
case you find them.

Also, in case you are using the pre-commit git-hook you need to install
the latest version from the main branch. This one has some updates to
correctly run all checks in the new environment.

As discussed in the SVSM development calls, I also updated the
repository to reflect the change of the project license from
MIT-OR-Apache-2.0 to MIT.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276A168C5
	for <linux-coco@lists.linux.dev>; Mon,  8 May 2023 10:15:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5620321F43;
	Mon,  8 May 2023 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683540948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B5oLYt8SftUK7hiZmk8lfqoPzMqEHi6acBDL9363v2c=;
	b=jEwIZMjYT2HPbYixDdwaJXb2KNz+SdgH2fC8r8UOFPZrsMs29pIh+Xdmex21FY3xZ+G3+e
	Ra1h4u5/P2GLWhHn626GD6ruY6CSLEr9JUW5tfI/4GBZ95DhIZENGVhxeJWeaBr/p4tKHZ
	DB+vy4Dg7NchMqN2U6nHDq8kBt7oUuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683540948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B5oLYt8SftUK7hiZmk8lfqoPzMqEHi6acBDL9363v2c=;
	b=sgvCp+K3N1WTpwtsA9FLiKzNCKhvyfjg81Jva4OCxvJMlgyDtgnZ6wIoJOom4LKMSz0qr7
	myUBk+1IwY0bTjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31D8613499;
	Mon,  8 May 2023 10:15:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id p/DWCdTLWGSfCAAAMHmgww
	(envelope-from <jroedel@suse.de>); Mon, 08 May 2023 10:15:48 +0000
Date: Mon, 8 May 2023 12:15:46 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: amd-sev-snp@lists.suse.com
Cc: linux-coco@lists.linux.dev
Subject: [RFD] COCONUT-SVSM project governance
Message-ID: <ZFjL0oXu6NjYKCXl@suse.de>
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

As discussed before[1] I'd like to start a discussion about the future
governance of COCONUT-SVSM. Bottom line is that the project should move
from a single-maintainer, SUSE-driven project to a multi-maintainer
model driven by the community.

[1] https://lore.kernel.org/linux-coco/ZFJTDtMK0QqXK5+E@suse.de/

Some of the things to discuss:

	* How many maintainers? (3 or more?)

	* How to select them (by contributions and trust in the
	  community? elections? If elections, who can vote?)

	* Regular changes to the maintainer group?

	* How the group makes decisions on merging contributions and
	  the general direction of the project.

And certainly more questions which I have not yet thought of. So I'd
like to invite everyone to share their thoughts and opinions in this
thread so that we can develop a way to an open project governance :)

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


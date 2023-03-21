Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1857A79C7
	for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 09:29:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 497F31FD6A;
	Tue, 21 Mar 2023 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679390953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yoH04eWd5UxBhyOEYXUi9WaWEaBHDCNrGzWfCwchho8=;
	b=PMQGdG37ZFLuEhF5jkbBRnnoEoRwkzwd8PruvgRKKfb5DjgSiaEkV/UVAh2Ke01gCDAaQj
	oz/Qip0ds6CsCkaDfEh38ElsZqJzMkbxPa03XAmxih0+DZUYNVKZ9Msuimy5lFgRg7nfKe
	D0jQgGKSz0CD8RT46xVroZR5m8PGwb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679390953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yoH04eWd5UxBhyOEYXUi9WaWEaBHDCNrGzWfCwchho8=;
	b=KzYHp93Aj+DzS18wxTw5XXU4A+yLat97c2d2K306qrphexYVjEpsxajB9g+HnFq6wGO/4h
	5tzqXQm0fqhkIJBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24B2113451;
	Tue, 21 Mar 2023 09:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MwiDB+l4GWTDCwAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 21 Mar 2023 09:29:13 +0000
Date: Tue, 21 Mar 2023 10:29:11 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBl4592947wC7WKI@suse.de>
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

We are happy to announce that last week our secure VM service module
(SVSM) went public on GitHub for everyone to try it out and participate
in its further development. It is dual-licensed under the MIT and
APACHE-2.0 licenses.

The project is written in Rust and can be cloned from:

	https://github.com/coconut-svsm/svsm

There are also repositories in the github project with the Linux host and
guest, EDK2 and QEMU changes needed to run the SVSM and boot up a full
Linux guest.

The SVSM repository contains an installation guide in the INSTALL.md
file and contributor hints in CONTRIBUTING.md.

A blog entry with more details is here:

	https://www.suse.com/c/suse-open-sources-secure-vm-service-module-for-confidential-computing/

We also thank AMD for implementing and providing the necessary changes
to Linux and EDK2 to make an SVSM possible.

Have a lot of fun!

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman


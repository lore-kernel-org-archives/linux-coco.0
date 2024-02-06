Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010971AB7E2
	for <linux-coco@lists.linux.dev>; Tue,  6 Feb 2024 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707236957; cv=none; b=lP4PQSPhFmYueBaKXviXqbcw3l88f/+cTipJcgqWif34QjZusfAAPqeN6yGLWL75zKk/Lzd3cjD6RAOAnNFuu24AicL2E6ucT1EJoAqGZhtquR+Isa7tAy7bRZJ5UQzB6ut7gRsjgfyitoDqSizbUah6s0LjJnTi3wlvHouPtRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707236957; c=relaxed/simple;
	bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=joTxWn7hgcGlcW428Q+91Z685z1Nh6RUKQr/b3Z23haXpeviwd8assRRKufMbjl23apClEbFnJOajZ1zouB3I3pTu1V7mdfbpdjf3chpF18x0KuvZ8qUcxGp4jvCzSyItRW1nyysG+g4yfUudlnZrFgzBSofDdFDdTJMRUQa0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tjWoCJa4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sBc929Wt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tjWoCJa4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sBc929Wt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tjWoCJa4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sBc929Wt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tjWoCJa4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sBc929Wt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 17F5C1FB75;
	Tue,  6 Feb 2024 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707236954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
	b=tjWoCJa42WiaEtlG5rBVf16JiQ8zvyriWzHAuvUWh1pHsdhhWLdnqKhwCp7nkD4/1OIZKm
	bCx5m6QhcpgJXpgZLMWAwlUppcWVqbu8WzB/5m0y7O4CWObhpX8OtELMdgoWSzgOuGcLBx
	SR547VTDuPmCQjDdqiqZqYZPmiJZ+h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707236954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
	b=sBc929WthFJ5xO4U75hihDUa/FzlpL3ZvEHkbf7dq5O2z23LoWvhkdEjLI97NrPU72YeEi
	Ax2eFnoWdgXcvUAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707236954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
	b=tjWoCJa42WiaEtlG5rBVf16JiQ8zvyriWzHAuvUWh1pHsdhhWLdnqKhwCp7nkD4/1OIZKm
	bCx5m6QhcpgJXpgZLMWAwlUppcWVqbu8WzB/5m0y7O4CWObhpX8OtELMdgoWSzgOuGcLBx
	SR547VTDuPmCQjDdqiqZqYZPmiJZ+h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707236954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
	b=sBc929WthFJ5xO4U75hihDUa/FzlpL3ZvEHkbf7dq5O2z23LoWvhkdEjLI97NrPU72YeEi
	Ax2eFnoWdgXcvUAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB56F139D8;
	Tue,  6 Feb 2024 16:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jdhwL1lewmV9cwAAD6G6ig
	(envelope-from <jroedel@suse.de>); Tue, 06 Feb 2024 16:29:13 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: SVSM Development Call Feb. 7th, 2024 (and Cargo workspace transition)
Message-Id: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
Date: Tue, 6 Feb 2024 17:29:02 +0100
To: svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
X-Mailer: Apple Mail (2.3774.400.31)
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.23 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 MV_CASE(0.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWO(0.00)[2];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.83)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: *
X-Spam-Score: 1.23
X-Spam-Flag: NO

Hi,

As some of you already noticed there is a PR now which transforms the =
SVSM repository into a cargo workspace.=20

I consider the move to a cargo workspace an important change which =
should better happen sooner than later, but it is also very intrusive, =
basically breaking any other pending PR.

So there are two possible strategies right now:

1) Merge the cargo workspace PR and let everyone else rebase their work =
on-top. That is work for everyone, but should not cause major hickups as =
only file paths will change and not the actual file content
2) Merge some of the pending PRs first and then do the cargo workspace =
transition. This requires re-basing the cargo workspace PR, which is =
also quite some work.

I am leaning towards option 1) as I think the sooner the transition is =
done the better, but I am open to other opinions on this. So if you =
think option 1) will not work/causes too much hassle or we should do =
something different, please speak up. Merging PRs is stopped until there =
is a decision on this, which I hope will be made after the SVSM =
Development call tomorrow.

The call is happing as usual tomorrow at 9am PST/5pm UTC/6pm CET.

You are all invited to join the discussion at:

https://meet.google.com/ppv-xehx-dvb

Please also let me know of any additional agenda items you want to =
discuss, either by replying to this email or raising them in the =
meeting.

A public Google calendar is available here:

=
https://calendar.google.com/calendar/u/0?cid=3DY181NWEzOGYzNDYwYzYzODc2MmE=
3NWQ0ZmQ2ZWRhM2IxY2Y0NTVlYzRjZmQ3ZjgzMjAxZTNjYmY4MTdiNDIwZGQ4QGdyb3VwLmNhb=
GVuZGFyLmdvb2dsZS5jb20

Looking forward to see you all there and discuss the above topics!

Regards,

J=C3=B6rg R=C3=B6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=C3=9Fe 146
90461 N=C3=BCrnberg
Germany
https://www.suse.com/

Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)


Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEC1DFCD
	for <linux-coco@lists.linux.dev>; Wed, 17 Jan 2024 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705495702; cv=none; b=mx5hNtPrDkZMrYqLtGgeEYOXvdZ8crFoJqmP3J3Dj5KZi/CAFUC+hozsyYiIKxyVRbY1Gr+f9qLRJEhsBiKd+Ok8AVmbt4xGmymHyT+qAPu6Bz5F4hZc55AWiKyhriOT6O4fjVsck872F41wyX7dvdDAJ38U8ZOt/DIFzo+Zoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705495702; c=relaxed/simple;
	bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
	h=Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:Content-Type:
	 Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:To:
	 X-Mailer:X-Spam-Level:X-Spam-Score:X-Spamd-Result:X-Spam-Flag; b=WH8rE108ncTZejOGiyGTU+O1AfrIVwxHmeQ9fPs2H/5u64HETuWxsi6YWPvTFzr7rN863Jvsl8TB2Dt2wLZKZ5pru2Ga4tfxFZJxdD8cgFstkyrgKzC4Gh0s0h6PZWYesDU+brnDJ0WMhru6hq4y8Uj9Xo7oAmkJgAbLe0n6Z5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LBm9dpd2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eHhNo3Q+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LBm9dpd2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eHhNo3Q+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LBm9dpd2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eHhNo3Q+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LBm9dpd2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eHhNo3Q+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F2C821F28;
	Wed, 17 Jan 2024 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705495698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
	b=LBm9dpd2pFpjPzjYp+VLCRug7Jva+qnRaDLK1LNkWtf+nhYcILmQuMadSKfTXCy+gONUlg
	DXKMcIQMxcL/xxrx27iM3W69osagz8ryrAdxvB0VUjFZt3JoaFCuHUpmIw/nhn09fNzJFA
	4wq0seJ6oIEYxNlIbR1DVXJqviEQlb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705495698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
	b=eHhNo3Q+iNyCsKw95YCJZCZPg5BgwSZJhI2/3RI8AgoCMmTwl9IKXiLhbt/6fpaAqDt2Zg
	lInSgozNz1ZOB7Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705495698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
	b=LBm9dpd2pFpjPzjYp+VLCRug7Jva+qnRaDLK1LNkWtf+nhYcILmQuMadSKfTXCy+gONUlg
	DXKMcIQMxcL/xxrx27iM3W69osagz8ryrAdxvB0VUjFZt3JoaFCuHUpmIw/nhn09fNzJFA
	4wq0seJ6oIEYxNlIbR1DVXJqviEQlb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705495698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
	b=eHhNo3Q+iNyCsKw95YCJZCZPg5BgwSZJhI2/3RI8AgoCMmTwl9IKXiLhbt/6fpaAqDt2Zg
	lInSgozNz1ZOB7Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 775F713800;
	Wed, 17 Jan 2024 12:48:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T7SzG5LMp2VmXwAAD6G6ig
	(envelope-from <jroedel@suse.de>); Wed, 17 Jan 2024 12:48:18 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: SVSM Development Call Jan 17th, 2024
Message-Id: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de>
Date: Wed, 17 Jan 2024 13:48:07 +0100
To: svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
X-Mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.26)[73.48%];
	 FROM_HAS_DN(0.00)[];
	 MV_CASE(0.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.19)[-0.973];
	 RCPT_COUNT_TWO(0.00)[2];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(1.25)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

Hi all,

Just a reminder for todays SVSM Development call at 9am PST/6pm CET.

If you have any agenda items you want to see covered, please let me =
know. Otherwise we will just do the usual rounds of updates and Q&A.

We meet as usual at https://meet.google.com/ppv-xehx-dvb

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


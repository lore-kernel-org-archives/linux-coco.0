Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E417C8B
	for <linux-coco@lists.linux.dev>; Thu, 16 Jan 2025 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737046289; cv=none; b=Eb5RAKf3Sq33KUEiCol0O+HB85o+3+Dkw1+gSDS9sumXVsMh3EoeWjTeLurhllcXuOLE8IXG8dvvCa8Rp7qvi5KoCMpxFndxkj9jmuVJ/toUKRhh81lE4//x9BUC69Qn8eFuPWeMoH4te4Kvc9IUVlyj0sGAWeaMPwgGkby+GcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737046289; c=relaxed/simple;
	bh=VwjSx7RSO7ul2oU5IqD0vjv00msACQu4TWlO2N4PyQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYdyAu+5494fZ37rYJfo5/uMhtWfZAU+YVTuBvcMfB4P4dlvRqweWQaImMl4roS2p8vxqktAp/SgGSfHrQckOT4WQKhtll1NTFqwj3jNHz3Q8Y1Da1cj/jBXKxS2ml6zqZ4EqLoz7kaWApWJdz7DKu1OJcpXilQrbBxVID7VvSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jhqHqFaC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XBq/MiEo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jhqHqFaC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XBq/MiEo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jhqHqFaC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XBq/MiEo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jhqHqFaC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XBq/MiEo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 43D8C21183;
	Thu, 16 Jan 2025 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737046285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
	b=jhqHqFaCgXqpgeOMUC5m1la4myJf94CHu4GvfAtwmJ7+Vmg8K1AD7owIln2fd2PBJ+FkxG
	3GpQqtLUebx62RaT91b5Uqzt+rJHNIYz7Lvdg8ivnGVf/WpRr4KXjbje1ZHVgTCDAVtIOw
	fz9ZAr/oOBY2PXLb0TrHR/sHKbsTEKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737046285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
	b=XBq/MiEoanCL9J8TZ6QR/wvZm+53KxF/HzHilp3w7wB9lkXZmSSqu7uMyfAw8QztjIOvti
	wKRMVvk41AjciTDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737046285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
	b=jhqHqFaCgXqpgeOMUC5m1la4myJf94CHu4GvfAtwmJ7+Vmg8K1AD7owIln2fd2PBJ+FkxG
	3GpQqtLUebx62RaT91b5Uqzt+rJHNIYz7Lvdg8ivnGVf/WpRr4KXjbje1ZHVgTCDAVtIOw
	fz9ZAr/oOBY2PXLb0TrHR/sHKbsTEKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737046285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
	b=XBq/MiEoanCL9J8TZ6QR/wvZm+53KxF/HzHilp3w7wB9lkXZmSSqu7uMyfAw8QztjIOvti
	wKRMVvk41AjciTDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FA0413A57;
	Thu, 16 Jan 2025 16:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qOevAg05iWeFdwAAD6G6ig
	(envelope-from <jroedel@suse.de>); Thu, 16 Jan 2025 16:51:25 +0000
Date: Thu, 16 Jan 2025 17:51:23 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev,
	amd-sev-snp@lists.suse.com
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>, dhaval.giani@amd.com,
	thomas.fossati@linaro.org, leonardo.garcia@linaro.org,
	mathieu.poirier@linaro.org
Subject: Confidential Computing MC-like workshop in May?
Message-ID: <Z4k5C2bw8El7Yn9S@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	R_MIXED_CHARSET(1.00)[subject];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.com:url]
X-Spam-Score: -2.30
X-Spam-Flag: NO

Hello everyone,

I hope you had a great start into 2025 and return refreshed for more
exciting confidential computing work :)

Our last get-together as the confidential computing community was in
September last year and this years LPC is far away in December. So there
is the idea to have another in-person/hybrid event earlier in May,
alongside Linaro Connect 2025 (May 14th-16th, 2025) in Lisbon.

Lorenzo (on Cc) reached out to ask if there is interest and enough
expected attendace at such an event? I personally see quite some value
in another in-person event before December.

Please let us know what you think and whether you would attend such an
event, either in-person or remotely.

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

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC2980020
	for <linux-coco@lists.linux.dev>; Tue, 19 Mar 2024 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854458; cv=none; b=JcjsSxfaZD3X//QTsW1Q19Ux6etQmdt5slAY98TUPYbY5N7n8IkXnGd4jD7kaIFDdhnHVvIlG6suBR3dQIMT9l4ndfQFGIG6AEdOHsVhyfd495iXhl4WZ+E42W1ktta3x7qO4YxsWK21NRhY8+i2LI5dQpveOJHR1W23L+9amAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854458; c=relaxed/simple;
	bh=dTuubtPTneZtYY5LNzmXJqTf9V/+APRk4w9xJMTiztU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Qb5ptZQ3TAelvK8co5x2VoH/yJJzfkGUDOlrZFvx52MiG5i1JJr1s2v5RS/PA5fQjseL14jCxGojiqqKwBd8j1iesAtedhUWb9wQ9CbCvE42i5kMXyH6hHfTvd8a4l1DDEnZcTeW9dHNIn34tyIw8FdEQu8jVcnYoGpU+7x07iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r5o3NEPl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IPienAxa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r5o3NEPl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IPienAxa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r5o3NEPl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IPienAxa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r5o3NEPl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IPienAxa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A2395CA84;
	Tue, 19 Mar 2024 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710854455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
	b=r5o3NEPloGvLFp+IEreqhxc3E5XDLanqEibnSgh/bjm1xtJbBUHnCh3sHi90jyj7rv+di5
	KSKHgq3bqHNCY5Uh5X/KIjgt5Z2G4CnLgamh+dRYMh0W+wMU02TvMBPwjDRjPKS//Y0lji
	pji2WjoIvlW21qdP6hcT5NoceCdjgpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710854455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
	b=IPienAxaCLZNImQQb7APVuXEtwm2sRkDUGtlKkfqJsCj0TnUTIg3kLFVvZVu5gskwLMDuY
	setcMO222uAYYuDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710854455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
	b=r5o3NEPloGvLFp+IEreqhxc3E5XDLanqEibnSgh/bjm1xtJbBUHnCh3sHi90jyj7rv+di5
	KSKHgq3bqHNCY5Uh5X/KIjgt5Z2G4CnLgamh+dRYMh0W+wMU02TvMBPwjDRjPKS//Y0lji
	pji2WjoIvlW21qdP6hcT5NoceCdjgpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710854455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMJuaAqCx6zH6qFcO69xv2DHe3iUVcIydJcr0SBOw0s=;
	b=IPienAxaCLZNImQQb7APVuXEtwm2sRkDUGtlKkfqJsCj0TnUTIg3kLFVvZVu5gskwLMDuY
	setcMO222uAYYuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 163EB136A5;
	Tue, 19 Mar 2024 13:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h/OMAjeR+WXbYgAAD6G6ig
	(envelope-from <clopez@suse.de>); Tue, 19 Mar 2024 13:20:55 +0000
Message-ID: <7e201984-862f-4503-bdfb-006dc685f205@suse.de>
Date: Tue, 19 Mar 2024 14:20:50 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [svsm-devel] SVSM Development Call March 20th, 2024
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
References: <ZfmPIXGDd-69c9xp@8bytes.org>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <ZfmPIXGDd-69c9xp@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.64
X-Spamd-Result: default: False [-3.64 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-2.35)[97.01%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Flag: NO

Hi,

On 19/3/24 14:12, Jörg Rödel wrote:
> Hi,
> 
> Here is the usual call for agenda items for this weeks SVSM development
> call. My agenda so far is:
> 
> 	* vTPM merge
> 	* SVSM attestation architecture
> 	* Vendored dependencies in the repo

Should we also discuss the status of the TryBox PR?

Best,
Carlos

-- 
Carlos López
Security Engineer
SUSE Software Solutions

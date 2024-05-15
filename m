Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE114AB4
	for <linux-coco@lists.linux.dev>; Wed, 15 May 2024 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715774400; cv=none; b=E5vF47JkZRgRf9calmmlE9pKwZfB2Pg5YlJRv/NkULjBI1BVCttuu7UB2GddjtvohEkTlsaZNb2gRMLnuj0Y7JAfFrBj5CAt32LBTwnIdIjeWAOZIWTcgq6zTe5i1MKyLAHPekyqplME+yaJfYhRdNXCvEZD/xij/jA6WNgGLKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715774400; c=relaxed/simple;
	bh=V/8L+sSDhXZU6ShfzdMXXXDjWYvTRD2wx3IfhhzwpKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=B2AvxI6eiCAmaHK/aVEztyhp7cDPAaf8OnEIKamaoZ8LiveNLXicHtkVNopZ8tn85uNla/xM1UlKVtWXyM84PhHB7lDqscKHBmBV54BuQJ+fmh7NMo5qK3L5ZNwD+PlfpooavsrKxnDpMc2LhFD9ld8Jz/GF+vQ6m5a9d3VcKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I+uepwuj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gdf4cc49; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I+uepwuj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gdf4cc49; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I+uepwuj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gdf4cc49";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I+uepwuj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gdf4cc49"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C984720618;
	Wed, 15 May 2024 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715774396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
	b=I+uepwujIF1yk9SvDrneLFi89dMeOqF6OPdapeuBvZdTVRg/QQQXHZU0PVjJPQObC5jT2c
	WMyatiOrqnR0fyH+ZMry5W0D+IqcE8iV0+8iimYPkzE11Dkd5Mm09Rey1jIldLFgdlJkk0
	B6BGv3Y/V80vehuNCgfVwniooBSx6yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715774396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
	b=gdf4cc49tzfkiH5qLjfQ/qEomrKxPPvWN64Oy58sz9YgmHqeUvWCJ2wJZnCSgoaAHnaDtT
	wRlMQvskSnrPqeCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I+uepwuj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gdf4cc49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715774396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
	b=I+uepwujIF1yk9SvDrneLFi89dMeOqF6OPdapeuBvZdTVRg/QQQXHZU0PVjJPQObC5jT2c
	WMyatiOrqnR0fyH+ZMry5W0D+IqcE8iV0+8iimYPkzE11Dkd5Mm09Rey1jIldLFgdlJkk0
	B6BGv3Y/V80vehuNCgfVwniooBSx6yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715774396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UBungeZX8wSDiohKxZCT8aQmlNmjz1V0stFg3Nyp5Q=;
	b=gdf4cc49tzfkiH5qLjfQ/qEomrKxPPvWN64Oy58sz9YgmHqeUvWCJ2wJZnCSgoaAHnaDtT
	wRlMQvskSnrPqeCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DC771372E;
	Wed, 15 May 2024 11:59:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r3A0FbyjRGYnJgAAD6G6ig
	(envelope-from <clopez@suse.de>); Wed, 15 May 2024 11:59:56 +0000
Message-ID: <d62c34bd-62c0-4f09-8612-0c20dc62ea44@suse.de>
Date: Wed, 15 May 2024 13:59:55 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [svsm-devel] Development Plan Document
To: "Reshetova, Elena" <elena.reshetova@intel.com>,
 =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <Zj30Nqq3OS58DwpP@8bytes.org> <ZkMpkfepqUWfq1RY@8bytes.org>
 <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.93 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.56)[subject];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C984720618
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.93


Hi,

On 15/5/24 12:20, Reshetova, Elena wrote:
> 5. Section 12.2: by double-validation you mean the case when a private page
> is added twice to the CVM (reaccept in TDX terms)?

I am not familiar with TDX, but I think so, yes. It means that the same
GPA is accepted twice by the guest. This opens a window for the
hypervisor to remap the GPA to a different HPA, at least on SEV-SNP.

Best,
Carlos

-- 
Carlos López
Security Engineer
SUSE Software Solutions

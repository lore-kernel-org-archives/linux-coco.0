Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691A4803
	for <linux-coco@lists.linux.dev>; Fri,  4 Nov 2022 20:53:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13B132190B;
	Fri,  4 Nov 2022 20:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667595204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2VGxdoks4hueLjmIZRrAT3uj+72PShV24wAI74aXoz8=;
	b=oG7gCD+J1Vc2wg59KPkQVeUimeKUvjTDr8cA2LeHJH4CWz5MyRmZp1h279kfhVqR2abCPu
	jQwSPsO7iJfhiImDBf6bdcBHnVp9sO0SiaOol00H0XYGWU/51HkP9bNbGYK6aoPS6AORtX
	9DxRlgbICO6zzzwXYD7OTY5oevtoxl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667595204;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2VGxdoks4hueLjmIZRrAT3uj+72PShV24wAI74aXoz8=;
	b=IwhAtvrRE3k/WXZdA1PLcInQmHDsGdmmqMQ8mlViN8UISlgRQ2BmZLS62p5aNZtBIV/B8n
	2xOl9CTadK7SbUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 070481346F;
	Fri,  4 Nov 2022 20:53:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uEWwAcR7ZWNNdAAAMHmgww
	(envelope-from <bp@suse.de>); Fri, 04 Nov 2022 20:53:24 +0000
Date: Fri, 4 Nov 2022 21:53:23 +0100
From: Borislav Petkov <bp@suse.de>
To: Cole Robinson <crobinso@redhat.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	thomas.lendacky@amd.com, brijesh.singh@amd.com
Subject: Re: [PATCH] virt: sev-guest: Add MODULE_ALIAS
Message-ID: <Y2V7w6PCUV/IxLBl@zn.tnic>
References: <ff480c5e688eb0a72a4db0a29c7b1bb54c45bfd4.1667594253.git.crobinso@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff480c5e688eb0a72a4db0a29c7b1bb54c45bfd4.1667594253.git.crobinso@redhat.com>

On Fri, Nov 04, 2022 at 04:42:45PM -0400, Cole Robinson wrote:
> This fixes driver autoloading

What is the scenario where this needs to be autoloaded?

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95297EDA
	for <linux-coco@lists.linux.dev>; Wed,  1 Feb 2023 10:50:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE88A20751;
	Wed,  1 Feb 2023 10:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675248645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qq2vEcUlLVW0N9gJDZcC+n+AVLycIxTQAx78+KCTTM=;
	b=Z9roHqowOPz3+CoA39a2+ErrKjuJzVHiAWRsMvYdYg2NaJPnLPCvrhZKjUhA90FUATyRrf
	lgG/NEwD7vOFZQySYJbnXWLiiluyBZOTqic0KIYFH5zXjNUJJNYZka1/mkq2jsNSGCFWhg
	mdzJTgrF9JGkHaUaFsl2LH/ysccvgus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675248645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qq2vEcUlLVW0N9gJDZcC+n+AVLycIxTQAx78+KCTTM=;
	b=DBZo19XBGvm0T52thjU9qgNefGxKbE6kygMLmlZwVqVORMWSCZltE/8tigGjzQMzSgssBM
	kESaPeYl3k9fL2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C78E13A10;
	Wed,  1 Feb 2023 10:50:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1BPSJAVE2mOWDQAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 01 Feb 2023 10:50:45 +0000
Date: Wed, 1 Feb 2023 11:50:44 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Message-ID: <Y9pEBGWl/xJyIgYS@suse.de>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+mdnCrn7sNCcMt@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8+mdnCrn7sNCcMt@suse.de>

On Tue, Jan 24, 2023 at 10:35:50AM +0100, Jörg Rödel wrote:
> It would be great if we have an equivalent to EBUSY in the return codes
> to the guest. Something like SVSM_ERR_BUSY or SVSM_ERR_AGAIN, which
> tells the guest that some resources needed to fulfill the request are
> currently in-use and that the guest should try again later.

On a related issue, do we need an extra return code for the case that
the SVSM got a fault when trying to access VMPL1 memory? Request
processing can fault for various reasons when accessing addresses passed
in via requests, should this be reported a SVSM_ERR_INVALID_ADDRESS or
is another code needed?

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


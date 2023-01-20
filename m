Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5A17D2
	for <linux-coco@lists.linux.dev>; Fri, 20 Jan 2023 08:37:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D504D5D9B1;
	Fri, 20 Jan 2023 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674203856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTlEXBJhXu15MhyoakXi09Gb7K6uHJb2tGC6peayjH8=;
	b=tVFQXO0KyXcyYZZEy5U7dY6mYWBo/Ii27auiOs2WKu4qtDOxeruTYh+UqsceEsttpbzx7m
	30Q+1niT2ENNs1rd96dAFSncxPXlmfDGMxYU1g4JJAhvzClXp4IZndtRv5uY9ZPl/IpTSi
	aNYd4e8SFs0s8QjUorIgMpR8F9v1CYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674203856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTlEXBJhXu15MhyoakXi09Gb7K6uHJb2tGC6peayjH8=;
	b=CM+VT27HE2RKw4B5IEo/SL3LQXFr8QSr+/3XAiai4vdzx4+dW4D0zJDN7fNRhPz+/BEgjl
	IPdL56K+6XbqyRDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A45F413251;
	Fri, 20 Jan 2023 08:37:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rHOQJtBSymP0FAAAMHmgww
	(envelope-from <jroedel@suse.de>); Fri, 20 Jan 2023 08:37:36 +0000
Date: Fri, 20 Jan 2023 09:37:35 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
	=?iso-8859-1?Q?=22Daniel_P=2E_Berrang=E9=22?= <berrange@redhat.com>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8pSzx1g8THT3rnC@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
 <Y8mztTGpZbWi89sn@suse.de>
 <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>

On Thu, Jan 19, 2023 at 04:29:23PM -0500, James Bottomley wrote:
> How can they stay there?  Even if the SVSM is the point of first
> contact to receive the secret, it must give the secret to higher VMPLs
> to try the mount, so the higher VMPLs have to destroy the secret they
> were given on failure.

My thinking was that the SVSM will only hand out the secrets once the
code in higher VMPLs has proven itself to be trusted. But it is possible
for an attacker to create an image with the expected parts to get the
measurements right and then use a fall-back mount if decryption fails to
steal the secret.

But such mount fallbacks a generally a bad idea in a CVM.

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


Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE17C
	for <linux-coco@lists.linux.dev>; Sat, 14 Jan 2023 16:58:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0CB591FF2C;
	Sat, 14 Jan 2023 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673715473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvjmppqqURGe50QET8urgdIHKtfBpWwFAbwQUFIZkkw=;
	b=WVP7FUZ9HRzhZXDq8kf6kDhCVLxU5GbJMeLlwAv696IyG+a9L7wXUFR4gCP+4gKC7Yu/VN
	tRnxM4qBTfmU0keVvbas6ueJRBsglBeUfKICBFqqdm91JCOqo6CTCyTHRiuT4AuRSrlLGt
	LMsmIntAMydiU6l2HBm/W2Lu60csg6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673715473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvjmppqqURGe50QET8urgdIHKtfBpWwFAbwQUFIZkkw=;
	b=xqMNy0ZiKrWElUptG+o1seEDgdqYRqhkzfstbclCYuhlK6uaZQKU5UpQDqUaDvgqlnf520
	pz6a1cQQ7bpy5rCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF3C81391E;
	Sat, 14 Jan 2023 16:57:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id bnx5MBDfwmPqHAAAMHmgww
	(envelope-from <jroedel@suse.de>); Sat, 14 Jan 2023 16:57:52 +0000
Date: Sat, 14 Jan 2023 17:57:51 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8LfDwfw+SksR5jO@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>

On Fri, Jan 13, 2023 at 01:02:30PM -0500, James Bottomley wrote:
> In the original proposal, grub was combined with ovmf to produce
> attestation covering the mounting component.  In this new scheme, you
> could use measured direct boot to ensure that the initial attestation
> covers the initrd since the boot partition isn't encrypted.

This can work in some environments, but for a generic distro it is not
very useful because it make is difficult to do image updates on the live
system. Well, except you use the first kernel and initrd (which is
measuresd) as the boot-loader to kexec into the distro kernel later,
which is loaded from the encrypted disk. This scheme is used on S390
Confidential VMs to some extent.

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


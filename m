Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355DB33E7
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 11:50:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54FCE606CE;
	Fri, 13 Jan 2023 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673610612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aMjVzaGZHOiEWYgjfZZNCG7lVnlYfSJz9DtLbjDP0U=;
	b=BTeba3pyv+Otn8sJ/FsFxceX5mY/KrvfF4IJFD41f3hQbHHT2XFZPpu2wVx4QtMRL0F6OF
	V41rJnFBdPvEI/MQby0iC0cA1bihMe/3sPQRrszIB539W1eILBZUHNpBVDdCWszszZYi+p
	kyOP01rfo0U4dwVk9ZisXW+Xzy0ns2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673610612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aMjVzaGZHOiEWYgjfZZNCG7lVnlYfSJz9DtLbjDP0U=;
	b=a/freltUPwHF9m88vpKI3bkgBE3/GUd12vKJfbmJ/T6UOcmxnSsh0Uj190ToboMlBMfNPt
	LUPPH+EbFZ2Cp4Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 364C71358A;
	Fri, 13 Jan 2023 11:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AOH5C3RFwWP3QAAAMHmgww
	(envelope-from <nstange@suse.de>); Fri, 13 Jan 2023 11:50:12 +0000
From: Nicolai Stange <nstange@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
  "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
Date: Fri, 13 Jan 2023 12:50:11 +0100
In-Reply-To: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com> (Tom Lendacky's
	message of "Tue, 10 Jan 2023 12:54:27 -0600")
Message-ID: <87edryu00c.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Tom,

Tom Lendacky <thomas.lendacky@amd.com> writes:

> Please take a look and reply with any feedback you may have.

Perhaps I simply missed it, but the available SVSM_VTPM_CMD response
buffer size seems to remain kind of unspecified. That is, the proposal
from [1] was to just require a complete page for the buffer, but I can't
find that explicitly stated anywhere (except for the required alignment
of %rcx giving a hint).


For the table on p. 28 in sec. 8.1 "SVSM_VTPM_QUERY Call", the
"Supported vTPM features" are meant get returned in %rdx, not %rcx, I
think.


And finally a question re the addition on p.9 ("Scope of the document"),
which reads as
 "Items measured at VMLP1+
  o Firmware binary
 "

In light of the sentence immediately preceeding the above and explicitly
stating that the svsm would get measured as part of the initial image,
does this conversely imply that the firmware binary would typically not
get measured as part of the initial guest image? I.e. that it would get
loaded with PAGE_TYPE_UNMEASURED? If so the above could be read as if
the firmware was supposed to measure itself at VMPL1. I think that's not
what's being meant here, but the wording is a bit misleading IMO.

Thanks!

Nicolai

[1] https://lore.kernel.org/linux-coco/b488a79617beed8913df61186e8e263c40f2=
330b.camel@linux.ibm.com/

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
(HRB 36809, AG N=C3=BCrnberg)

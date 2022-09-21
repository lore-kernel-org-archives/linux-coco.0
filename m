Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821AA7C
	for <linux-coco@lists.linux.dev>; Wed, 21 Sep 2022 08:49:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDA261F747;
	Wed, 21 Sep 2022 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663750170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98fih9GUwu8XeLPCG3O+3miy41iGa0MQojjCHci4ZVg=;
	b=2GURPhpaBUr9/FFPv0hDEUgIu4i4O+ECIvoI3qbRxh4/sRHnAuWvADJ10NfuDl4zE6P6c9
	ge3vSPDUStG3Jo92Lbu5pBW8B67VqkPts34uTMvhzgfhNgftfecsrCbWt114dXmyxb1QRH
	ZGoc5R+Kutu4VzLOEdeuXUDu/ar2XaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663750170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98fih9GUwu8XeLPCG3O+3miy41iGa0MQojjCHci4ZVg=;
	b=te9cC631zabG2tmjGu4teZwDJPVqYr5Sv5So7vGSttGuiwMJQc3sfF/DUENXPt5NDZpOGO
	/oMK6ua7qvPzQqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B95B513A89;
	Wed, 21 Sep 2022 08:49:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nM27KxrQKmOrNAAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 21 Sep 2022 08:49:30 +0000
Date: Wed, 21 Sep 2022 10:49:29 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: linux-coco@lists.linux.dev,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
	amd-sev-snp@lists.suse.com
Subject: Re: Secure vTPMs for confidential VMs
Message-ID: <YyrQGXO34ZRxSbgl@suse.de>
References: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>

Hi Dov,

On Tue, Sep 20, 2022 at 11:28:15PM +0300, Dov Murik wrote:
> * Implementation in TEEs: SNP introduced VPMLs, and AMD's linux-SVSM
> running in VPML0 can also run vTPM code to handle TPM requests from the
> guest running in VMPL1.  Such a solution is not applicable as-is to
> other TEEs (SEV, TDX).  People suggested running vTPMs in a separate
> confidential VMs, and somehow connect the tenant's guest to the TPM VM;
> but we'll need a way to secure this communication channel.

Yes, so for SEV-SNP the way to implement a vTPM is via a Secure VM
Service Module (SVSM) running at VMPL0.

I not sure how much we should care about the variant of running a vTPM
in a separate trusted VM. In the long run SEV and SEV-ES will be
replaced by SEV-SNP, and for TDX it would be best if Intel just adds a
software TPM into their SEAM module. IIRC TDX already has some TPM-like
features, e.g. PCRs, implemented there. A full vTPM seems to be doable.

> * Guest enlightment: Guest software currently interacts with the TPM by
> writing commands to a memory-mapped IO page (GPA 0xfed40000) and reading
> responses from that page.  We want such writes to trigger the code of
> our vTPM (for whatever implementation we choose).  Our current early
> experience with TPM running in linux-SVSM required adding "exit-guest"
> calls after writing commands to the IO page, in order to allow the SVSM
> to run and recognize the incoming command.  Ideally, we'd like a
> solution that doesn't require modifying all the TPM drivers out there
> (in Linux, Windows, OVMF, grub, ...).

It will not be that easy to emulate a vTPM at VMPL0 which has the same
interface as memory mapped TPMs. That would mean marking the page as
MMIO, but that will trigger a VC exception in the OS (or OVMF, Grub,
...), which would then need to forward the MMIO access to the SVSM. So
either way, OVMF and Grub need modification to work with a vTPM running
at a lower VMPL.

An alternative is using the ReflectVC feature to get the VC directed to
the lower VMPL, but that has much wider implications and is not
justified for only emulating a vTPM.

The current plan is to have VMPL1 talk to the VMPL0 vTPM via
standardised SVSM commands. This requires new TPM drivers for all VMPL1
components. At least unless someone comes up with a better idea :)

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


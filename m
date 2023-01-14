Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5477C
	for <linux-coco@lists.linux.dev>; Sat, 14 Jan 2023 17:08:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94E244E368;
	Sat, 14 Jan 2023 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673716088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcqn3PwnX1FSivptxUyyC/rCsA9xhwC7nLsIkFkpWX4=;
	b=Z01JW/nt8x9Ale+t8nvluoawhClWmn2xiu0GgoKYQzZq3C85SnRQLeKgi/tBGfAjBNsshE
	8AVK/J5K7jFqDZbKVxHH7L9md/Hkp0m8Bh+Zow5/biyGSWFZkwVOsagjdyQxrVfJ45trRX
	kyixKyyFLoz9tM0bxa7zyB4BFyyy9Ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673716088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcqn3PwnX1FSivptxUyyC/rCsA9xhwC7nLsIkFkpWX4=;
	b=u8NERfZmF8Bp3D7CRLQAZiLKi4XTtvSNlTtQJ2OSuQlu6vabHxGjqxSU73gMJBy5jUIUJZ
	Z6JjMksf3ciJR6Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71B081391E;
	Sat, 14 Jan 2023 17:08:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id chM+GnjhwmOyIAAAMHmgww
	(envelope-from <jroedel@suse.de>); Sat, 14 Jan 2023 17:08:08 +0000
Date: Sat, 14 Jan 2023 18:08:07 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8Lhd/H4yGTsOM/+@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <Y8Gi0KLj5JbhCqBE@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8Gi0KLj5JbhCqBE@redhat.com>

On Fri, Jan 13, 2023 at 06:28:32PM +0000, Daniel P. Berrangé wrote:
> Aside from what James' says, one option is to lockdown the OVMF and
> secureboot chain. eg OVMF built with SecureBoot=on, and instead of
> having the generic Microsoft keys enrolled, have a distro specific
> key enrolled. That distro key would have to be one that is only
> used for signing UKIs (Unified Kernel Images), and the initrd embedded
> in the UKI would need to be designed abort if it finds the disk is
> not encrypted.
> 
> The main challenge here is that you don't have a single OVMF anymore.
> You have many OVMFs, one for each distinct set of distro SecureBoot
> keys, and the attestation server has to decide which one it wants
> based on the distro the VM is expected to use.

Yeah, as you said, this requires OS-vendor specific firmware in the VM,
I doubt the CSPs will implement offerings this way. More likely is
that a CSP will deploy its forked OVMF BIOS with a set of secure boot
keys, which will likely also include keys from the CSP (especially if
the CSP also provides its own distro). So you still need to trust the
CSP that it will not fake one of your VMs to steal secrets.

As James also said, the measurement to unlock secrets need to include
all software/data components up to the point where the encrypted disk
gets mounted.

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


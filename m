Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D619456
	for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 12:44:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D8582000D;
	Tue, 21 Mar 2023 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+7qSU8PTZ7jb1QFaGzVCG7WQ11iWdZECtfo29qI5vI=;
	b=dXudV0HgmOUDu0xMnbKEAgdDSpOJniYolzdcHftM2zWGzoSnrI2UiM8mL7EPcEOa9FT3b7
	O8rg1AbUJ7AdpmngqScZvj9CCtywT+8XiZLFIgxpUwLyLdw6+ciDv8G6m2rRAyVz1WbmMZ
	7IsMQ8mmTEK++BmKuyUI8HfGo4KdLmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+7qSU8PTZ7jb1QFaGzVCG7WQ11iWdZECtfo29qI5vI=;
	b=tMhnkDDf8+E2ELrKJQwRowhJRRwOTCyQ3hXVGXpOldVY6gCE+/0Cz/RwpCn+v8tefuMlq5
	74hocgPcTbtAYpBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 532F513440;
	Tue, 21 Mar 2023 12:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dDzeEpCmGWQeYgAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 21 Mar 2023 12:44:00 +0000
Date: Tue, 21 Mar 2023 13:43:58 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBmmjlNdBwVju6ib@suse.de>
References: <ZBl4592947wC7WKI@suse.de>
 <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>

Hi James,

On Tue, Mar 21, 2023 at 07:09:40AM -0400, James Bottomley wrote:
> Since this a fork of the AMD svsm code
> (https://github.com/AMDESE/linux-svsm/), is it intended to be a
> permanent fork, or are you going to be submitting your additions back
> upstream like we're trying to do for our initial vTPM prototype?  From
> the community point of view, having two different SVSM code bases and
> having to choose which one to develop against is going to be very
> confusing ...

The COCONUT-SVSM was and is a separate project and not a fork of AMDs
linux-svsm. Some code was ported from our code-base to linux-svsm in the
past, namely the SpinLock implementation and the memory allocators.

What the project also shares with linux-svsm is the support code in the
Linux kernel (host and guest) and the EDK2 changes needed to launch an
SVSM.

But besides that the two code-bases are different, using a different
build approach and different launch protocol. The goals we have with our
SVSM are hard to achieve with the linux-svsm code-base, so a merge does
not make sense at this point.

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


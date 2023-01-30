Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE420E3
	for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 11:29:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2BF6E1FE32;
	Mon, 30 Jan 2023 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675078153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlutJp3Rq6v3ftkqKq4LQYOrGlBPvORoMOD6B3a9P3c=;
	b=PuIuseIuzCs0TW2lCVTyWJqld7M4o7unA+36j7rVf4uXWddScpdLeMht6ZFofOJlnPtXul
	b8DFJG6PgLCs5R400lSv4YC/YX0UzxU6MHNEQIfiAvjs87j2X5NDuQONFWY/5hfDkv5u0a
	3dcKNf+p97Ies/j3verU9BggkaHnCpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675078153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlutJp3Rq6v3ftkqKq4LQYOrGlBPvORoMOD6B3a9P3c=;
	b=TTJ9R7svkHbF5PkZTPbtxd4DJNGMxnTVOg6LpwO4I2x2A4BXFrpu4roQiJoCMhy8Im4ig2
	MRAJp7yREjadZ1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F28FA13A06;
	Mon, 30 Jan 2023 11:29:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zkjAOQiq12PTJAAAMHmgww
	(envelope-from <jroedel@suse.de>); Mon, 30 Jan 2023 11:29:12 +0000
Date: Mon, 30 Jan 2023 12:29:11 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Jon Lange <jlange@microsoft.com>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Message-ID: <Y9eqB5/1YcZeIHqG@suse.de>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de>
 <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9OMuuHz2utBASOm@suse.de>
 <MN0PR21MB30724AB0ED1740D2018C06E3CACC9@MN0PR21MB3072.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR21MB30724AB0ED1740D2018C06E3CACC9@MN0PR21MB3072.namprd21.prod.outlook.com>

Hi Jon,

On Fri, Jan 27, 2023 at 04:11:57PM +0000, Jon Lange wrote:
> I agree that some amount of implementation-specific SVSM communication
> may be unavoidable, but for the sake of a robust standard, this
> position should be accepted reluctantly rather than being embraced.

I totally agree with that. How about specifying that implementation
specific calls must be designed in a way that allows the guest OS to
treat them as optional. Or in other words, an SVSM must be able to run a
guest OS which does not use implementation specific call at all (and
even doesn't know about them)?

> As long as the crutch of implementation-specific calls is available,
> it will be too easy for contributors to classify new features
> in this way when doing so may be the easy way out.  It would
> be much better if the specification of an
> implementation-specific call were the harder path, so that the
> default option would always be in the direction of
> standardization.

Right, but I think this is hard to achieve. It depends on how the
standardization process works.

> Logging is something that every SVSM implementation will want to be
> able to offer, and so the aspiration should be to design a standard
> log configuration and retrieval calling convention so that log
> management can be done in a consistent manner across all guests and
> across all SVSM implementations.  The reflex to call this
> "implementation-specific" is exactly the sort of deviation from a
> standard that worries me.

On the other side, too much standardization on these matters could lock
down SVSM implementation details to a point that makes it hard to
innovate.

For example, consider these questions about logging alone:

	* Support one log or many?
	* In case of many logs, one per protocol? Or divide it
	  differently? Separate event and error logs?
	* How to enumerate the logs, by protocol number or by a name or
	  even by a GUID?

I think such questions are implementation specific, and it can be even
worse with other possible extensions, like tracing for example.

> Perhaps not every SVSM will want to offer logging, at least not at
> first, and that's fine; those implementations can simply decline to
> offer the logging protocol.  But the key point here is that the set of
> features present in an SVSM should be at the discretion of the
> implementation - and may change over time - and must be discoverable
> in a standard way.

I agree on the discoverability. There should be a standard way to
discover the specific SVSM implementation and the extensions it possibly
offers. The extension remain optional, of course.

> Separately, I struggle to understand how a guest OS is supposed to
> know which SVSM implementation it's running with.  I don't recall a
> proposal to define a call to get the SVSM type, nor a proposal to
> define a registry of SVSM types.  Without such a mechanism, how could
> a guest have any idea which implementation-specific calls are expected
> to succeed?  Again, moving functionality into a standard calling
> convention avoids these questions, leaves protocol implementation
> choices in the hands of individual SVSM designers, and is fully
> enumerable and optional.  Shouldn't this be the primary design model
> for all SVSM interactions?

As I said, the implementation specific parts must remain optional, but I
think the standard should leave room for implementers to have SVSM
specific calls without violating the standard.

As of discovery, this is what this sub-thread is about :) We can add a
call to the standard which allows to identify the SVSM implementation.

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


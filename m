Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA259746A
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673531879;
	bh=8vN3t+1bGF80ChpY5IFDuMQb+J/lXRxMTqIW+Dtq0aw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=T3HfoogptnHKdb2x4Ysupr4srblXG3K9HCjDglO+MGWMiZ2GdAObuQGN6sMD/W6ct
	 MpJvgx1L5C6btlzaQ9sMJQK3D7VyqdcAn05e6jHempLdR8FnNn9b79JMeW50CCIEVY
	 CzhVqVt8FKs2NTu5n7bY5UnHf9wEIW54il4wJs9I=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id CAD0612811B7;
	Thu, 12 Jan 2023 08:57:59 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTDuwnCTCLCr; Thu, 12 Jan 2023 08:57:59 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673531879;
	bh=8vN3t+1bGF80ChpY5IFDuMQb+J/lXRxMTqIW+Dtq0aw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=T3HfoogptnHKdb2x4Ysupr4srblXG3K9HCjDglO+MGWMiZ2GdAObuQGN6sMD/W6ct
	 MpJvgx1L5C6btlzaQ9sMJQK3D7VyqdcAn05e6jHempLdR8FnNn9b79JMeW50CCIEVY
	 CzhVqVt8FKs2NTu5n7bY5UnHf9wEIW54il4wJs9I=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0C4EA1280B5C;
	Thu, 12 Jan 2023 08:57:58 -0500 (EST)
Message-ID: <777e87d6c77b2c6287040242f1f2759266778eff.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christophe de Dinechin <dinechin@redhat.com>, Tom Lendacky
	 <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Thu, 12 Jan 2023 08:57:55 -0500
In-Reply-To: <m2tu0wrjv0.fsf@redhat.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <m2tu0wrjv0.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-01-11 at 17:39 +0100, Christophe de Dinechin wrote:
[...]
> p29: Table 14: How can RAX be used as command ordinal and command
> response size if it's already used for call identifier / result
> value?

I think there's a bug on the first table: in the prototype we use RAX
[in] (not RCX [in]) for the pointer to the request/response buffer and
RAX [out] as the SVSM return code.

The shared response buffer has the platform command as the first word
when it goes down and the response length as the first word when it
comes back, which I think is what the second table is meant to show.

> p30: Why would you need 4 bytes for the TPM command ordinal? This
> causes the TPM command size to be misaligned. What about 2 bytes for
> command ordinal, one byte for locality, and one reserved byte?

It comes straight from the MSSIM protocol.  The actual vTPM service
routine sends the buffer down unmodified to the vTPM command routines.
If the size of this gets changed, the entire command would have to be
copied to a new buffer to send it to the MSSIM vTPM.

James


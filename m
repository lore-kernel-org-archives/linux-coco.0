Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCE0A94F
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 20:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673382554;
	bh=/N7xkrFjEVmROxho/7JC2MotBqYwL8VdQuQFQa8rZCU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=dN+USSn87zZCWPXVubQfr6BbH0SkUXRR3RKpXMNzNhU9M1TpXmcbOwdq5jxJYlqkR
	 e7BU1MqpBx0eNgbpC7RqaUz7hFjnFlevWtQvsgarE4FNYtzYFKNewqkS5JqS4tguVY
	 bF4rMsgo4MiMQcafox/2JoErHaJX/Fzs62+cskfM=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D406E128646B;
	Tue, 10 Jan 2023 15:29:14 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIV-xjxzFZey; Tue, 10 Jan 2023 15:29:14 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673382554;
	bh=/N7xkrFjEVmROxho/7JC2MotBqYwL8VdQuQFQa8rZCU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=dN+USSn87zZCWPXVubQfr6BbH0SkUXRR3RKpXMNzNhU9M1TpXmcbOwdq5jxJYlqkR
	 e7BU1MqpBx0eNgbpC7RqaUz7hFjnFlevWtQvsgarE4FNYtzYFKNewqkS5JqS4tguVY
	 bF4rMsgo4MiMQcafox/2JoErHaJX/Fzs62+cskfM=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2EF33128645F;
	Tue, 10 Jan 2023 15:29:14 -0500 (EST)
Message-ID: <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 10 Jan 2023 15:29:12 -0500
In-Reply-To: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2023-01-10 at 12:54 -0600, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with
> added support for an attestation protocol and a vTPM protocol as well
> as other  miscellaneous changes (all identified by change bar).
> Please take a look and reply with any feedback you may have.


I think the first feedback I'd have is that the word "ordinal" isn't
used anywhere in the MS reference implementation.  It confusingly
refers to them as "commands".  To avoid confusion, most TSS
implementations call them "platform commands" to distinguish them from
actual TPM commands.

Then in section 7 "Attestation Protocol", the way we've currently coded
keylime is to validate the specific TPM attestation.  It is possible to
code it to extract that from a bundle of attestations, but that bundle
size grows with every new service and the verification is remote.  It
would be ideal to be able to request only a single service attestation,
so we can keep the current VTPM only attestation in keylime.  You seem
to be identifying services by protocol number so perhaps we could use
the protocol number instead of the GUID and also have a call per
service protocol to attest only that service, say as function id 1 of
protocol 1 taking the protocol number and report version (starting at
zero)?

You suggested that because REPORT_DATA is 64 bytes that we should do
the sha512 hash of (nonce || data), which is how the current VTPM is
coded ... is there a reason to go back to sha256 like the new document
proposes?

James


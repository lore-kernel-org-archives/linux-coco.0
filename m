Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D5C148FF5
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 19:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733945432; cv=none; b=FHnGknZ5DOR14+OvkJkZdqoce/h4Q5VJWt2WHCyPj3PYBt61r4XbSuVmdcs6oAcA+t1dCi2rD1jB7sbRhI+fwD5cEHC8JJjaLXXJICYZGNfjm/H4xmmNx1AhJPSopKwnvgCgoKZspt5sb+5J5ygk7ZTc3C/EncaUkm3WF1o4Q70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733945432; c=relaxed/simple;
	bh=jGqj8ukO3/QTeEOcMJePQhqyNNk7vWDp8Pog5gL3niQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e9U3L3OXai+PGP37pN0Jx/MpP44Lq6PS711AWn4urcKJxuz6e56JDYvabP+Pbj7Stszas8zwvGByAH3cD1KjEBUXqF9jrHW6nkSC1RvVyXU5gUdsXQIleXGU7Pb6QWS/ksZzeilDssIRI4k7QmeSFNUB9CKW5UJzv0FaDTcYuRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=wrPGQQCR; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=wrPGQQCR; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="wrPGQQCR";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="wrPGQQCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733945429;
	bh=jGqj8ukO3/QTeEOcMJePQhqyNNk7vWDp8Pog5gL3niQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=wrPGQQCR/enT3TUvRn5GFQIBLozxuq9382FB8z2e8GggL9Y69hTNKLDfFkiD97SlO
	 vlkIVsxENzhBdUpAYmwT6Xo+iD5z64AR55sLqkbCecxgimZeZ4RIYmSGsSSrIHH11c
	 Xgl5xkf7B1jlPsXbJBTe81ekX83D6LbLPKlaVtGI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5D3B8128B0D5;
	Wed, 11 Dec 2024 14:30:29 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id sAXLKf11921t; Wed, 11 Dec 2024 14:30:29 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733945429;
	bh=jGqj8ukO3/QTeEOcMJePQhqyNNk7vWDp8Pog5gL3niQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=wrPGQQCR/enT3TUvRn5GFQIBLozxuq9382FB8z2e8GggL9Y69hTNKLDfFkiD97SlO
	 vlkIVsxENzhBdUpAYmwT6Xo+iD5z64AR55sLqkbCecxgimZeZ4RIYmSGsSSrIHH11c
	 Xgl5xkf7B1jlPsXbJBTe81ekX83D6LbLPKlaVtGI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DE1C9128B0D4;
	Wed, 11 Dec 2024 14:30:28 -0500 (EST)
Message-ID: <d0b32f57b5ca66255c02ba62c9894bd5f2878a8d.camel@HansenPartnership.com>
Subject: Re: SVSM attest single service binding
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, linux-coco@lists.linux.dev
Date: Wed, 11 Dec 2024 14:30:27 -0500
In-Reply-To: <CAAH4kHYdK7X3jZFYaJRrO5gSgF55kxHzweh0epoq+ciPjwwAwA@mail.gmail.com>
References: 
	<CAAH4kHYdK7X3jZFYaJRrO5gSgF55kxHzweh0epoq+ciPjwwAwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2024-12-11 at 10:20 -0800, Dionna Amalie Glaze wrote:
[...]
> I would like to request a change to the specification to add context
> tags in the REPORT_DATA, at least for attest_single_service, e.g.,
> SHA2-512(nonce || "svsm service <uuid>" || service manifest)
> 
> A solution could just be to say single services shouldn't use GUID
> tables as their own service manifests, but that's a bit brittle.

Another possibility is to define an end of report GUID which would have
a zero size entry and define that it should always appear last in the
manifest for all services attestation but should never appear in a
single service attestation.

Regards,

James


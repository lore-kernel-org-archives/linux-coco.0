Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C92374D3
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718194807; cv=none; b=JncL3BMZXh0bsiwDN3rNMJQOWSL7oIQLX/Kz1ntDriO5Ajxfq9TfxWsZP5+zoKHHJgDV3LtAJJnBO6jA+sI57ieIcqAWikH5NYXn1vX0DhjsCCX1ByeVW1pbAkLjBcGz1JNMi/rYEfxCGzUmWWMn889y2uJdshEkaPLLmNPb4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718194807; c=relaxed/simple;
	bh=hams3tDzyOgLdRtdhPicGhJSgF2Fx3TGq11heF/U1yE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KDni1DKOdxlZAOOxivZO1XhuOB3UNoxaoz4j5oA88zz9KiGA/XKBnl994DXo50i4mGRzSamqAIftI4lxOEBPItyJF+4hDy1lPAojGXZZYRAFnKhdiEigsvMBZ48YIn43gs1enlwftwvV5SXckz7C+u2S1m//wOFzQaXVzTrCuOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=HvlGWYhk; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=Zz+J1FRT; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="HvlGWYhk";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Zz+J1FRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718194805;
	bh=hams3tDzyOgLdRtdhPicGhJSgF2Fx3TGq11heF/U1yE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=HvlGWYhk5GHdRGHbKMEytV9h9KRZKNwXHs7JM7f+G6+2OZBpbko0GdONvFI+Rptz6
	 MXMRZqULmQWD8z9YtkTtIb1JhDDlMSFLS+hEvdHItHcUB6mtMfOp47tTGSFl9WkzGW
	 dN5OLRQKFH7m4G/4HmC7cXMd+0lF/Vh16EAuCf3o=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0A52E1287A74;
	Wed, 12 Jun 2024 08:20:05 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 5SzdMoqbnVt1; Wed, 12 Jun 2024 08:20:04 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718194804;
	bh=hams3tDzyOgLdRtdhPicGhJSgF2Fx3TGq11heF/U1yE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Zz+J1FRTzB8J8wxNCwVfDOENdUUlZJRBWcFaDajHg38gNHgdbA3kaxzt5mA/nM1bj
	 /uzoS238uV45494poZY85HD+zKlWY76kkMEh+BPFSmA+u3m6jY936wpA+kbO0YAbe3
	 mBr5ELS7CdQJk77x8lg2zSKIR6o+eEuwjEyWeV9k=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 679491286D85;
	Wed, 12 Jun 2024 08:20:04 -0400 (EDT)
Message-ID: <8bce2394bc209f1bae708d51c8a233850db699bb.camel@HansenPartnership.com>
Subject: Re: SVSM Development Call - June 12th, 2024
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, 
	"linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>, "svsm-devel@coconut-svsm.dev"
	 <svsm-devel@coconut-svsm.dev>
Cc: "joro@8bytes.org" <joro@8bytes.org>
Date: Wed, 12 Jun 2024 08:20:03 -0400
In-Reply-To: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
References: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2024-06-11 at 20:46 +0000, Claudio Siqueira de Carvalho wrote:
> Hi,
> 
> I would like to add two topics to the SVSM meeting agenda:
> 
> - What does TPM locality[1] mean for the SVSM vTPM?

Well, unlike the physical TPM, which is locked to locality zero unless
you do a dynamic launch, the SVSM vTPM protocol supports any locality
(in that way it's the same as a vTPM attached to a VM).  This would
allow us to operate userspace and the kernel at different localities
meaning there could be key sealing policies that won't allow a key to
unseal in the userspace locality (i.e. kernel only).  Adding
functionality like this doesn't require the SVSM to police localities
(the kernel does it).

Policing localities is more problematic for the SVSM.  It means that
the SVSM must ensure that a particular locality request comes from a
particular trust level.  For instance in a dynamic launch, the TIS TPM
polices localities by replicating register access pages (one for each
locality) and then the chipset blocks access to some of them as the
boot continues.

The problem for the SVSM-vTPM is that it's hard to employ this type of
access sealing mechanism without an additional command and enlightening
all the OS components to use it, so unless there's a reason to reserve
a locality exclusively for the SVSM (say to unseal a provided secret
only for it) 

> - Is there any SVSM boot event that we want to record in the TPM
> PCRs/Event log?
> E.g. a SVSM configuration, the OVMF hash, etc

OVMF records all the mandatory TCG measured boot events, including its
own measurement.  This, unfortunately, includes the static core root of
trust (SCRT) measurement, which is supposed to be the first entry.  We
could still add preceding SVSM measurements, but this would be a
technical spec violation.

Probably what needs to happen is that the SVSM-vTPM should be
responsible for the SCRT Measurement and OVMF should detect the
presence of the SVSM and assume it's been done.  That would give us
scope for adding the SVSM configuration to the SCRT measurement.

Regards,

James


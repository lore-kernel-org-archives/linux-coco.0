Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D4B16F0F3
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195344; cv=none; b=toUffLWnp6DS4bu4jNGl+SziySlhG8/HW2njSB+QnqsseHl4QpNGNHRzDQANV6zB5svHxMOfeHotabRVombGzGSiAG2CQQ5WNhDvZqqayqAWsjGPLSaRxYwqHjnhwaNlt7/m5opOhKW7SW1fuIE44Y3IMJKyKVF6IDjCquhZ518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195344; c=relaxed/simple;
	bh=Xbep88JtYZ1Hn7y0EXwEdcL8Q0/y90+n3a2gCvzA48w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qZlFDFOnO6aKO235PFwOPIIJWnUDrCNOst7CW/uk8lPwIBytMqUS/2siSnZ9awXSWyvhRkQOqkZeS0Ob5YyJPmtOHJjGqvNpYmnDLEf0zzRDHdugg6ePPPzzEO7I7lIU/6T+Xof8fVaizCpW8+egAdtLZ/z3moZCGxR9XP9lOBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=fCfcP6LW; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=fCfcP6LW; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="fCfcP6LW";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="fCfcP6LW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718195342;
	bh=Xbep88JtYZ1Hn7y0EXwEdcL8Q0/y90+n3a2gCvzA48w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=fCfcP6LWiS7FNOL71PQxSy3S4tbBqjcmL2qDiMG1yc1lyL6FP9OqpatFWUfvzdOm4
	 CYXbi2Kq5waxfdOeEOqd+Qs2DwgVU4rJm6tzBj6ZoafR+Wxy9YmncpBSb1P4zp4aIT
	 P1vgVdjy850HjUVayehq56zHiuDkaHJn8Ub7m/PI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 4D2B61287A8D;
	Wed, 12 Jun 2024 08:29:02 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id s0FI-gzEzSVB; Wed, 12 Jun 2024 08:29:02 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718195342;
	bh=Xbep88JtYZ1Hn7y0EXwEdcL8Q0/y90+n3a2gCvzA48w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=fCfcP6LWiS7FNOL71PQxSy3S4tbBqjcmL2qDiMG1yc1lyL6FP9OqpatFWUfvzdOm4
	 CYXbi2Kq5waxfdOeEOqd+Qs2DwgVU4rJm6tzBj6ZoafR+Wxy9YmncpBSb1P4zp4aIT
	 P1vgVdjy850HjUVayehq56zHiuDkaHJn8Ub7m/PI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id AB6C81287A74;
	Wed, 12 Jun 2024 08:29:01 -0400 (EDT)
Message-ID: <c6d4a4a0cf6f2316d9a6965d9087d3b40761b894.camel@HansenPartnership.com>
Subject: Re: [svsm-devel] SVSM Development Call - June 12th, 2024
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Claudio Siqueira de Carvalho
	 <cclaudio@ibm.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"svsm-devel@coconut-svsm.dev"
	 <svsm-devel@coconut-svsm.dev>
Date: Wed, 12 Jun 2024 08:29:00 -0400
In-Reply-To: <CAGxU2F43hwr3pJjS-MdOjyVrZ5tQTG3W==vDTJmgd3YhPKr86Q@mail.gmail.com>
References: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
	 <CAGxU2F43hwr3pJjS-MdOjyVrZ5tQTG3W==vDTJmgd3YhPKr86Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2024-06-12 at 12:00 +0200, Stefano Garzarella wrote:
> Hi Claudio,
> 
> On Tue, Jun 11, 2024 at 10:46 PM Claudio Siqueira de Carvalho
> <cclaudio@ibm.com> wrote:
> > 
> > Hi,
> > 
> > I would like to add two topics to the SVSM meeting agenda:
> 
> I won't be able to participate in today's call because I'm on my way
> to Brno for DevConf, so I post a few thoughts below.
> 
> > 
> > - What does TPM locality[1] mean for the SVSM vTPM?
> 
> Interesting, IIUC an example could be to use different "localities"
> for SVSM itself, edk2, kernel, etc.  right ?
> 
> > - Is there any SVSM boot event that we want to record in the TPM
> > PCRs/Event log? E.g. a SVSM configuration, the OVMF hash, etc
> 
> Talking with Daniel, it seems that now EDK2 is self-measuring itself
> in PCR0, so maybe it would be better to do this in SVSM.
> So it would be nice to have SVSM measuring itself in PCR0, SVSM
> measuring EDK2 in PCR0, and EDK2 stopping doing it.

Actually, that's not quite how it should work.  edk2 has a 3 phase
measurement sequence: the SEC phase which is the current static root of
trust adds a self measurement then measures PEI (actually this is a bit
of a lie: that's what the spec says EFI is supposed to do, but not what
OVMF actually does because SEC originally didn't have the cryptographic
ability to do a measurement) and hands off to it.  PEI eventually
measures DXE and hands off to it.  To keep the sequence correct, the
SVSM-vTPM should really only measure SEC before handing off to it.

What really happens is that PEI adds both the SCRT measurement and its
own measurement and then measures DXE.  I've asked several times if we
could fix this, because it really is a measured boot hole.

James


Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [104.223.66.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4E21A83E1
	for <linux-coco@lists.linux.dev>; Tue,  7 Jan 2025 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.223.66.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736291298; cv=none; b=Vq2T/kJCJrgkhF1m1tQzP6WVXwsdFEvBIDwsxYqlyx6nIlqgp3jFERysfT+/WBsrm2Yf263a0Q8HxP3pleoVlhIsFC+iXGjFirvg0GPq6mrln0kNptAKW/Tof/QJEk6LQOFqbWOD4TnxEbDf/MldO2jX5/qVdzVuwKLQWnNFZmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736291298; c=relaxed/simple;
	bh=HMiBiA/wjEFCDapYSNMC3e5iiTOK3Q/ehnaOFjFPa6A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llgArgm7nn51HgV44D/wRsXkubH10bl8tkp/h9gvAtiKDCwCwCxEaaeqfV/nnelXhmcfqMzoF589eYe3cM70g5HpPTCAd+ZjoWBGT7a9MksHG5xB10zQxDrlu8lTM4EO4rW8pIusrbhBTNAmmOfpWMmCOMpejvKQ+E483zwT+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=LZm99slU; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=D4rO+6HB; arc=none smtp.client-ip=104.223.66.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="LZm99slU";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="D4rO+6HB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1736291295;
	bh=HMiBiA/wjEFCDapYSNMC3e5iiTOK3Q/ehnaOFjFPa6A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=LZm99slUT244knZxktmV8kPO1+A9SHCFMZPGvoReI0A29QTuPzWUShpNMoGpa1CfZ
	 nqQ0TXtCKrvlxm2WWCJOJZTcE67ji7GArCAHajngBnyxlGoCeOz9v4CY/GJX9XAYdz
	 wn242izfEi9QB4te1KOROiAxM8qPUu80AY/0Dv6g=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 179511281748;
	Tue, 07 Jan 2025 18:08:15 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id QrRERlSBUCaa; Tue,  7 Jan 2025 18:08:15 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1736291294;
	bh=HMiBiA/wjEFCDapYSNMC3e5iiTOK3Q/ehnaOFjFPa6A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=D4rO+6HBLbHFTPaw5Je5oPFmGZ3EbwtUQj3b1oZUKhm0hTVewUAGYAUzxL8CbU76I
	 Cm7cn1RofIVxOt/8tM5ViyOHUIg2Kfuj/EFwOrbzDo94MOaQ9NWrKnDSZvRtzJFwLo
	 KYi6BRtcrhRlUHog1x7KqcMBPOuddB3+kzjrjXrg=
Received: from [10.106.168.49] (unknown [167.220.100.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 83A7A1281745;
	Tue, 07 Jan 2025 18:08:14 -0500 (EST)
Message-ID: <06c94a892ce95aa043b6afaf3e61f8ee2b3010e8.camel@HansenPartnership.com>
Subject: Re: [svsm-devel] SVSM Development Call January 8th, 2025
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, 
	=?ISO-8859-1?Q?J=F6rg_R=F6del?=
	 <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Date: Tue, 07 Jan 2025 15:08:13 -0800
In-Reply-To: <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
References: <Z31OYDtmN3DRe3oN@8bytes.org>
	 <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2025-01-07 at 08:26 -0800, Dionna Amalie Glaze wrote:
> On Tue, Jan 7, 2025 at 7:55 AM Jörg Rödel <joro@8bytes.org> wrote:
> > 
> > Hi,
> > 
> > Happy new year everyone!
> > 
> > Here is the usual call for agenda items for the first SVSM
> > development
> > call in 2025.  Please send me any agenda items you have in mind or
> > raise
> > them in the meeting.
> > 
> > I have one item on the agenda so far:
> > 
> >         * IGVM support for QEMU.
> 
> Regarding this, I'd like to make sure we cover the topic of MSFT
> donating the IGVM spec and implementation to the CCC for appropriate
> open governance.

The spec isn't really separated from the code: it's all one thing.  I
think in principle this document along side code is a good thing and we
want to keep it that way, so you're in effect asking to move this
entire repo:

https://github.com/microsoft/igvm

The IGVM format is designed to be useful beyond simply confidential
computing for multiple different virtual machine images, so even if we
were to move it, I'm not sure the CCC would be the best place to
guarantee that universality.

>  We're institutionally blocked without a significant approval chain
> to provide code to competitor companies.

This sounds a bit like an internal Google problem; I may be able to
help you with this, but I think it's been a while since I engaged
Google legal on open source.  However, the main argument for you to
deploy is that for open source the whole point is to collaborate with
your competitors in the open and you should be empowered to do that.

>  Keeping the tools Coconut-SVSM and Qemu uses under Microsoft is an
> inversion of power, even with the MIT license.

You mean simply by hosting it under our external github account?  It's
where we incubate all our open source projects that accept outside
contributions (and where we hope to openly demonstrate stewardship
worthy of community trust) and I believe Google does something similar.
All corporations tread this fine line: if the project accretes a
vibrant community, we'd likely be happy to move it elsewhere, but we
equally don't want to be accused of simply throwing code over the wall,
which is why we incubate projects to see how they progress.

Regards,

James

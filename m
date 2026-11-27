Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766299;
	b=QwmWiKYVx91IWWD/ah1Xi5vzLWS6tdVysWki1G67cHJD2ee98NMeyj7YWCl2wtz06hno
	 lMoDeVkcWv1JFjXUXfUrqnh0wb65z4SOfdHBN0NVCpU4cLPDdG0pJs+ol7f7KFTAjL6an
	 lxAmu2S6uFo6dK/aindqzkPrk7BxCika8SCKU4tQREYz1+hudDvW3pIH3Ak3bV0/NX4YH
	 7UuNjIgOTYww+aFWZbd/mZaYf63vErV3llbVyyvgvDc5eLSV+hgGdMjSK7LdmiZTWqZfm
	 JfZ6o+U6PMhqETWR3Dhoa4DyGIlcIQvAnzsT3QoYHXE1LPf/Lp/1/cNvfJd9hFx9UKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766299;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=vojZeN+CXnWfVFY7/b8MlqBoq/cuPVXbAcITrAcerRs=;
	b=Zl5BHyoUC/JkytrNzlgyE2nKZADRajGezCUNTMeVAPknuweT+qWiC6D6r/8LXoCa2MJ8
	 e1Qo3jv+SswZlIoL/KUnzyWTCNWPOW30uLvOk9zpmKwAC1f8gK35E/GXrdTfPoqtF/nWI
	 /3+73MZnwjMANzWdIo2dLVkZUuwIfrZcbnR7EIeV/Y/VV0tOZzht3mMxVivcoFyJSarGS
	 szpyFk+BdbAbZTXk5uhz2QTv7jNqlxXRtvipfP2kqkhj6JjRf6UvaEok9QVYAA0WBG9zX
	 c5nREBhNSx8pbRbPVAZAvCLe2lf6GQntBZlOKWNnnxvECmlfsmPvIGlse1wO9NwSu1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="co4H0/El";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DF0606A31C
	for <linux-coco@lists.linux.dev>; Fri, 27 Nov 2026 07:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=co4H0/El
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795766297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vojZeN+CXnWfVFY7/b8MlqBoq/cuPVXbAcITrAcerRs=;
	b=co4H0/ElDv3ZbcP5qW0xwR6pa29QFD9igwZqwjCqH+GscygifpJIC573k0D+8OcaiBvew/
	F9Jam9DHjvWufgm3cwBlaF1ouphhJn+eYIU1z9bd2C8lDNkfFHdwxwBJRB2+F4QHeldXC7
	BvhtkB8CJfPS+8wGZKTWqdeK1QT4YJ0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-_ixdUWBeO2Kk9Dw4ZRBGCQ-1; Fri,
 27 Nov 2026 07:58:14 +0000
X-MC-Unique: _ixdUWBeO2Kk9Dw4ZRBGCQ-1
X-Mimecast-MFC-AGG-ID: _ixdUWBeO2Kk9Dw4ZRBGCQ_1795766293
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0C6618002CE;
	Fri, 27 Nov 2026 07:58:12 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C5241956042;
	Fri, 27 Nov 2026 07:58:12 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
	id 0D49D40774E0; Fri, 27 Nov 2026 08:58:09 +0100 (CET)
Date: Fri, 27 Nov 2026 08:58:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	Mahmoud Nagy Adam <madam@amd.com>, coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
Message-ID: <awkz05_7U4lmN17K@nucbdw.ghoffman.csb.home.kraxel.org>
References: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
 <65vkyfqwo92zb.fsf@amd.com>
 <awglpsRXwJRS7aa5@8bytes.org>
 <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XJi5VdR78GifRLm1O8qihSeeB1GLQhlFZXvHfxcXqHs_1795766293
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> > Also Debian stable uses Rust 1.85, COCONUT is already on 1.88 with
> > the aim to go to 1.91.
> 
> Well that's only because of this:
> 
> https://github.com/coconut-svsm/svsm/pull/1277
> 
> And the rationale is dependency on this project
> 
> https://gitlab.com/kraxel/virt-firmware-rs
> 
> requires it to pull in a bug fix, but if I look through the commit logs
> of the latter I can't figure out why (presumably Gerd or Luigi can
> explain);

uefi-rs (which virt-firmware-rs depends on) raised the bar.  The
dependency update pulled this in.  Note that virt-firmware-rs does
not require the latest version ...

	uefi = { version = ">= 0.39, < 0.42" }
	uefi-raw = { version = ">= 0.15, < 0.18" }

... so pinning uefi + uefi-rs to an older version in coconut should
work for now.

It is unclear how long that will hold though.  There have been
incompatible changes which affected virt-firmware-rs in the past, most
recent was the 0.38 -> 0.39 update (which why 0.39 is the oldest
supported version).  It will probably happen again in the future ...

take care,
  Gerd


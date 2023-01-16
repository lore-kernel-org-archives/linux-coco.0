Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9959A6FA3
	for <linux-coco@lists.linux.dev>; Mon, 16 Jan 2023 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673889187;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uMsVAzG3a8I8ARu1tKnXPbB3N/X2KfewRtrXmjTlYwg=;
	b=cHz/0e8G8wAupvyAfjYXehbclcrFu0hlOo0sjltgVnrM4IQcsCVrF7IL1/EysHWFUVWU8I
	f44zrJUCn2NvT/gyHfG2KYaScK09tfey4rAVnXkLux67cB3hO8Rq3ZPPCiAqm9aF+hfMIz
	cID3k4T0Cc+Fxe1zi3lQqIkGe/6RKtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Spzfx93RPMmhwP8IKzEClg-1; Mon, 16 Jan 2023 12:13:04 -0500
X-MC-Unique: Spzfx93RPMmhwP8IKzEClg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC5F8802D2A;
	Mon, 16 Jan 2023 17:13:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 306FA2026D4B;
	Mon, 16 Jan 2023 17:13:03 +0000 (UTC)
Date: Mon, 16 Jan 2023 17:13:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: James Bottomley <jejb@linux.ibm.com>, linux-coco@lists.linux.dev,
	amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8WFnFAzPrFiDHNP@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <Y8Gi0KLj5JbhCqBE@redhat.com>
 <Y8Lhd/H4yGTsOM/+@suse.de>
 <45342f9ca1170817b2f741b35a5b0b2c85dc72c6.camel@linux.ibm.com>
 <Y8WBmNVD8DuRQuC2@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y8WBmNVD8DuRQuC2@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 16, 2023 at 05:55:52PM +0100, Jörg Rödel wrote:
> On Sat, Jan 14, 2023 at 01:22:41PM -0500, James Bottomley wrote:
> > On Sat, 2023-01-14 at 18:08 +0100, Jörg Rödel wrote:
> > 
> > [...]
> > > As James also said, the measurement to unlock secrets need to include
> > > all software/data components up to the point where the encrypted disk
> > > gets mounted.
> > 
> > Well, we have a prototype in IBM Research using keylime to do this
> > based on the vTPM measurements.  We currently bring up a network
> > interface inside the initrd to run the keylime agent, but if you're
> > already inventing a non-network method for attestation, there's no
> > reason we couldn't transport TPM quotes over it as well.
> 
> So you are unlocking the disk via keylime remote attestation. This means
> you need a measured initrd, right?
> 
> We were thinking about doing disk-unlocking via TPM in Grub, but that
> has the problem that we need to securely deploy the TPM state at SVSM
> init-time.

IMHO it is undesirable to build a reliance on a specific bootloader.

My desire is that we have the stateful TPM in SVSM, such that once
the UEFI firmware starts everything functions identically to how
it would in bare metal or non-confidential VMs with a TPM. eg the
ability to use all the normal Linux tools, and especially the
standard systemd integration with LUKS and TPMs.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


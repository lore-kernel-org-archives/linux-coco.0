Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CAC1852
	for <linux-coco@lists.linux.dev>; Mon, 16 Jan 2023 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673861810;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Bi5dXMuq/Q807tEZT2CrUnTv7nwvT07rfVZCS8RyCHM=;
	b=hPXeHeeprhS3R8QOr+6gisBYYQpNrBAySk2t0Thsd/oSRrbMcJtJqbMtnQZFs5yvHKO/F3
	0q+o9+pimhe1yxCxs3H8r297KgBHBlkQR58yCgjf4wRmNumKQNZMdQ36mt2BxEPTT4Nav5
	tHmvwMWhF/R1rYsXsWlborgWY/1QDD4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-35xGAfadO9Wipv_26A9HXw-1; Mon, 16 Jan 2023 04:36:48 -0500
X-MC-Unique: 35xGAfadO9Wipv_26A9HXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30D072A5955A;
	Mon, 16 Jan 2023 09:36:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA762026D4B;
	Mon, 16 Jan 2023 09:36:46 +0000 (UTC)
Date: Mon, 16 Jan 2023 09:36:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8UaqpLzyznAQl7D@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <Y8Gi0KLj5JbhCqBE@redhat.com>
 <CAAH4kHb=3nrAMR3GvpvyG0y__-USmZgV=FBSqtecw+ECXXoqpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAH4kHb=3nrAMR3GvpvyG0y__-USmZgV=FBSqtecw+ECXXoqpQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jan 13, 2023 at 10:52:57AM -0800, Dionna Amalie Glaze wrote:
> >
> > Aside from what James' says, one option is to lockdown the OVMF and
> > secureboot chain. eg OVMF built with SecureBoot=on, and instead of
> > having the generic Microsoft keys enrolled, have a distro specific
> > key enrolled. That distro key would have to be one that is only
> > used for signing UKIs (Unified Kernel Images), and the initrd embedded
> > in the UKI would need to be designed abort if it finds the disk is
> > not encrypted.
> >
> 
> IIUC, the disk doesn't need to be encrypted, it needs integrity. We
> can't treat booting to an encrypted disk as booting to the expected
> encrypted disk.

The attacker does not know the keyslot passphrase for the expected
encrypted disk. Thus if the initrd successfully unlocks the root
disk keyslot, we know it was presented the expected one. The only
serious attack is for the encrypted disk to be substituted with an
unencrypted disk, which can be handled by having the initrd refuse
to boot with any unencrypted root disk.

Other attacks on the encrypted disk such as tampering with the
cipher text would be mere denial of service. Use of LUKS AEAD
ciphers would mitigate that, but other integrity checking layers
can work too.

> The secret-holding server should only ever release secrets encrypted
> by an attested vTPM binary (SVSM-generated public key) that has sealed
> the secret to the workload PCRs.
> This kicks the problem to the server and VM having pre-agreed on
> what's the expected combination of OVMF and SVSM. So yes the vTPM gets
> its core secret transferred to it before the PCRs get set to the
> expected values, but that's part of the attestation dance with the
> initial registration with the secret-holding server.

To be clear, I think the vTPM is a good thing, but it does not look
like it is mandatory to me. If you lock down your firmware and initrd
sufficiently strict in its impl, a vTPM is not a blocker. What a vTPM
does is make the system much more flexible, since you can come up with
a wide variety of PCR policies for tieing unlock to. When not having a
vTPM you're effectively having to rely on one very specific policy that
is hardcoded through initrd/firmware impl.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


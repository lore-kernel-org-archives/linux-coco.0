Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2FB17D2
	for <linux-coco@lists.linux.dev>; Fri, 20 Jan 2023 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674205055;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umvuJM62uEMJ6d5/kJcv7+1mZtYkeabzjWGmSGafJnA=;
	b=a8jtXydHb9R37w+3RldaTs9l2Zy5NB5mIGGN+iC2oiMxl+TRdUhqUgqY7L1BRNyOli8bUf
	bemyKUdj2AVpJ6ffOlrulf7D6an9SM35HTeS+ub41LdIGW4Ng5aIe5ONHThmUvT4wRXrej
	6MAoNpp+z6AmcMeUY4Q5ZpW/ysPc2LI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-7jq5TwVDMcWnCKB_PEe3oQ-1; Fri, 20 Jan 2023 03:57:33 -0500
X-MC-Unique: 7jq5TwVDMcWnCKB_PEe3oQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 736542801E4F;
	Fri, 20 Jan 2023 08:57:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE90140EBF6;
	Fri, 20 Jan 2023 08:57:31 +0000 (UTC)
Date: Fri, 20 Jan 2023 08:57:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: James Bottomley <jejb@linux.ibm.com>,
	Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8pXeZHY+bKQDen2@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
 <Y8mztTGpZbWi89sn@suse.de>
 <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>
 <Y8pSzx1g8THT3rnC@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y8pSzx1g8THT3rnC@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jan 20, 2023 at 09:37:35AM +0100, Jörg Rödel wrote:
> On Thu, Jan 19, 2023 at 04:29:23PM -0500, James Bottomley wrote:
> > How can they stay there?  Even if the SVSM is the point of first
> > contact to receive the secret, it must give the secret to higher VMPLs
> > to try the mount, so the higher VMPLs have to destroy the secret they
> > were given on failure.
> 
> My thinking was that the SVSM will only hand out the secrets once the
> code in higher VMPLs has proven itself to be trusted. But it is possible
> for an attacker to create an image with the expected parts to get the
> measurements right and then use a fall-back mount if decryption fails to
> steal the secret.

With a vTPM, and systemd-pcrphase.service, it is possible to seal
secrets to prevent such an attack, by including phase=initrd in
the sealing PCRs. IOW, nothing after the initrd can unseal the
secrets, even if a different filesystem mount was substituted.

Secrets that are needed /after/ the root FS is mounted (eg SSH
host key, Apache HTTP certs) can be sealed with a PCR set that
covers the LUKS master key hash, so that they can only be acccessed
if the correct rootfs was unlocked.

In the vTPM case, the guest owner is deciding policy when they
seal secrets to the vTPM during guest provisioning initially.
If we try to support a scenario without a vTPM, then the guest
owner has to determine policy by using a carefully built initrd
that does not do any fallbacks, and they have to rely on having
a known firmware with a particular set to certs enrolled, which
has support implications for public clouds. Much less flexible.
 
> But such mount fallbacks a generally a bad idea in a CVM.

Yep, but hopefully not fatal, if the user picks a suitable set
of PCRs for sealing data.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


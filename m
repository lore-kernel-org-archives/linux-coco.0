Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3920FE
	for <linux-coco@lists.linux.dev>; Fri, 20 Jan 2023 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674219068;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxakAMlHi4bGtI2eB2T3cQdANZ0SSQyaH779tdj1MBs=;
	b=QAh4JP92/TUPXBknlRCVxi3QKa0+dJ/0J/Nq9oiffJNxd9b8m713+HMAaxAXCRfEgnP6Pg
	CMszsrRZP0isYw+sUjcC2BU66bp4kl0geARSCePKDQ0AUd8sZy5zcWatr2+16IXNoTKFQo
	ZnBXtx1CbFGO+6q2tnHK90fY9V5vSJY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-1rl0OJ23MnmbRS9X5XMozw-1; Fri, 20 Jan 2023 07:51:07 -0500
X-MC-Unique: 1rl0OJ23MnmbRS9X5XMozw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F8F138149C9;
	Fri, 20 Jan 2023 12:51:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A9740C2064;
	Fri, 20 Jan 2023 12:51:06 +0000 (UTC)
Date: Fri, 20 Jan 2023 12:51:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
	Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8qON8v5DmB+u9u3@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
 <Y8mztTGpZbWi89sn@suse.de>
 <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>
 <Y8pSzx1g8THT3rnC@suse.de>
 <Y8pXeZHY+bKQDen2@redhat.com>
 <4086b1c3fc3f68b0dd0b0b9acf0c22256022efa1.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4086b1c3fc3f68b0dd0b0b9acf0c22256022efa1.camel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jan 20, 2023 at 07:39:30AM -0500, James Bottomley wrote:
> On Fri, 2023-01-20 at 08:57 +0000, Daniel P. Berrangé wrote:
> > On Fri, Jan 20, 2023 at 09:37:35AM +0100, Jörg Rödel wrote:
> > > On Thu, Jan 19, 2023 at 04:29:23PM -0500, James Bottomley wrote:
> > > > How can they stay there?  Even if the SVSM is the point of first
> > > > contact to receive the secret, it must give the secret to higher
> > > > VMPLs
> > > > to try the mount, so the higher VMPLs have to destroy the secret
> > > > they
> > > > were given on failure.
> > > 
> > > My thinking was that the SVSM will only hand out the secrets once
> > > the
> > > code in higher VMPLs has proven itself to be trusted. But it is
> > > possible
> > > for an attacker to create an image with the expected parts to get
> > > the
> > > measurements right and then use a fall-back mount if decryption
> > > fails to
> > > steal the secret.
> > 
> > With a vTPM, and systemd-pcrphase.service, it is possible to seal
> > secrets to prevent such an attack, by including phase=initrd in
> > the sealing PCRs. IOW, nothing after the initrd can unseal the
> > secrets, even if a different filesystem mount was substituted.
> > 
> > Secrets that are needed /after/ the root FS is mounted (eg SSH
> > host key, Apache HTTP certs) can be sealed with a PCR set that
> > covers the LUKS master key hash, so that they can only be acccessed
> > if the correct rootfs was unlocked.
> 
> But that provides no additional security: the LUKS master hash is just
> a hash of an area on the disk which anyone controlling the device can
> see.  I can duplicate this area and still substitute my own volume
> (which would still fail to decrypt when presented with the key), so the
> trusted mounting component sill has to correctly handle the failure
> case.

Yes, it would have to be a hash that is different from the
hash that's exposed in clear text in the LUKS header. For
example it could be hash(master_key || uuid). 


> > In the vTPM case, the guest owner is deciding policy when they
> > seal secrets to the vTPM during guest provisioning initially.
> > If we try to support a scenario without a vTPM, then the guest
> > owner has to determine policy by using a carefully built initrd
> > that does not do any fallbacks, and they have to rely on having
> > a known firmware with a particular set to certs enrolled, which
> > has support implications for public clouds. Much less flexible.
> >  
> > > But such mount fallbacks a generally a bad idea in a CVM.
> > 
> > Yep, but hopefully not fatal, if the user picks a suitable set
> > of PCRs for sealing data.
> 
> You can't rely only on PCRs for this because they don't contain enough
> information, you must code the correct policy into the trusted mount
> component as well.

Well it entirely depends on what info is being measured into the
PCRs. If what systemd measures into PCRs in the initrd is not
sufficient to allow safe sealing policies, we can request further
info.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


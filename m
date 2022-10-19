Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431AA2F22
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666184726;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTNFvEG//zBPj6R1U2b0d19z9rKo/12vOaSti5Nvo9w=;
	b=AuR35EGXPb1U8IUZvyhqDVt2vP7rPa2EagsB2O5VH2O38EMXLU2B3KFckvHEa/zc3TUiW0
	2euPJTiObOZbV1YFpOhtvGvTFkaxart1HnTSYLGBC4/T1Xr6ptK5mmMppxWnqO7n+DVO+6
	6KzUk4oO8KNl7og2QUXDO3kdL4XUODk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-Lb6_BZI6NYaw0Jjb3agNMg-1; Wed, 19 Oct 2022 09:05:23 -0400
X-MC-Unique: Lb6_BZI6NYaw0Jjb3agNMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90216101245D;
	Wed, 19 Oct 2022 13:05:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B8F5C15BB4;
	Wed, 19 Oct 2022 13:05:21 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:05:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Christophe de Dinechin <cdupontd@redhat.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: SVSM vTPM specification
Message-ID: <Y0/2D93P/xgp1sU9@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
 <Y0+wcWgcRFTiDTNk@redhat.com>
 <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 19, 2022 at 08:38:19AM -0400, James Bottomley wrote:
> On Wed, 2022-10-19 at 09:08 +0100, Daniel P. Berrangé wrote:
> > I'd be inclined to not rely on guest networking, and probably even
> > strictly decouple what the SVSM does to communicate, from any
> > specific attestation server connection protocol or details.
> 
> I think we should be clear: if you need a secret at start of day,
> before the guest boots, then you need to retrieve an attestation from
> the SVSM and inject a secret.  If you can delay needing the secret
> until after boot (say for data volumes) then you can use the cloud
> standard methods we have today (which actually do mostly operate over
> the guest network path) and a TPM which manufactures on boot.
> 
> However, the above mechanism is out of scope for the vTPM project. 
> This is simply about putting a vTPM into the SVSM which appears in the
> guest as a TPM and providing a guest API to retrieve its attestation. 
> So the scope of the project ends there.
> 
> If we want a TPM with persistent state, then the state has to be
> injected pre-boot but that is the same pre-boot problem as all secret
> injection.  I think there should be a separate project working on this
> and we'll make sure they interlock correctly.
> 
> So I think there are three pieces
> 
>    1. Ephemeral vTPM with attestation retrieved from guest
>    2. Attestation and injection API from SVSM to host/guest end point
>    3. SVSM API for saving TPM state
> 
> We'll work initially on 1. Someone else can work on 2. but we'll make
> sure they fit together.  3. would be required for full TPM emulation,
> but might not be required if all we want is persistence of the seeds of
> the TPM, so this would be evaluated when we have 1+2.

Yes, that all makes sense to me as a division of concepts & work.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


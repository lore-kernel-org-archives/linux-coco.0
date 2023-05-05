Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F3A8BE0
	for <linux-coco@lists.linux.dev>; Fri,  5 May 2023 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683301673;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQobjkXCgk5uy3vBplD0U6FyzeEdp0Sx4RLjpDbb7I8=;
	b=UPKm+XTBu+5S3ezawvFbQofYWIjj6ZOFN9oNS3ZLofLs23y3wfvSVLO57I14m3Cd/dGiMK
	Ph57iqG7jaL8Tg4fJaK91gNVJaiC7HlG0Yn6rnw2zteiAyqdUg/t6t5raIoyOcULubnGbl
	tqQ/rq5NhKkTXMy6YUSdBYLjHrRcDMU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-l-v661S2Ooy26swHv9Pw_g-1; Fri, 05 May 2023 11:47:52 -0400
X-MC-Unique: l-v661S2Ooy26swHv9Pw_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A3A53815EED;
	Fri,  5 May 2023 15:47:52 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA78E1121331;
	Fri,  5 May 2023 15:47:50 +0000 (UTC)
Date: Fri, 5 May 2023 16:47:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, amd-sev-snp@lists.suse.com,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao@amd.com>,
	Klaus Kiwi <kkiwi@redhat.com>
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZFUlJOFZvrNEjV1N@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <ZBl4592947wC7WKI@suse.de>
 <4420d7e5-d05f-8c31-a0f2-587ebb7eaa20@amd.com>
 <ZFJTDtMK0QqXK5+E@suse.de>
 <cc22183359d107dc0be58b4f9509c8d785313879.camel@linux.ibm.com>
 <ZFUh/KlLXJF+2hoJ@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZFUh/KlLXJF+2hoJ@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

On Fri, May 05, 2023 at 05:34:20PM +0200, Jörg Rödel wrote:
> Hi Claudio,
> 
> On Wed, May 03, 2023 at 12:51:17PM -0400, Claudio Carvalho wrote:
> > Thanks. I would be happy to collaborate in that discussion.
> 
> Great, I will send out that email early next week to get the discussion
> rolling.
> 
> > I think the crypto support requires more design discussion since it is required
> > in multiple places.
> > 
> > The experience I've had adding SVSM-vTPM support is that the SVSM needs crypto
> > for requesting an attestation report (SNP_GUEST_REQUEST messages sent to the
> > security processor PSP have to be encrypted with AES_GCM) and the vTPM also
> > needs crypto for the TPM crypto operations. We could just duplicate the crypto
> > library, or find a way to share it (e.g. vdso approach).
> > 
> > For the SVSM, it would be rust code talking to the crypto library; for the vTPM
> > it would be the vTPM (most likely an existing C implementation) talking to the
> > crypto library.
> 
> Right, where to place and how to share the crypto code needs more
> discussion, there are multiple possible approaches. I have seen that you
> have a talk at KVM Forum, so we can meet there in a larger group and
> discuss those and other questions in person.

Yep, we should probably do a BoF session on the topic of SVSM
for anyone interested who's attending KVM Forum.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


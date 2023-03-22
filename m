Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6328F58
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679507884;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M64+Ax7Z1KLZxDdHoHWW0+vnpH6T6Y8a3gCnVFAODd8=;
	b=UsvGmmZVD4rSCAIPh3xHgkPNybis/7pW2SzGBqjMa9ee8+aGvKjBiF5BMMjSFnB6vygES+
	Z21ynPbBwFDcLgptlFqfISPPlGhGZAoubQCRYeWZHFyhKLN/WaonlK/ax9L1HGFr6KPk8y
	oKtvAxCtaZbz6JHvxrMk0eqoYQB8wjg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-fB22SGmqPHKLTcSoRANu8Q-1; Wed, 22 Mar 2023 13:57:59 -0400
X-MC-Unique: fB22SGmqPHKLTcSoRANu8Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73D383C218A1;
	Wed, 22 Mar 2023 17:57:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78C85492C13;
	Wed, 22 Mar 2023 17:57:57 +0000 (UTC)
Date: Wed, 22 Mar 2023 17:57:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Marc Orr <marcorr@google.com>
Cc: jejb@linux.ibm.com, =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
	amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBtBoy+KVo/TZ6pl@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <ZBl4592947wC7WKI@suse.de>
 <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
 <ZBmmjlNdBwVju6ib@suse.de>
 <c2e8af835723c453adaba4b66db533a158076bbf.camel@linux.ibm.com>
 <ZBnJ6ZCuQJTVMM8h@suse.de>
 <7d615af4c6a9e5eeb0337d98c9e9ddca6d2cbdef.camel@linux.ibm.com>
 <CAA03e5F=Giy5pWbcc9M+O+=FTqL0rrCWSzcgr8V2s-xqjpxKJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA03e5F=Giy5pWbcc9M+O+=FTqL0rrCWSzcgr8V2s-xqjpxKJA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

On Tue, Mar 21, 2023 at 06:29:29PM -0700, Marc Orr wrote:
> On Tue, Mar 21, 2023 at 1:05 PM James Bottomley <jejb@linux.ibm.com> wrote:
> >
> > > Of course we could start changing linux-svsm to support the same
> > > goals, but I think the end result will not be very different from
> > > what COCONUT looks now.
> >
> > That's entirely possible, so what are the chances of combining the
> > projects now so we don't get a split in community effort?
> 
> Very cool to see this announcement and read the discussion!
> 
> One SVSM will be better for Google too. Specifically:
> - One hypervisor/SVSM startup sequence is easier for us to get working
> - One SVSM is easier to test/qualify/deploy
> - Generally speaking, things will be easier for us if all SNP VMs
> start running off of the same "first mutable code". I.e., the same
> SVSM, UEFI, etc.

I agree with this from the Red Hat side. We would prefer there to
be a standard / common SVSM used by all [OSS] hypervisors/clouds,
to reduce permutations that guest OS vendors/tenants have to
develop/test/deploy against.

It looks like even developing one high quality feature rich SVSM
is a non-trivial undertaking, so I agree with James that it is
undesirable to divide community resources across many competing
impls, without a compelling justification.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


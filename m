Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B319476
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679508484;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bXYgdepoNjf1fNiYsqAn9Mk4kXYZoTvvj90n/CysB7A=;
	b=hkGHineyfhW9b8N0uXfMhIPFbZW20pvuNn/ay4DtVhOfHbm54S936g8cQTdlEECzi/m6Nc
	aYfoC0jga60bCt28mSwavv4XdadsTV4z/jPrhgICVsCaVLs+3TI76nuz7nyOaUEAjKx07t
	pLXg7B1nuEu99f8ymWVwrM5Cb9iGNYY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-LDVo1uBnMcqMDvJCMy-_-A-1; Wed, 22 Mar 2023 14:08:03 -0400
X-MC-Unique: LDVo1uBnMcqMDvJCMy-_-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBE42185A794;
	Wed, 22 Mar 2023 18:08:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD1040C845F;
	Wed, 22 Mar 2023 18:08:01 +0000 (UTC)
Date: Wed, 22 Mar 2023 18:07:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: James Bottomley <jejb@linux.ibm.com>, amd-sev-snp@lists.suse.com,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBtD/y1En3FqDYxw@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <ZBl4592947wC7WKI@suse.de>
 <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
 <ZBmmjlNdBwVju6ib@suse.de>
 <c2e8af835723c453adaba4b66db533a158076bbf.camel@linux.ibm.com>
 <ZBnJ6ZCuQJTVMM8h@suse.de>
 <7d615af4c6a9e5eeb0337d98c9e9ddca6d2cbdef.camel@linux.ibm.com>
 <ZBrHNW4//aA/ToEl@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBrHNW4//aA/ToEl@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

On Wed, Mar 22, 2023 at 10:15:33AM +0100, Jörg Rödel wrote:
> There is of course work building on linux-svsm out there, too. It would
> be interesting to get an overview of that. We are already looking into
> porting over the attestation code IBM wrote for linux-svsm (although we
> would prefer IBM submitting it :) ). The vTPM code out there can not be
> ported over as-is, as COCONUT will not link a whole TPM library in its
> code-base. But maybe it can be the base for a separate vTPM binary run
> by COCONUT.

For whichever SVSM impl becomes the dominant, the vTPM support with
persistence, is something I see as a critical component. It lets the
guest OS boot process at least be largely decoupled from the CVM
attestation process, and instead rely on the pre-existing support for
TPMs, SecureBoot & secret sealing which is common to bare metal and
non-confidential VM deployments alike. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6F370F8
	for <linux-coco@lists.linux.dev>; Wed,  7 Jun 2023 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686155103;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=FGwtRIbMcFmeTYRtPGQIyYyH4Cod/Wtufl6Lk6HVcRs=;
	b=GQTlQnSsCJ7AHu/ZNpngAXHMOt/XA67cKIitSEtBTmLeFiFpAlztRfe0TJL/4mBEQxnzHs
	xPpRSxweZKeUkyLx3GTJc1jmwgpuq9ZOXYJRal4EDkOQ30xDqqJeeEAAyfVlahnf1KBsEv
	ZWuEC8um9B8yYNM2KsrYLQoFM0LPwZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-5pQRKEsTPTuplaagXCEUEg-1; Wed, 07 Jun 2023 12:23:53 -0400
X-MC-Unique: 5pQRKEsTPTuplaagXCEUEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9320811E85;
	Wed,  7 Jun 2023 16:23:04 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.57])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 222809E8B;
	Wed,  7 Jun 2023 16:23:03 +0000 (UTC)
Date: Wed, 7 Jun 2023 17:23:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: linux-coco@lists.linux.dev,
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] virt: sevguest: Add support to get attestation
 report from SVSM
Message-ID: <ZICu5fmlC8QeqFbO@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230607150646.97208-1-dovmurik@linux.ibm.com>
 <20230607150646.97208-4-dovmurik@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230607150646.97208-4-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 07, 2023 at 06:06:46PM +0300, Dov Murik wrote:
> Expose SNP_SVSM_ATTEST_SERVICES ioctl function which allows userspace to
> retrieve SNP attestation report.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  drivers/virt/coco/sevguest/sevguest.c | 95 +++++++++++++++++++++++++++
>  include/uapi/linux/sev-guest.h        | 34 ++++++++++
>  2 files changed, 129 insertions(+)

Appreciate it is just an RFC right now, but the ioctl will eventually
need documenting at Documentation/virt/coco/sev-guest.rst

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694597;
	b=AYQhkbezRzOzIKGs6by1MQZEihlyXvHCjhQLjbUuC9lpDJCi4ASMIGWCLKmG3hFqhxO5
	 H1IMOykJenPvpbJxI3LmHNMDkMBxoaKy3tSgp9Z8dkYBW7xlGjyIUhfCiUkpuQuo9D4tw
	 uACbxTw6H5KCzDBfnjHtMQrpAfQCYkmaWBYvmp8RKOhD2SeUBMuuXBbpmGjaOSVMAQPP4
	 nOiNqqupLv8zJec5BsLQfMTQYnWS9Ynou8Bq8j8TPbistUZkUaNpInOUJsGB9JkT86AZU
	 cJ0cKaCOgaC+leChexQNnIxAHpAmMrIFtnRj2kQMVDnazfUkcA7/HQFDXftBcGg5+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
	b=2BigXxXzQe625JpK82tbNnOpiG5t1B5dvSPXR3esBU7YoD2EnayV/6Z1oAqZuLqDxOlI
	 n5Z8tJPnrrLEnn13uRDMvY/5RhViJ6ArDWkMmLQt+A2hC2fQ3yyWI038DgVATHbACTly+
	 eP3Oc1sBKMCAVo+XAiGa/VZLTN7MXsCyA5L2oi+YHDDWTh9M7H6dXcuE4FVMeXKIF9QjV
	 TpKFPcTh8LMgz+Y1GBV8znrbS1GOvK5Cs5BUO+rmw9xDevWnxfnx66QbMgeHI9WDtluBx
	 Ljn8hnO2+UNm5jgmlwF6SvcBkyP1CKeoX27jqvORv3NDA20wSEQNkqGiXzhK6uvE6hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ahhXS2ZD;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C7606A31B
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 18:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D3C7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ahhXS2ZD
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91bb5795792so2119916d6.2
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792694596; x=1793299396; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
        b=ahhXS2ZDZnabIDdRj4kzHG11HOEbr8XOe+nri46C+r1kXUL/buCyMSwpas/vDplEOy
         kUUQU/Ymre0j71qOd6NFq8BvFJzh9zc9ElE+g5iwqhZYAdetL4KYKE0pbyJqHb7wBn2y
         lM9+QTVnwvyZ3j7BSs4rmCFmkFscPWhnih41q9IcqLl31Y8iyTH0alnzWM4pC/KAle8k
         Gi/dcSaN/OHlhvwLOq1chK7QBADYlr//EzpKQWKQ+v/D5gLjyPPzf51/3ZKCAu1moQZz
         jZ/DyOQ0mdo00r7JFvhGBphYnvnA3XR+3HOGrbPf5BeNJhjcdWZLj8WPLmgLOENy8/pp
         NOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694596; x=1793299396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
        b=pwIH0o2W/cbl7d6MBAgQszx/hSeZvf/o7W0kkMywsQbCcfI42EzyYzayJ0PfO7jNp5
         z3a4yKzP+QLN5pSRVCkx2TD8RmW5DN+jDCgeeOlTskduDGA8CDAYLSxj1sWBAdh9GO1t
         Sa7Dtge4c5mWOYwN44aerZSM3k+LcDdTlfxb5oJL0Z5LwFxEfkukPShpLtmglKl/f3Ya
         qkdbK94qs21YoUjO+3R102Jxt+7Mbe56oeqWS/y8LNOcSAKHXAUDYJCiJI8OOGbEAfbZ
         yQ2YHQI5a88zZdo8hxYHFrCBsClFbekJYBSKfyz8NBAHS+vwIf4QkUcXuVrv+hXBogKe
         15rA==
X-Forwarded-Encrypted: i=1; AKwUvBwdazsRvPHJUkD57TQXkx9oKjJcpZtWlSO0d9Gss31dfSgfLh7H/qIG0r5g0Hc/wvYmIDgS7SD7zk4s@lists.linux.dev
X-Gm-Message-State: AFq9FYIQ7GuT/w0nGIWsCpQ/qeFNk/w8r5C58WdasdBms1jDnMQACvBr
	8F0Vn2fBW67EHAYQB9xbUEUyPmn7VcvuO6hn0cq3iQONp/8MZatCeCyuv58RtziOmYs=
X-Gm-Gg: AYBFou2IkVp00MFUdBpeB9UEeCEx4Pn3dnCjSs3Q7wvoYRZIcFo8pW0Nq/712GpvnIz
	2hN+UgF7wptp2nvjfiua2yZoMLT3c2chZg6OG6XdjyWy8OaeJcJfvq8XvJ+Q0S+4xhtLuoxwpnU
	1wGQMDf2q+dq/JMJIG4AOtwbZceceQEsSJbA7fyN1ziMGc6rxEsoitB/2rMuEkuEtv/SuVWFPq3
	KfPaAZct7/9SyIQ6eJDNPDe6yHDeMS/ExOSq1xBqUfUN02uYBWzGwih2nhkCqi6NQor7iUYi9zL
	5zTAWcAj/JA1t4l2xg4BbXvIFCvsJGibUAR2rTOiYKT7XZPk/3TiWZ72OovAAyZyMq/wo3R+EUr
	zvDhaqNR86GkYNWX87rEDvQzetvpAhgtBR6kgE/VwCdn7BBIgNDyaUSkoea89YnGDOk6Zc6yLcc
	t4lCAKIa1dzOa14zzwl1fHvJ9ujpIlNmnI4jJlcGbJ4Zma6ADAYZi+ARuHaWCfU0pAbfrCj278E
	MXm3tAUKil0GeuVu6BUKJ2/y3+JANGzZ95sLtTFPzDYR9CCxu84zg5XSnnFybU4m04UOB61Qd9x
	+5rWTCMy+96fVvVwvecM/crNdCAI9M7hkL0KlA==
X-Received: by 2002:ad4:4ee5:0:b0:91b:8b44:d4c7 with SMTP id 6a1803df08f44-91c12ee2dc3mr106716916d6.26.1792694596058;
        Thu, 22 Oct 2026 11:43:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c37060bb5sm4070256d6.24.2026.10.22.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:43:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJxkv-0000000FjQ8-3dAv;
	Thu, 22 Oct 2026 15:43:13 -0300
Date: Thu, 22 Oct 2026 15:43:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <20261022184313.GD3381610@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021022505.6fe1b1bb@jic23-hlaptop>

On Wed, Oct 21, 2026 at 02:25:05AM +0100, Jonathan Cameron wrote:
> > +struct ctlv_device *ctlv_create(struct device *parent_dev, const struct ctlv_family *family,
> > +				const void *init_info)
> > +{
> > +	struct ctlv_device *ctlvdev;
> > +	int devnum, ret;
> > +
> > +	if (!parent_dev || !family)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	ctlvdev = kzalloc_obj(*ctlvdev, GFP_KERNEL);
> > +	if (!ctlvdev)
> > +		return ERR_PTR(-ENOMEM);
> > +	ctlvdev->family = family;
> > +	init_rwsem(&ctlvdev->registration_lock);
> > +	spin_lock_init(&ctlvdev->transition_lock);
> > +	ctlv_event_device_init(ctlvdev);
> > +
> > +	/* Before anything reads the schema through this device. */
> > +	ret = ctlv_op_resolution_init(ctlvdev, family);
> > +	if (ret)
> > +		goto err_free;
> > +	/* What this family's events need of every queue opened on it. */
> > +	ret = ctlv_event_sizes(ctlvdev);
> > +	if (ret)
> > +		goto err_free;
> > +	/* Before a minor is spent on a device that could not be announced. */
> > +	ret = ctlv_device_uevent_check(family);
> > +	if (ret)
> > +		goto err_free;
> > +	if (ctlvdev->dynamic_ops_count) {
> > +		ctlvdev->disabled = bitmap_zalloc(ctlvdev->dynamic_ops_count, GFP_KERNEL);
> > +		if (!ctlvdev->disabled) {
> > +			ret = -ENOMEM;
> > +			goto err_free;
> > +		}
> > +	}
> > +	devnum = ida_alloc_max(&ctlv_device_ids, CTLV_MAX_DEVICES - 1, GFP_KERNEL);
> > +	if (devnum < 0) {
> > +		ret = devnum;
> > +		goto err_free;
> > +	}
> > +
> > +	ctlvdev->dev.devt = ctlv_device_number + devnum;
> > +	ctlvdev->dev.class = &ctlv_device_class;
> > +	ctlvdev->dev.parent = parent_dev;
> > +	device_initialize(&ctlvdev->dev);
> > +	/*
> > +	 * The core owns the file operations, so an open holds the core module
> > +	 * and not the family's, which may unload while readers remain.
> > +	 */
> > +	cdev_init(&ctlvdev->cdev, &ctlv_file_operations);
> > +	ctlvdev->cdev.owner = THIS_MODULE;
> > +
> > +	ret = dev_set_name(&ctlvdev->dev, "ctlv%d", devnum);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_claim_add(family->schema);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_privs_pre_init(ctlvdev, init_info);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_privs_init(ctlvdev);
> > +	if (ret)
> > +		goto err_put;
> > +	ctlv_op_publish_all(ctlvdev);
> > +	ctlv_event_contexts_start(ctlvdev);
> > +	ret = ctlv_family_privs_post_init(ctlvdev);
> > +	if (ret)
> > +		goto err_fini;
> > +	scoped_guard(rwsem_write, &ctlvdev->registration_lock) {
> > +		ret = ctlv_device_add(ctlvdev);
> > +		if (!ret)
> > +			ctlvdev->registered = true;
> > +	}
> > +	if (ret)
> > +		goto err_fini;
> > +	return ctlvdev;
> > +
> > +err_fini:
> > +	ctlv_device_fini(ctlvdev);
> > +err_put:
> > +	put_device(&ctlvdev->dev);
> > +	return ERR_PTR(ret);
> 
> Jason did some nice handling in the fwctl stuff for
> device alloc and hand over after device_initialize()
> (I've copied it into a few places recently :)
> 
> I'd like to see something similar here as it made
> it easier to follow lifetimes etc.

This is really at the wrong layer.. Attestation subsystem is the lead
subsystem, it should be allocating the struct device memory and the
driver should see the typical

  struct attestation_dev *adev;

  adev = attestation_alloc()
  [..]
  attestation_register(adev)

Sequence in its probe function

We need the subsystem refcounted memory to exist if we are ever going
to create a kapi and common functions

Jason

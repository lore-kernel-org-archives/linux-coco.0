Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760324;
	b=Lx5mdRPDJwKA/nfMEkd9w12Ss+MCNjZS/Ol4Pfz5XzGeBmkVdGRtcrN09B00MAyGPNny
	 bRRgmkay/WRVp+C8m8HBXKxmUzLMk6vli7IEsH9zOuEJ7LYDIZxo+RUFrU4Iy5j1UdyPv
	 kZ5tJcIphXKjDp7efPuhLbnWgN8VJJdHYBCIOxqiuNDW76AS3W/Kjh7dyjc4KUbyI4c0J
	 yK97evxb4375XnDT8utJ6d+452B351KlrlIVAWkrnQQnu5M4/ytdUa1DSUtaMDSaB3F3U
	 Nm1R1TRQCNJIH1BUS3vmhAP3Vy6XGEfjI1eid2QHzwF+O0OxO27094KPrSY+6OVaNjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JG9x0NIXD32q8WVFYmOnLtFpuKdZNQP6WxoLonwFFAw=;
	b=RFsE5zNaei2PxFJsxsIVDt2XfPRm5CFtqOLHb7PvQKNnyIlxMm+5uxc9GPNRq4YqtR5N
	 7PHS4CMWS6n/Zk7B4TQ7oqCwN2sp1q/NBRrkY8Ly6V9fglBhlbxW6esXuMjn7tANCz+VY
	 8jfNjRj8YVFJDLqmx3dJMbxbkVYVX9/k0+JbDPnfkzR4bm4BnZZ2fzsKhmOSL5rZE0Hzn
	 8itTTv5B8wT0A2HukPpIUf/EgBLa9/Q5TU1URByQUIhDPyeSalDfOcHE+5DYo4n4zm9jA
	 bbJRR/xmwWhED8OqPmz5pl4wOW1CDjJktYVxNwf43TopMUcata9cCI8ibWPwyWFoJxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AACD606A320
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 12:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AACD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so7746075e9.2
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792760317; x=1793365117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JG9x0NIXD32q8WVFYmOnLtFpuKdZNQP6WxoLonwFFAw=;
        b=vMV7RD1u3bxxn39h980W8n5WpVFoQrdWsIEwjff+uolwOR/GmP8XC2CnAzUcTZHlGp
         v8P3xpyB/TNruErzXhOy5UPErTie91kyF722D7om2BHX4vVtymvgKB+3+1PZk6p79aGC
         E4Oe7JdQGUVUOCmARcTlk4KR7k4CdEJ1nK/6eHfiKaJSmPdgII3A4TaUFxbJfWL9GDuB
         EcOnve9T+M+mO+G9vamz2e9XT6Lb0JjKx8xpD6jhSfuaJF9StCLakyJroPrECXCPxs5Z
         RmFJUNAl8X19mNxsxiQU6EsXX5PmUStk8tcd5DgX3Bmqg72bbU91RQxKAu47SQdNOwYF
         4n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760317; x=1793365117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JG9x0NIXD32q8WVFYmOnLtFpuKdZNQP6WxoLonwFFAw=;
        b=FRjWNfkR+KDFGnSqWAEvW5PFaO/1iQvEcZsR4AITdDKmvHdjDBAb2B+Im0tECUxbal
         jZ2ApuTNZbdiWiB+R5nBn77e9q1MxBV089WNYtgM9lbqYpyxqhLVifdIjYgEpkC4c4Yz
         4Zsi1RJeW4iEQnN20Uvy+PQzRFLnRZ3BTYbvSOim5fi70M66AFf4celmiHSBmgboTWxm
         WdMCAREZZhGb2nkGLz7s/XZEMOtBayG4x71ylWg6opvWBGaj9eK9q93vsGwkOmUYkJxe
         oSH0fK7+QmOVhP4NjtOWnEUA9kAmM9LhVGYp/buazTArwtOGkAn4y64H0p0mVL+7w8jX
         ba3Q==
X-Forwarded-Encrypted: i=1; AKwUvBySBGhphQw5RIPufNundjJQPF5E0T3y5KY6bsxdfoduvN59BPtCqOEyf3Lp8RstdyZOa1yxrcGiRVtW@lists.linux.dev
X-Gm-Message-State: AFq9FYJseWy3P4rC/V0Gxx+K1eWw034+8eIP44pabfh2X9F8Z/7S2PGe
	9cUwwLtXA3bJt3DiMmVvpLw30Rq501VISB4umn4AcA/7lPWCzCMuWgaRx9fv3B5JBwU=
X-Gm-Gg: AYBFou0SoFpvVG5Jm9Ntyk5id6B/7Ixrcg3/8MXqj5a6cYDT7uK1VNtEXyL0ij0wPip
	EHGBn1F82kjJny1JKWOU91RQwKh6y4IDEvSWW0GH1D5vutIZ+gZneMx+cYosIPuF+4by+mctiiB
	uTAI+pdjJJE84opWLOcsOxAJJB/iU0FHGauY0dGsN6xls3SbFQUU2haAIAptvbZGCjGtmLA2+Ff
	a5X1PrOkRPhnpfuotKjd46Mm3vIcF+vFy5glNJweHNO3UDxLTtklxPufyWFBeBDCjY3+4UznEMj
	Utbd7lDW+NsYe+sKFMq4BjoE3DXZ1Jvp9Rm4gt0MvK/aG1fJ70QRl0ZCoZMn+kjW5MkYYg5CHTn
	7dR0biA4j+bV8wFn+tD/vjm+tepvKJ4NsRhQZIUNrCGuCyJLc9sfGSPCLTQ760IUbyDoZDe0Rkb
	J64axKQUVuF1pbvKuY+qE/tBUvKyC5F8Zvn6bYDmK0cjw0jqsZawR/8KeJ4otNSrK90MkqiKd3o
	4zkYNsH1zq/WRnVMfS+mzTSgoy21ksUgS0mmvEHhgNAlRpsqOhAzy+Z4zXShWlM2Y4=
X-Received: by 2002:a05:600c:3508:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a211edd5c6mr37509065e9.30.1792760317227;
        Fri, 23 Oct 2026 05:58:37 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2153c14c6sm28069895e9.1.2026.10.23.05.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:58:36 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:58:33 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <attZl_0TNMDLgi4U@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
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
In-Reply-To: <20261022184313.GD3381610@ziepe.ca>

Thu, Oct 22, 2026 at 08:43:13PM +0200, jgg@ziepe.ca wrote:
>On Wed, Oct 21, 2026 at 02:25:05AM +0100, Jonathan Cameron wrote:
>> > +struct ctlv_device *ctlv_create(struct device *parent_dev, const struct ctlv_family *family,
>> > +				const void *init_info)
>> > +{
>> > +	struct ctlv_device *ctlvdev;
>> > +	int devnum, ret;
>> > +
>> > +	if (!parent_dev || !family)
>> > +		return ERR_PTR(-EINVAL);
>> > +
>> > +	ctlvdev = kzalloc_obj(*ctlvdev, GFP_KERNEL);
>> > +	if (!ctlvdev)
>> > +		return ERR_PTR(-ENOMEM);
>> > +	ctlvdev->family = family;
>> > +	init_rwsem(&ctlvdev->registration_lock);
>> > +	spin_lock_init(&ctlvdev->transition_lock);
>> > +	ctlv_event_device_init(ctlvdev);
>> > +
>> > +	/* Before anything reads the schema through this device. */
>> > +	ret = ctlv_op_resolution_init(ctlvdev, family);
>> > +	if (ret)
>> > +		goto err_free;
>> > +	/* What this family's events need of every queue opened on it. */
>> > +	ret = ctlv_event_sizes(ctlvdev);
>> > +	if (ret)
>> > +		goto err_free;
>> > +	/* Before a minor is spent on a device that could not be announced. */
>> > +	ret = ctlv_device_uevent_check(family);
>> > +	if (ret)
>> > +		goto err_free;
>> > +	if (ctlvdev->dynamic_ops_count) {
>> > +		ctlvdev->disabled = bitmap_zalloc(ctlvdev->dynamic_ops_count, GFP_KERNEL);
>> > +		if (!ctlvdev->disabled) {
>> > +			ret = -ENOMEM;
>> > +			goto err_free;
>> > +		}
>> > +	}
>> > +	devnum = ida_alloc_max(&ctlv_device_ids, CTLV_MAX_DEVICES - 1, GFP_KERNEL);
>> > +	if (devnum < 0) {
>> > +		ret = devnum;
>> > +		goto err_free;
>> > +	}
>> > +
>> > +	ctlvdev->dev.devt = ctlv_device_number + devnum;
>> > +	ctlvdev->dev.class = &ctlv_device_class;
>> > +	ctlvdev->dev.parent = parent_dev;
>> > +	device_initialize(&ctlvdev->dev);
>> > +	/*
>> > +	 * The core owns the file operations, so an open holds the core module
>> > +	 * and not the family's, which may unload while readers remain.
>> > +	 */
>> > +	cdev_init(&ctlvdev->cdev, &ctlv_file_operations);
>> > +	ctlvdev->cdev.owner = THIS_MODULE;
>> > +
>> > +	ret = dev_set_name(&ctlvdev->dev, "ctlv%d", devnum);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ret = ctlv_family_claim_add(family->schema);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ret = ctlv_family_privs_pre_init(ctlvdev, init_info);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ret = ctlv_family_privs_init(ctlvdev);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ctlv_op_publish_all(ctlvdev);
>> > +	ctlv_event_contexts_start(ctlvdev);
>> > +	ret = ctlv_family_privs_post_init(ctlvdev);
>> > +	if (ret)
>> > +		goto err_fini;
>> > +	scoped_guard(rwsem_write, &ctlvdev->registration_lock) {
>> > +		ret = ctlv_device_add(ctlvdev);
>> > +		if (!ret)
>> > +			ctlvdev->registered = true;
>> > +	}
>> > +	if (ret)
>> > +		goto err_fini;
>> > +	return ctlvdev;
>> > +
>> > +err_fini:
>> > +	ctlv_device_fini(ctlvdev);
>> > +err_put:
>> > +	put_device(&ctlvdev->dev);
>> > +	return ERR_PTR(ret);
>> 
>> Jason did some nice handling in the fwctl stuff for
>> device alloc and hand over after device_initialize()
>> (I've copied it into a few places recently :)
>> 
>> I'd like to see something similar here as it made
>> it easier to follow lifetimes etc.
>
>This is really at the wrong layer.. Attestation subsystem is the lead
>subsystem, it should be allocating the struct device memory and the
>driver should see the typical
>
>  struct attestation_dev *adev;
>
>  adev = attestation_alloc()
>  [..]
>  attestation_register(adev)

Er, the driver would call attestation_create() which will be a wrapper
of ctvl_create. The reason is inheritance chain and each parent being
passed info to and doing its own init()


>
>Sequence in its probe function
>
>We need the subsystem refcounted memory to exist if we are ever going
>to create a kapi and common functions
>
>Jason

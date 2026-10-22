Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659949;
	b=CC7s2S7yp4T+XcWjJTfegnp0Vy4bCScvctFbm/lNMwPCy/u0TDfD0IxJZro3MIuwyvJN
	 eWlGaUIb2nwXPv+WoROnyaemQ1VecyDU5Mp5emcA/FoYsqYYjGF1UTuartN+Lm5UMElEj
	 O4T+e18Zl4p7HRfxMlyQIL2255EIOmSR2JYLMYUXmyCQ40uQvheS8kPTF5EpASGywfCNC
	 OQ/3xC2BNdEYjukJI/X9hwgnmr1WXlXjCR9qSdAC/y6UaJjbtbe7afE2bkbuOrhRGxc3q
	 1cSwRzD+iI8UFbMTiZGRwREXrKpGR6oVINErzX5GlR16eospaDHIRWwl2hnY9TiWEmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VCtPLF1g5YCJnqvDxXjL/9SGDpcHIvBwNuJeTWJPyWo=;
	b=Ar4mXC41/o+8tXMHV1VAciLd7IE5MYX5SxIKFFe8VwOukVAuodozxjxP9czw8eqnUiEL
	 Go6Z0OArkyr6jIrlFS/hVAE3w0upZeX3sR4HAQDuWwwLjvbQkHrDJQ26Okfsb1AHJHdSJ
	 18uQi2PDhTqpvRmqNME40LOnuzlo780SWccNZYzx8YDRGyMrANWtDimeIFJW2gS0sRg/d
	 pZCI8UbVRT2FAgHTMBCcUSYvkz1YoykLWcB+sj9WU+nAdjXMS2iy4Wi6n27RGdVZO0oiv
	 JxRjEIoeUY0vb1W9QhazzTqv9vaZz+KuL5XFDXktIejnqwF/SCDYjtOIVLSB3KbHeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=td2SYwfl;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92689606A31E
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 09:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92689606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=td2SYwfl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dc202a60eso808631f8f.3
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792659947; x=1793264747; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCtPLF1g5YCJnqvDxXjL/9SGDpcHIvBwNuJeTWJPyWo=;
        b=td2SYwflhOyrAmR2YIHEPE/qdMBIJyYAWjAhlkxGOletGHQ5BF+PWaXYB9+epLZB5J
         QBD2pBuwQAkla6F0mXlCyIesQGLG0MdDk4rdcxRPiDdfyDFoTd0Rkbd4gofAE3wITpzG
         ypK4pliEDH4OS5bAGSYoywF42xeGWEYxWJThJ/OBdjxApAELPCa0SHKcluXXkkjA5j9m
         +XHk7DHI6YMLn7P42JMZH5n/I3Oez/pfy1EcmYfZxDSSqH1fjeuNdeYaWxUSecfaJKrm
         16hGn4XtrIRLwXv0D3ep5fnln7i3SSYjKQiEBHkE+6VCJYivXGHqz0CPOKWH4rAGBNFG
         fdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659947; x=1793264747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCtPLF1g5YCJnqvDxXjL/9SGDpcHIvBwNuJeTWJPyWo=;
        b=SpV8hIWTIT0hSGzGK1H/UvXRTOvN6FwvAhUFOVtzxIm5zh83BmnHeFDOx+t+AmlYyn
         t8O/fy9UBeFeUdGMZGqUT1nWPPP+9MjKdce0v2gyKuUno3Q6dmd77T7ubP9l1VWq+SL5
         SpKCMs6GaWW5oo8BNq2NJu7UG1rleii3q+6wv3vwIGbIifzhGU0oOMIZvmq4MywrTjkI
         UdtjEy5JuOY+LKx3zlCGdtADHyZNh6iwOOBTXWycqTWihBQ/8oXW7vXQBOQAVWVQevSS
         6WyKKrffurqr2wlCIFPUt7EU+MRevEPWbR7+TOJs4zeBP5fLODE8jUwvyiqqljynMoE+
         Nclg==
X-Gm-Message-State: AFq9FYLqhS3oyRR80Oc3bHBlhSDfoV5HE8vq2PU98Hm7kWdq85lwk41n
	7A71uXHO6v9icANYBYojRdA1ri/covzY4ScuY1oWqJqzYBTPlMuGhCD59hopGpdRE8o=
X-Gm-Gg: AYBFou0adWBKFYVqIuTPvW7KIbRxbcdU45Tqtzkq+QdZ/BO/34qGEOZQH93udVQ2oQg
	m/W7+0wZOQz7o6mQDlDq5xAAkoNQdMTbhwZ/Mb9Wixzmxgp3C2xiELxiht2+IdKb8MhEpMbsFQx
	3b6TEZUs/V5PnYKvZmSkHc785G2go4DkE+g7FJX9JlcdAi5DEfSeesBP8ND6PczkXGbe/dbP7Y/
	XwvZuKSakkbX+yy+17vcTA7oeY7QkLc3zsnV/2qylflcBVbxjeatlSxewrE8Et2Q5NZ2zkHqp4A
	grQrjn84TjjPz5yqaRZmgd+9lQoL17O8iiF3hqHuPGlSRNxSb5ngDgFBcbMoEL0PA5b/OMM3D1t
	1m5Zs5qLMVwSAKOKObx/KfIPtz0Ho/6yUQ/XZHeAM3Qa90heSO4rh/O9+XaFSOpP6RRKyuQH+8O
	L+H8yuUn9oiPsu7eRknqEAEeRkCW52wXnZrQjxITBbMHHMtz5vtELg/0pqB5/eVDNBBvBbcEv/i
	QAjBze+bdYvTR1jqfmC1aK46QDPtzBwplUQTXnsrvQzdMy7FYWnMyYAjtENu4zi
X-Received: by 2002:a05:600c:3b1d:b0:4a1:d41b:5060 with SMTP id 5b1f17b1804b1-4a1fdb1358bmr98096365e9.22.1792659946257;
        Thu, 22 Oct 2026 02:05:46 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm62056445e9.4.2026.10.22.02.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:05:45 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:05:41 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <atnRsQHieSNzE51D@FV6GYCPJ69>
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

Wed, Oct 21, 2026 at 03:25:05AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:45 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Register CTLV devices, resolve family chains and dispatch operations
>> through validated messages. Wire CONFIG_CTLV and the generated root family
>> after all module objects are present.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  drivers/Kconfig             |    2 +
>>  drivers/Makefile            |    1 +
>>  drivers/ctlv/Makefile       |    4 +-
>>  drivers/ctlv/core.c         | 1517 +++++++++++++++++++++++++++++++++++
>Normally I'd push back hard on too big to read, but it is an rfc
>and other patches in the series are much large.
>
>I'm out of time for today and not sure when I'll get back to this,
>so just a few quick comments inline on the bit I did look at.
>
>>  drivers/ctlv/device.h       |   17 +
>>  include/linux/ctlv.h        |   55 ++
>>  include/linux/ctlv_family.h |   22 +
>>  7 files changed, 1616 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/ctlv/core.c
>
>> diff --git a/drivers/ctlv/core.c b/drivers/ctlv/core.c
>> new file mode 100644
>> index 000000000000..aeab29fe2fdd
>> --- /dev/null
>> +++ b/drivers/ctlv/core.c
>
>...
>
>> +static int ctlv_file_open(struct inode *inode, struct file *filp)
>> +{
>> +	struct ctlv_device *ctlvdev = container_of(inode->i_cdev, struct ctlv_device, cdev);
>> +	struct ctlv_file *cfile;
>> +	int ret;
>> +
>> +	/*
>> +	 * A failed create can withdraw the cdev while an open is waiting for
>> +	 * the lifecycle lock, so admission itself first pins core storage.
>> +	 */
>> +	get_device(&ctlvdev->dev);
>> +	ctlv_file_open_pinned(ctlvdev);
>> +	scoped_guard(rwsem_read, &ctlvdev->registration_lock) {
>> +		if (!ctlv_file_open_allowed(ctlvdev)) {
>> +			ret = -ENODEV;
>> +			break;
>Personally I still dislike the hidden for loop in scoped_guard()
>and using break with that enough I'd do a 
>	do {
>		guard(rwsem_read)(&ctlvdev->registration_lock);
>
>	
>	} while (0);
>
>Just so it is obvious what those breaks are from.

Agreed, easier to read. Will fix.


>
>Maybe I just need to get this one into my code review head...
>> +		}
>> +		if (!(filp->f_mode & FMODE_READ)) {
>> +			ret = -EACCES;
>> +			break;
>> +		}
>> +
>> +		cfile = kzalloc_obj(*cfile, GFP_KERNEL_ACCOUNT);
>> +		if (!cfile) {
>> +			ret = -ENOMEM;
>> +			break;
>> +		}
>> +		cfile->ctlvdev = ctlvdev;
>> +		/*
>> +		 * Commits this description to the device. An open that failed
>> +		 * after this would have to take it back.
>> +		 */
>> +		ret = ctlv_event_file_init(cfile);
>> +		if (ret) {
>> +			kfree(cfile);
>> +			break;
>> +		}
>> +		/* This description keeps the reference taken on entry. */
>> +		filp->private_data = cfile;
>> +		return 0;
>> +	}
>> +
>> +	put_device(&ctlvdev->dev);
>> +	return ret;
>> +}
>
>> +struct ctlv_device *ctlv_create(struct device *parent_dev, const struct ctlv_family *family,
>> +				const void *init_info)
>> +{
>> +	struct ctlv_device *ctlvdev;
>> +	int devnum, ret;
>> +
>> +	if (!parent_dev || !family)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	ctlvdev = kzalloc_obj(*ctlvdev, GFP_KERNEL);
>> +	if (!ctlvdev)
>> +		return ERR_PTR(-ENOMEM);
>> +	ctlvdev->family = family;
>> +	init_rwsem(&ctlvdev->registration_lock);
>> +	spin_lock_init(&ctlvdev->transition_lock);
>> +	ctlv_event_device_init(ctlvdev);
>> +
>> +	/* Before anything reads the schema through this device. */
>> +	ret = ctlv_op_resolution_init(ctlvdev, family);
>> +	if (ret)
>> +		goto err_free;
>> +	/* What this family's events need of every queue opened on it. */
>> +	ret = ctlv_event_sizes(ctlvdev);
>> +	if (ret)
>> +		goto err_free;
>> +	/* Before a minor is spent on a device that could not be announced. */
>> +	ret = ctlv_device_uevent_check(family);
>> +	if (ret)
>> +		goto err_free;
>> +	if (ctlvdev->dynamic_ops_count) {
>> +		ctlvdev->disabled = bitmap_zalloc(ctlvdev->dynamic_ops_count, GFP_KERNEL);
>> +		if (!ctlvdev->disabled) {
>> +			ret = -ENOMEM;
>> +			goto err_free;
>> +		}
>> +	}
>> +	devnum = ida_alloc_max(&ctlv_device_ids, CTLV_MAX_DEVICES - 1, GFP_KERNEL);
>> +	if (devnum < 0) {
>> +		ret = devnum;
>> +		goto err_free;
>> +	}
>> +
>> +	ctlvdev->dev.devt = ctlv_device_number + devnum;
>> +	ctlvdev->dev.class = &ctlv_device_class;
>> +	ctlvdev->dev.parent = parent_dev;
>> +	device_initialize(&ctlvdev->dev);
>> +	/*
>> +	 * The core owns the file operations, so an open holds the core module
>> +	 * and not the family's, which may unload while readers remain.
>> +	 */
>> +	cdev_init(&ctlvdev->cdev, &ctlv_file_operations);
>> +	ctlvdev->cdev.owner = THIS_MODULE;
>> +
>> +	ret = dev_set_name(&ctlvdev->dev, "ctlv%d", devnum);
>> +	if (ret)
>> +		goto err_put;
>> +	ret = ctlv_family_claim_add(family->schema);
>> +	if (ret)
>> +		goto err_put;
>> +	ret = ctlv_family_privs_pre_init(ctlvdev, init_info);
>> +	if (ret)
>> +		goto err_put;
>> +	ret = ctlv_family_privs_init(ctlvdev);
>> +	if (ret)
>> +		goto err_put;
>> +	ctlv_op_publish_all(ctlvdev);
>> +	ctlv_event_contexts_start(ctlvdev);
>> +	ret = ctlv_family_privs_post_init(ctlvdev);
>> +	if (ret)
>> +		goto err_fini;
>> +	scoped_guard(rwsem_write, &ctlvdev->registration_lock) {
>> +		ret = ctlv_device_add(ctlvdev);
>> +		if (!ret)
>> +			ctlvdev->registered = true;
>> +	}
>> +	if (ret)
>> +		goto err_fini;
>> +	return ctlvdev;
>> +
>> +err_fini:
>> +	ctlv_device_fini(ctlvdev);
>> +err_put:
>> +	put_device(&ctlvdev->dev);
>> +	return ERR_PTR(ret);
>
>Jason did some nice handling in the fwctl stuff for
>device alloc and hand over after device_initialize()
>(I've copied it into a few places recently :)
>
>I'd like to see something similar here as it made
>it easier to follow lifetimes etc.

Will do.


>
>> +err_free:
>> +	bitmap_free(ctlvdev->disabled);
>> +	ctlv_family_privs_free(ctlvdev);
>> +	kfree(ctlvdev->ops);
>> +	kfree(ctlvdev);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_create, "CTLV");
>

Thanks!


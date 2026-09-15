Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0A2361943;
	Tue, 15 Sep 2026 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464144; cv=none; b=An9qPM+1DhHWTdAxa9LEWSH4cAc/fZfK0NiOgNPetYR1BKrlQFGJ11+rbfZYGu6v4CQ1Qi1Q3i3wdsZuTR0gLpzcOts++7Q05GXWazoOj1rMRCETbFV4P3JEVNAKifn7Fp1uA/9u/FrojrbcdkkARWBhfX+iA1duQjIp8U614RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464144; c=relaxed/simple;
	bh=vxyaDbXamgOwTGDwbZPbiVG4rgOdwIyYPZUCCxy44Sk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VeBhk/zG3p65D2EnsujL33c9DLtHkk7XVyEofgkyYvO6i4YgzVDPwCcCPBCdPW6CnQT3pCiuKbBq37C9ef7Y5x4egXdL+AFHiF9N2ZhBaCfkUu+cgZv0e/7HKLn+EfNsiV3AwmxXBl5DkE3kg+2DSjpMdoIxaB0YZp9bOcNmw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTJidoyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTJidoyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BD81F000FF;
	Tue, 15 Sep 2026 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789464142;
	bh=OadurXtHOgOnjlSsISaCXnU9N/sHfJp9cVxt5WWcWKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YTJidoykyUhChX8GQahnIT64xHHnp+E8TuRHMJLpH8eoac0OsJ4T+QjlMA7Yw5OEh
	 KPNJlUEwEr3IaFfaGV3uy5+dmpUBb5IYbieF6ZufCvelaz+YIFHD7d6x23DoV5QrvI
	 IUZbnGi13Mmq9jvrW6sI05fqSVu4LvOIt8E4ITHx6TEWsjJ6bAkrg9Huk50K9PZZ6u
	 2rJXRe9NucPsRfL9MBgIa514get10/v3duDmI6d7g1E2XQXElIaRB57ENTnLlj4wUV
	 JOy37sJeBSAcmv9Bb0q0B9LLL5H+ts+9RGImW0PQFXXqlq5sXq9JRJKnmQvbRfeoCm
	 2XwyhqBsf1PEA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <20260914222836.GO3968357@nvidia.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-2-aneesh.kumar@kernel.org>
 <20260914133249.00007d35@oss.qualcomm.com>
 <20260914222836.GO3968357@nvidia.com>
Date: Tue, 15 Sep 2026 14:52:14 +0530
Message-ID: <yq5ao6dy27jt.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Mon, Sep 14, 2026 at 01:32:49PM -0700, Jonathan Cameron wrote:
>> > +struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
>> > +{
>> > +	int ret;
>> > +	struct arm_smccc_device *smccc_dev;
>> > +
>> > +	if (!name)
>> > +		return ERR_PTR(-EINVAL);
>> > +
>> > +	smccc_dev = kzalloc_obj(*smccc_dev);
>> > +	if (!smccc_dev)
>> > +		return ERR_PTR(-ENOMEM);
>> > +
>> > +	smccc_dev->func_id = func_id;
>> > +	smccc_dev->dev.bus = &arm_smccc_bus_type;
>> > +	smccc_dev->dev.release = arm_smccc_release_device;
>> > +
>> > +	ret = dev_set_name(&smccc_dev->dev, "%s", name);
>> 
>> Does protecting the string defeat the nice underlying const handling?
>> e.g.
>> 	ret = dev_set_name(&smccc_dev->dev, name);
>> might be better.
>
> Pedenatically the %s is better as it doesn't restrict name to not
> include % characters. 
>
>> you'd often see this between an device_initialize() and device_add()
>> and then we'd be relying on the device_put() to clean it up.
>> 
>> So as this stands this is fragile as any error paths that later
>> get added...
>
> Yes, but as written it is OK, and this is a common pattern in the
> kernel. I agree it is fragile tricky..
>
> Still it isn't an urgent reason to change it around, but the best
> pattern is to put the allocate, dev.release=, and device_initialize()
> in one 'alloc' function. Then the other function calls it and always
> unwinds with put_device. Use device_add().
>
> This avoids mixing the different kfree/put_device error unwind regimes
> into the same function..
>

Something like

+static struct arm_smccc_device *arm_smccc_device_alloc(u32 func_id)
+{
+	struct arm_smccc_device *smccc_dev;
+
+	smccc_dev = kzalloc_obj(*smccc_dev);
+	if (!smccc_dev)
+		return NULL;
+
+	smccc_dev->func_id = func_id;
+	smccc_dev->dev.bus = &arm_smccc_bus_type;
+	smccc_dev->dev.release = arm_smccc_release_device;
+	device_initialize(&smccc_dev->dev);
+
+	return smccc_dev;
+}
+
 struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
 {
+	struct arm_smccc_device *smccc_dev;
 	int ret;
-	struct arm_smccc_device *smccc_dev;
 
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
-	smccc_dev = kzalloc_obj(*smccc_dev);
+	smccc_dev = arm_smccc_device_alloc(func_id);
 	if (!smccc_dev)
 		return ERR_PTR(-ENOMEM);
 
-	smccc_dev->func_id = func_id;
-	smccc_dev->dev.bus = &arm_smccc_bus_type;
-	smccc_dev->dev.release = arm_smccc_release_device;
-
 	ret = dev_set_name(&smccc_dev->dev, "%s", name);
-	if (ret) {
-		kfree(smccc_dev);
-		return ERR_PTR(ret);
-	}
+	if (ret)
+		goto err_put_device;
 
-	ret = device_register(&smccc_dev->dev);
-	if (ret) {
-		put_device(&smccc_dev->dev);
-		return ERR_PTR(ret);
-	}
+	ret = device_add(&smccc_dev->dev);
+	if (ret)
+		goto err_put_device;
 
 	return smccc_dev;
+
+err_put_device:
+	put_device(&smccc_dev->dev);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(arm_smccc_device_register);
 


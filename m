Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621482;
	b=iCwrJl5LmixZh4Tg+zdO80+wGQ02f/iTh3jxnhUYMWvbg6yyfaLjxPurxDzK71XfQp3f
	 zUxuLDzWFEEG1x+Rx+ANtruGm7KKAMMFAy5KN+T7jK5aBEnZJZ8ERnWtL+qlrK3L2ITnL
	 XfIZTS5R74JDkJGkuwVNU1OVZfCvBKnzgr/gtVa3q8j/ClZ1MT9goZhhXfD+ChJsuYdst
	 tfkExOD84G/lMSAEDtMWb0BHf7xjvTK+bpG7h2lw6bdsjfVDwrRihrgNelZqx3DQRpTzL
	 yoGfB3lL/AREkr0Aald4r5ZLNb5G8WPE+7yaASI2mwqwfpnvjBBskA3Xj0MQCciFwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tvTx6m5Vu+Gzk7DYvJ/RY758ujXZGYWFugqF5JgTxv8=;
	b=hut+2gmgK95G2n/ZBGluBdDVI3u/rI3E8cmc/LciL4NJUJKwHZk7k4JuLvQiQrXC9iF3
	 8OhWplAn22yMquFwW/KO0bxGGnBoWSak0gNtzsPVusEVIpsW9zE5gKJbvnkzgGmdCsRVG
	 wMAe4l3g9BqfSgEtsiRcTvg8341qChkGxnSXN/XT8JtN8qr2ns0u8NmWokM46jQRiYMQb
	 IaQcwFQUIqXl7h8GtiSWKmyhX0LIkRhr/GzxlTtxTaQdJixoVuEo7QXszQ/5sRqBd+b7J
	 aPrQdbFCeGp6rblZDXtznP7Sd4hqSt1rkvpRTqgfbaChS3pY4PJtQWaTQ103MYhRJNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=uHdXgAYx;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FCE606A33F
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 12:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FCE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=uHdXgAYx
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3404767e87.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 04:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793621480; x=1794226280; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tvTx6m5Vu+Gzk7DYvJ/RY758ujXZGYWFugqF5JgTxv8=;
        b=uHdXgAYxJ0I2htooxCJAeumn04f2IAoLBK36HdQCe19Xbn/yvX/bC2tRVlEEAOVeZh
         ogFSp/fsYyj3JfmyEYHOLlrlZXPi2cLqA3bsDumoB41mi1PVJuulTpwSU5pTdYX8/I7R
         A1iVSd/ZoCTPCj6JbQbnf+0suO+/kYpuDAV06MNB5wso8nIs6AjxpumUSYQ973fxeTuo
         zdkH6VH20wEFPFN5zuZxxNSFZkA4CyxbbVrWb6XmDKqsS8aYefekNJA5rEdlra6WOLw7
         S0IJLVmwGb3gmcXF2FWobnDSnG8ddiTfea45qWaR9ZBsglML6KestFMeALiQXN4gxrJf
         vx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621480; x=1794226280;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvTx6m5Vu+Gzk7DYvJ/RY758ujXZGYWFugqF5JgTxv8=;
        b=PnN07svwTnIUWSTPJJMTdwtt2YndjJ/YzxRWAoEOjywzEj3aYPk4S32m0xKGpyljJz
         MaD+852+g6Db292GYRyQnzHTkHSWZh03kdKM9YZxSoadjIrzXTnTwwfo/HwygdVHCsN3
         LtoZk+OG68u9zPqGE5U97KMoavP5KAtOYu/qcJV9ic/rTGnM8sESXgj9NjP6xZvFIbQx
         zwlFpb1NXK7JjdRlyK5Plqp8XIke3gzqoKSP4DJMjChbKmeWHw8kFkbwSX+6cmq6fmTF
         iEXQh38ygMH5GEccEukApNjKY7WU3U8ZT+UDPzTJe7DKkwg09VA0aBx/Qetx2CrUwNHk
         PKSw==
X-Forwarded-Encrypted: i=1; AKwUvBy/SvHP0JE6V6btoDJHxnsH+UKjxNbOD3f7ISW78VnsyKOerfYbrH9t1+sxe0b9YSo1hod2CpkwGum0@lists.linux.dev
X-Gm-Message-State: APuU4Z/2D+J40gzLf5zF87Ku44zAldXx6CH/LQbwzO9nVZhuHgl/9SOk
	ldDtvCzKEq3aj4gUv71UrmmLjrJ/aZ3p72VidDO8BkrJUAZMD1ExJCm1i8IxmWQNvJs=
X-Gm-Gg: AYBFou1gLSpzkqLR1/ha8KaWLSgiuCqTXFJp2ccPTJ3wZyTi/yRlp9lJJrHqwAQCp6o
	jujPAekIxQatbjiuk/SQd3+1Q/3YGlKQ/Sr1T6TcfIdZT2qPA5/FOYrSicjLSt5XrBLcuC8xiSj
	wndc+dL1tnL6k00IbIuRHSDvaHuGId8GrF4oznsUMbFqvErSOwzUwavtdW3QygkP1wlTMzPGgad
	kZj7ZVzrXL01zCC+nQxi2WQt5iWkJAbFDfTSjqi+T5jh+cwncvBqtHNceZeS++Gf75PdFavuxRu
	TggyfigrsgNH2EisAGGojhfWtS6LvG0rplk1XUnhsShvJ097GwGcsTsJ7PwLXHtwigtUUQFVncz
	wLFs1b6cOCdNNl3rLCKFSUVbzmbGg4tsGTBX3MB/3dHtmTJnK9hM8bxfqgYj3PNc/H+aSHqmk+Y
	LZD2hkaUvwfoyZKhRstJ32lRLnnn3XswVZqyfIUrbc41TadqRngFvmtWL5eIzj9eBZZTvfkbEM0
	eg0tip4X9V0witrC4Ah78efRTTP7MOqaYLrf/qZqTyzDpMmDmrrFMUdKqYMQlEtSwG41V6/wgAx
	FTE9T/CBn2iviCPqWZvpHc91nqE2uO0ibJ4bfvI=
X-Received: by 2002:a05:6512:3090:b0:5be:41da:5c68 with SMTP id 2adb3069b0e04-5bfd1227c1amr3752635e87.39.1793621480254;
        Mon, 02 Nov 2026 04:11:20 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe6b59dbfsm962961e87.11.2026.11.02.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:18 -0800 (PST)
Date: Mon, 2 Nov 2026 13:11:14 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
	linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 08/11] PCI/TSM: Bind CTLV attestation to connected
 and locked contexts
Message-ID: <auh9uIC0TrR9pAZR@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-9-aneesh.kumar@kernel.org>
 <auSkHORl2mg_FiOf@FV6GYCPJ69>
 <20261030153900.GM3734323@nvidia.com>
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
In-Reply-To: <20261030153900.GM3734323@nvidia.com>

Fri, Oct 30, 2026 at 04:39:00PM +0100, jgg@nvidia.com wrote:
>On Fri, Oct 30, 2026 at 03:08:52PM +0100, Jiri Pirko wrote:
>> Wed, Oct 28, 2026 at 04:26:15PM +0100, aneesh.kumar@kernel.org wrote:
>> 
>> [..]
>> 
>> > 		available authentication methods for the device.
>> > 
>> > 		When present and the tsm/ attribute directory is present, the
>> >-		authenticated attribute is an alias for the device 'connect'
>> >-		state. See the 'tsm/connect' attribute for more details.
>> >+		authenticated attribute reports the TSM name only after secure
>> >+		session and stream setup succeed, otherwise an empty string.
>> >+		Connection control uses tsm/connect and tsm/disconnect.
>> > 		This is a "link" TSM attribute, see
>> > 		Documentation/ABI/testing/sysfs-class-tsm.
>> 
>> [..]
>> 
>> > static ssize_t authenticated_show(struct device *dev,
>> > 				  struct device_attribute *attr, char *buf)
>> > {
>> >-	/*
>> >-	 * When the SPDM session established via TSM the 'authenticated' state
>> >-	 * of the device is identical to the connect state.
>> >-	 */
>> >-	return connect_show(dev, attr, buf);
>> >+	struct pci_dev *pdev = to_pci_dev(dev);
>> >+	struct pci_tsm_pf0 *pf0;
>> >+	int rc;
>> >+
>> >+	ACQUIRE(rwsem_read_intr, lock)(&pci_tsm_rwsem);
>> >+	rc = ACQUIRE_ERR(rwsem_read_intr, &lock);
>> >+	if (rc)
>> >+		return rc;
>> >+
>> >+	if (!pdev->tsm || !pdev->tsm->dsm_dev)
>> >+		return sysfs_emit(buf, "\n");
>> >+
>> >+	pf0 = to_pci_tsm_pf0(pdev->tsm);
>> >+	if (!pf0 || !pf0->stream_connected || pf0->base_tsm.error)
>> >+		return sysfs_emit(buf, "\n");
>> >+
>> >+	return sysfs_emit(buf, "%s\n", dev_name(&pdev->tsm->tsm_dev->dev));
>> > }
>> > static DEVICE_ATTR_RO(authenticated);
>> 
>> I had in mind removing this attribute alongside the staged connect
>> change and reporting authentication state through SPDM_GET.
>> 
>> This instead retains the attribute and changes when it reports the TSM
>> name. Could we settle that together with the SPDM_GET interface rather
>> than maintaining parallel authentication-state queries?
>> 
>> Jason, what do you think?
>
>I'm not keen on any of the sysfs, I'd like to understand who is
>expected to use this.
>
>If we imagine a systemd-device-accept-d kind of flow I don't see any
>need to duplicate things in attestation subsystem in sysfs..
>
>I'm not sure 'stream connected' is even right, as in my last note we
>should not consider the thing authenticated until we actually pass
>userspace EVIDENCE_ACCEPT, even if the TSM has established a SPDM
>session.

Agreed. The question if we can legally get rid of it at this point...

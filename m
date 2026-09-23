Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43D151DAEC
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173968; cv=none; b=LrBFD73pCntgxou1kPNg6bXdCTs4o7dFtGQBfdrhhKjFwWWlhCab4aPdolD/qPdKJen9aKBeFsSKZWQfFtuO+2am8rVWLzTwmJKb9MNsNZjxqXFLn8rS0q53NFErJD5Wz9ik49DF3Cz9caJZwttD5xekCW+c0Uh64MN5VTlDJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173968; c=relaxed/simple;
	bh=S7rAkPuZSZMbYQIfkDVKURs4Ono2lI5WQLQVCr5CGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxbxLWA8wNrjdzU5mhH4nrbeTq7BDMzeY44+rXgdtJ3Lhb8tk2xDwBhNPk5ZZdm0kXPExkGzDLzeg0ZxTOp1AcouhjHPJjRKIFWiiESjJUVCnWLPl46THcft0zsdJrJQjCw1UQXqgOgqbGPv/V6eAmcitMUxEeoucKUK5BtVJvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lo90lvrx; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lo90lvrx"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so563548a91.1
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790173966; x=1790778766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rhO8zdKOr8jmD+SfzN1wHrIhUden50az9FhzT+ZY8k=;
        b=lo90lvrxCDZsiMQsdk2e3j4WWLuWyGrLDc2sVpOKphV04WLX7Xp4XnJ8DtZLzxy5Op
         zZbJRYdET1WB9J79NHJbFYd4SkK3SD0lC3Jtw4/wkwIJZKdpwX0zL1OfzkhHuEA4NsK8
         7joADV3MS021FicsPtynqpsQ7pIPBWowYojyNJIuXHyOGqobus20nwZqg0B63zqgqDF9
         sNMRmOF6w6p3jBfFjxqRmBTAQq8y0UWEUp525LE21wZNtp5aXYWv5ldNeKPBDcpWG34I
         MYOZz/poQhB71zewNLjP5H66CYQMoPWbO2ADECrNVugYhZJK27n8xYseJJ3KOvpSluW8
         yuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173966; x=1790778766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rhO8zdKOr8jmD+SfzN1wHrIhUden50az9FhzT+ZY8k=;
        b=VvVWFY9bJY4aYRF6f9oGaOTWrIkZGWrqzoszDsAwp8mW3XQc53Zj5pmlelfJNlekW2
         gUBcr2HSq59/Lwz4sHj/llbd4Ao11+Y77KJhHIo0lykMthujW0Q6SXYBW2vN4hhztur7
         EyC9lNjJoLNg0/otZQXdKcyCY3UnYCpsof+3ik/VsY+OLgoGTif5IqiR5i2h8LqXoDPx
         ccrTxTKikrWQZ+1plKTKmeCu2NygYpj2bynExA3Kymh+93fwxpDYnzdofeepTzaW7r9M
         gVf0fAX8nES8M8FCPZ4Z5j6++uaWpbZmSAhvKH3glN1zpZUXTCepd6XollgX5DK6V+Jd
         UGHQ==
X-Forwarded-Encrypted: i=1; AKwUvByUe2Bzla8hfuoBTKQaPDi9qpnIAQGXLNdONoyjdDdaTIyFvu+xSj5QtO/5g4DodxG4BKSuNygyOUNM@lists.linux.dev
X-Gm-Message-State: AFuF++mK3ROQFGMbb76Cwcq29wPRoJ32SYpkCWDmEPbZci6pbzzkCJDj
	Cg0B3aVdLF48qA6LjocH1btTJ5VpFFv5JcpPrSf0KDE35gWyTS4AVJknkltkqJQUrVA=
X-Gm-Gg: AYBFou032z1Lgvw3w5mGA+oxTsc/oCSIYTM6pDLohZoFjLha8C7no+pdpnOhG9uHzYh
	hDwcPAYzgqjssp9MaGaOEazG5UYrpA19hf3LNN/uKyyvsfeEKCttjn22Y3pqSC+ToHlnLsNgK77
	qhyuepvHa4QDgRrDgpdctZEH/rcto44f7HRsVm7Y7AGuLbWnurl/+6j4anePPUu/w4H4AYrTfdw
	WP/dt6zuny3rd1F5W8EohFLWwY+1KjgYKyv9X694JAJOKais6dEiQilt/oA4VcBtURZ9SvWB3nH
	v8bA7aD397Gch1tDlrGlLcQ8EhWgITpBf297mA6uG69ze/ltCQ+I/D4/FgJ0FouUW1jCjA3pSpM
	IkTkvOk9CJxlMF4dyir3wYKF4InRqb8zNVSQOgKM4mzHU1TsxM/l6DmR9GqgmdLpRYZKxOt2c8J
	mzSOACjyC3Ptah8tkPJfOtixZifVpBzPcJDreb/TJSdUFf0RNWacGOtsdzY4832q2RQ1bXKqohK
	Btr48zG0w==
X-Received: by 2002:a17:90b:2552:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-3a07e51cf1fmr2382544a91.15.1790173965946;
        Wed, 23 Sep 2026 07:32:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db882a5sm5446811a91.1.2026.09.23.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:32:45 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:32:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, maz@kernel.org, will@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	oupton@kernel.org, gshan@redhat.com, joey.gouly@arm.com,
	tabba@google.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
Message-ID: <arPjCZL2IfvTKMml@p14s>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <aqrsmUTxDVbKJn8k@p14s>
 <yq5aecel3aj3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecel3aj3.fsf@kernel.org>

On Tue, Sep 22, 2026 at 02:52:56PM +0530, Aneesh Kumar K.V wrote:
> Mathieu Poirier <mathieu.poirier@linaro.org> writes:
> 
> > Hi Suzuki,
> >
> > On Tue, Sep 15, 2026 at 05:01:18PM +0100, Suzuki K Poulose wrote:
> 
>  [ ... 42 lines skipped ... ] 
> 
> >> 
> >> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/all/20260803134403.80630-1-steven.price@arm.com
> >> [1] Linux firmware RMI https://lore.kernel.org/all/20260912083611.2513845-1-suzuki.poulose@arm.com
> >> [2] Linux GPF Host https://lore.kernel.org/all/20260913070459.2547407-1-suzuki.poulose@arm.com
> >> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v18/integration
> >> [4] https://support.arm.com/documentation/den0137/2-0bet3/
> >
> > When testing on the FVP model with the above baselines, I get the following
> > error messagaes in a loop, preventing the system from reaching the command line:
> >
> > [    3.112577] Freeing unused kernel memory: 3520K
> > [    3.115398] Run /sbin/init as init process
> > [    3.142926] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.150111] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.177190] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.197194] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.217188] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.237194] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.257181] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.277189] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.297193] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.317188] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    8.157185] swiotlb_tbl_map_single: 241 callbacks suppressed
> >
> > I get the same result with v17.  Have you seen this before?  Perhaps a kernel
> > option that needs to be adjusted?
> >
> 
> This is due to a change in the swiotlb setup.
> 
> https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org
> 
> You can increase the swiotlb size using the swiotlb= kernel command-line

What size do you recommend setting it at?

> option. I also have a patch series in progress to address this issue:
> 
> https://lore.kernel.org/all/20260921063628.362078-1-aneesh.kumar@kernel.org
> 
> -aneesh
> 

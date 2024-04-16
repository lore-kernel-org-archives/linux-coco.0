Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806AE12C522
	for <linux-coco@lists.linux.dev>; Tue, 16 Apr 2024 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277729; cv=none; b=SNhwy7Z2WFrbbmIc6x1Ksb+muMQO51AB/oj3cSCzeS5PYjCvPP2ull55j6uMxr3D6Ska9bgJCC70xUT1e+mBk6gRuAKe4mloaK1JRlKgvu4UaZw/CXqz6wELLUJXdKPM1Xq/cL8Sa+1UsRxQo6fGiaA2IkCaPHBtC4KNQtJZEUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277729; c=relaxed/simple;
	bh=Jns8AmEqmuJmtroLiyJfBw+gt2Dkhup/lrHLF/M5PTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXwh/lsRt8qZCmchTU2cvpS00nL0FNfoyld4CxPO3CgalP3L3hyM2w78Kgkc4Q6aB6fWAwFKgMbwO7QqWHnXUVc1wyq3M3UcyqKgy5gnAg6zbTtweYHy51mr1wfapKgYJP1EVUEhlcZ5NioWNQy7APcJEYtHAhksO1SHn3uh4T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yN+bv3WJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yN+bv3WJ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3497fcc40f9so469592f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 16 Apr 2024 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713277725; x=1713882525; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODh/R4bfK57i1Jc+tcGcRXOngX+xxVgLxwYp8nV0YkU=;
        b=yN+bv3WJksQWFBDlCyw6oEFVJG3/W6QBvX5WecTCgTqOLLBxYpYHbwJLF4yxQeRbst
         fVSLzuoGEddSYtxM4Q//FqGoCJTIMWKYXNdYJFsEzBSUof0/14L/Gio7IzFCG55RUfZ8
         eIJHvqUyY03KBrIbE2yLz9msdknB7rq+L3sPLMvn7MeBt3xwPk7uA4nfghMkffKtriNi
         76h32lY/b0qMZlQeZb7EfAt3Wh2OniQHtSEZwVa+XaDaJ5xfaUwJj9qpWHtSIrofzLYO
         VIdD+KRNpmQO1xmdrYRdXQc2efySCTek8Dj6fHwlj41px1hdZlQYlXBY9rWTlJx7U6qd
         QUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277725; x=1713882525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODh/R4bfK57i1Jc+tcGcRXOngX+xxVgLxwYp8nV0YkU=;
        b=p/kcTd/AjTAq9T2kZkPIeF4WGNAFbmghtI0/mcKDLgTYmz78pigzXC0DmYfiD/LGzS
         G3Hh0P0arUNrRLu/ZdI+BCTE9SAw7gsorcEgQwsKS7tOdRLnfn4u6ZdQtY3B8TxAsm7f
         NgJMV+IcBvKINSCooAfSRrbZhyOuQbh02wZtvuovK7Cu6K2hkvfORYZl+nouxybCcNvC
         2FiAaZtiaQlTwNgtNqOJ4ZyzPnmlatNoHjGVTAHT37TA7vePR2IpZXQTD88Y7nfe4e0J
         XWaKz7GMG974uLlK+ofZ+nBDYu546Jl0eqhSORngA7jkCqR4IaSVA47SAmTshDtywvsS
         hkvw==
X-Forwarded-Encrypted: i=1; AJvYcCWPBh0FWk7YS/kC9O6a7VBf9EckKA4dVWyn342Kmve7M56J5VPqaHGQR/ujkYGTw4bx7cYa+0tRguJ2I9hVFrwzRLmDHaC/x8m9bA==
X-Gm-Message-State: AOJu0YymmPcu5z4q90W20C0zwJ90aRO6MthXkkXMeOedn1i7CmQz8Ha5
	fDFzIoJ0WXUhlW3+fmHFXC9z6ms1Zn/7uB2Glcrog2CkAXHYNkqw8beEwSKdI5g=
X-Google-Smtp-Source: AGHT+IGBEcpM41oq6+uqCwJlNZfyCfSFjAcPSTPtMeeIgJSTr98uSVszWwBj9GJB4rj5Lkx3xI6IhQ==
X-Received: by 2002:adf:f4d0:0:b0:343:7cdc:458b with SMTP id h16-20020adff4d0000000b003437cdc458bmr9656332wrp.7.1713277724914;
        Tue, 16 Apr 2024 07:28:44 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id v17-20020a5d43d1000000b00347cf86dee6sm5769662wrr.71.2024.04.16.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 07:28:44 -0700 (PDT)
Date: Tue, 16 Apr 2024 15:28:57 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	alexandru.elisei@arm.com, joey.gouly@arm.com, steven.price@arm.com,
	james.morse@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com,
	andrew.jones@linux.dev, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH 00/33] Support for Arm Confidential
 Compute Architecture
Message-ID: <20240416142857.GA963176@myrica>
References: <20240412103408.2706058-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412103408.2706058-1-suzuki.poulose@arm.com>

Hello,

On Fri, Apr 12, 2024 at 11:33:35AM +0100, Suzuki K Poulose wrote:
> This series adds support for running the kvm-unit-tests in the Arm CCA reference
> software architecture.
> 
> 
> The changes involve enlightening the boot/setup code with the Realm Service Interface
> (RSI). The series also includes new test cases that exercise the RSI calls.
> 
> Currently we only support "kvmtool" as the VMM for running Realms. There was
> an attempt to add support for running the test scripts using with kvmtool here [1],
> which hasn't progressed. It would be good to have that resolved, so that we can
> run all the tests without manually specifying the commandlines for each run.
> 
> For the purposes of running the Realm specific tests, we have added a "temporary"
> script "run-realm-tests" until the kvmtool support is added. We do not expect
> this to be merged.

The tests can also be run with QEMU, which requires one more patch to
share the chr-testdev DMA memory with the host. I pushed this and
additional tests here:
https://git.codelinaro.org/linaro/dcap/kvm-unit-tests

Follow the build instructions for QEMU:
https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/Building+an+RME+stack+for+QEMU

Buildroot supports kvm-unit-tests but as standalone scripts. I prefer the
run_tests.sh script, which also enables comparing Realm measurements
between runs:

	./configure --arch=arm64 --cross-prefix=path/to/buildroot/host/bin/aarch64-buildroot-linux-gnu-
	make -j
	# copy everything to the shared directory, then modify config.mak
	sed -i -e "/PRETTY_PRINT_STACKS/s/yes/no/" \
               -e "/ERRATATXT/s/=.*/=errata.txt/"  \
               -e "/HOST/s/=.*/=aarch64/" \
               -e "/ARCH/s/=.*/=arm64/" \
               config.mak

	# Run all realm tests
	ACCEL=kvm MAX_SMP=8 ./run_tests.sh -v -g realms

Thanks,
Jean

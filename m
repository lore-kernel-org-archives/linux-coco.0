Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C071DFE11
	for <linux-coco@lists.linux.dev>; Tue,  8 Oct 2024 11:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385547; cv=none; b=j2Oe99G8gm0YnnSH8J8xwgtCsNPDfVFOEx1RGbx/Yn1rA4QaV/Xe9IUNzaYeb5HLi26D2Ft/b9TgS9bUDCyRgV+7cNaQFF5PTsCPfC9pwnyWHBh7i2gOieJwaw23B8AOUDvu2O563Rw8vKsedISa/C2/d84QHcpbJ7042EPeh5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385547; c=relaxed/simple;
	bh=blpyLMsuFMn24VZPPL8dDbNZnSR7Pou7ksJj/nytLXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4gF+hBPoxl24e8NflcEaE8aAamCDBA8410Dk4/i8G7duslozbRnngEASA+T+JKPZipkFYIEjn3IgWO0E49inISVGyDD7JEv7IDJo9M1PyqLlnWetE50G/BqBYRrgUiewyhCjUqbZLQ8GJSIibI/RFAkFvcD01kqo3affSKO/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ycMsNcHu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ycMsNcHu"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fad6de2590so81564001fa.0
        for <linux-coco@lists.linux.dev>; Tue, 08 Oct 2024 04:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728385542; x=1728990342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxNxFS3ZbI3W4kQXbO0lCunpQ22o9dZ3gjnqPR7i4vQ=;
        b=ycMsNcHuHsJm8otu9JJNQrw5iqmeybv8lFrrYC59t1OAQDaX4opdagcKAc6gPCLoyZ
         1xRK9bBt442gua+26/ruHlbxnarbPRin5Zq7XzY3Bo6y7Ffe84L8J1xS0nW4Yln/gAGT
         LgpiXt82H3410NzfVMMSQwk3mzI4VfwJT7ZJ6/EiUwQYNhH0RTbad8/xxYJmxiaH/XWj
         SCiFjN/WwkMg2/4F7R3odbX4zrNX+yBRao4qure5SSaPtNaHGMDVBNsoDRG1qpfnQJFR
         eKbN+AmPbRRtZuMr3PY2JW/06e9SamCE8Rw0vz1gMUq0WUX8TJ89nYcbL/VuRHOKRsIK
         50/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728385542; x=1728990342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxNxFS3ZbI3W4kQXbO0lCunpQ22o9dZ3gjnqPR7i4vQ=;
        b=ViZPA9OVKxNaknY37mOTO0JYQeBEUWt8ZoeTYdm3AtBNpx740c62xkEX4sks9SfKuG
         0YURiYiULlm0f1/lLpqQpCUCYSNOEQ0mIMzM9MoSzQBFd2hb2at/99pmWmLnYyFXLUq7
         g4ii0veA1p0H3cx7Si82MIoWGVVxdvELnOqyzlNpylcI/4UhMf+P09BM0GUHMUbnoVQf
         JbkysNheiZo9XfQF8fCw0kjYhzohqosbneEhu/5VZGDzcvv6RDHM542nAGia/Q76vCap
         SMER8maC29y9xv+DycRpGurYlsDbhoUyOPBBi1DSmIwryW6AAy67uabBu+nrrpV6Hl8Q
         suiA==
X-Forwarded-Encrypted: i=1; AJvYcCXsFMz/2AEYlw06lfCWOSiy1HNt76xlmLGx6MmY54a0P2cNuHNyjxqVwm0KUJ7rq+DPZSa8dhLHUG2C@lists.linux.dev
X-Gm-Message-State: AOJu0YwD/AU9IyHpMIUds1cVgJnEqDwpZybsJU01s6u4LLXF+x3YkgCe
	A4ZkKW1as1jUVmZ2g7vQP+hwXFt4/5wSHfHSGJoRNXDNxxfmxnHJLJ+Z+bgH2oU=
X-Google-Smtp-Source: AGHT+IFUUVsOSGGJPAphsOFCoHIZ+0khfsB4/lk7TDogJccRq5ZqzE4wbYgRX+9fbyD9s7dMaYkATg==
X-Received: by 2002:a05:651c:2211:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2faf3c1e75emr93401371fa.17.1728385529761;
        Tue, 08 Oct 2024 04:05:29 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993d92ed5dsm434265866b.63.2024.10.08.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 04:05:29 -0700 (PDT)
Date: Tue, 8 Oct 2024 12:05:49 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v6 11/11] arm64: Document Arm Confidential Compute
Message-ID: <20241008110549.GA1058742@myrica>
References: <20241004144307.66199-1-steven.price@arm.com>
 <20241004144307.66199-12-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004144307.66199-12-steven.price@arm.com>

On Fri, Oct 04, 2024 at 03:43:06PM +0100, Steven Price wrote:
> Add some documentation on Arm CCA and the requirements for running Linux
> as a Realm guest. Also update booting.rst to describe the requirement
> for RIPAS RAM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  Documentation/arch/arm64/arm-cca.rst | 67 ++++++++++++++++++++++++++++
>  Documentation/arch/arm64/booting.rst |  3 ++
>  Documentation/arch/arm64/index.rst   |  1 +
>  3 files changed, 71 insertions(+)
>  create mode 100644 Documentation/arch/arm64/arm-cca.rst
> 
> diff --git a/Documentation/arch/arm64/arm-cca.rst b/Documentation/arch/arm64/arm-cca.rst
> new file mode 100644
> index 000000000000..ab7f90e64c2f
> --- /dev/null
> +++ b/Documentation/arch/arm64/arm-cca.rst
> @@ -0,0 +1,67 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=====================================
> +Arm Confidential Compute Architecture
> +=====================================
> +
> +Arm systems that support the Realm Management Extension (RME) contain
> +hardware to allow a VM guest to be run in a way which protects the code
> +and data of the guest from the hypervisor. It extends the older "two
> +world" model (Normal and Secure World) into four worlds: Normal, Secure,
> +Root and Realm. Linux can then also be run as a guest to a monitor
> +running in the Realm world.
> +
> +The monitor running in the Realm world is known as the Realm Management
> +Monitor (RMM) and implements the Realm Management Monitor
> +specification[1]. The monitor acts a bit like a hypervisor (e.g. it runs
> +in EL2 and manages the stage 2 page tables etc of the guests running in
> +Realm world), however much of the control is handled by a hypervisor
> +running in the Normal World. The Normal World hypervisor uses the Realm
> +Management Interface (RMI) defined by the RMM specification to request
> +the RMM to perform operations (e.g. mapping memory or executing a vCPU).
> +
> +The RMM defines an environment for guests where the address space (IPA)
> +is split into two. The lower half is protected - any memory that is
> +mapped in this half cannot be seen by the Normal World and the RMM
> +restricts what operations the Normal World can perform on this memory
> +(e.g. the Normal World cannot replace pages in this region without the
> +guest's cooperation). The upper half is shared, the Normal World is free
> +to make changes to the pages in this region, and is able to emulate MMIO
> +devices in this region too.
> +
> +A guest running in a Realm may also communicate with the RMM to request
> +changes in its environment or to perform attestation about its
> +environment. In particular it may request that areas of the protected
> +address space are transitioned between 'RAM' and 'EMPTY' (in either
> +direction). This allows a Realm guest to give up memory to be returned
> +to the Normal World, or to request new memory from the Normal World.
> +Without an explicit request from the Realm guest the RMM will otherwise
> +prevent the Normal World from making these changes.

We could mention that this interface is "RSI", so readers know what to
look for next

> +
> +Linux as a Realm Guest
> +----------------------
> +
> +To run Linux as a guest within a Realm, the following must be provided
> +either by the VMM or by a `boot loader` run in the Realm before Linux:
> +
> + * All protected RAM described to Linux (by DT or ACPI) must be marked
> +   RIPAS RAM before handing over the Linux.

"handing control over to Linux", or something like that?

> +
> + * MMIO devices must be either unprotected (e.g. emulated by the Normal
> +   World) or marked RIPAS DEV.
> +
> + * MMIO devices emulated by the Normal World and used very early in boot
> +   (specifically earlycon) must be specified in the upper half of IPA.
> +   For earlycon this can be done by specifying the address on the
> +   command line, e.g.: ``earlycon=uart,mmio,0x101000000``

This is going to be needed frequently, so maybe we should explain in a
little more detail how we come up with this value: "e.g. with an IPA size
of 33 and the base address of the emulated UART at 0x1000000,
``earlycon=uart,mmio,0x101000000``"

(Because the example IPA size is rather unintuitive and specific to the
kvmtool memory map)

Thanks,
Jean

> +
> + * Linux will use bounce buffers for communicating with unprotected
> +   devices. It will transition some protected memory to RIPAS EMPTY and
> +   expect to be able to access unprotected pages at the same IPA address
> +   but with the highest valid IPA bit set. The expectation is that the
> +   VMM will remove the physical pages from the protected mapping and
> +   provide those pages as unprotected pages.
> +
> +References
> +----------
> +[1] https://developer.arm.com/documentation/den0137/
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index b57776a68f15..30164fb24a24 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -41,6 +41,9 @@ to automatically locate and size all RAM, or it may use knowledge of
>  the RAM in the machine, or any other method the boot loader designer
>  sees fit.)
>  
> +For Arm Confidential Compute Realms this includes ensuring that all
> +protected RAM has a Realm IPA state (RIPAS) of "RAM".
> +
>  
>  2. Setup the device tree
>  -------------------------
> diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
> index 78544de0a8a9..12c243c3af20 100644
> --- a/Documentation/arch/arm64/index.rst
> +++ b/Documentation/arch/arm64/index.rst
> @@ -10,6 +10,7 @@ ARM64 Architecture
>      acpi_object_usage
>      amu
>      arm-acpi
> +    arm-cca
>      asymmetric-32bit
>      booting
>      cpu-feature-registers
> -- 
> 2.34.1
> 
> 

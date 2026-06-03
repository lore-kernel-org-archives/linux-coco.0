Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044247DD6A;
	Wed,  3 Jun 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512775; cv=none; b=jj3Pfr6iCsORPNNDmQP3R1GmmBNuErpr2MMQH9PZy377iw5898DYNgYzHOZAfBjWMg+4of7nxOm7K8VwRlFSZ8DhjqngNLukddOdPYsKctfn7yKN3D/U8Wyv6mPjdr/UYWo4ZF7hqGST9Txq7opOsiMlFoR++q2EeiBuJGnWB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512775; c=relaxed/simple;
	bh=u8+r4HRmxwsekiiR0Ep+iCO2fwRvl6BlOOtO2xjFtwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAtILuHaICHpYiAELDt6W92UuRDyo5Haqb5OkV9nIw8r3Zc0vd0HPWye32om1y0U/gYmi9NZ/6MKZY4yq3A7zkVK+Ys7RE5EzeG/vpMtIZvYvV4AHJqs28FtIyBwR5JpReLvnMXK/VcwK4dEHSQ/6HE/yXTYI/D6bXZXgckDcuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqrhjgRa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqrhjgRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CFA1F00893;
	Wed,  3 Jun 2026 18:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780512773;
	bh=+lkFQwlCbhUAalW714RjzdW28pKtGTW9crfVaCzc6h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KqrhjgRaligsSCjFOKrIc9ojfq0vPNhhoEsxr7KrYV8vIKE0ekvQIRZuwhAAhAHQu
	 rV1bTbMiCezbgLR+Tf8n3WEpAQEhnASHEaTSEWqiWUonMNGBQ4h9BpuVVCKRt5Gjht
	 T6j/rcZsuYCVuxgFcjSH1wRocQizn0lJy9JmS9w6OFJ/ltkyG4SYAqAkOa5mlylUxn
	 ijpz8mERvC836pvslHqtiYUTwq13M1NGSOiHJsmCkpkd3D0tvKGoigw8NRGfvUX6F9
	 5tPCAPTkk7N+yhaNZKvIayQXnsN77LFjneIGSaZGUo3AnTAlIxyRnYaja5bl8gxfD6
	 xCEsavN8qNSyA==
Date: Wed, 3 Jun 2026 19:52:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 1/4] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260603-feathered-parakeet-of-forgiveness-b40db4@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-2-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527100233.428018-2-aneesh.kumar@kernel.org>

On Wed, May 27, 2026 at 03:32:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
>

This looks good to me.

> Based on arm_ffa code
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/firmware/smccc/smccc.c    | 158 ++++++++++++++++++++++++++++++

I think it is better to keep it separate say bus.c ?

-- 
Regards,
Sudeep

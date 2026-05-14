Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB7286D5C;
	Thu, 14 May 2026 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763060; cv=none; b=rzM3Ak04olCcUHyUG1hughE+BSGpQFdaXKYy327oeFbT/rEVJB+XTasWhxejtg9maPZtwsYH/lMtwH22KQA4X1tKnctB3EL7b6lGItVTAYN5XwUkl/vj4VN/RxmdgdvWnhSL9BiOJx2WpeC5z7WdP8mloomsR31Ifks2FJz07Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763060; c=relaxed/simple;
	bh=NU7efjjrxQUqAILsFuBvBIYHO01a0fjLt028tTxJD0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VylRTObIV3S8wk4JiMlhBYDgsgir4kmabSuFPpS3t1aG1KI0A937kYtz0Qp8CvjghXTGxpiF2R3Dv8OwYKo+GzBtl+URXvQqpO87ejtexp95lTVXV7C8sSzK2OTkhYwzRQSxrmALJarfGwxgUr1428yhf+Jw+5bwfEOAhRK5ZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zu8U3myv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zu8U3myv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36103C2BCC7;
	Thu, 14 May 2026 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763059;
	bh=NU7efjjrxQUqAILsFuBvBIYHO01a0fjLt028tTxJD0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zu8U3myvrfYUrToiqd9JuWi0pe15BoGO21xJF3J9aIORX52lpfSHZ/efZj4QSnRFq
	 S+9ilFe9XBbhL+H8AxubbWH7Sw5sucd+eCDt1ZdqPNfiyRo0XeD+S/jBOtyRAjKL8Y
	 4A63UrJCKcYplb4KX02aG4ETvgWV/pwl8NVmyVGTGUxUXayGdHilC3Z9SGaHbUI20b
	 L+obL1IRTAwo0L4w1xJp8AJyyvXwPOD3EPFVIwpxrAZQzptWoji7W+cK0qrDT1woMf
	 InMyhp0gk7BQv4GR6mdxR+FhqEaGeoUMYQDqq2LlVUcll3Zue/0K4pe49VZLzZ56Fc
	 F8YfZZrN+AixQ==
Date: Thu, 14 May 2026 13:50:55 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <20260514-invisible-peacock-of-potency-ccf65d@sudeepholla>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>

On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> Hi Aneesh
> 
> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > Make the SMCCC driver responsible for registering the arm-smccc platform
> > device and after confirming the relevant SMCCC function IDs, create
> > the arm_cca_guest auxiliary device.
> > 
> 
> There are a few changes squashed in to this patch.

I had similar thoughts but I didn't get into forming a reply, now I can keep
it small, thanks for that 😉.

> Please could we split the patch in the following order ?
> 
> 1. Add platform device for arm-smccc
> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> it before the RSI changes)
> 3. Move RSI dev as Auxilliary
> 4. Add the firmware sysfs ABI.
> 

I agree with the logical split of functionality above.

> That way, first two could be merged while we figure out (3) and (4)
> 

I disagree with this though. We don't want to merge this unless (3) is
agreed. There is no point in doing that unless we agree the approach for
RSI as well.

-- 
Regards,
Sudeep

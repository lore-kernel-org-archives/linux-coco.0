Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDF4279E6;
	Thu, 14 May 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769490; cv=none; b=EmL0hjBMHGgJpOeNGONYu5Jp7PdcU7e44dniBUYzktDPLQciTt6gkSfygeu3MGurhrl6k8yIysd6RHK6VQGsaRLf9b1C3ADHkbOUzxBboRobDZ6RkNzecob8ba7mL+ThFlsARGRsXWecHaZ6ZME0vFPupB42cIGjUfIZlbDgJuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769490; c=relaxed/simple;
	bh=giklq2u3G/coCjwWJANCaOkNdgcmN7tUkMYzKD51xjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ASykr0L9kCJdH/YLaVUmtVmLtVIPVAYXZvxGMka31d/ASS2GmnPbJ5e9Lgs1Qe+ljse/Y/GNNjWrG9IO997qU1SRO+fhynKmfkRECYDrc5wjkYMyDjLPk3XGFl8paPwiIOaNQ+Hn9knnzuDLKV346RunlsNQPie1GC5w2Mg0vp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLgFu0eX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLgFu0eX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF01C2BCC7;
	Thu, 14 May 2026 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778769489;
	bh=giklq2u3G/coCjwWJANCaOkNdgcmN7tUkMYzKD51xjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HLgFu0eXNAR4VlrKviHPiWfQ2GDi2CP/VDJPi0+x7WYNnpewyq7YcpR+opdnSnVV0
	 78NMFICDvV9OIFbAKCTJUTA5nYtzug72zZGCTlY+t/ha1EyIZZ0uF+fNimWpfokpYw
	 eLHcnJrQbEbkpIYkelEAmWuccP9Yb+gqcNKt8Kf+3jAB25ai3sHVvTboNb6S24gW32
	 wRjgDaBcyLWuczmEQiwzW/fyQKlz9M2XeNKDngiDGVKNyXPvN2P6s+tXvpm58XRTNn
	 vlPBlfoAMpQErC5xcuyLODoM06RUdBEZcm+Q1WzAraTiwrM/6PUU0+OQ8F5qJNs83t
	 AqqBjeezB5zSQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
In-Reply-To: <agXL12bNh4gGyK1K@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh> <agXL12bNh4gGyK1K@arm.com>
Date: Thu, 14 May 2026 20:08:01 +0530
Message-ID: <yq5ajyt65a5y.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
>> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
>> > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
>> > > Make the SMCCC driver responsible for registering the arm-smccc platform
>> > > device and after confirming the relevant SMCCC function IDs, create
>> > > the arm_cca_guest auxiliary device.
>> > > 
>> > 
>> > There are a few changes squashed in to this patch. Please could we
>> > split the patch in the following order ?
>> > 
>> > 1. Add platform device for arm-smccc
>> 
>> Do not make any more "fake" platform devices please.
>> 
>> > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
>> > it before the RSI changes)
>> 
>> No, move it to the faux api please.
>
> So should we end up with:
>
>   /sys/devices/faux/arm-smccc/
>     smccc_trng/
>     arm-rsi-dev/
>       tsm/tsm0
>
>   /sys/class/tsm/tsm0
>     -> ../../devices/faux/arm-smccc/arm-rsi-dev/tsm/tsm0
>
>   /sys/firmware/cca/
>     realm_guest

But we need the ability to autoload different TSM backend drivers based
on the support/availability of these SMCCC function-id ranges. faux
device don't support that.

-aneesh

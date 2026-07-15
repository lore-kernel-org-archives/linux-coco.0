Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2C44432F2
	for <linux-coco@lists.linux.dev>; Wed, 15 Jul 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117984; cv=none; b=MNh1pgUeDf033vRB/DubVhtqXRD689kpDPQmExb1ztkbdEodQ5MN5kaCKBJLo4ckZSO8iIfuFqetiNqCLrXyQrWJ9o+5wKt6nZ8OQuEQbt3HJkbyzQDjccKj3tB2t/BxwAddPxX2h6qDmFpVJA8XMC74Cb7Q4FyL6G5GeQqgc/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117984; c=relaxed/simple;
	bh=1Tt0MZGEStJa1QvPCBaLpbX+2rLiZ4I/VM9Ny/bJNBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xp6+KDkjjYV7kR8mABfuL0lzYAIOd1p3OwSUbZ8CJUV7Ub8k1Lu0bt8VHMosMQMXW71bxPo1hn4Nv4GdAMMOqx+XbPdpcE0Fwqv/htWEwQiY4pIiGx/k/efZmY4h3i2pv/vVqc3/JN/Oh0y/0TozvC2zLA43NzvvWnrTht+TWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=U1mfcg9Q; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="U1mfcg9Q"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 068432F;
	Wed, 15 Jul 2026 05:19:37 -0700 (PDT)
Received: from [10.1.39.37] (unknown [10.1.39.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5640F3F7B4;
	Wed, 15 Jul 2026 05:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784117981; bh=1Tt0MZGEStJa1QvPCBaLpbX+2rLiZ4I/VM9Ny/bJNBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U1mfcg9QIS5BoO/4wu//17ztJSflgRoB9KQjRjBikCmilifzyw6nVovS43XmGPDtn
	 4cMHAPRhcRgkMscJR0+GbCwtD5Vw65ifrz/ECvQ6Q7ZrvDfG/DJH6/Wich4aXymhWI
	 21sLyoTBBqddcTDUvDNaVr+eHAlRJRLMnW87X+w8=
Message-ID: <ba85df41-4858-44aa-9bd3-d503518fe107@arm.com>
Date: Wed, 15 Jul 2026 13:19:37 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] coco: guest: arm64: Replace dummy CCA device with
 sysfs ABI
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
 <20260707081351.1680209-7-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260707081351.1680209-7-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2026 09:13, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the arm-smccc platform device and
> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.
> 
> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
> for detecting whether the kernel is running as an Arm CCA Realm guest. The
> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
> guests.
> 
> Remove the dummy arm-cca-dev registration now that userspace has a
> dedicated CCA Realm guest indicator, and document the new ABI in
> Documentation/ABI/testing/sysfs-firmware-cca.
> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



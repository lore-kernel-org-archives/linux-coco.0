Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E8616BE26
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722615393; cv=none; b=GT+7LI+91xIA+kcG8pN5DnnMJoocf1R4xej1oZ5qqJTq+htyzw4nYQ6g6nwtDe7wbYxha1Siwww5nVV/vjvlMC2VxRlYJmHcd8M9fRHDak/lHc8EBgnUEqFER6MfoGUljknay0dwb0ROpDLpQomA4lNbfs/ZQza5DjToWs3EVLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722615393; c=relaxed/simple;
	bh=7tBPJDGBSXQXrJPXcK1OlbhN3CEcxQySVnphOx8+TZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U1GNOjJjN0hI/OIHzQC30NrdD/+HRMUhigb+HlSlvGbviBSE4NhVoZk3vpAMDn9dbwoI6JRjDUVuYe5vRfg2xHBdXHGnJB/kJKHOyGVyqnqcamy+WIfmbLEVVpjUTonqWb14U/FDgxBWoG07iBa8FvdUzOQ1nM9sdbMCofAlr+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyuHUg7D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyuHUg7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51FEC32782;
	Fri,  2 Aug 2024 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722615392;
	bh=7tBPJDGBSXQXrJPXcK1OlbhN3CEcxQySVnphOx8+TZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lyuHUg7D90JWU3TbW78IU7LH8ClvNjA0D1v1UhYw2qsd8JOgCvGUCIh8/xEs8OpCm
	 5KK4YT1Di2MGWl9khw42YSkN5XcqPPOE3yxQSQlXLtVqxUXhdfXnpqmIHYHaAWXfvy
	 hgyF5u7Vro3hVkM/hPRw6FQHja/TI4SxwY9yKxBRoGFJ2Tc5HtLMlWnTfqfSdXwO1w
	 ktVBVf5gJWu5/LgCPy1sxarVqeWXrsXl67SXPQ1f4GXdqn/ZRv5TgmWiivWG89fcHK
	 7NepxvyRUbfeU6mpeE/55GL2oZqHjNFITZ6DoU7yfOomeTCLHYaUKTs2xDUfZjoWHm
	 WBq8wstjiurgw==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/6] firmware/smccc: Call arch-specific hook on
 discovering KVM services
In-Reply-To: <Zqz-0IosZbF76d0E@arm.com>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-2-will@kernel.org> <yq5ar0b9tyib.fsf@kernel.org>
 <20240731155045.GA3296@willie-the-truck> <yq5ao76dtv6n.fsf@kernel.org>
 <yq5ale1htv0w.fsf@kernel.org> <Zqz-0IosZbF76d0E@arm.com>
Date: Fri, 02 Aug 2024 21:46:24 +0530
Message-ID: <yq5a8qxeuch3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Wed, Jul 31, 2024 at 09:26:31PM +0530, Aneesh Kumar K.V wrote:
>> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
>> > Will Deacon <will@kernel.org> writes:
>> >> On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
>> >>> Will Deacon <will@kernel.org> writes:
>> >>> > diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
>> >>> > index 89a68e7eeaa6..f3319be20b36 100644
>> >>> > --- a/drivers/firmware/smccc/kvm_guest.c
>> >>> > +++ b/drivers/firmware/smccc/kvm_guest.c
>> >>> > @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
>> >>> >
>> >>> >  	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
>> >>> >  		 res.a3, res.a2, res.a1, res.a0);
>> >>> > +
>> >>> > +	kvm_arch_init_hyp_services();
>> >>> >  }
>> >>> >
>> >>>
>> >>> That is a bit late to detect RMM? One of the requirements is to
>> >>> figure out the pgprot_t flags for early_ioremap so that "earlycon" will
>> >>> work (by mapping the address as shared alias). To do that we need to
>> >>> make an RSI call to detect PROT_NS_SHARED mask as below.
>> >>>
>> >>> 	if (rsi_get_realm_config(&config))
>> >>> 		return;
>> >>> 	prot_ns_shared = BIT(config.ipa_bits - 1);
>> >>
>> >> Why can't the earlycon MMIO address just have that high bit set?
>> >>
>> >> I think it's horribly fragile to try detecting all of this stuff before
>> >> we're allowed to touch the console. We don't even bother with pKVM --
>> >> it's the guest firmware's responsibility to MMIO_GUARD the UART if it
>> >> detects a debuggable payload.
>> >
>> > To mark something shared, we need to know the mask value which is
>> > returned via rsi_get_realm_config() call.
>>
>> I guess you are suggesting to leave it to firmware to set up the device
>> tree "reg-offset" with shared bit set?
>
> As you know, we've been through these options internally and we
> concluded not to encode this information in the DT for various reasons.
>

I was trying to find out what a guest firmware-based control means.

>
> Personally I don't like this IPA split but that's too late to change it
> now in the RMM spec.
>

Agreed. This also makes supporting both secure and non secure devices
difficult.

-aneesh
